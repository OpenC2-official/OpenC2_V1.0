import math

def insert_pwr_to_verilog(input_verilog_file_path, output_verilog_file_path):
    with open(input_verilog_file_path, 'r') as file:
        lines = file.readlines()
    previous_line = ''
    processed_lines = ''
    port = 0
    for line in lines: 
        if line.strip().startswith('(') or line.strip().startswith('/*'):
            line = ''
        elif line.strip().startswith('module'):
            line = line.replace('(', '(vdd, gnd, ').replace(');', ');\n  inout vdd; \n  inout gnd; ')
        elif line.strip().startswith('.'):
            port += 1
            if previous_line: 
                previous_line = previous_line.rstrip()
            if port == 1:
                previous_line += '.vdd(vdd), .gnd(gnd), '
        else: 
            port = 0
        processed_lines += previous_line
        previous_line = line
    processed_lines += previous_line
    output_verilog_file_path
    with open(output_verilog_file_path, 'w') as file:
        file.write(''.join(processed_lines))


def insert_pwr_to_verilog_for_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width):
    top_module_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    input_verilog_file_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/synthesis/control_gate_for_{input_bit_width}bit_input.v'
    output_verilog_file_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/pwr/control_for_{input_bit_width}bit_input_pwr.v'
    # insert pwr to verilog to run LVS.
    insert_pwr_to_verilog(input_verilog_file_path, output_verilog_file_path)
    print('Insert power and ground pin to verilog files of control.')

    # # parameters
    # log_num_row = int(math.log(num_row, 2))
    # psum_bit_width = weight_bit_width + log_num_row
    # column_psum_bit_width = psum_bit_width + input_bit_width  
    # # module name
    # top_module_name = f'dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit'
    # sram_with_rw_name = f'sram_{num_row}x{weight_bit_width}_with_rw'
    # adder_tree_name = f'adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit'
    # accumulator_name = f'accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit'
    # decoder_name = f'decoder_{log_num_row}_to_{num_row}'
    # driver_name = f'driver_{num_row}x{num_col}'
    # driver_b_name = f'driver_b_{num_row}x{num_col}'
    # control_name = f'control_for_{input_bit_width}bit_input'
    # # sub module name list
    # sub_module_name_list = [sram_with_rw_name, adder_tree_name, accumulator_name, decoder_name, driver_name, driver_b_name, control_name]
    # for sub_module_name in sub_module_name_list:
    #     input_verilog_file_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/flatten/{sub_module_name}_flatten.v'
    #     output_verilog_file_path = f'results/{top_module_name}/frontend/verilog_file/sub_modules/flatten_pwr/{sub_module_name}_flatten_pwr.v'
    #     # insert pwr to verilog to run LVS.
    #     insert_pwr_to_verilog(input_verilog_file_path, output_verilog_file_path)
    # # top module
    # top_module_path = f'results/{top_module_name}/frontend/verilog_file/top_module/{top_module_name}.v'
    # top_module_pwr_path = f'results/{top_module_name}/frontend/verilog_file/top_module/{top_module_name}_pwr.v'
    # # insert pwr to verilog to run LVS.
    # insert_pwr_to_verilog(top_module_path, top_module_pwr_path)


