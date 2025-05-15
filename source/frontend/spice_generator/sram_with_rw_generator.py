from subckt_generator import generate_sram_subckt
from subckt_generator import generate_sram_rw_subckt
from subckt_generator import generate_sram_with_rw_subckt

def generate_sram_with_rw(weight_bit_width, input_num): 
    ### subcircuits
    spice_file_code = ''
    # sram
    spice_file_code += generate_sram_subckt(weight_bit_width, input_num)
    # sram_rw
    spice_file_code += generate_sram_rw_subckt(weight_bit_width)
    # top: sram_with_rw
    spice_file_code += generate_sram_with_rw_subckt(weight_bit_width, input_num)
    ### return spice file code
    return spice_file_code