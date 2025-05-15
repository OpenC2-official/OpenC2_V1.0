import os
from decoder_generator import generate_decoder
from driver_generator import generate_driver
from dcim_column_generator import generate_dcim_column
from module_generator import generate_dcim_macro_module

def generate_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width): 
    ### modules
    verilog_file_code = ''
    # decoder
    verilog_file_code += generate_decoder(num_row)
    # driver & driver_b
    verilog_file_code += generate_driver(num_row, num_col)
    # dcim_column
    verilog_file_code += generate_dcim_column(weight_bit_width, input_bit_width, num_row)
    # top: dcim_macro
    verilog_file_code += generate_dcim_macro_module(num_row, num_col, weight_bit_width, input_bit_width)
    ### return verilog file code
    return verilog_file_code
    
    ### write verilog file
    os.chdir(output_path)
    file_name = f"dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit.v"
    with open(file_name, "w") as f:
        f.write(verilog_file_code)
    print(f"Generated {file_name}")