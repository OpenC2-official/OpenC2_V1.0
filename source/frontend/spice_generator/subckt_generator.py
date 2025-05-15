import math

def generate_adder_subckt(bit_width):
    # info
    cell_name = f"adder_{bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} "
    subckt_code += "vdd gnd " 
    for i in range(bit_width): 
        subckt_code += f"a[{i}] "
    for i in range(bit_width):
        subckt_code += f"b[{i}] "
    for i in range(bit_width):
        subckt_code += f"s[{i}] "
    subckt_code += "\n"
    # circuit
    subckt_code += f"xi_ha_0 vdd gnd a[0] b[0] s[0] c[0] half_adder\n"
    for i in range(1, bit_width):
        subckt_code += f"xi_fa_{i} vdd gnd a[{i}] b[{i}] c[{i-1}] s[{i}] c[{i}] full_adder\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_adder_sign_extension_subckt(bit_width):
    # info
    cell_name = f"adder_{bit_width}bit_sign_extension"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} "
    subckt_code += "vdd gnd sign " 
    for i in range(bit_width):
        subckt_code += f"a[{i}] "
    for i in range(bit_width):
        subckt_code += f"b[{i}] "
    for i in range(bit_width + 1):
        subckt_code += f"s[{i}] "
    subckt_code += "\n" 
    # circuit
    subckt_code += f"xi_ha_0 vdd gnd a[0] b[0] s[0] c[0] half_adder\n"
    for i in range(1, bit_width):
        subckt_code += f"xi_fa_{i} vdd gnd a[{i}] b[{i}] c[{i-1}] s[{i}] c[{i}] full_adder\n"
    subckt_code += f"xi_fa_{bit_width} vdd gnd sign a[{bit_width-1}] b[{bit_width-1}] c[{bit_width-1}] s[{bit_width}] adder_sign_extension\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_adder_with_cin_subckt(bit_width):
    # info
    cell_name = f"adder_{bit_width}bit_with_cin"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} "
    subckt_code += "vdd gnd c_in " 
    for i in range(bit_width):
        subckt_code += f"a[{i}] "
    for i in range(bit_width):
        subckt_code += f"b[{i}] "
    for i in range(bit_width):
        subckt_code += f"s[{i}] "
    subckt_code += "\n" 
    # circuit
    subckt_code += f"xi_fa_0 vdd gnd a[0] b[0] c_in s[0] c[0] full_adder\n"
    for i in range(1, bit_width):
        subckt_code += f"xi_fa_{i} vdd gnd a[{i}] b[{i}] c[{i-1}] s[{i}] c[{i}] full_adder\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_adder_tree_subckt(weight_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    cell_name = f"adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd sign_weight "
    for i in range(input_num):
        for j in range(weight_bit_width):
            subckt_code += f"in_{i}[{j}] "
    for i in range(psum_bit_width):
        subckt_code += f"out[{i}] "
    subckt_code += "\n"
    # circuit
    # adder_first_layer
    for i in range(input_num//2):
        subckt_code += f"xi_adder_{weight_bit_width}bit_{i} vdd gnd sign_weight "
        for j in range(weight_bit_width):
            subckt_code += f"in_{2*i}[{j}] "
        for j in range(weight_bit_width):
            subckt_code += f"in_{2*i+1}[{j}] "
        for j in range(weight_bit_width+1):
            subckt_code += f"sum_{weight_bit_width}bit_{i}[{j}] "
        subckt_code += f"adder_{weight_bit_width}bit_sign_extension\n"
    # adder_mid_layers
    for k in range(log_input_num-2):
        for i in range(input_num//2**(k+2)):
            subckt_code += f"xi_adder_{weight_bit_width+k+1}bit_{i} vdd gnd sign_weight "
            for j in range(weight_bit_width+k+1):
                subckt_code += f"sum_{weight_bit_width+k}bit_{2*i}[{j}] "
            for j in range(weight_bit_width+k+1):
                subckt_code += f"sum_{weight_bit_width+k}bit_{2*i+1}[{j}] "
            for j in range(weight_bit_width+k+2):
                subckt_code += f"sum_{weight_bit_width+k+1}bit_{i}[{j}] "
            subckt_code += f"adder_{weight_bit_width+k+1}bit_sign_extension\n"
    # adder_last_layer
    subckt_code += f"xi_adder_{psum_bit_width-1}bit vdd gnd sign_weight "
    for j in range(psum_bit_width-1):
        subckt_code += f"sum_{psum_bit_width-2}bit_{0}[{j}] "
    for j in range(psum_bit_width-1):
        subckt_code += f"sum_{psum_bit_width-2}bit_{1}[{j}] "
    for j in range(psum_bit_width):
        subckt_code += f"out[{j}] "
    subckt_code += f"adder_{psum_bit_width-1}bit_sign_extension\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_dff_subckt(bit_width):
    # info
    cell_name = f"dff_{bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd clk rst_b "
    for i in range(bit_width):
        subckt_code += f"in[{i}] "
    for i in range(bit_width):
        subckt_code += f"out[{i}] "
    subckt_code += "\n"
    # circuit
    for i in range(bit_width):
        subckt_code += f"xi_dff_{i} vdd gnd clk rst_b in_{i} out_{i} dff\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_inverse_mux_subckt(bit_width):
    # info
    cell_name = f"inverse_mux_{bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} sign vdd gnd "
    for i in range(bit_width):
        subckt_code += f"in[{i}] "
    for i in range(bit_width):
        subckt_code += f"out[{i}] "
    # circuit
    subckt_code += "\nxi_inv_sign vdd gnd sign sign_b inverter\n"
    for i in range(bit_width):
        subckt_code += f"xi_inv_in_{i} vdd gnd in[{i}] in_b[{i}] inverter\n"
    for i in range(bit_width):
        subckt_code += f"xi_in_0_{i} vdd gnd in[{i}] sign_b in_0[{i}] nand2\n"
        subckt_code += f"xi_in_1_{i} vdd gnd in_b[{i}] sign in_1[{i}] nand2\n"
    for i in range(bit_width):
        subckt_code += f"xi_out_{i} vdd gnd in_0[{i}] in_1[{i}] out[{i}] nand2\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_adder_with_cin_for_acc_subckt(weight_bit_width, input_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    cell_name = f"adder_{column_psum_bit_width}bit_with_cin_for_acc"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} "
    subckt_code += "vdd gnd c_in " 
    for i in range(psum_bit_width):
        subckt_code += f"a_0_to_{psum_bit_width-1}[{i}] "
    for i in range(input_bit_width): 
        subckt_code += f"a_{psum_bit_width+i} "
    subckt_code += f"b_0 "    
    for i in range(column_psum_bit_width-1):
        subckt_code += f"b_1_to_{column_psum_bit_width-1}[{i}] "
    for i in range(column_psum_bit_width):
        subckt_code += f"s[{i}] "
    subckt_code += "\n" 
    # circuit
    subckt_code += f"xi_fa_0 vdd gnd a_0_to_{psum_bit_width-1}[0] b_0 c_in s[0] c[0] full_adder\n"
    for i in range(1, psum_bit_width):
        subckt_code += f"xi_fa_{i} vdd gnd a_0_to_{psum_bit_width-1}[{i}] b_1_to_{column_psum_bit_width-1}[{i-1}] c[{i-1}] s[{i}] c[{i}] full_adder\n"
    for i in range(psum_bit_width, column_psum_bit_width):
        subckt_code += f"xi_fa_{i} vdd gnd a_{i} b_1_to_{column_psum_bit_width-1}[{i-1}] c[{i-1}] s[{i}] c[{i}] full_adder\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_accumulator_subckt(weight_bit_width, input_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    cell_name = f"accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd clk_psum clk_shift clk_out rst_b sign_weight sign_in in_msb "
    for i in range(psum_bit_width):
        subckt_code += f"in[{i}] "
    for i in range(column_psum_bit_width):
        subckt_code += f"out[{i}] "
    subckt_code += "sign_out "
    # circuit
    # nor2 & inverter for sign_out
    subckt_code += "xi_nor_sign_out vdd gnd sign_weight sign_in sign_out_b nor2\n"
    subckt_code += "xi_inv_sign_out vdd gnd sign_out_b sign_out inverter\n"    
    # nand2 & inverter for sign_in_msb
    subckt_code += "xi_nand_acc vdd gnd sign_in in_msb sign_in_msb_b nand2\n"
    subckt_code += "xi_inv_acc vdd gnd sign_in_msb_b sign_in_msb inverter\n"
    # 0.dff_psum
    subckt_code += "\nxi_dff_psum vdd gnd clk_psum rst_b_psum "
    for i in range(psum_bit_width):
        subckt_code += f"in[{i}] "
    for i in range(psum_bit_width):
        subckt_code += f"psum[{i}] "
    subckt_code += f"dff_{psum_bit_width}bit\n"
    # inverse_mux
    subckt_code += "xi_inverse_mux vdd gnd sign_in_msb "
    for i in range(psum_bit_width):
        subckt_code += f"psum[{i}] "
    for i in range(psum_bit_width):
        subckt_code += f"complement[{i}] "
    subckt_code += f"inverse_mux_{psum_bit_width}bit\n"
    # mux_2_1
    subckt_code += f"xi_mux vdd gnd sign_weight sign_in_msb complement[{psum_bit_width-1}] extension mux_2_1\n"
    # tiel
    subckt_code += f"xi_tie_low vdd gnd tie_to_low tiel\n"
    # adder_with_cin
    subckt_code += "xi_adder vdd gnd sign_in_msb "
    for i in range(psum_bit_width):
        subckt_code += f"complement[{i}] "
    for i in range(input_bit_width):
        subckt_code += f"extension "
    subckt_code += "tie_to_low "
    for i in range(column_psum_bit_width-1):
        subckt_code += f"shift[{i}] " 
    for i in range(column_psum_bit_width):
        subckt_code += f"sum[{i}] "
    subckt_code += f"adder_{column_psum_bit_width}bit_with_cin_for_acc\n"
    # dff_shift
    subckt_code += "xi_dff_shift vdd gnd clk_shift rst_b_shift "
    for i in range(column_psum_bit_width-1):
        subckt_code += f"sum[{i}] " 
    for i in range(column_psum_bit_width-1):
        subckt_code += f"shift[{i}] " 
    subckt_code += f"dff_{column_psum_bit_width-1}bit\n"
    # dff_out
    subckt_code += "xi_dff_out vdd gnd clk_out rst_b_out "
    for i in range(column_psum_bit_width):
        subckt_code += f"sum[{i}] " 
    for i in range(column_psum_bit_width):
        subckt_code += f"out[{i}] " 
    subckt_code += f"dff_{column_psum_bit_width}bit\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_sram_subckt(weight_bit_width, input_num):
    # info
    cell_name = f"sram_{input_num}x{weight_bit_width}"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd "
    for i in range(input_num):
        subckt_code += f"wl[{i}] "
    for i in range(input_num):
        subckt_code += f"in_b[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"bl[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"bl_b[{i}] "
    for j in range(input_num):
        for i in range(weight_bit_width):
            subckt_code += f"bitcell_out_{j}[{i}] "
    subckt_code += "\n"
    # circuit
    for j in range(input_num):
        for i in range(weight_bit_width):
            subckt_code += f"xi_bitcell_{j}_{i} vdd gnd wl[{j}] in_b[{j}] bl[{i}] bl_b[{i}] bitcell_out_{j}[{i}] dcim_bitcell\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_sram_rw_subckt(weight_bit_width):
    # info
    cell_name = f"sram_rw_{weight_bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd "
    for i in range(weight_bit_width):
        subckt_code += f"bl[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"bl_b[{i}] "
    subckt_code += "pe ysw ysr spe se "
    for i in range(weight_bit_width):
        subckt_code += f"din[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"dout[{i}] "
    subckt_code += "\n"
    # circuit
    for i in range(weight_bit_width):
        subckt_code += f"xi_rw_{i} vdd gnd bl[{i}] bl_b[{i}] pe ysw ysr spe se din[{i}] dout[{i}] sram_rw\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_sram_with_rw_subckt(weight_bit_width, input_num):
    # info
    cell_name = f"sram_{input_num}x{weight_bit_width}_with_rw"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd "
    subckt_code += "pe ysw ysr spe se "
    for i in range(input_num):
        subckt_code += f"wl[{i}] "
    for i in range(input_num):
        subckt_code += f"in_b[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"din[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"dout[{i}] "
    for j in range(input_num):
        for i in range(weight_bit_width):
            subckt_code += f"bitcell_out_{j}[{i}] "
    subckt_code += "\n"
    # circuit
    # sram
    sub_subckt_name = f"sram_{input_num}x{weight_bit_width}"
    subckt_code += "xi_sram vdd gnd "
    for i in range(input_num):
        subckt_code += f"wl[{i}] "
    for i in range(input_num):
        subckt_code += f"in_b[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"bl[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"bl_b[{i}] "
    for j in range(input_num):
        for i in range(weight_bit_width):
            subckt_code += f"bitcell_out_{j}[{i}] "
    subckt_code += f"{sub_subckt_name}\n"
    # sram_rw
    sub_subckt_name = f"sram_rw_{weight_bit_width}bit"
    subckt_code += "xi_sram_rw vdd gnd "
    for i in range(weight_bit_width):
        subckt_code += f"bl[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"bl_b[{i}] "
    subckt_code += "pe ysw ysr spe se "
    for i in range(weight_bit_width):
        subckt_code += f"din[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"dout[{i}] "
    subckt_code += f"{sub_subckt_name}\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_dcim_column_subckt(weight_bit_width, input_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    cell_name = f"dcim_column_{input_num}x{weight_bit_width}x{input_bit_width}"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd clk_psum clk_shift clk_out rst_b "
    subckt_code += "sign_weight sign_in in_msb pe ysw ysr spe se "
    for i in range(input_num):
        subckt_code += f"wl[{i}] "
    for i in range(input_num):
        subckt_code += f"in_b[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"din[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"dout[{i}] "
    for i in range(column_psum_bit_width):
        subckt_code += f"column_psum[{i}] "
    subckt_code += "sign_out \n"
    # circuit
    # sram_with_rw
    sub_subckt_name = f"sram_{input_num}x{weight_bit_width}_with_rw"
    subckt_code += "xi_sram_with_rw vdd gnd "
    subckt_code += f"pe ysw ysr spe se "
    for i in range(input_num):
        subckt_code += f"wl[{i}] "
    for i in range(input_num):
        subckt_code += f"in_b[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"din[{i}] "
    for i in range(weight_bit_width):
        subckt_code += f"dout[{i}] "
    for j in range(input_num):
        for i in range(weight_bit_width):
            subckt_code += f"bitcell_out_{j}[{i}] "
    subckt_code += f"{sub_subckt_name}\n"
    # adder_tree
    sub_subckt_name = f"adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit"
    subckt_code += "xi_adder_tree vdd gnd sign_weight "
    for i in range(input_num):
        for j in range(weight_bit_width):
            subckt_code += f"bitcell_out_{i}[{j}] "
    for i in range(psum_bit_width):
        subckt_code += f"psum[{i}] "
    subckt_code += f"{sub_subckt_name}\n"
    # accumulator
    sub_subckt_name = f"accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit" 
    subckt_code += "xi_accumulator vdd gnd "
    subckt_code += "clk_psum clk_shift clk_out rst_b "
    subckt_code += "sign_weight sign_in, in_msb "
    for i in range(psum_bit_width):
        subckt_code += f"psum[{i}] "
    for i in range(column_psum_bit_width):
        subckt_code += f"column_psum[{i}] "
    subckt_code += "sign_out "
    subckt_code += f"{sub_subckt_name}\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_nand_subckt(num):
    # info
    cell_name = f"nand{num}"
    subckt_code = f"** Cell name: {cell_name}\n"
    # pin
    subckt_code += f".subckt {cell_name} vdd gnd "
    for i in range(num):
        subckt_code += f"in_{i} "
    subckt_code += "out \n"
    # circuit
    # num_nand2 = num-1, num_inverter = num-2
    subckt_code += f"  xi_nand2_0 vdd gnd in_0 in_1 nand_0 nand2\n"
    subckt_code += f"  xi_inv_0 nand_0 and_0 inverter\n"
    for i in range(1, num-2): 
        subckt_code += f"  xi_nand2_{i} and_{i-1} in_{i+1} nand_{i} nand2 \n"
        subckt_code += f"  xi_inv_{i} nand_{i} and_{i} inverter\n"
    subckt_code += f"  xi_nand2_{num-2} and_{num-3} in_{num-1} out nand2 \n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_decoder_subckt(num_row):
    # parameter
    log_num_row = int(math.log(num_row, 2))
    # info
    cell_name = f"decoder_{log_num_row}_to_{num_row}"
    subckt_code = f"** Cell name: {cell_name}\n"
    subckt_code += f".subckt {cell_name} vdd gnd "
    # pins
    subckt_code += "enable "
    for i in range(log_num_row):
        subckt_code += f"in[{i}] "
    for i in range(num_row):
        subckt_code += f"out[{i}] "
    subckt_code += "\n"
    # circuit
    # inverter
    for i in range(log_num_row): 
        subckt_code += f"  xi_inv_{i} in[{i}] in_b[{i}] inverter\n"
    # nand
    for j in range(num_row): 
        subckt_code += f"  xi_nand_{j} "
        temp = j
        for i in range(log_num_row): 
            if temp%2 == 0:
                subckt_code += f"in_b[{i}] "
            else: 
                subckt_code += f"in[{i}] "
            temp = temp//2
        subckt_code += f"enable "
        subckt_code += f"out[{j}] nand{log_num_row+1}\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_inverter_subckt(size): 
    # info
    cell_name = f"inverter{size}"
    subckt_code = f"** Cell name: {cell_name}\n"
    subckt_code += f".subckt {cell_name} vdd gnd "
    # pins
    subckt_code += f"in out\n"
    # circuit
    for i in range(size): 
        subckt_code += f"  xi_inv_{i} in out inverter\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_driver_subckt(num_row, num_col):
    # parameter
    stage = math.ceil((math.ceil(math.log(num_col/16, 4))+1)/2)*2
    # info
    cell_name = f"driver_{num_row}x{num_col}"
    subckt_code = f"** Cell name: {cell_name} (stage = {stage})\n"
    subckt_code += f".subckt {cell_name} vdd gnd "
    # pins
    for i in range(num_row):
        subckt_code += f"in[{i}] "
    for i in range(num_row):
        subckt_code += f"out[{i}] "
    subckt_code += "\n"
    # circuit
    # inverter
    size = int(num_col/16)
    in_name = 'out_b'
    out_name = 'out'
    for j in range(stage-1): 
        for i in range(num_row):
            if size == 1:
                subckt_code += f"  xi_inv_stage{stage-1-j}_{i} {in_name}[{i}] {out_name}[{i}] inverter\n"
            else: 
                subckt_code += f"  xi_inv{size}_stage{stage-1-j}_{i} {in_name}[{i}] {out_name}[{i}] inverter{size}\n"
        size = math.ceil(size/4)
        in_name += '_b'
        out_name += '_b'
    for i in range(num_row):
        subckt_code += f"  xi_inv_stage0_{i} in[{i}] {out_name}[{i}] inverter\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_driver_b_subckt(num_row, num_col):
    # parameter
    stage = math.ceil(math.ceil(math.log(num_col/16, 4))/2)*2+1
    # info
    cell_name = f"driver_b_{num_row}x{num_col}"
    subckt_code = f"** Cell name: {cell_name} (stage = {stage})\n"
    subckt_code += f".subckt {cell_name} vdd gnd "
    # pins
    for i in range(num_row):
        subckt_code += f"in[{i}] "
    for i in range(num_row):
        subckt_code += f"out[{i}] "
    subckt_code += "\n"
    # circuit
    # inverter
    size = int(num_col/16)
    in_name = 'out_b'
    out_name = 'out'
    for j in range(stage-1): 
        for i in range(num_row):
            if size == 1:
                subckt_code += f"  xi_inv_stage{stage-1-j}_{i} {in_name}[{i}] {out_name}[{i}] inverter\n"
            else: 
                subckt_code += f"  xi_inv{size}_stage{stage-1-j}_{i} {in_name}[{i}] {out_name}[{i}] inverter{size}\n"
        size = math.ceil(size/4)
        in_name += '_b'
        out_name += '_b'
    for i in range(num_row):
        subckt_code += f"  xi_inv_stage0_{i} in[{i}] {out_name}[{i}] inverter\n"
    # end
    subckt_code += f".ends {cell_name}\n"
    subckt_code += f"** End of subcircuit definition.\n\n"
    return subckt_code

def generate_dcim_macro_subckt(num_row, num_col, weight_bit_width, input_bit_width): 
    # parameter
    num_dcim_column = int(num_col/weight_bit_width)
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width
    # info
    cell_name = f"dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit"
    subckt_code = f"** Cell name: {cell_name}\n"
    subckt_code += f".subckt {cell_name} vdd gnd "
    # pins
    subckt_code += f"clk rst r_w_cim[0] r_w_cim[1] start "
    for i in range(num_dcim_column): 
        subckt_code += f"sign_weight[{i}] "
    subckt_code += "sign_in "
    for i in range(log_num_row): 
        subckt_code += f"wl_address[{i}] "
    for i in range(num_row): 
        subckt_code += f"in[{i}] "
    for i in range(num_col): 
        subckt_code += f"din[{i}] "
    for i in range(num_col): 
        subckt_code += f"dout[{i}] "    
    for i in range(num_dcim_column): 
        subckt_code += f"sign_out[{i}] "
    subckt_code += "rd_data_enable cim_data_enable busy "
    for i in range(num_dcim_column): 
        for j in range(column_psum_bit_width):
            subckt_code += f"out_{i}[{j}] "
    subckt_code += "\n"
    # control unit
    subckt_code += f"  xi_control_block "
    subckt_code += "clk rst r_w_cim[0] r_w_cim[1] start "
    subckt_code += "wl_enable pe ysw ysr spe se rd_data_enable "
    subckt_code += "clk_b rst_b in_msb clk_out cim_data_enable busy "
    subckt_code += f"control \n"
    # decoder
    subckt_code += f"  decoder_{log_num_row}_to_{num_row} xi_decoder (.enable(wl_enable), .in(wl_address), .out(wl_address_decoded));\n"
    # driver
    subckt_code += f"  driver_{num_row}x{num_col} driver_for_wl (.in(wl_address_decoded), .out(wl));\n"
    subckt_code += f"  driver_b_{num_row}x{num_col} driver_for_input (.in(in), .out(in_b));\n"
    # for clk_b
    subckt_code += f"  inverter inv_clk (.in(clk), .out(clk_b));\n"
    # dcim column
    sub_subckt_name = f"dcim_column_{num_row}x{weight_bit_width}x{input_bit_width}"
    for j in range(num_dcim_column): 
        subckt_code += f"  {sub_subckt_name} dcim_column_{j} ("
        subckt_code += ".clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), "
        subckt_code += ".rst_b(rst_b), "
        subckt_code += f".sign_weight(sign_weight[{j}]), .sign_in(sign_in), .in_msb(in_msb), "
        subckt_code += ".pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), "
        subckt_code += ".wl(wl), .in_b(in_b), "
        subckt_code += f".din(din[{weight_bit_width*(j+1)-1}:{weight_bit_width*j}]), "
        subckt_code += f".dout(dout[{weight_bit_width*(j+1)-1}:{weight_bit_width*j}]), "
        subckt_code += f".column_psum(out_{j}), "
        subckt_code += f".sign_out(sign_out[{j}]));\n"
    # end
    subckt_code += "endsubckt\n"
    subckt_code += "// End of subckt definition.\n\n"
    return subckt_code
