import json
import sys
import math


def generate_basic_info_in_def(design_name, def_convert_factor): 
    # basic info
    print('VERSION 5.8 ;')
    print('DIVIDERCHAR "/" ;')
    print('BUSBITCHARS "[]" ;')
    print(f'DESIGN {design_name} ;')
    print(f'UNITS DISTANCE MICRONS {def_convert_factor} ;\n')


def generate_area_in_def(area, def_convert_factor): 
    # area
    print(f'DIEAREA ( {round(area[0][0]*def_convert_factor)} {round(area[0][1]*def_convert_factor)} ) ( {round((area[0][0]+area[1][0])*def_convert_factor)} {round((area[0][1]+area[1][1])*def_convert_factor)} ) ;\n')


def generate_pins_in_def(pins, def_convert_factor):
    # pins
    PINS = ''
    PINS += f'PINS {len(pins)} ;\n'
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
    PINS += 'END PINS\n'
    print(PINS)


def generate_components_in_def(cells, def_convert_factor):
    # COMPONENTS
    COMPONENTS = ''
    COMPONENTS += f'COMPONENTS {len(cells)} ;\n'
    for key, value in cells.items():    # name: [type, position]
        COMPONENTS += f'  - {key} {value[0]}\n'
        COMPONENTS += f'    + PLACED ( {int(round(value[1]*def_convert_factor))} {int(round(value[2]*def_convert_factor))} ) N ;\n'
    COMPONENTS += 'END COMPONENTS\n'
    print(COMPONENTS)


def get_sub_module_area(result_path):
    # read area from json file
    area_path = result_path + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    return area


def generate_area_pins_components_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width, row_height, sram_rw_width, mode = 'pwr'):
    # parameters
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width
    # module name
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    # sram_with_rw
    name = f'sram_{num_row}x{weight_bit_width}_with_rw'
    area = get_sub_module_area(result_path + '/sram_with_rw')
    sram_with_rw = [name, area[1][0], area[1][1]]
    # adder_tree
    name = f'adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit'
    area = get_sub_module_area(result_path + '/adder_tree')
    adder_tree = [name, area[1][0], area[1][1]]
    # accumulator
    name = f'accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit'
    area = get_sub_module_area(result_path + '/accumulator')
    accumulator = [name, area[1][0], area[1][1]]
    # decoder
    name = f'decoder_{log_num_row}_to_{num_row}'
    area = get_sub_module_area(result_path + '/decoder')
    decoder = [name, area[1][0], area[1][1]]
    # driver
    name = f'driver_{num_row}x{num_col}'
    area = get_sub_module_area(result_path + '/driver')
    driver = [name, area[1][0], area[1][1]]
    # driver_b
    name = f'driver_b_{num_row}x{num_col}'
    area = get_sub_module_area(result_path + '/driver_b')
    driver_b = [name, area[1][0], area[1][1]]
    # control
    name = f'control_for_{input_bit_width}bit_input'
    area = get_sub_module_area(result_path + '/control')
    control = [name, area[1][0], area[1][1]]
    # area
    width = decoder[1]+driver[1]+driver_b[1] + math.ceil(num_col/weight_bit_width)*(sram_with_rw[1]+adder_tree[1])
    height = decoder[2] + control[2]
    area = [[0, 0], [width, height]]
    # components     
    # name: [type, position]
    cells = {}
    cells['control'] = [control[0], 0, 0]
    cells['decoder'] = [decoder[0], 0, control[2]]
    cells['driver'] = [driver[0], decoder[1], control[2]]
    cells['driver_b'] = [driver_b[0], decoder[1]+driver[1], control[2]]
    for i in range(int(num_col/weight_bit_width)): 
        cells[f'sram_with_rw_{int(num_col/weight_bit_width)-1-i}'] = [sram_with_rw[0], decoder[1]+driver[1]+driver_b[1]+i*(sram_with_rw[1]+adder_tree[1]), accumulator[2]]
        cells[f'adder_tree_{int(num_col/weight_bit_width)-1-i}'] = [adder_tree[0], decoder[1]+driver[1]+driver_b[1]+(i+1)*sram_with_rw[1]+i*adder_tree[1], accumulator[2]]
        cells[f'accumulator_{int(num_col/weight_bit_width)-1-i}'] = [accumulator[0], decoder[1]+driver[1]+driver_b[1]+i*(sram_with_rw[1]+adder_tree[1]), 0]
    ### pins
    # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
    pins = {}

    if mode == 'pwr':
        ### metal1
        layer_name = 'metal1'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]
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

    ### metal2
    layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.19, 0.14]
    layer_width = 0.07
    layer_offset = [0.095, 0]
    ### input
    for i in range(num_row):
        # position of pin
        position = [0, 0]
        position[0] = -layer_width     # left
        # align with the metal track in horizontal direction
        if i%2 == 0: 
            position[1] = control[2] + decoder[2] - (i+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
        else: 
            position[1] = control[2] + decoder[2] - i*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] 
        pins[f'in<{i}>'] = ['INPUT', position, f'in<{i}>', layer_name, [2*layer_width, layer_width]]
    ### clk
    # clk
    position = [0, 0]
    position[0] = -layer_width      # left
    position[1] = accumulator[2] - row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]    # 1st row, low
    pins[f'clk'] = ['INPUT', position, f'clk', layer_name, [2*layer_width, layer_width]]
    ### sign_in
    position = [0, 0]
    position[0] = -layer_width      # left
    position[1] = accumulator[2] + layer_offset[1] - layer_width/2 - layer_pitch[1]     # 1st row, high
    pins[f'sign_in'] = ['INPUT', position, f'sign_in', layer_name, [2*layer_width, layer_width]]  
    ### din, dout
    for i in range(int(num_col/weight_bit_width)):
        for j in range(weight_bit_width):
            # din
            position = [0, 0]
            position[0] = cells[f'sram_with_rw_{i}'][1] + sram_rw_width*(weight_bit_width-1-j) + layer_offset[0] - layer_width/2 + layer_pitch[0]*2
            position[1] = accumulator[2] + row_height*3 + layer_offset[1] - layer_width/2 + layer_pitch[1]*4
            pins[f'din<{i*weight_bit_width+j}>'] = ['INPUT', position, f'din<{i*weight_bit_width+j}>', layer_name, [layer_width, layer_width]]  
            # dout
            position = [0, 0]
            position[0] = cells[f'sram_with_rw_{i}'][1] + sram_rw_width*(weight_bit_width-1-j) + layer_offset[0] - layer_width/2 + layer_pitch[0]*4
            position[1] = accumulator[2] + layer_offset[1] - layer_width/2 + layer_pitch[1]*2
            pins[f'dout<{i*weight_bit_width+j}>'] = ['OUTPUT', position, f'dout<{i*weight_bit_width+j}>', layer_name, [layer_width, layer_width]]  

    ### metal3
    layer_name = 'metal3'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.19, 0.14]
    layer_width = 0.07
    layer_offset = [0.095, 0.07]
    ### wl_address
    for i in range(log_num_row):
        # position of pin
        position = [0, 0]
        position[0] = -layer_width     # left
        # align with the metal track in horizontal direction
        if i%2 == 0: 
            position[1] = control[2] + decoder[2] - i*row_height + layer_offset[1] - layer_width/2 - 2*layer_pitch[1]
        else: 
            position[1] = control[2] + decoder[2] - (i+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
        # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
        pins[f'wl_address<{i}>'] = ['INPUT', position, f'wl_address<{i}>', layer_name, [2*layer_width, layer_width]]
    ### rst, r_w_cim[0], r_w_cim[1], start 
    # rst
    position = [0, 0]
    position[0] = -layer_width      # left
    position[1] = accumulator[2] + layer_offset[1] - layer_width/2 + layer_pitch[1]     # -1 row
    pins[f'rst'] = ['INPUT', position, f'rst', layer_name, [2*layer_width, layer_width]]
    # start
    position = [0, 0]
    position[0] = -layer_width      # left
    position[1] = accumulator[2] - row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]    # 1st row
    pins[f'start'] = ['INPUT', position, f'start', layer_name, [2*layer_width, layer_width]]
    # r_w_cim[0]
    position = [0, 0]
    position[0] = -layer_width      # left
    position[1] = accumulator[2] - 2*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]  # 3rd row
    pins[f'r_w_cim<0>'] = ['INPUT', position, f'r_w_cim<0>', layer_name, [2*layer_width, layer_width]]
    # r_w_cim[1]
    position = [0, 0]
    position[0] = -layer_width      # left
    position[1] = accumulator[2] - 3*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]  # 3rd row
    pins[f'r_w_cim<1>'] = ['INPUT', position, f'r_w_cim<1>', layer_name, [2*layer_width, layer_width]]

    ### metal4
    layer_name = 'metal4'    # metal_name: [direction, pitch, width, offset]
    layer_pitch = [0.285, 0.28]
    layer_width = 0.14
    layer_offset = [0.285, 0.21]
    ### out, sign_out
    num_routing_tracks_x = int((accumulator[1]-layer_offset[0])/layer_pitch[0])
    pin_pitch_x = int(num_routing_tracks_x/(column_psum_bit_width+1))*layer_pitch[0]
    for i in range(int(num_col/weight_bit_width)): 
        # out
        for j in range(column_psum_bit_width):
            # position of pin
            position = [0, 0]
            position[0] = cells[f'accumulator_{int(num_col/weight_bit_width)-1-i}'][1] + layer_offset[0] - layer_width/2 + (j+1)*pin_pitch_x
            position[1] = -layer_width      # bottom
            pins[f'out_{int(num_col/weight_bit_width)-1-i}<{column_psum_bit_width-1-j}>'] = ['OUTPUT', position, f'out_{int(num_col/weight_bit_width)-1-i}<{column_psum_bit_width-1-j}>', layer_name, [layer_width, layer_width]]
        # sign_out
        position = [0, 0]
        position[0] = accumulator[1]-layer_pitch[0]
        position[0] = cells[f'accumulator_{int(num_col/weight_bit_width)-1-i}'][1] + round((position[0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
        position[1] = -layer_width      # bottom
        pins[f'sign_out<{int(num_col/weight_bit_width)-1-i}>'] = ['OUTPUT', position, f'sign_out<{int(num_col/weight_bit_width)-1-i}>', layer_name, [layer_width, 2*layer_width]]
    
    ### sign_weight
    for i in range(int(num_col/weight_bit_width)): 
        position = [0, 0]
        position[0] = adder_tree[1]-layer_pitch[0]
        position[0] = cells[f'adder_tree_{int(num_col/weight_bit_width)-1-i}'][1] + round((position[0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
        position[1] = area[1][1]
        pins[f'sign_weight<{int(num_col/weight_bit_width)-1-i}>'] = ['INPUT', position, f'sign_weight<{int(num_col/weight_bit_width)-1-i}>', layer_name, [layer_width, 2*layer_width]]
    ### busy, rd_date_enable, cim_data_enable
    # busy
    position = [0, 0]
    position[0] = round((control[1]/4-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
    position[1] = -layer_width      # bottom
    pins[f'busy'] = ['OUTPUT', position, f'busy', layer_name, [layer_width, 2*layer_width]]
    # rd_data_enable
    position = [0, 0]
    position[0] = round((control[1]/4*2-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
    position[1] = -layer_width      # bottom
    pins[f'rd_data_enable'] = ['OUTPUT', position, f'rd_data_enable', layer_name, [layer_width, 2*layer_width]]
    # cim_data_enable
    position = [0, 0]
    position[0] = round((control[1]/4*3-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
    position[1] = -layer_width      # bottom
    pins[f'cim_data_enable'] = ['OUTPUT', position, f'cim_data_enable', layer_name, [layer_width, 2*layer_width]]
    
    ### return area, pins, and cells
    return [area, pins, cells]


def generate_def_for_top_module(num_row, num_col, weight_bit_width, input_bit_width, row_height, sram_rw_width, mode = 'pwr', def_convert_factor = 2000):
    # file path
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    output_lef_path = f'results/{top_design_name}/backend/top_module/def_file/{top_design_name}.def'
    sys.stdout = open(output_lef_path, 'w')
    [area, pins, cells] = generate_area_pins_components_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width, row_height, sram_rw_width, mode)
    generate_basic_info_in_def(top_design_name, def_convert_factor)
    generate_area_in_def(area, def_convert_factor)
    generate_pins_in_def(pins, def_convert_factor)
    generate_components_in_def(cells, def_convert_factor)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate def file for dcim macro.')


# parameters
num_row = 2**8
num_col = 2**8
weight_bit_width = 4
input_bit_width = 4
row_height = 1.26
sram_rw_width = 1.52
mode = 'pwr'
def_convert_factor = 2000


generate_def_for_top_module(num_row, num_col, weight_bit_width, input_bit_width, row_height, sram_rw_width, mode, def_convert_factor)
