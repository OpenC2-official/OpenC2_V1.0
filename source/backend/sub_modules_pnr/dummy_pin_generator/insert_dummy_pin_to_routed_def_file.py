import math
import re
import json


def get_sub_module_area(result_path):
    # read area from json file
    area_path = result_path + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    return area


def generate_dummy_pin_for_driver(num_row, num_col, weight_bit_width, input_bit_width, row_height):
    ### read driver area
    area = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/driver')
    ### read driver_b width
    driver_b_width = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/driver_b')[1][0]
    ### dummy pins
    pins = {}
    layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.19, 0.14]
    layer_width = 0.07
    layer_offset = [0.095, 0]
    for i in range(num_row): 
        # position of pin
        position = [0, 0]
        position[0] = area[0][0] + area[1][0]   # right
        # align with the metal track in horizontal direction
        if i%2 == 0: 
            position[1] = area[0][1] + area[1][1] - i*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
        else:
            position[1] = area[0][1] + area[1][1] - (i+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1] 
        # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
        pins[f'out[{i}]_dummy'] = ['INOUT', position, f'out[{i}]', layer_name, [driver_b_width, layer_width]]
    return pins

 
def generate_dummy_pin_for_driver_b(num_row, num_col, weight_bit_width, input_bit_width, row_height):
    ### read driver_b area
    area = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/driver_b')
    ### read decoder width
    decoder_width = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/decoder')[1][0]    
    ### read driver width
    driver_width = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/driver')[1][0]
    ### dummy pins
    pins = {}
    layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.19, 0.14]
    layer_width = 0.07
    layer_offset = [0.095, 0]
    for i in range(num_row): 
        # position of pin
        position = [0, 0]
        position[0] = area[0][0] - driver_width - decoder_width     # left
        # align with the metal track in horizontal direction
        if i%2 == 0: 
            position[1] = area[0][1] + area[1][1] - (i+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
        else:
            position[1] = area[0][1] + area[1][1] - i*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] 
        # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
        pins[f'in[{i}]_dummy'] = ['INOUT', position, f'in[{i}]', layer_name, [decoder_width+driver_width, layer_width]]
    return pins


def generate_dummy_pin_for_control(num_row, num_col, weight_bit_width, input_bit_width): 
    ### read accumulator_height and control_width
    accumulator_height = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/accumulator')[1][1]
    control_width = get_sub_module_area(f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file/control')[1][0]
    ### dummy pin
    pins = {}
    layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.19, 0.14]
    layer_width = 0.07
    layer_offset = [0.095, 0]
    ### sign_in
    position = [0, 0]
    position[0] = 0
    position[1] = accumulator_height + layer_offset[1] - layer_width/2 - layer_pitch[1]     # 1st row, high
    pins[f'sign_in'] = ['INOUT', position, f'sign_in', layer_name, [control_width, layer_width]]  
    return pins


def generate_dummy_pins_in_def(pins, def_convert_factor):
    # pins
    PINS = ''
    for key, value in pins.items():    # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
        PINS += f'- {key} \n'
        PINS += f'  + DIRECTION {value[0].upper()} \n'
        PINS += f'  + PLACED ( {int(round(value[1][0]*def_convert_factor))} {int(round(value[1][1]*def_convert_factor))} ) N \n'
        PINS += f'  + LAYER {value[3]} ( 0 0 ) ( {int(round(value[4][0]*def_convert_factor))} {int(round(value[4][1]*def_convert_factor))} ) ; \n'
    return PINS


def insert_new_line_to_def(input_def_file_path, output_def_file_path, new_line, key_word):
    with open(input_def_file_path, 'r') as file:
        lines = file.readlines()
    index = None
    for i, line in enumerate(lines):
        if line.startswith(key_word):
            index = i
            break
    if index is not None:
        lines.insert(index + 1, new_line + '\n')
    with open(output_def_file_path, 'w') as file:
        file.writelines(lines)


def update_num_pins_in_def(input_def_file_path, output_def_file_path, pins):
    with open(input_def_file_path, 'r') as file:
        lines = file.readlines()
    for i, line in enumerate(lines):
        if line.startswith('PINS'): 
            nums = re.findall(r'\d+', line)
            num_pin = int(nums[0])
            lines[i] = f'PINS {num_pin+len(pins)} ;\n'
            break
    with open(output_def_file_path, 'w') as file:
        file.writelines(lines)


def insert_dummy_pin_to_routed_def_file(num_row, num_col, weight_bit_width, input_bit_width, row_height):
    # driver
    dummy_pins_for_driver = generate_dummy_pin_for_driver(num_row, num_col, weight_bit_width, input_bit_width, row_height)
    dummy_pins_for_driver_in_def = generate_dummy_pins_in_def(dummy_pins_for_driver, def_convert_factor = 2000)
    # driver_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_{num_row}x{num_col}.def'
    # driver_with_dummy_pin_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_{num_row}x{num_col}_with_dummy_pin.def'
    driver_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver.def'
    driver_with_dummy_pin_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_with_dummy_pin.def'
    update_num_pins_in_def(driver_def_file_path, driver_with_dummy_pin_def_file_path, dummy_pins_for_driver)
    insert_new_line_to_def(driver_with_dummy_pin_def_file_path, driver_with_dummy_pin_def_file_path, dummy_pins_for_driver_in_def, 'PINS')
    print("Insert dummy pins to routed def file of driver.")
    # driver_b
    dummy_pins_for_driver_b = generate_dummy_pin_for_driver_b(num_row, num_col, weight_bit_width, input_bit_width, row_height)
    dummy_pins_for_driver_b_in_def = generate_dummy_pins_in_def(dummy_pins_for_driver_b, def_convert_factor = 2000)
    # driver_b_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_b_{num_row}x{num_col}.def'
    # driver_b_with_dummy_pin_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_b_{num_row}x{num_col}_with_dummy_pin.def'
    driver_b_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_b.def'
    driver_b_with_dummy_pin_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/driver_b_with_dummy_pin.def'
    update_num_pins_in_def(driver_b_def_file_path, driver_b_with_dummy_pin_def_file_path, dummy_pins_for_driver_b)
    insert_new_line_to_def(driver_b_with_dummy_pin_def_file_path, driver_b_with_dummy_pin_def_file_path, dummy_pins_for_driver_b_in_def, 'PINS')
    print("Insert dummy pins to routed def file of driver_b.")
    # control
    dummy_pins_for_control = generate_dummy_pin_for_control(num_row, num_col, weight_bit_width, input_bit_width)
    dummy_pins_for_control_in_def = generate_dummy_pins_in_def(dummy_pins_for_control, def_convert_factor = 2000)
    # control_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/control_for_{input_bit_width}bit_input.def'
    # control_with_dummy_pin_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/control_for_{input_bit_width}bit_input_with_dummy_pin.def'
    control_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/control.def'
    control_with_dummy_pin_def_file_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/routed_def_file/control_with_dummy_pin.def'
    update_num_pins_in_def(control_def_file_path, control_with_dummy_pin_def_file_path, dummy_pins_for_control)
    insert_new_line_to_def(control_with_dummy_pin_def_file_path, control_with_dummy_pin_def_file_path, dummy_pins_for_control_in_def, 'PINS')
    print("Insert dummy pins to routed def file of control.")


# parameters
num_row = 64
num_col = 64
weight_bit_width = 4
input_bit_width = 4
row_height = 1.26


insert_dummy_pin_to_routed_def_file(num_row, num_col, weight_bit_width, input_bit_width, row_height)