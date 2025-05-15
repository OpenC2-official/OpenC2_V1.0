import os
from sram_with_rw_generator import generate_sram_with_rw
from adder_tree_generator import generate_adder_tree
from accumulator_generator import generate_accumulator
from module_generator import generate_dcim_column_module

def generate_dcim_column(weight_bit_width, input_bit_width, input_num): 
    ### modules
    verilog_file_code = ''
    # verilog_file_code += '`include "std_cell_lib.v"\n\n'
    # sram_with_rw
    verilog_file_code += generate_sram_with_rw(weight_bit_width, input_num)
    # adder_tree
    verilog_file_code += generate_adder_tree(weight_bit_width, input_num)
    # accumulator
    verilog_file_code += generate_accumulator(weight_bit_width, input_bit_width, input_num)
    # top: dcim_column
    verilog_file_code += generate_dcim_column_module(weight_bit_width, input_bit_width, input_num)
    ### return verilog file code
    return verilog_file_code
    
    ### write verilog file
    os.chdir(output_path)
    file_name = f"dcim_column_{input_num}x{weight_bit_width}x{input_bit_width}.v"
    with open(file_name, "w") as f:
        f.write(verilog_file_code)
    print(f"Generated {file_name}")


# input_num = 2**6
# weight_bit_width = 4
# input_bit_width = 4
# output_path = "verilog_file"

# os.chdir(output_path)
# file_name = f"dcim_column_{input_num}x{weight_bit_width}x{input_bit_width}.v"
# verilog_file_code = generate_dcim_column(weight_bit_width, input_bit_width, input_num)
# with open(file_name, "w") as f:
#     f.write(verilog_file_code)
# print(f"Generated {file_name}")