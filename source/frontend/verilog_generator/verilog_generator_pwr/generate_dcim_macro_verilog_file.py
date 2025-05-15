import os
from dcim_macro_generator import generate_dcim_macro


def generate_dcim_macro_verilog_file(num_row, num_col, weight_bit_width, input_bit_width):
    verilog_file_code = generate_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width)
    top_module_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    verilog_file_path = f'results/{top_module_name}/frontend/verilog_file/top_module/{top_module_name}_pwr.v'
    with open(verilog_file_path, "w") as f:
        f.write(verilog_file_code)
    print(f"Generated verilog file with power for {top_module_name}.")


num_row = 512
num_col = 512
weight_bit_width = 4
input_bit_width = 4


generate_dcim_macro_verilog_file(num_row, num_col, weight_bit_width, input_bit_width)
