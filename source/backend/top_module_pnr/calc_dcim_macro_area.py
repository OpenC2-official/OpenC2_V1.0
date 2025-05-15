import json


def get_sub_module_area(result_path):
    # read area from json file
    area_path = result_path + '/area.json'
    with open(area_path, 'r') as area_file:
        area = json.load(area_file)
    return area


def calc_dcim_macro_area(num_row, num_col, weight_bit_width, input_bit_width):
    # module name
    top_design_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    result_path = f'results/{top_design_name}/backend/sub_modules/placed_def_file'
    # sram_with_rw_area
    sram_with_rw_area = get_sub_module_area(result_path + '/sram_with_rw')
    # accumulator_area
    accumulator_area = get_sub_module_area(result_path + '/accumulator')
    # control_area
    control_area = get_sub_module_area(result_path + '/control')
    # macro_area
    macro_width = int(num_col/weight_bit_width)*accumulator_area[1][0] + control_area[1][0]
    macro_height = sram_with_rw_area[1][1] + accumulator_area[1][1]
    macro_area = macro_width*macro_height/10**6
    print(f"Area of dcim_macro_64x64_for_4bitx4bit is {macro_area} mm2.")


num_row = 2**8
num_col = 2**8
weight_bit_width = 4
input_bit_width = 4

calc_dcim_macro_area(num_row, num_col, weight_bit_width, input_bit_width)