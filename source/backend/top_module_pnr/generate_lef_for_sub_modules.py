import json
import sys
import math


def generate_basic_info_in_lef(lef_convert_factor): 
    # basic info
    print('VERSION 5.8 ;')
    print('DIVIDERCHAR "/" ;')
    print('BUSBITCHARS "[]" ;\n')
    print('UNITS')
    print(f'  DISTANCE MICRONS {lef_convert_factor} ;')
    print('END UNITS\n')


def generate_site_in_lef(site_name, site_width, site_height): 
    print(f'SITE {site_name}')
    print('  CLASS CORE ;')
    print('  SYMMETRY X Y ;')
    print(f'  SIZE {site_width} BY {site_height} ;')
    print(f'END {site_name}\n')


def generate_macro_in_lef(macro_name, macro_width, macro_height, site_name, origin = [0, 0], foreign = [0, 0]):
    print(f'MACRO {macro_name}')
    print(f'  CLASS CORE ;')
    print(f'  ORIGIN {origin[0]} {origin[1]} ;')
    print(f'  FOREIGN {macro_name} {foreign[0]} {foreign[1]} ;')    
    print(f'  SIZE {macro_width} BY {macro_height} ;')
    print(f'  SYMMETRY X Y ;')
    print(f'  SITE {site_name} ;')
    print(f'END {macro_name}\n')


def get_sub_module_area(result_path):
    # read area from json file
    area_path = result_path + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    return area


def generate_lef_for_sub_modules(num_row, num_col, weight_bit_width, input_bit_width, site_name, site_width, site_height, lef_convert_factor = 2000):
    # parameters
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width  
    # file path
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    output_lef_path = f'results/{top_design_name}/backend/sub_modules/lef_file/sub_modules.lef'
    sys.stdout = open(output_lef_path, 'w')
    # generate basic info and site in lef
    generate_basic_info_in_lef(lef_convert_factor)
    generate_site_in_lef(site_name, site_width, site_height)
    # module name
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
    # sub module list
    sub_module_list = [sram_with_rw, adder_tree, accumulator, decoder, driver, driver_b, control]
    # generate macro in lef
    for sub_module in sub_module_list:
        [macro_name, macro_width, macro_height] = sub_module
        generate_macro_in_lef(macro_name, macro_width, macro_height, site_name, origin = [0, 0], foreign = [0, 0])
    # end
    print('END LIBRARY')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print('Generate lef file for sub modules.')


# dcim parameters
num_row = 2**8
num_col = 2**8
weight_bit_width = 4
input_bit_width = 4
# site parameters
site_name = 'CoreSite'
site_width = 0.19
site_height = 1.26
# lef parameter
lef_convert_factor = 2000


generate_lef_for_sub_modules(num_row, num_col, weight_bit_width, input_bit_width, site_name, site_width, site_height, lef_convert_factor)