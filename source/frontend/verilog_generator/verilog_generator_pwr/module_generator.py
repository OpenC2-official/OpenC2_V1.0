import math

def generate_adder_module(bit_width):
    # info
    module_name = f"adder_{bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  input [{bit_width-1}:0] a,\n"
    module_code += f"  input [{bit_width-1}:0] b,\n"
    module_code += f"  output [{bit_width-1}:0] s\n);\n"
    # wire
    module_code += f"  wire [{bit_width-1}:0] c;\n"
    # circuit
    module_code += "  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));\n"
    for i in range(1, bit_width):
        module_code += f"  full_adder fa_{i} (.vdd(vdd), .gnd(gnd), .a(a[{i}]), .b(b[{i}]), .cin(c[{i-1}]), .s(s[{i}]), .cout(c[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_adder_sign_extension_module(bit_width):
    # info
    module_name = f"adder_{bit_width}bit_sign_extension"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input sign,\n"
    module_code += f"  input [{bit_width-1}:0] a,\n"
    module_code += f"  input [{bit_width-1}:0] b,\n"
    module_code += f"  output [{bit_width}:0] s\n);\n"
    # wire
    module_code += f"  wire [{bit_width-1}:0] c;\n"
    # circuit
    module_code += "  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));\n"
    for i in range(1, bit_width):
        module_code += f"  full_adder fa_{i} (.vdd(vdd), .gnd(gnd), .a(a[{i}]), .b(b[{i}]), .cin(c[{i-1}]), .s(s[{i}]), .cout(c[{i}]));\n"
    module_code += f"  adder_sign_extension fa_{bit_width} (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[{bit_width-1}]), .b(b[{bit_width-1}]), .cin(c[{bit_width-1}]), .s(s[{bit_width}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_adder_with_cin_module(bit_width):
    # info
    module_name = f"adder_{bit_width}bit_with_cin"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input c_in,\n"
    module_code += f"  input [{bit_width-1}:0] a,\n"
    module_code += f"  input [{bit_width-1}:0] b,\n"
    module_code += f"  output [{bit_width-1}:0] s\n);\n"
    # wire
    module_code += f"  wire [{bit_width-1}:0] c;\n"
    # circuit
    module_code += "  full_adder fa_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .cin(c_in), .s(s[0]), .cout(c[0]));\n"
    for i in range(1, bit_width):
        module_code += f"  full_adder fa_{i} (.vdd(vdd), .gnd(gnd), .a(a[{i}]), .b(b[{i}]), .cin(c[{i-1}]), .s(s[{i}]), .cout(c[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_adder_tree_module(weight_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    module_name = f"adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input sign_weight, \n"
    for i in range(input_num):
        module_code += f"  input [{weight_bit_width-1}:0] in_{i},\n"
    module_code += f"  output [{psum_bit_width-1}:0] out\n);\n"
    # wire
    for k in range(log_input_num-1):
        for i in range(input_num//2**(k+1)):
            module_code += f"  wire [{weight_bit_width+k}:0] sum_{weight_bit_width+k}bit_{i};\n"
    # circuit
    # adder_first_layer
    for i in range(input_num//2):
        module_code += f"  adder_{weight_bit_width}bit_sign_extension adder_{weight_bit_width}bit_{i} "
        module_code += f"(.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_{2*i}), .b(in_{2*i+1}), .s(sum_{weight_bit_width}bit_{i}));\n"
    # adder_mid_layers
    for k in range(log_input_num-2):
        for i in range(input_num//2**(k+2)):
            module_code += f"  adder_{weight_bit_width+k+1}bit_sign_extension adder_{weight_bit_width+k+1}bit_{i} "
            module_code += f"(.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_{weight_bit_width+k}bit_{2*i}), .b(sum_{weight_bit_width+k}bit_{2*i+1}), .s(sum_{weight_bit_width+k+1}bit_{i}));\n"
    # adder_last_layer
    module_code += f"  adder_{psum_bit_width-1}bit_sign_extension adder_{psum_bit_width-1}bit "
    module_code += f"(.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_{psum_bit_width-2}bit_{0}), .b(sum_{psum_bit_width-2}bit_{1}), .s(out));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_dff_module(bit_width):
    # info
    module_name = f"dff_{bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input clk, \n"
    module_code += "  input rst_b, \n"
    module_code += f"  input [{bit_width-1}:0] in,\n"
    module_code += f"  output [{bit_width-1}:0] out\n);\n"
    # circuit
    for i in range(bit_width):
        module_code += f"  dff dff_{i} (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[{i}]), .out(out[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_inverse_mux_module(bit_width):
    # info
    module_name = f"inverse_mux_{bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input sign,\n"
    module_code += f"  input [{bit_width-1}:0] in,\n"
    module_code += f"  output [{bit_width-1}:0] out\n);\n"
    # circuit
    module_code += "  wire sign_b;\n"
    module_code += f"  wire [{bit_width-1}:0] in_b; \n"
    module_code += f"  wire [{bit_width-1}:0] in_0; \n"
    module_code += f"  wire [{bit_width-1}:0] in_1; \n"
    # circuit
    module_code += f"  inverter inv_sign (.vdd(vdd), .gnd(gnd), .in(sign), .out(sign_b));\n"
    for i in range(bit_width):
        module_code += f"  inverter inv_in_{i} (.vdd(vdd), .gnd(gnd), .in(in[{i}]), .out(in_b[{i}]));\n"
    for i in range(bit_width):
        module_code += f"  nand2 in_0_{i} (.vdd(vdd), .gnd(gnd), .in_0(in[{i}]), .in_1(sign_b), .out(in_0[{i}]));\n"
        module_code += f"  nand2 in_1_{i} (.vdd(vdd), .gnd(gnd), .in_0(in_b[{i}]), .in_1(sign), .out(in_1[{i}]));\n"
    for i in range(bit_width):
        module_code += f"  nand2 out_{i} (.vdd(vdd), .gnd(gnd), .in_0(in_0[{i}]), .in_1(in_1[{i}]), .out(out[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_adder_with_cin_for_acc_module(weight_bit_width, input_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    module_name = f"adder_{column_psum_bit_width}bit_with_cin_for_acc"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input c_in,\n"
    module_code += f"  input [{psum_bit_width-1}:0] a_0_to_{psum_bit_width-1},\n"
    for i in range(input_bit_width): 
        module_code += f"  input a_{psum_bit_width+i},\n"
    module_code += f"  input b_0,\n"
    module_code += f"  input [{column_psum_bit_width-2}:0] b_1_to_{column_psum_bit_width-1},\n"
    module_code += f"  output [{column_psum_bit_width-1}:0] s\n);\n"
    module_code += f"  wire [{column_psum_bit_width-1}:0] c;\n"
    # circuit
    module_code += f"  full_adder fa_0 (.vdd(vdd), .gnd(gnd), .a(a_0_to_{psum_bit_width-1}[0]), .b(b_0), .cin(c_in), .s(s[0]), .cout(c[0]));\n"
    for i in range(1, psum_bit_width):
        module_code += f"  full_adder fa_{i} (.vdd(vdd), .gnd(gnd), .a(a_0_to_{psum_bit_width-1}[{i}]), .b(b_1_to_{column_psum_bit_width-1}[{i-1}]), .cin(c[{i-1}]), .s(s[{i}]), .cout(c[{i}]));\n"
    for i in range(psum_bit_width, column_psum_bit_width):
        module_code += f"  full_adder fa_{i} (.vdd(vdd), .gnd(gnd), .a(a_{i}), .b(b_1_to_{column_psum_bit_width-1}[{i-1}]), .cin(c[{i-1}]), .s(s[{i}]), .cout(c[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_accumulator_module(weight_bit_width, input_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    module_name = f"accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    module_code += f"module {module_name}(\n"
    # input/output
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input clk_psum, \n"
    module_code += "  input clk_shift, \n"
    module_code += "  input clk_out, \n"
    module_code += "  input rst_b, \n"
    module_code += "  input sign_weight, \n"
    module_code += "  input sign_in,\n"
    module_code += "  input in_msb,\n"
    module_code += f"  input [{psum_bit_width-1}:0] in,\n"
    module_code += f"  output [{column_psum_bit_width-1}:0] out,\n"
    module_code += "  output sign_out\n);\n"
    # circuit
    module_code += f"  wire [{psum_bit_width-1}:0] psum;\n"
    module_code += f"  wire [{psum_bit_width-1}:0] complement;\n"
    module_code += "  wire extension;\n"
    module_code += f"  wire [{column_psum_bit_width-2}:0] shift;\n"
    module_code += f"  wire [{column_psum_bit_width-1}:0] sum;\n"
    module_code += f"  wire sign_in_msb_b;\n"
    module_code += f"  wire sign_in_msb;\n"
    module_code += f"  wire sign_out_b;\n"
    module_code += f"  wire tie_to_low;\n"
    # nor2 & inverter for sign_out
    module_code += f"  nor2 nor_sign_out (.vdd(vdd), .gnd(gnd), .in_0(sign_weight), .in_1(sign_in), .out(sign_out_b));\n"
    module_code += f"  inverter inv_sign_out (.vdd(vdd), .gnd(gnd), .in(sign_out_b), .out(sign_out));\n"
    # nand2 & inverter for sign_in_msb
    module_code += f"  nand2 nand_acc (.vdd(vdd), .gnd(gnd), .in_0(sign_in), .in_1(in_msb), .out(sign_in_msb_b));\n"
    module_code += f"  inverter inv_acc (.vdd(vdd), .gnd(gnd), .in(sign_in_msb_b), .out(sign_in_msb));\n"
    # dff_psum
    module_code += f"  dff_{psum_bit_width}bit dff_psum (.vdd(vdd), .gnd(gnd), .clk(clk_psum), .rst_b(rst_b), .in(in), .out(psum));\n"
    # inverse_mux 
    module_code += f"  inverse_mux_{psum_bit_width}bit inverse_mux (.vdd(vdd), .gnd(gnd), .sign(sign_in_msb), .in(psum), .out(complement));\n"
    # mux_2_1
    module_code += f"  mux_2_1 mux (.vdd(vdd), .gnd(gnd), .s(sign_weight), .in_0(sign_in_msb), .in_1(complement[{psum_bit_width-1}]), .out(extension));\n"
    # tie low
    module_code += f"  tiel tie_low (.vdd(vdd), .gnd(gnd), .out(tie_to_low));\n"
    # adder_with_cin
    module_code += f"  adder_{column_psum_bit_width}bit_with_cin_for_acc adder (.vdd(vdd), .gnd(gnd), .c_in(sign_in_msb), .a_0_to_{psum_bit_width-1}(complement), "
    for i in range(input_bit_width):
        module_code += f".a_{psum_bit_width+i}(extension), "
    module_code += f".b_0(tie_to_low), .b_1_to_{column_psum_bit_width-1}(shift), .s(sum));\n"
    # dff_shift
    module_code += f"  dff_{column_psum_bit_width-1}bit dff_shift (.vdd(vdd), .gnd(gnd), .clk(clk_shift), .rst_b(rst_b), .in(sum[{column_psum_bit_width-2}:0]), .out(shift));\n"
    # dff_out
    module_code += f"  dff_{column_psum_bit_width}bit dff_out (.vdd(vdd), .gnd(gnd), .clk(clk_out), .rst_b(rst_b), .in(sum), .out(out));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_sram_module(weight_bit_width, input_num):
    # info
    module_name = f"sram_{input_num}x{weight_bit_width}"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  input [{input_num-1}:0] wl, \n"
    module_code += f"  input [{input_num-1}:0] in_b, \n"
    module_code += f"  inout [{weight_bit_width-1}:0] bl,\n"
    module_code += f"  inout [{weight_bit_width-1}:0] bl_b,\n"
    for j in range(input_num-1):
        module_code += f"  output [{weight_bit_width-1}:0] bitcell_out_{j}, \n"
    module_code += f"  output [{weight_bit_width-1}:0] bitcell_out_{input_num-1}\n);\n"
    # circuit
    for j in range(input_num): 
        for i in range(weight_bit_width):
            module_code += f"  dcim_bitcell bitcell_{j}_{i} (.vdd(vdd), .gnd(gnd), .wl(wl[{j}]), .in_b(in_b[{j}]), .bl(bl[{i}]), .bl_b(bl_b[{i}]), .out(bitcell_out_{j}[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_sram_rw_module(weight_bit_width):
    # info
    module_name = f"sram_rw_{weight_bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  inout [{weight_bit_width-1}:0] bl,\n"
    module_code += f"  inout [{weight_bit_width-1}:0] bl_b,\n"
    module_code += "  input pe, \n"
    module_code += "  input ysw, \n"
    module_code += "  input ysr, \n"
    module_code += "  input spe, \n"
    module_code += "  input se, \n"
    module_code += f"  input [{weight_bit_width-1}:0] din,\n"
    module_code += f"  output [{weight_bit_width-1}:0] dout\n);\n"
    # circuit
    for i in range(weight_bit_width): 
        module_code += f"  sram_rw rw_{i} (.vdd(vdd), .gnd(gnd), .bl(bl[{i}]), .bl_b(bl_b[{i}]), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din[{i}]), .dout(dout[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_sram_with_rw_module(weight_bit_width, input_num):
    # info
    module_name = f"sram_{input_num}x{weight_bit_width}_with_rw"
    module_code = f"// Module name: {module_name}\n"
    # input/output
    module_code += f"module {module_name} (\n"
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input pe, \n"
    module_code += "  input ysw, \n"
    module_code += "  input ysr, \n"
    module_code += "  input spe, \n"
    module_code += "  input se, \n"
    module_code += f"  input [{input_num-1}:0] wl, \n"
    module_code += f"  input [{input_num-1}:0] in_b, \n"
    module_code += f"  input [{weight_bit_width-1}:0] din,\n"
    module_code += f"  output [{weight_bit_width-1}:0] dout,\n"
    for j in range(input_num-1):
        module_code += f"  output [{weight_bit_width-1}:0] bitcell_out_{j}, \n"
    module_code += f"  output [{weight_bit_width-1}:0] bitcell_out_{input_num-1}\n);\n"
    # wire 
    module_code += f"  wire [{weight_bit_width-1}:0] bl;\n"
    module_code += f"  wire [{weight_bit_width-1}:0] bl_b;\n"
    # circuit
    # sram
    sub_module_name = f"sram_{input_num}x{weight_bit_width}"
    module_code += f"  {sub_module_name} sram ("
    module_code += f".vdd(vdd), .gnd(gnd), .wl(wl), .in_b(in_b), .bl(bl), .bl_b(bl_b), "
    for j in range(input_num-1): 
        module_code += f".bitcell_out_{j}(bitcell_out_{j}), "
    module_code += f".bitcell_out_{input_num-1}(bitcell_out_{input_num-1})"
    module_code += ");\n"
    # sram_rw
    sub_module_name = f"sram_rw_{weight_bit_width}bit"
    module_code += f"  {sub_module_name} sram_rw ("
    module_code += ".vdd(vdd), .gnd(gnd), .bl(bl), .bl_b(bl_b), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din), .dout(dout)"
    module_code += ");\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_dcim_column_module(weight_bit_width, input_bit_width, input_num):
    # info
    log_input_num = int(math.log(input_num, 2))
    psum_bit_width = weight_bit_width + log_input_num
    column_psum_bit_width = psum_bit_width + input_bit_width
    module_name = f"dcim_column_{input_num}x{weight_bit_width}x{input_bit_width}"
    module_code = f"// Module name: {module_name}\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input clk_psum, \n"
    module_code += "  input clk_shift, \n"
    module_code += "  input clk_out, \n"
    module_code += "  input rst_b, \n"
    module_code += "  input sign_weight, \n"
    module_code += "  input sign_in, \n"
    module_code += "  input in_msb, \n"
    module_code += "  input pe, \n"
    module_code += "  input ysw, \n"
    module_code += "  input ysr, \n"
    module_code += "  input spe, \n"
    module_code += "  input se, \n"
    module_code += f"  input [{input_num-1}:0] wl, \n"
    module_code += f"  input [{input_num-1}:0] in_b, \n"
    module_code += f"  input [{weight_bit_width-1}:0] din,\n"
    module_code += f"  output [{weight_bit_width-1}:0] dout,\n"
    module_code += f"  output [{column_psum_bit_width-1}:0] column_psum,\n"
    module_code += "  output sign_out\n"    
    module_code += ");\n"
    # wire
    for i in range(input_num): 
        module_code += f"  wire [{weight_bit_width-1}:0] bitcell_out_{i};\n" 
    module_code += f"  wire [{psum_bit_width-1}:0] psum;\n" 
    # submodules
    # sram_with_rw
    sub_module_name = f"sram_{input_num}x{weight_bit_width}_with_rw"
    module_code += f"  {sub_module_name} sram_with_rw (.vdd(vdd), .gnd(gnd), "
    module_code += f".pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), "
    module_code += f".wl(wl), .in_b(in_b), .din(din), .dout(dout), "
    for i in range(input_num-1): 
        module_code += f".bitcell_out_{i}(bitcell_out_{i}), "
    module_code += f".bitcell_out_{input_num-1}(bitcell_out_{input_num-1})"
    module_code += ");\n"
    # adder_tree
    sub_module_name = f"adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit"
    module_code += f"  {sub_module_name} adder_tree (.vdd(vdd), .gnd(gnd), "
    module_code += f".sign_weight(sign_weight), "
    for i in range(input_num):
        module_code += f".in_{i}(bitcell_out_{i}), "
    module_code += f".out(psum)"
    module_code += ");\n"
    # accumulator
    sub_module_name = f"accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit"
    module_code += f"  {sub_module_name} accumulator (.vdd(vdd), .gnd(gnd), "
    module_code += f".clk_psum(clk_psum), .clk_shift(clk_shift), .clk_out(clk_out), "
    module_code += f".rst_b(rst_b), "
    module_code += f".sign_weight(sign_weight), .sign_in(sign_in), .in_msb(in_msb), "
    module_code += f".in(psum), .out(column_psum), .sign_out(sign_out)"
    module_code += ");\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_nand_module(num): 
    # info
    module_name = f"nand{num}"
    module_code = f"// Module name: {module_name}\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    for i in range(num): 
        module_code += f"  input in_{i}, \n"
    module_code += f"  output out\n"
    module_code += ");\n"
    # wires
    for i in range(num-2):
        module_code += f"  wire nand_{i};\n"
        module_code += f"  wire and_{i};\n"
    # circuit
    # num_nand2 = num-1, num_inverter = num-2
    module_code += f"  nand2 nand2_0 (.vdd(vdd), .gnd(gnd), .in_0(in_0), .in_1(in_1), .out(nand_0));\n"
    module_code += f"  inverter inv_0 (.vdd(vdd), .gnd(gnd), .in(nand_0), .out(and_0));\n"
    for i in range(1, num-2): 
        module_code += f"  nand2 nand2_{i} (.vdd(vdd), .gnd(gnd), .in_0(and_{i-1}), .in_1(in_{i+1}), .out(nand_{i}));\n"
        module_code += f"  inverter inv_{i} (.vdd(vdd), .gnd(gnd), .in(nand_{i}), .out(and_{i}));\n"
    module_code += f"  nand2 nand2_{num-2} (.vdd(vdd), .gnd(gnd), .in_0(and_{num-3}), .in_1(in_{num-1}), .out(out));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_decoder_module(num_row):
    # parameter
    log_num_row = int(math.log(num_row, 2))
    # info
    module_name = f"decoder_{log_num_row}_to_{num_row}"
    module_code = f"// Module name: {module_name}\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += "  input enable, \n"
    module_code += f"  input [{log_num_row-1}:0] in, \n"
    module_code += f"  output [{num_row-1}:0] out \n"
    module_code += ");\n"
    # wires
    module_code += f"  wire [{log_num_row-1}:0] in_b;\n"
    module_code += f"  wire [{num_row-1}:0] out_b;\n"
    # circuit
    # inverter for input
    for i in range(log_num_row): 
        module_code += f"  inverter inv_{i} (.vdd(vdd), .gnd(gnd), .in(in[{i}]), .out(in_b[{i}]));\n"
    # nand
    for j in range(num_row): 
        module_code += f"  nand{log_num_row+1} nand_{j} (.vdd(vdd), .gnd(gnd), "
        temp = j
        for i in range(log_num_row): 
            if temp%2 == 0:
                module_code += f".in_{i}(in_b[{i}]), "
            else: 
                module_code += f".in_{i}(in[{i}]), "
            temp = temp//2
        module_code += f".in_{log_num_row}(enable), "
        module_code += f".out(out_b[{j}]));\n"
    # inverter for output
    for i in range(num_row): 
        module_code += f"  inverter inv_for_output_{i} (.vdd(vdd), .gnd(gnd), .in(out_b[{i}]), .out(out[{i}]));\n" 
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_inverter_module(size): 
    # info
    module_name = f"inverter{size}"
    module_code = f"// Module name: {module_name}\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  input in, \n"
    module_code += f"  output out\n"
    module_code += ");\n"
    # circuit
    for i in range(size): 
        module_code += f"  inverter inv_{i} (.vdd(vdd), .gnd(gnd), .in(in), .out(out));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_driver_module(num_row, num_col):
    # parameter
    stage = math.ceil((math.ceil(math.log(num_col/16, 4))+1)/2)*2
    # info
    module_name = f"driver_{num_row}x{num_col}"
    module_code = f"// Module name: {module_name} (stage = {stage})\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  input [{num_row-1}:0] in, \n"
    module_code += f"  output [{num_row-1}:0] out \n"
    module_code += ");\n"
    # wires
    wire_name = 'out_b'
    for i in range(stage-1):
        module_code += f"  wire [{num_row-1}:0] {wire_name};\n"
        wire_name += '_b'
    # circuit
    # inverter
    size = int(num_col/16)
    in_name = 'out_b'
    out_name = 'out'
    for j in range(stage-1): 
        for i in range(num_row):
            if size == 1:
                module_code += f"  inverter inv_stage{stage-1-j}_{i} (.vdd(vdd), .gnd(gnd), .in({in_name}[{i}]), .out({out_name}[{i}]));\n"
            else: 
                module_code += f"  inverter{size} inv{size}_stage{stage-1-j}_{i} (.vdd(vdd), .gnd(gnd), .in({in_name}[{i}]), .out({out_name}[{i}]));\n"
        size = math.ceil(size/4)
        in_name += '_b'
        out_name += '_b'
    for i in range(num_row):
        module_code += f"  inverter inv_stage0_{i} (.vdd(vdd), .gnd(gnd), .in(in[{i}]), .out({out_name}[{i}]));\n"
    # end
    module_code += "endmodule\n\n"
    return module_code

def generate_driver_b_module(num_row, num_col):
    # parameter
    stage = math.ceil(math.ceil(math.log(num_col/16, 4))/2)*2+1
    # info
    module_name = f"driver_b_{num_row}x{num_col}"
    module_code = f"// Module name: {module_name} (stage = {stage})\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  input [{num_row-1}:0] in, \n"
    module_code += f"  output [{num_row-1}:0] out \n"
    module_code += ");\n"
    # wires
    wire_name = 'out_b'
    for i in range(stage-1):
        module_code += f"  wire [{num_row-1}:0] {wire_name};\n"
        wire_name += '_b'
    # circuit
    # inverter
    size = int(num_col/16)
    in_name = 'out_b'
    out_name = 'out'
    for j in range(stage-1): 
        for i in range(num_row):
            if size == 1:
                module_code += f"  inverter inv_stage{stage-1-j}_{i} (.vdd(vdd), .gnd(gnd), .in({in_name}[{i}]), .out({out_name}[{i}]));\n"
            else: 
                module_code += f"  inverter{size} inv{size}_stage{stage-1-j}_{i} (.vdd(vdd), .gnd(gnd), .in({in_name}[{i}]), .out({out_name}[{i}]));\n"
        size = math.ceil(size/4)
        in_name += '_b'
        out_name += '_b'
    for i in range(num_row):
        module_code += f"  inverter inv_stage0_{i} (.vdd(vdd), .gnd(gnd), .in(in[{i}]), .out({out_name}[{i}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code

def generate_dcim_macro_module(num_row, num_col, weight_bit_width, input_bit_width): 
    # parameter
    num_dcim_column = int(num_col/weight_bit_width)
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width
    # info
    module_name = f"dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit"
    module_code = f"// Module name: {module_name}\n"
    module_code += f"module {module_name}(\n"
    # pins
    module_code += "  inout vdd,\n"
    module_code += "  inout gnd,\n"
    module_code += f"  input clk, \n"
    module_code += f"  input rst, \n"
    module_code += f"  input [1:0] r_w_cim, \n"
    module_code += f"  input start, \n"
    module_code += f"  input [{num_dcim_column-1}:0] sign_weight, \n"
    module_code += f"  input sign_in, \n"
    module_code += f"  input [{log_num_row-1}:0] wl_address, \n"
    module_code += f"  input [{num_row-1}:0] in, \n"
    module_code += f"  input [{num_col-1}:0] din, \n"
    module_code += f"  output [{num_col-1}:0] dout, \n"
    module_code += f"  output [{num_dcim_column-1}:0] sign_out, \n"
    module_code += f"  output rd_data_enable, \n"
    module_code += f"  output cim_data_enable, \n"
    module_code += f"  output busy, \n"
    for i in range(num_dcim_column-1): 
        module_code += f"  output [{column_psum_bit_width-1}:0] out_{i},\n"
    module_code += f"  output [{column_psum_bit_width-1}:0] out_{num_dcim_column-1}\n"
    module_code += ");\n"
    # wire
    module_code += f"  wire clk_b; \n"
    module_code += f"  wire wl_enable; \n"
    module_code += f"  wire pe; \n"
    module_code += f"  wire ysw; \n"
    module_code += f"  wire ysr; \n"
    module_code += f"  wire spe; \n"
    module_code += f"  wire se; \n"
    module_code += f"  wire rst_b; \n"
    module_code += f"  wire in_msb; \n"
    module_code += f"  wire clk_out; \n"
    module_code += f"  wire [{num_row-1}:0] wl_address_decoded; \n"
    module_code += f"  wire [{num_row-1}:0] wl; \n"
    module_code += f"  wire [{num_row-1}:0] in_b; \n"
    module_code += f"  wire sign_out_b; \n"
    # control
    module_code += f"  control_for_{input_bit_width}bit_input control (.vdd(vdd), .gnd(gnd), "
    module_code += ".clk(clk), .rst(rst), .r_w_cim(r_w_cim), .start(start), "
    module_code += ".wl_enable(wl_enable), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .rd_data_enable(rd_data_enable), "
    module_code += ".clk_b(clk_b), .rst_b(rst_b), .in_msb(in_msb), .clk_out(clk_out), .cim_data_enable(cim_data_enable), .busy(busy));\n"
    # decoder
    module_code += f"  decoder_{log_num_row}_to_{num_row} decoder (.vdd(vdd), .gnd(gnd), .enable(wl_enable), .in(wl_address), .out(wl_address_decoded));\n"
    # driver
    module_code += f"  driver_{num_row}x{num_col} driver_for_wl (.vdd(vdd), .gnd(gnd), .in(wl_address_decoded), .out(wl));\n"
    module_code += f"  driver_b_{num_row}x{num_col} driver_for_input (.vdd(vdd), .gnd(gnd), .in(in), .out(in_b));\n"
    # dcim column
    sub_module_name = f"dcim_column_{num_row}x{weight_bit_width}x{input_bit_width}"
    for j in range(num_dcim_column): 
        module_code += f"  {sub_module_name} dcim_column_{j} (.vdd(vdd), .gnd(gnd), "
        module_code += ".clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), "
        module_code += ".rst_b(rst_b), "
        module_code += f".sign_weight(sign_weight[{j}]), .sign_in(sign_in), .in_msb(in_msb), "
        module_code += ".pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), "
        module_code += ".wl(wl), .in_b(in_b), "
        module_code += f".din(din[{weight_bit_width*(j+1)-1}:{weight_bit_width*j}]), "
        module_code += f".dout(dout[{weight_bit_width*(j+1)-1}:{weight_bit_width*j}]), "
        module_code += f".column_psum(out_{j}), "
        module_code += f".sign_out(sign_out[{j}]));\n"
    # end
    module_code += "endmodule\n"
    module_code += "// End of module definition.\n\n"
    return module_code
