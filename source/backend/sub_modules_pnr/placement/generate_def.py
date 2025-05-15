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


def generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode):
    # rows
    ROWS = ''
    site_num = int(round(area[1][0]/site_width))
    if bottom_mode == 'vdd':
        for i in range(int(round(area[1][1]/row_height))):
            if round(i*row_height/row_height)%2 == 1: 
                direction = 'N'
            else: 
                direction = 'FS'
            ROWS += f'ROW CORE_ROW_{i} CoreSite 0 {int(round(i*row_height*def_convert_factor))} {direction} DO {site_num} BY 1 STEP {int(round(site_width*def_convert_factor))} 0 ;\n'
    elif bottom_mode == 'gnd':
        for i in range(int(round(area[1][1]/row_height))):
            if round(i*row_height/row_height)%2 == 0: 
                direction = 'N'
            else: 
                direction = 'FS'
            ROWS += f'ROW CORE_ROW_{i} CoreSite 0 {int(round(i*row_height*def_convert_factor))} {direction} DO {site_num} BY 1 STEP {int(round(site_width*def_convert_factor))} 0 ;\n'
    print(ROWS)


# metals(dict): metal_name: [direction, pitch, width, offset]
def generate_tracks_in_def(area, metals, def_convert_factor):
    # tracks
    TRACKS = ''
    for key in metals.keys():
        if metals[key][0] == 'HORIZONTAL':    # define x tracks firstly
            TRACKS += f'TRACKS X {round(metals[key][3][0]*def_convert_factor)} DO {int((area[1][0]-metals[key][3][0])/metals[key][1][0])} STEP {round(metals[key][1][0]*def_convert_factor)} LAYER {key} ;\n'
            TRACKS += f'TRACKS Y {round(metals[key][3][1]*def_convert_factor)} DO {int((area[1][1]-metals[key][3][1])/metals[key][1][1])} STEP {round(metals[key][1][1]*def_convert_factor)} LAYER {key} ;\n'
        elif metals[key][0] == 'VERTICAL':    # define y tracks firstly   
            TRACKS += f'TRACKS Y {round(metals[key][3][1]*def_convert_factor)} DO {int((area[1][1]-metals[key][3][1])/metals[key][1][1])} STEP {round(metals[key][1][1]*def_convert_factor)} LAYER {key} ;\n'
            TRACKS += f'TRACKS X {round(metals[key][3][0]*def_convert_factor)} DO {int((area[1][0]-metals[key][3][0])/metals[key][1][0])} STEP {round(metals[key][1][0]*def_convert_factor)} LAYER {key} ;\n'
    print(TRACKS)


def generate_vias_in_def(vias_path = 'vias.def'):
    # VIAS
    with open(vias_path, 'r') as vias_file: 
        VIAS = vias_file.read()
    print(VIAS)


def generate_pins_in_def(pins, def_convert_factor):
    # pins
    PINS = ''
    PINS += f'PINS {len(pins)} ;\n'
    for key, value in pins.items():    # pin_name: [direction, position, net_connect_name, layer_name, layer_size]
        PINS += f'  - {key} + NET {value[2]} \n'
        PINS += f'    + DIRECTION {value[0].upper()} \n'
        PINS += f'    + PLACED ( {int(round(value[1][0]*def_convert_factor))} {int(round(value[1][1]*def_convert_factor))} ) N \n'
        PINS += f'    + LAYER {value[3]} ( 0 0 ) ( {int(round(value[4][0]*def_convert_factor))} {int(round(value[4][1]*def_convert_factor))} ) ; \n'
    PINS += 'END PINS\n'
    print(PINS)


def generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode):
    # COMPONENTS
    COMPONENTS = ''
    COMPONENTS += f'COMPONENTS {len(cells)} ;\n'
    if bottom_mode == 'vdd':
        for key, value in cells.items():
            if round(value[1][1]/row_height)%2 == 1: 
                direction = 'N'
            else: 
                direction = 'FS' 
            COMPONENTS += f'  - {key} {value[0]}\n'
            COMPONENTS += f'    + PLACED ( {int(round(value[1][0]*def_convert_factor))} {int(round(value[1][1]*def_convert_factor))} ) {direction} ;\n'
    elif bottom_mode == 'gnd':
        for key, value in cells.items():
            if round(value[1][1]/row_height)%2 == 0: 
                direction = 'N'
            else: 
                direction = 'FS'   
            COMPONENTS += f'  - {key} {value[0]}\n'
            COMPONENTS += f'    + PLACED ( {int(round(value[1][0]*def_convert_factor))} {int(round(value[1][1]*def_convert_factor))} ) {direction} ;\n'
    COMPONENTS += 'END COMPONENTS\n'
    print(COMPONENTS)


def generate_nets_in_def(nets):
    # nets
    NETS = ''
    NETS += f'NETS {len(nets)} ;\n'
    for net in nets:
        NETS += f'  - {net[0]}\n'
        for i in range(len(net)-2):
            if len(net[i+1]) == 3:    # for cell
                NETS += f'    ( {net[i+1][0]} {net[i+1][2]} )\n'
            else:    # for pin
                NETS += f'    ( PIN {net[i+1][0]} )\n'
        if len(net[len(net)-1]) == 3:    # for cell
            NETS += f'    ( {net[len(net)-1][0]} {net[len(net)-1][2]} ) ;\n'
        else:    # for pin
            NETS += f'    ( PIN {net[len(net)-1][0]} ) ;\n'  
    NETS += 'END NETS\n'
    print(NETS)


def generate_def_for_sram_with_rw(num_row, num_col, weight_bit_width, input_bit_width, 
                                  site_width, row_height, metals, vias, def_convert_factor): 
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_sram_with_rw = result_path + '/sram_with_rw'
    sys.stdout = open(result_path_sram_with_rw + '/sram_with_rw.def', 'w')
    design_name = f'sram_{num_row}x{weight_bit_width}_with_rw'
    # read area from json file
    area_path = result_path_sram_with_rw + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_sram_with_rw + '/cells.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_sram_with_rw + '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_sram_with_rw + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # bottom mode
    bottom_mode = 'gnd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    # pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for sram_with_rw.')


def generate_def_for_adder_tree(num_row, num_col, weight_bit_width, input_bit_width, 
                                site_width, row_height, metals, vias, def_convert_factor): 
    ###### parameters
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_adder_tree = result_path + '/adder_tree'
    sys.stdout = open(result_path_adder_tree + '/adder_tree.def', 'w')
    design_name = f'adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit'
    # read area from json file
    area_path = result_path_adder_tree + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_adder_tree + '/cells.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_adder_tree + '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_adder_tree + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # bottom mode
    bottom_mode = 'gnd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    # pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for adder_tree.')


def generate_def_for_accumulator(num_row, num_col, weight_bit_width, input_bit_width, 
                                 site_width, row_height, metals, vias, def_convert_factor): 
    ###### parameter
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width    
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_accumulator = result_path + '/accumulator'
    sys.stdout = open(result_path_accumulator + '/accumulator.def', 'w')
    design_name = f'accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit'
    # read area from json file
    area_path = result_path_accumulator + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_accumulator + '/cells_greedy_legalization.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_accumulator + '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_accumulator + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # bottom mode
    # top mode = 'gnd', then calculate bottom mode
    if round(area[1][1]/row_height)%2 == 0:
        bottom_mode = 'gnd'
    else:
        bottom_mode = 'vdd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    # pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for accumulator.')


def generate_def_for_decoder(num_row, num_col, weight_bit_width, input_bit_width, 
                             site_width, row_height, metals, vias, def_convert_factor): 
    ###### parameter
    log_num_row = int(math.log(num_row, 2))  
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_decoder = result_path + '/decoder'
    sys.stdout = open(result_path_decoder + '/decoder.def', 'w')
    design_name = f'decoder_{log_num_row}_to_{num_row}'
    # read area from json file
    area_path = result_path_decoder + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_decoder + '/cells.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_decoder + '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_decoder + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # bottom mode
    bottom_mode = 'vdd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    # pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for decoder.')


def generate_def_for_driver(num_row, num_col, weight_bit_width, input_bit_width, 
                            site_width, row_height, metals, vias, def_convert_factor):  
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_driver = result_path + '/driver'
    sys.stdout = open(result_path_driver + '/driver.def', 'w')
    design_name = f'driver_{num_row}x{num_col}'
    # read area from json file
    area_path = result_path_driver + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_driver + '/cells.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_driver + '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_driver + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # bottom mode
    bottom_mode = 'vdd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    # pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for driver.')


def generate_def_for_driver_b(num_row, num_col, weight_bit_width, input_bit_width, 
                              site_width, row_height, metals, vias, def_convert_factor): 
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_driver_b = result_path + '/driver_b'
    sys.stdout = open(result_path_driver_b + '/driver_b.def', 'w')
    design_name = f'driver_b_{num_row}x{num_col}'
    # read area from json file
    area_path = result_path_driver_b + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_driver_b + '/cells.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_driver_b + '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_driver_b + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # # read pins from json file
    # pins_path = result_path_driver_b + '/pins.json'
    # with open(pins_path, 'r') as pins_file:
    #     pins = json.load(pins_file)
    # bottom mode
    bottom_mode = 'vdd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    # pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for driver_b.')


def generate_def_for_control(num_row, num_col, weight_bit_width, input_bit_width, 
                             site_width, row_height, metals, vias, def_convert_factor): 
    ###### file
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    result_path_control = result_path + '/control'
    sys.stdout = open(result_path_control + f'/control.def', 'w')
    design_name = f'control_for_{input_bit_width}bit_input'
    # read area from json file
    area_path = result_path_control + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    # read cells from json file
    cells_path = result_path_control + '/cells_abacus_legalization.json'
    with open(cells_path, 'r') as cells_file:
        cells = json.load(cells_file)
    # read nets from json file
    nets_path = result_path_control+ '/nets.json'
    with open(nets_path, 'r') as nets_file:
        nets = json.load(nets_file)
    # read pins from json file
    pins_path = result_path_control + '/pins.json'
    with open(pins_path, 'r') as pins_file:
        pins = json.load(pins_file)
    # bottom mode
    # bottom mode
    # top mode = 'vdd', then calculate bottom mode
    if round(area[1][1]/row_height)%2 == 0:
        bottom_mode = 'vdd'
    else: 
        bottom_mode = 'gnd'
    ###### generate def
    # basic info
    generate_basic_info_in_def(design_name, def_convert_factor)
    # area
    generate_area_in_def(area, def_convert_factor)
    # rows
    generate_rows_in_def(area, site_width, row_height, def_convert_factor, bottom_mode)
    # tracks
    generate_tracks_in_def(area, metals, def_convert_factor)
    # # vias
    # generate_vias_in_def()
    pins 
    generate_pins_in_def(pins, def_convert_factor)
    # components
    generate_components_in_def(cells, row_height, def_convert_factor, bottom_mode)
    # nets
    generate_nets_in_def(nets)
    # end
    print('END DESIGN')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate placed def file for control.')


def generate_def_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width, 
                                site_width, row_height, metals, vias, def_convert_factor):
    generate_def_for_sram_with_rw(num_row, num_col, weight_bit_width, input_bit_width, 
                                  site_width, row_height, metals, vias, def_convert_factor)
    generate_def_for_adder_tree(num_row, num_col, weight_bit_width, input_bit_width, 
                                site_width, row_height, metals, vias, def_convert_factor)
    generate_def_for_accumulator(num_row, num_col, weight_bit_width, input_bit_width, 
                                 site_width, row_height, metals, vias, def_convert_factor)
    generate_def_for_decoder(num_row, num_col, weight_bit_width, input_bit_width, 
                             site_width, row_height, metals, vias, def_convert_factor)
    generate_def_for_driver(num_row, num_col, weight_bit_width, input_bit_width, 
                            site_width, row_height, metals, vias, def_convert_factor)
    generate_def_for_driver_b(num_row, num_col, weight_bit_width, input_bit_width, 
                              site_width, row_height, metals, vias, def_convert_factor)
    generate_def_for_control(num_row, num_col, weight_bit_width, input_bit_width, 
                             site_width, row_height, metals, vias, def_convert_factor)


# metals
# name: [direction, pitch, width, offset]
metal3 = ['metal3', 'HORIZONTAL', [0.19, 0.14], 0.07, [0.095, 0.07]]
metal4 = ['metal4', 'VERTICAL', [0.285, 0.28], 0.14, [0.285, 0.21]]
metal5 = ['metal5', 'HORIZONTAL', [0.285, 0.28], 0.14, [0.285, 0.21]]
metal6 = ['metal6', 'VERTICAL', [0.285, 0.28], 0.14, [0.285, 0.21]]

metal_lists = [metal3, metal4, metal5, metal6]
zip(*metal_lists)
metals = {name: (direction, pitch, width, offset) for name, direction, pitch, width, offset in metal_lists}

# vias
vias = {}

# dcim parameters
num_row = 2**6
num_col = 2**6
weight_bit_width = 4
input_bit_width = 4

# layout parameters
site_width = 0.19
row_height = 1.26

#def parameter
def_convert_factor = 1000

# generate def file
generate_def_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width, 
                            site_width, row_height, metals, vias, def_convert_factor)

