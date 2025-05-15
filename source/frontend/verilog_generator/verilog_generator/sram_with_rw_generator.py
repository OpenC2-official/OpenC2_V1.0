import os
from module_generator import generate_sram_module
from module_generator import generate_sram_rw_module
from module_generator import generate_sram_with_rw_module

def generate_sram_with_rw(weight_bit_width, input_num): 
    ### modules
    verilog_file_code = ''
    # verilog_file_code += '`include "std_cell_lib.v"\n\n'
    # sram
    verilog_file_code += generate_sram_module(weight_bit_width, input_num)
    # sram_rw
    verilog_file_code += generate_sram_rw_module(weight_bit_width)
    # top: sram_with_rw
    verilog_file_code += generate_sram_with_rw_module(weight_bit_width, input_num)
    ### return verilog file code
    return verilog_file_code

    ### write verilog file
    os.chdir(output_path)
    file_name = f"sram_{input_num}x{weight_bit_width}_with_rw.v"
    with open(file_name, "w") as f:
        f.write(verilog_file_code)
    print(f"Generate {file_name}")
