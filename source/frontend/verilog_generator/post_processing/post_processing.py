import math
from yosys import generate_yosys_command_files_for_dcim_macro
from yosys import run_yosys_command_files_for_dcim_macro
from insert_pwr_to_verilog import insert_pwr_to_verilog_for_dcim_macro


def post_processing(num_row, num_col, weight_bit_width, input_bit_width):
    # # generate yosys command files.
    # generate_yosys_command_files_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width)
    # # run yosys command files.
    # ys_file_folder_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/yosys_command_file'
    # run_yosys_command_files_for_dcim_macro(ys_file_folder_path)
    # insert pwr to sub module verilog files to run LVS.
    insert_pwr_to_verilog_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width)

num_row = 64
num_col = 64
weight_bit_width = 4
input_bit_width = 4

post_processing(num_row, num_col, weight_bit_width, input_bit_width)