import os
from dcim_macro_generator import generate_dcim_macro

num_row = 2**6
num_col = 2**6
weight_bit_width = 4
input_bit_width = 4

output_path = "verilog_file"

verilog_file_code = generate_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width)

os.chdir(output_path)
file_name = f"dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit.v"
with open(file_name, "w") as f:
    f.write(verilog_file_code)
print(f"Generated {file_name}")