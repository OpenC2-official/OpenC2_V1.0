import math
import subprocess
import os


def generate_yosys_flatten_command_file(top_module_path, sub_module_name, sub_module_path, output_file_path, std_cell_lib_verilog_file_path, 
                                        std_cell_lib = 'inverter nand2 nor2 xor2 mux_2_1 half_adder full_adder adder_sign_extension dff dcim_bitcell sram_rw filler tiel tieh'):
    yosys_command = f'read_verilog {top_module_path}\n'
    if std_cell_lib_verilog_file_path:
        yosys_command += f'read_verilog {std_cell_lib_verilog_file_path}\n'
    yosys_command += f'hierarchy -check -top {sub_module_name}\n'
    yosys_command += f'blackbox {std_cell_lib}\n'
    yosys_command += 'flatten\n'
    yosys_command += 'splitnets -ports\n'
    yosys_command += 'clean\n'
    yosys_command += f'write_verilog {sub_module_path}\n'
    with open(output_file_path, "w") as file:
        file.write(yosys_command)


def generate_yosys_synthesis_command_file(rtl_module_path, gate_module_path, synthesized_module_name, output_file_path, std_cell_lib_lib_file_path):
    yosys_command = f'read_verilog {rtl_module_path}\n'
    yosys_command += f'hierarchy -check -top {synthesized_module_name}\n'
    yosys_command += 'proc; opt; memory; opt; fsm; opt\n'
    yosys_command += 'techmap; opt\n'
    yosys_command += f'dfflibmap -liberty {std_cell_lib_lib_file_path}\n'
    yosys_command += f'abc -liberty {std_cell_lib_lib_file_path}\n'
    yosys_command += 'hilomap -hicell tieh out -locell tiel out\n'
    yosys_command += 'insbuf -buf buffer in out\n'
    yosys_command += 'clean\n'
    yosys_command += f'write_verilog {gate_module_path}\n'
    with open(output_file_path, "w") as file:
        file.write(yosys_command)


def generate_yosys_command_files_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width):
    # parameters
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width    
    # module name
    top_module_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    sram_with_rw_name = f'sram_{num_row}x{weight_bit_width}_with_rw'
    adder_tree_name = f'adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit'
    accumulator_name = f'accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit'
    decoder_name = f'decoder_{log_num_row}_to_{num_row}'
    driver_name = f'driver_{num_row}x{num_col}'
    driver_b_name = f'driver_b_{num_row}x{num_col}'
    control_name = f'control_for_{input_bit_width}bit_input'
    control_rtl_name = f'control_rtl_for_{input_bit_width}bit_input'
    control_gate_name = f'control_gate_for_{input_bit_width}bit_input'
    # top_module_path
    top_module_path = f'results/{top_module_name}/frontend/verilog_file/top_module/{top_module_name}.v'
    # synthesis_flatten
    control_rtl_module_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/synthesis/{control_rtl_name}.v'
    control_gate_module_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/synthesis/{control_gate_name}.v'
    output_file_path = f'results/{top_module_name}/frontend/yosys_command_file/synthesis_{control_name}.ys'
    std_cell_lib_lib_file_path = 'library/lib/std_cell_lib.lib'
    generate_yosys_synthesis_command_file(control_rtl_module_path, control_gate_module_path, control_name, output_file_path, std_cell_lib_lib_file_path)
    print("Generate yosys synthesis command file.")
    # flatten
    std_cell_lib_verilog_file_path = 'library/verilog/std_cell_lib.v'
    sub_module_name_list = [sram_with_rw_name, adder_tree_name, accumulator_name, decoder_name, driver_name, driver_b_name]
    for sub_module_name in sub_module_name_list:
        sub_module_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/flatten/{sub_module_name}_flatten.v'
        output_file_path = f'results/{top_module_name}/frontend/yosys_command_file/flatten_{sub_module_name}.ys'
        generate_yosys_flatten_command_file(top_module_path, sub_module_name, sub_module_path, output_file_path, None)
    # flatten control
    control_flatten_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/flatten/{control_name}_flatten.v'
    output_file_path = f'results/{top_module_name}/frontend/yosys_command_file/flatten_{control_name}.ys'
    generate_yosys_flatten_command_file(control_gate_module_path, control_name, control_flatten_path, output_file_path, std_cell_lib_verilog_file_path)
    print("Generate yosys flatten command files.")
    

def run_yosys_command_file(command_file):
    command = ["yosys", command_file]
    subprocess.run(command)


def run_yosys_command_files_for_dcim_macro(folder_path):
    for root, dirs, files in os.walk(folder_path):
        # run synthesis command file firstly
        for file in files:
            if file.startswith('synthesis'):
                file_path = os.path.join(root, file)
                run_yosys_command_file(file_path)
                files.remove(file)
        for file in files:
            run_yosys_command_file(os.path.join(root, file))
    print("Run yosys command files for dcim macro.")

