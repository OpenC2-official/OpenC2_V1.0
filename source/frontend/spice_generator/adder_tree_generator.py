import math
from subckt_generator import generate_adder_sign_extension_subckt
from subckt_generator import generate_adder_tree_subckt

def generate_adder_tree(weight_bit_width, input_num): 
    ### parameters
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    ### modules
    spice_file_code = ''
    # adders
    for i in range(weight_bit_width, psum_bit_width):
        spice_file_code += generate_adder_sign_extension_subckt(i)
    # top: adder_tree
    spice_file_code += generate_adder_tree_subckt(weight_bit_width, input_num)
    ### return verilog file code
    return spice_file_code
