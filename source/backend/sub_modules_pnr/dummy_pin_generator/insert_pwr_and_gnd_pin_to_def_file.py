import re
import json

def generate_pwr_and_gnd_pin(area, row_height, top_mode): 
    pins = {}
    ### metal1
    layer_name = 'metal1'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.19, 0.14]
    layer_width = 0.07
    layer_offset = [0.095, 0]
    if top_mode == 'vdd':
        # vdd: top is vdd
        position = [0, 0]
        position[0] = area[0][0]-2*layer_pitch[0]-layer_width/2
        position[1] = area[0][1]+area[1][1]+layer_offset[1]-layer_width/2
        relative_position_list = []
        relative_position_list.append([0, -area[1][1], layer_width, layer_width])
        num_vdd = round(area[1][1]/row_height)//2+1
        for i in range(num_vdd):
            relative_position = [layer_width, 0-i*row_height*2, 2*layer_pitch[0]+layer_width/2, layer_width-i*row_height*2]
            relative_position_list.append(relative_position)
        pins[f'vdd'] = ['INOUT', position, f'vdd', layer_name, relative_position_list]        
        # gnd
        position = [0, 0]
        position[0] = area[0][0]+area[1][0]-layer_offset[0]+2*layer_pitch[0]-layer_width/2
        position[1] = area[1][1]+layer_offset[1]-layer_width/2
        relative_position_list = []
        relative_position_list.append([0, -area[1][1], layer_width, layer_width])
        num_gnd = (round(area[1][1]/row_height)-1)//2+1
        for i in range(num_gnd):
            relative_position = [-2*layer_pitch[0]+layer_offset[0]+layer_width/2, -row_height*(2*i+1), 0, layer_width-row_height*(2*i+1)]
            relative_position_list.append(relative_position)
        pins[f'gnd'] = ['INOUT', position, f'gnd', layer_name, relative_position_list]
    elif top_mode == 'gnd':    
        # gnd: top is gnd
        position = [0, 0]
        position[0] = area[0][0]-2*layer_pitch[0]-layer_width/2
        position[1] = area[0][1]+area[1][1]+layer_offset[1]-layer_width/2
        relative_position_list = []
        relative_position_list.append([0, -area[1][1], layer_width, layer_width])
        num_gnd = round(area[1][1]/row_height)//2+1
        for i in range(num_gnd):
            relative_position = [layer_width, 0-i*row_height*2, 2*layer_pitch[0]+layer_width/2, layer_width-i*row_height*2]
            relative_position_list.append(relative_position)
        pins[f'gnd'] = ['INOUT', position, f'gnd', layer_name, relative_position_list]        
        # vdd
        position = [0, 0]
        position[0] = area[0][0]+area[1][0]-layer_offset[0]+2*layer_pitch[0]-layer_width/2
        position[1] = area[1][1]+layer_offset[1]-layer_width/2
        relative_position_list = []
        relative_position_list.append([0, -area[1][1], layer_width, layer_width])
        num_vdd = (round(area[1][1]/row_height)-1)//2+1
        for i in range(num_vdd):
            relative_position = [-2*layer_pitch[0]+layer_offset[0]+layer_width/2, -row_height*(2*i+1), 0, layer_width-row_height*(2*i+1)]
            relative_position_list.append(relative_position)
        pins[f'vdd'] = ['INOUT', position, f'vdd', layer_name, relative_position_list]
    return pins


def generate_pins_in_def(pins, def_convert_factor):
    # pins
    PINS = ''
    for key, value in pins.items():    # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
        PINS += f'  - {key} + NET {value[2]} \n'
        PINS += f'    + DIRECTION {value[0].upper()} \n'
        PINS += f'    + PLACED ( {int(round(value[1][0]*def_convert_factor))} {int(round(value[1][1]*def_convert_factor))} ) N \n'
        if len(value[4]) == 2:
            PINS += f'    + LAYER {value[3]} ( 0 0 ) ( {int(round(value[4][0]*def_convert_factor))} {int(round(value[4][1]*def_convert_factor))} ) ; \n'
        elif len(value[4]) > 2:    # for vdd & gnd
            for i in range(len(value[4])-1):
                PINS += f'    + LAYER {value[3]} ( {int(round(value[4][i][0]*def_convert_factor))} {int(round(value[4][i][1]*def_convert_factor))} ) ( {int(round(value[4][i][2]*def_convert_factor))} {int(round(value[4][i][3]*def_convert_factor))} )\n'
            PINS += f'    + LAYER {value[3]} ( {int(round(value[4][(len(value[4])-1)][0]*def_convert_factor))} {int(round(value[4][(len(value[4])-1)][1]*def_convert_factor))} ) ( {int(round(value[4][(len(value[4])-1)][2]*def_convert_factor))} {int(round(value[4][(len(value[4])-1)][3]*def_convert_factor))} ) ;\n'
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
            lines[i] = f'PINS {num_pin+2} ;\n'
            break
    with open(output_def_file_path, 'w') as file:
        file.writelines(lines)


def get_sub_module_area(result_path):
    # read area from json file
    area_path = result_path + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    return area


def insert_pwr_and_gnd_pin_to_def_file(num_row, num_col, weight_bit_width, input_bit_width, row_height):
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    placed_def_file_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    # sram_with_rw
    sram_with_rw_area = get_sub_module_area(placed_def_file_path + '/sram_with_rw')
    sram_with_rw_name = 'sram_with_rw'
    sram_with_rw = [sram_with_rw_area, sram_with_rw_name, 'vdd']
    # adder_tree
    adder_tree_area = get_sub_module_area(placed_def_file_path + '/adder_tree')
    adder_tree_name = 'adder_tree'
    adder_tree = [adder_tree_area, adder_tree_name, 'vdd']
    # accumulator
    accumulator_area = get_sub_module_area(placed_def_file_path + '/accumulator')
    accumulator_name = 'accumulator'
    accumulator = [accumulator_area, accumulator_name, 'gnd']
    # decoder
    decoder_area = get_sub_module_area(placed_def_file_path + '/decoder')
    decoder_name = 'decoder'
    decoder = [decoder_area, decoder_name, 'vdd']
    # driver
    driver_area = get_sub_module_area(placed_def_file_path + '/driver')
    driver_name = 'driver'
    driver = [driver_area, driver_name, 'vdd']
    # driver_b
    driver_b_area = get_sub_module_area(placed_def_file_path + '/driver_b')
    driver_b_name = 'driver_b'
    driver_b = [driver_b_area, driver_b_name, 'vdd']
    # control
    control_area = get_sub_module_area(placed_def_file_path + '/control')
    control_name = 'control'
    control = [control_area, control_name, 'vdd']
    # sub_module_list
    sub_module_list = [sram_with_rw, adder_tree, accumulator, decoder, driver, driver_b, control]
    for [area, sub_module_name, top_mode] in sub_module_list:
        pwr_and_gnd_pin = generate_pwr_and_gnd_pin(area, row_height, top_mode)
        pwr_and_gnd_pin_in_def = generate_pins_in_def(pwr_and_gnd_pin, def_convert_factor = 2000)
        def_file_path = f'results/{top_design_name}/backend/sub_modules/routed_def_file/{sub_module_name}.def'
        def_file_path_new = f'results/{top_design_name}/backend/sub_modules/routed_def_file/{sub_module_name}_pwr.def'
        update_num_pins_in_def(def_file_path, def_file_path_new, pwr_and_gnd_pin_in_def)
        insert_new_line_to_def(def_file_path_new, def_file_path_new, pwr_and_gnd_pin_in_def, 'PINS')
        print("Insert power and ground pin to sub module def files.")




num_row = 2**6
num_col = 2**6
weight_bit_width = 4
input_bit_width = 4
row_height = 1.26

insert_pwr_and_gnd_pin_to_def_file(num_row, num_col, weight_bit_width, input_bit_width, row_height)