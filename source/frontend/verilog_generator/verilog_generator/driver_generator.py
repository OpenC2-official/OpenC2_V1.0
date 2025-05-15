import math
import os
from module_generator import generate_inverter_module
from module_generator import generate_driver_module
from module_generator import generate_driver_b_module

def generate_driver(num_row, num_col): 
    ### parameters
    size = int(num_col/16)
    ### modules
    verilog_file_code = ''
    # verilog_file_code += '`include "std_cell_lib.v"\n\n'
    # inverter
    while(size > 1):
        verilog_file_code += generate_inverter_module(size)
        size = int(size/4)
    # top: driver & driver_b
    verilog_file_code += generate_driver_module(num_row, num_col)
    verilog_file_code += generate_driver_b_module(num_row, num_col)
    ### return verilog file code
    return verilog_file_code

    ### write verilog file
    os.chdir(output_path)
    file_name = f"decoder_{log_num_row}_to_{num_row}.v"
    with open(file_name, "w") as f:
        f.write(verilog_file_code)
    print(f"Generate {file_name}")
