import os
from sram_with_rw_generator import generate_sram_with_rw
from adder_tree_generator import generate_adder_tree
from accumulator_generator import generate_accumulator
from subckt_generator import generate_dcim_column_subckt

def generate_dcim_column(weight_bit_width, input_bit_width, input_num): 
    ### subckts
    spice_file_code = ''
    # sram_with_rw
    spice_file_code += generate_sram_with_rw(weight_bit_width, input_num)
    # adder_tree
    spice_file_code += generate_adder_tree(weight_bit_width, input_num)
    # accumulator
    spice_file_code += generate_accumulator(weight_bit_width, input_bit_width, input_num)
    # top: dcim_column
    spice_file_code += generate_dcim_column_subckt(weight_bit_width, input_bit_width, input_num)
    ### return spice file code
    return spice_file_code


input_num = 2**6
weight_bit_width = 4
input_bit_width = 4
output_path = "spice_file"

os.chdir(output_path)
file_name = f"dcim_column_{input_num}x{weight_bit_width}x{input_bit_width}.sp"
spice_file_code = generate_dcim_column(weight_bit_width, input_bit_width, input_num)
with open(file_name, "w") as f:
    f.write(spice_file_code)
print(f"Generated {file_name}")