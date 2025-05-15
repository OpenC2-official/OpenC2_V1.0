import math
import os
from module_generator import generate_nand_module
from module_generator import generate_decoder_module

def generate_decoder(num_row): 
    ### parameters
    log_num_row = int(math.log(num_row, 2))
    ### modules
    verilog_file_code = ''
    # verilog_file_code += '`include "std_cell_lib.v"\n\n'
    # nand
    verilog_file_code += generate_nand_module(log_num_row+1)
    # top: decoder
    verilog_file_code += generate_decoder_module(num_row)
    ### return verilog file code
    return verilog_file_code

    ### write verilog file
    os.chdir(output_path)
    file_name = f"decoder_{log_num_row}_to_{num_row}.v"
    with open(file_name, "w") as f:
        f.write(verilog_file_code)
    print(f"Generate {file_name}")