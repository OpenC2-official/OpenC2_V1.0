import math
import os
from subckt_generator import generate_adder_with_cin_for_acc_subckt
from subckt_generator import generate_dff_subckt
from subckt_generator import generate_inverse_mux_subckt
from subckt_generator import generate_accumulator_subckt

def generate_accumulator(weight_bit_width, input_bit_width, input_num): 
    ### parameter
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    ### subckts
    spice_file_code = ''
    # adder
    spice_file_code += generate_adder_with_cin_for_acc_subckt(weight_bit_width, input_bit_width, input_num)
    # dffs
    spice_file_code += generate_dff_subckt(psum_bit_width)
    spice_file_code += generate_dff_subckt(column_psum_bit_width-1)
    spice_file_code += generate_dff_subckt(column_psum_bit_width)
    # inverse_mux
    spice_file_code += generate_inverse_mux_subckt(psum_bit_width)
    # (mux_2_1, in std_cell_lib)
    # top: accumulator
    spice_file_code += generate_accumulator_subckt(weight_bit_width, input_bit_width, input_num)
    ### return spice file code
    return spice_file_code