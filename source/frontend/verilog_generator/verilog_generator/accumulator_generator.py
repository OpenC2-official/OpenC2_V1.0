import math
import os
from module_generator import generate_adder_with_cin_for_acc_module
from module_generator import generate_dff_module
from module_generator import generate_inverse_mux_module
from module_generator import generate_accumulator_module

def generate_accumulator(weight_bit_width, input_bit_width, input_num): 
    ### parameter
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    ### modules
    verilog_file_code = ''
    # verilog_file_code += '`include "std_cell_lib.v"\n\n'
    # adder
    verilog_file_code += generate_adder_with_cin_for_acc_module(weight_bit_width, input_bit_width, input_num)
    # dffs
    verilog_file_code += generate_dff_module(psum_bit_width)
    verilog_file_code += generate_dff_module(column_psum_bit_width-1)
    verilog_file_code += generate_dff_module(column_psum_bit_width)
    # inverse_mux
    verilog_file_code += generate_inverse_mux_module(psum_bit_width)
    # (mux_2_1, in std_cell_lib)
    # top: accumulator
    verilog_file_code += generate_accumulator_module(weight_bit_width, input_bit_width, input_num)
    ### return verilog file code
    return verilog_file_code
    
    ### write verilog file
    os.chdir(output_path)
    file_name = f"accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit.v"
    with open(file_name, "w") as f:
        f.write(verilog_file_code)
    print(f"Generated {file_name}")

# input_num = 16
# weight_bit_width = 4
# input_bit_width = 8
# output_path = "verilog_file"

# log_input_num = int(math.log(input_num, 2))
# psum_bit_width = weight_bit_width + log_input_num
# column_psum_bit_width = psum_bit_width + input_bit_width

# os.chdir(output_path)
# file_name = f"accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit.v"
# verilog_file_code = generate_accumulator(weight_bit_width, input_bit_width, input_num)
# with open(file_name, "w") as f:
#     f.write(verilog_file_code)
# print(f"Generated {file_name}")
