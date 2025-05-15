// Module name: nand7
module nand7(
  inout vdd,
  inout gnd,
  input in_0, 
  input in_1, 
  input in_2, 
  input in_3, 
  input in_4, 
  input in_5, 
  input in_6, 
  output out
);
  wire nand_0;
  wire and_0;
  wire nand_1;
  wire and_1;
  wire nand_2;
  wire and_2;
  wire nand_3;
  wire and_3;
  wire nand_4;
  wire and_4;
  nand2 nand2_0 (.vdd(vdd), .gnd(gnd), .in_0(in_0), .in_1(in_1), .out(nand_0));
  inverter inv_0 (.vdd(vdd), .gnd(gnd), .in(nand_0), .out(and_0));
  nand2 nand2_1 (.vdd(vdd), .gnd(gnd), .in_0(and_0), .in_1(in_2), .out(nand_1));
  inverter inv_1 (.vdd(vdd), .gnd(gnd), .in(nand_1), .out(and_1));
  nand2 nand2_2 (.vdd(vdd), .gnd(gnd), .in_0(and_1), .in_1(in_3), .out(nand_2));
  inverter inv_2 (.vdd(vdd), .gnd(gnd), .in(nand_2), .out(and_2));
  nand2 nand2_3 (.vdd(vdd), .gnd(gnd), .in_0(and_2), .in_1(in_4), .out(nand_3));
  inverter inv_3 (.vdd(vdd), .gnd(gnd), .in(nand_3), .out(and_3));
  nand2 nand2_4 (.vdd(vdd), .gnd(gnd), .in_0(and_3), .in_1(in_5), .out(nand_4));
  inverter inv_4 (.vdd(vdd), .gnd(gnd), .in(nand_4), .out(and_4));
  nand2 nand2_5 (.vdd(vdd), .gnd(gnd), .in_0(and_4), .in_1(in_6), .out(out));
endmodule
// End of module definition.

// Module name: decoder_6_to_64
module decoder_6_to_64(
  inout vdd,
  inout gnd,
  input enable, 
  input [5:0] in, 
  output [63:0] out 
);
  wire [5:0] in_b;
  wire [63:0] out_b;
  inverter inv_0 (.vdd(vdd), .gnd(gnd), .in(in[0]), .out(in_b[0]));
  inverter inv_1 (.vdd(vdd), .gnd(gnd), .in(in[1]), .out(in_b[1]));
  inverter inv_2 (.vdd(vdd), .gnd(gnd), .in(in[2]), .out(in_b[2]));
  inverter inv_3 (.vdd(vdd), .gnd(gnd), .in(in[3]), .out(in_b[3]));
  inverter inv_4 (.vdd(vdd), .gnd(gnd), .in(in[4]), .out(in_b[4]));
  inverter inv_5 (.vdd(vdd), .gnd(gnd), .in(in[5]), .out(in_b[5]));
  nand7 nand_0 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[0]));
  nand7 nand_1 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[1]));
  nand7 nand_2 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[2]));
  nand7 nand_3 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[3]));
  nand7 nand_4 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[4]));
  nand7 nand_5 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[5]));
  nand7 nand_6 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[6]));
  nand7 nand_7 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[7]));
  nand7 nand_8 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[8]));
  nand7 nand_9 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[9]));
  nand7 nand_10 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[10]));
  nand7 nand_11 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[11]));
  nand7 nand_12 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[12]));
  nand7 nand_13 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[13]));
  nand7 nand_14 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[14]));
  nand7 nand_15 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[15]));
  nand7 nand_16 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[16]));
  nand7 nand_17 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[17]));
  nand7 nand_18 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[18]));
  nand7 nand_19 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[19]));
  nand7 nand_20 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[20]));
  nand7 nand_21 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[21]));
  nand7 nand_22 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[22]));
  nand7 nand_23 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[23]));
  nand7 nand_24 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[24]));
  nand7 nand_25 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[25]));
  nand7 nand_26 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[26]));
  nand7 nand_27 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[27]));
  nand7 nand_28 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[28]));
  nand7 nand_29 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[29]));
  nand7 nand_30 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[30]));
  nand7 nand_31 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in_b[5]), .in_6(enable), .out(out_b[31]));
  nand7 nand_32 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[32]));
  nand7 nand_33 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[33]));
  nand7 nand_34 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[34]));
  nand7 nand_35 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[35]));
  nand7 nand_36 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[36]));
  nand7 nand_37 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[37]));
  nand7 nand_38 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[38]));
  nand7 nand_39 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[39]));
  nand7 nand_40 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[40]));
  nand7 nand_41 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[41]));
  nand7 nand_42 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[42]));
  nand7 nand_43 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[43]));
  nand7 nand_44 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[44]));
  nand7 nand_45 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[45]));
  nand7 nand_46 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[46]));
  nand7 nand_47 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in_b[4]), .in_5(in[5]), .in_6(enable), .out(out_b[47]));
  nand7 nand_48 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[48]));
  nand7 nand_49 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[49]));
  nand7 nand_50 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[50]));
  nand7 nand_51 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[51]));
  nand7 nand_52 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[52]));
  nand7 nand_53 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[53]));
  nand7 nand_54 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[54]));
  nand7 nand_55 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in_b[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[55]));
  nand7 nand_56 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[56]));
  nand7 nand_57 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[57]));
  nand7 nand_58 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[58]));
  nand7 nand_59 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in_b[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[59]));
  nand7 nand_60 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[60]));
  nand7 nand_61 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in_b[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[61]));
  nand7 nand_62 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[62]));
  nand7 nand_63 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(in[1]), .in_2(in[2]), .in_3(in[3]), .in_4(in[4]), .in_5(in[5]), .in_6(enable), .out(out_b[63]));
  inverter inv_for_output_0 (.vdd(vdd), .gnd(gnd), .in(out_b[0]), .out(out[0]));
  inverter inv_for_output_1 (.vdd(vdd), .gnd(gnd), .in(out_b[1]), .out(out[1]));
  inverter inv_for_output_2 (.vdd(vdd), .gnd(gnd), .in(out_b[2]), .out(out[2]));
  inverter inv_for_output_3 (.vdd(vdd), .gnd(gnd), .in(out_b[3]), .out(out[3]));
  inverter inv_for_output_4 (.vdd(vdd), .gnd(gnd), .in(out_b[4]), .out(out[4]));
  inverter inv_for_output_5 (.vdd(vdd), .gnd(gnd), .in(out_b[5]), .out(out[5]));
  inverter inv_for_output_6 (.vdd(vdd), .gnd(gnd), .in(out_b[6]), .out(out[6]));
  inverter inv_for_output_7 (.vdd(vdd), .gnd(gnd), .in(out_b[7]), .out(out[7]));
  inverter inv_for_output_8 (.vdd(vdd), .gnd(gnd), .in(out_b[8]), .out(out[8]));
  inverter inv_for_output_9 (.vdd(vdd), .gnd(gnd), .in(out_b[9]), .out(out[9]));
  inverter inv_for_output_10 (.vdd(vdd), .gnd(gnd), .in(out_b[10]), .out(out[10]));
  inverter inv_for_output_11 (.vdd(vdd), .gnd(gnd), .in(out_b[11]), .out(out[11]));
  inverter inv_for_output_12 (.vdd(vdd), .gnd(gnd), .in(out_b[12]), .out(out[12]));
  inverter inv_for_output_13 (.vdd(vdd), .gnd(gnd), .in(out_b[13]), .out(out[13]));
  inverter inv_for_output_14 (.vdd(vdd), .gnd(gnd), .in(out_b[14]), .out(out[14]));
  inverter inv_for_output_15 (.vdd(vdd), .gnd(gnd), .in(out_b[15]), .out(out[15]));
  inverter inv_for_output_16 (.vdd(vdd), .gnd(gnd), .in(out_b[16]), .out(out[16]));
  inverter inv_for_output_17 (.vdd(vdd), .gnd(gnd), .in(out_b[17]), .out(out[17]));
  inverter inv_for_output_18 (.vdd(vdd), .gnd(gnd), .in(out_b[18]), .out(out[18]));
  inverter inv_for_output_19 (.vdd(vdd), .gnd(gnd), .in(out_b[19]), .out(out[19]));
  inverter inv_for_output_20 (.vdd(vdd), .gnd(gnd), .in(out_b[20]), .out(out[20]));
  inverter inv_for_output_21 (.vdd(vdd), .gnd(gnd), .in(out_b[21]), .out(out[21]));
  inverter inv_for_output_22 (.vdd(vdd), .gnd(gnd), .in(out_b[22]), .out(out[22]));
  inverter inv_for_output_23 (.vdd(vdd), .gnd(gnd), .in(out_b[23]), .out(out[23]));
  inverter inv_for_output_24 (.vdd(vdd), .gnd(gnd), .in(out_b[24]), .out(out[24]));
  inverter inv_for_output_25 (.vdd(vdd), .gnd(gnd), .in(out_b[25]), .out(out[25]));
  inverter inv_for_output_26 (.vdd(vdd), .gnd(gnd), .in(out_b[26]), .out(out[26]));
  inverter inv_for_output_27 (.vdd(vdd), .gnd(gnd), .in(out_b[27]), .out(out[27]));
  inverter inv_for_output_28 (.vdd(vdd), .gnd(gnd), .in(out_b[28]), .out(out[28]));
  inverter inv_for_output_29 (.vdd(vdd), .gnd(gnd), .in(out_b[29]), .out(out[29]));
  inverter inv_for_output_30 (.vdd(vdd), .gnd(gnd), .in(out_b[30]), .out(out[30]));
  inverter inv_for_output_31 (.vdd(vdd), .gnd(gnd), .in(out_b[31]), .out(out[31]));
  inverter inv_for_output_32 (.vdd(vdd), .gnd(gnd), .in(out_b[32]), .out(out[32]));
  inverter inv_for_output_33 (.vdd(vdd), .gnd(gnd), .in(out_b[33]), .out(out[33]));
  inverter inv_for_output_34 (.vdd(vdd), .gnd(gnd), .in(out_b[34]), .out(out[34]));
  inverter inv_for_output_35 (.vdd(vdd), .gnd(gnd), .in(out_b[35]), .out(out[35]));
  inverter inv_for_output_36 (.vdd(vdd), .gnd(gnd), .in(out_b[36]), .out(out[36]));
  inverter inv_for_output_37 (.vdd(vdd), .gnd(gnd), .in(out_b[37]), .out(out[37]));
  inverter inv_for_output_38 (.vdd(vdd), .gnd(gnd), .in(out_b[38]), .out(out[38]));
  inverter inv_for_output_39 (.vdd(vdd), .gnd(gnd), .in(out_b[39]), .out(out[39]));
  inverter inv_for_output_40 (.vdd(vdd), .gnd(gnd), .in(out_b[40]), .out(out[40]));
  inverter inv_for_output_41 (.vdd(vdd), .gnd(gnd), .in(out_b[41]), .out(out[41]));
  inverter inv_for_output_42 (.vdd(vdd), .gnd(gnd), .in(out_b[42]), .out(out[42]));
  inverter inv_for_output_43 (.vdd(vdd), .gnd(gnd), .in(out_b[43]), .out(out[43]));
  inverter inv_for_output_44 (.vdd(vdd), .gnd(gnd), .in(out_b[44]), .out(out[44]));
  inverter inv_for_output_45 (.vdd(vdd), .gnd(gnd), .in(out_b[45]), .out(out[45]));
  inverter inv_for_output_46 (.vdd(vdd), .gnd(gnd), .in(out_b[46]), .out(out[46]));
  inverter inv_for_output_47 (.vdd(vdd), .gnd(gnd), .in(out_b[47]), .out(out[47]));
  inverter inv_for_output_48 (.vdd(vdd), .gnd(gnd), .in(out_b[48]), .out(out[48]));
  inverter inv_for_output_49 (.vdd(vdd), .gnd(gnd), .in(out_b[49]), .out(out[49]));
  inverter inv_for_output_50 (.vdd(vdd), .gnd(gnd), .in(out_b[50]), .out(out[50]));
  inverter inv_for_output_51 (.vdd(vdd), .gnd(gnd), .in(out_b[51]), .out(out[51]));
  inverter inv_for_output_52 (.vdd(vdd), .gnd(gnd), .in(out_b[52]), .out(out[52]));
  inverter inv_for_output_53 (.vdd(vdd), .gnd(gnd), .in(out_b[53]), .out(out[53]));
  inverter inv_for_output_54 (.vdd(vdd), .gnd(gnd), .in(out_b[54]), .out(out[54]));
  inverter inv_for_output_55 (.vdd(vdd), .gnd(gnd), .in(out_b[55]), .out(out[55]));
  inverter inv_for_output_56 (.vdd(vdd), .gnd(gnd), .in(out_b[56]), .out(out[56]));
  inverter inv_for_output_57 (.vdd(vdd), .gnd(gnd), .in(out_b[57]), .out(out[57]));
  inverter inv_for_output_58 (.vdd(vdd), .gnd(gnd), .in(out_b[58]), .out(out[58]));
  inverter inv_for_output_59 (.vdd(vdd), .gnd(gnd), .in(out_b[59]), .out(out[59]));
  inverter inv_for_output_60 (.vdd(vdd), .gnd(gnd), .in(out_b[60]), .out(out[60]));
  inverter inv_for_output_61 (.vdd(vdd), .gnd(gnd), .in(out_b[61]), .out(out[61]));
  inverter inv_for_output_62 (.vdd(vdd), .gnd(gnd), .in(out_b[62]), .out(out[62]));
  inverter inv_for_output_63 (.vdd(vdd), .gnd(gnd), .in(out_b[63]), .out(out[63]));
endmodule
// End of module definition.

// Module name: inverter4
module inverter4(
  inout vdd,
  inout gnd,
  input in, 
  output out
);
  inverter inv_0 (.vdd(vdd), .gnd(gnd), .in(in), .out(out));
  inverter inv_1 (.vdd(vdd), .gnd(gnd), .in(in), .out(out));
  inverter inv_2 (.vdd(vdd), .gnd(gnd), .in(in), .out(out));
  inverter inv_3 (.vdd(vdd), .gnd(gnd), .in(in), .out(out));
endmodule
// End of module definition.

// Module name: driver_64x64 (stage = 2)
module driver_64x64(
  inout vdd,
  inout gnd,
  input [63:0] in, 
  output [63:0] out 
);
  wire [63:0] out_b;
  inverter4 inv4_stage1_0 (.vdd(vdd), .gnd(gnd), .in(out_b[0]), .out(out[0]));
  inverter4 inv4_stage1_1 (.vdd(vdd), .gnd(gnd), .in(out_b[1]), .out(out[1]));
  inverter4 inv4_stage1_2 (.vdd(vdd), .gnd(gnd), .in(out_b[2]), .out(out[2]));
  inverter4 inv4_stage1_3 (.vdd(vdd), .gnd(gnd), .in(out_b[3]), .out(out[3]));
  inverter4 inv4_stage1_4 (.vdd(vdd), .gnd(gnd), .in(out_b[4]), .out(out[4]));
  inverter4 inv4_stage1_5 (.vdd(vdd), .gnd(gnd), .in(out_b[5]), .out(out[5]));
  inverter4 inv4_stage1_6 (.vdd(vdd), .gnd(gnd), .in(out_b[6]), .out(out[6]));
  inverter4 inv4_stage1_7 (.vdd(vdd), .gnd(gnd), .in(out_b[7]), .out(out[7]));
  inverter4 inv4_stage1_8 (.vdd(vdd), .gnd(gnd), .in(out_b[8]), .out(out[8]));
  inverter4 inv4_stage1_9 (.vdd(vdd), .gnd(gnd), .in(out_b[9]), .out(out[9]));
  inverter4 inv4_stage1_10 (.vdd(vdd), .gnd(gnd), .in(out_b[10]), .out(out[10]));
  inverter4 inv4_stage1_11 (.vdd(vdd), .gnd(gnd), .in(out_b[11]), .out(out[11]));
  inverter4 inv4_stage1_12 (.vdd(vdd), .gnd(gnd), .in(out_b[12]), .out(out[12]));
  inverter4 inv4_stage1_13 (.vdd(vdd), .gnd(gnd), .in(out_b[13]), .out(out[13]));
  inverter4 inv4_stage1_14 (.vdd(vdd), .gnd(gnd), .in(out_b[14]), .out(out[14]));
  inverter4 inv4_stage1_15 (.vdd(vdd), .gnd(gnd), .in(out_b[15]), .out(out[15]));
  inverter4 inv4_stage1_16 (.vdd(vdd), .gnd(gnd), .in(out_b[16]), .out(out[16]));
  inverter4 inv4_stage1_17 (.vdd(vdd), .gnd(gnd), .in(out_b[17]), .out(out[17]));
  inverter4 inv4_stage1_18 (.vdd(vdd), .gnd(gnd), .in(out_b[18]), .out(out[18]));
  inverter4 inv4_stage1_19 (.vdd(vdd), .gnd(gnd), .in(out_b[19]), .out(out[19]));
  inverter4 inv4_stage1_20 (.vdd(vdd), .gnd(gnd), .in(out_b[20]), .out(out[20]));
  inverter4 inv4_stage1_21 (.vdd(vdd), .gnd(gnd), .in(out_b[21]), .out(out[21]));
  inverter4 inv4_stage1_22 (.vdd(vdd), .gnd(gnd), .in(out_b[22]), .out(out[22]));
  inverter4 inv4_stage1_23 (.vdd(vdd), .gnd(gnd), .in(out_b[23]), .out(out[23]));
  inverter4 inv4_stage1_24 (.vdd(vdd), .gnd(gnd), .in(out_b[24]), .out(out[24]));
  inverter4 inv4_stage1_25 (.vdd(vdd), .gnd(gnd), .in(out_b[25]), .out(out[25]));
  inverter4 inv4_stage1_26 (.vdd(vdd), .gnd(gnd), .in(out_b[26]), .out(out[26]));
  inverter4 inv4_stage1_27 (.vdd(vdd), .gnd(gnd), .in(out_b[27]), .out(out[27]));
  inverter4 inv4_stage1_28 (.vdd(vdd), .gnd(gnd), .in(out_b[28]), .out(out[28]));
  inverter4 inv4_stage1_29 (.vdd(vdd), .gnd(gnd), .in(out_b[29]), .out(out[29]));
  inverter4 inv4_stage1_30 (.vdd(vdd), .gnd(gnd), .in(out_b[30]), .out(out[30]));
  inverter4 inv4_stage1_31 (.vdd(vdd), .gnd(gnd), .in(out_b[31]), .out(out[31]));
  inverter4 inv4_stage1_32 (.vdd(vdd), .gnd(gnd), .in(out_b[32]), .out(out[32]));
  inverter4 inv4_stage1_33 (.vdd(vdd), .gnd(gnd), .in(out_b[33]), .out(out[33]));
  inverter4 inv4_stage1_34 (.vdd(vdd), .gnd(gnd), .in(out_b[34]), .out(out[34]));
  inverter4 inv4_stage1_35 (.vdd(vdd), .gnd(gnd), .in(out_b[35]), .out(out[35]));
  inverter4 inv4_stage1_36 (.vdd(vdd), .gnd(gnd), .in(out_b[36]), .out(out[36]));
  inverter4 inv4_stage1_37 (.vdd(vdd), .gnd(gnd), .in(out_b[37]), .out(out[37]));
  inverter4 inv4_stage1_38 (.vdd(vdd), .gnd(gnd), .in(out_b[38]), .out(out[38]));
  inverter4 inv4_stage1_39 (.vdd(vdd), .gnd(gnd), .in(out_b[39]), .out(out[39]));
  inverter4 inv4_stage1_40 (.vdd(vdd), .gnd(gnd), .in(out_b[40]), .out(out[40]));
  inverter4 inv4_stage1_41 (.vdd(vdd), .gnd(gnd), .in(out_b[41]), .out(out[41]));
  inverter4 inv4_stage1_42 (.vdd(vdd), .gnd(gnd), .in(out_b[42]), .out(out[42]));
  inverter4 inv4_stage1_43 (.vdd(vdd), .gnd(gnd), .in(out_b[43]), .out(out[43]));
  inverter4 inv4_stage1_44 (.vdd(vdd), .gnd(gnd), .in(out_b[44]), .out(out[44]));
  inverter4 inv4_stage1_45 (.vdd(vdd), .gnd(gnd), .in(out_b[45]), .out(out[45]));
  inverter4 inv4_stage1_46 (.vdd(vdd), .gnd(gnd), .in(out_b[46]), .out(out[46]));
  inverter4 inv4_stage1_47 (.vdd(vdd), .gnd(gnd), .in(out_b[47]), .out(out[47]));
  inverter4 inv4_stage1_48 (.vdd(vdd), .gnd(gnd), .in(out_b[48]), .out(out[48]));
  inverter4 inv4_stage1_49 (.vdd(vdd), .gnd(gnd), .in(out_b[49]), .out(out[49]));
  inverter4 inv4_stage1_50 (.vdd(vdd), .gnd(gnd), .in(out_b[50]), .out(out[50]));
  inverter4 inv4_stage1_51 (.vdd(vdd), .gnd(gnd), .in(out_b[51]), .out(out[51]));
  inverter4 inv4_stage1_52 (.vdd(vdd), .gnd(gnd), .in(out_b[52]), .out(out[52]));
  inverter4 inv4_stage1_53 (.vdd(vdd), .gnd(gnd), .in(out_b[53]), .out(out[53]));
  inverter4 inv4_stage1_54 (.vdd(vdd), .gnd(gnd), .in(out_b[54]), .out(out[54]));
  inverter4 inv4_stage1_55 (.vdd(vdd), .gnd(gnd), .in(out_b[55]), .out(out[55]));
  inverter4 inv4_stage1_56 (.vdd(vdd), .gnd(gnd), .in(out_b[56]), .out(out[56]));
  inverter4 inv4_stage1_57 (.vdd(vdd), .gnd(gnd), .in(out_b[57]), .out(out[57]));
  inverter4 inv4_stage1_58 (.vdd(vdd), .gnd(gnd), .in(out_b[58]), .out(out[58]));
  inverter4 inv4_stage1_59 (.vdd(vdd), .gnd(gnd), .in(out_b[59]), .out(out[59]));
  inverter4 inv4_stage1_60 (.vdd(vdd), .gnd(gnd), .in(out_b[60]), .out(out[60]));
  inverter4 inv4_stage1_61 (.vdd(vdd), .gnd(gnd), .in(out_b[61]), .out(out[61]));
  inverter4 inv4_stage1_62 (.vdd(vdd), .gnd(gnd), .in(out_b[62]), .out(out[62]));
  inverter4 inv4_stage1_63 (.vdd(vdd), .gnd(gnd), .in(out_b[63]), .out(out[63]));
  inverter inv_stage0_0 (.vdd(vdd), .gnd(gnd), .in(in[0]), .out(out_b[0]));
  inverter inv_stage0_1 (.vdd(vdd), .gnd(gnd), .in(in[1]), .out(out_b[1]));
  inverter inv_stage0_2 (.vdd(vdd), .gnd(gnd), .in(in[2]), .out(out_b[2]));
  inverter inv_stage0_3 (.vdd(vdd), .gnd(gnd), .in(in[3]), .out(out_b[3]));
  inverter inv_stage0_4 (.vdd(vdd), .gnd(gnd), .in(in[4]), .out(out_b[4]));
  inverter inv_stage0_5 (.vdd(vdd), .gnd(gnd), .in(in[5]), .out(out_b[5]));
  inverter inv_stage0_6 (.vdd(vdd), .gnd(gnd), .in(in[6]), .out(out_b[6]));
  inverter inv_stage0_7 (.vdd(vdd), .gnd(gnd), .in(in[7]), .out(out_b[7]));
  inverter inv_stage0_8 (.vdd(vdd), .gnd(gnd), .in(in[8]), .out(out_b[8]));
  inverter inv_stage0_9 (.vdd(vdd), .gnd(gnd), .in(in[9]), .out(out_b[9]));
  inverter inv_stage0_10 (.vdd(vdd), .gnd(gnd), .in(in[10]), .out(out_b[10]));
  inverter inv_stage0_11 (.vdd(vdd), .gnd(gnd), .in(in[11]), .out(out_b[11]));
  inverter inv_stage0_12 (.vdd(vdd), .gnd(gnd), .in(in[12]), .out(out_b[12]));
  inverter inv_stage0_13 (.vdd(vdd), .gnd(gnd), .in(in[13]), .out(out_b[13]));
  inverter inv_stage0_14 (.vdd(vdd), .gnd(gnd), .in(in[14]), .out(out_b[14]));
  inverter inv_stage0_15 (.vdd(vdd), .gnd(gnd), .in(in[15]), .out(out_b[15]));
  inverter inv_stage0_16 (.vdd(vdd), .gnd(gnd), .in(in[16]), .out(out_b[16]));
  inverter inv_stage0_17 (.vdd(vdd), .gnd(gnd), .in(in[17]), .out(out_b[17]));
  inverter inv_stage0_18 (.vdd(vdd), .gnd(gnd), .in(in[18]), .out(out_b[18]));
  inverter inv_stage0_19 (.vdd(vdd), .gnd(gnd), .in(in[19]), .out(out_b[19]));
  inverter inv_stage0_20 (.vdd(vdd), .gnd(gnd), .in(in[20]), .out(out_b[20]));
  inverter inv_stage0_21 (.vdd(vdd), .gnd(gnd), .in(in[21]), .out(out_b[21]));
  inverter inv_stage0_22 (.vdd(vdd), .gnd(gnd), .in(in[22]), .out(out_b[22]));
  inverter inv_stage0_23 (.vdd(vdd), .gnd(gnd), .in(in[23]), .out(out_b[23]));
  inverter inv_stage0_24 (.vdd(vdd), .gnd(gnd), .in(in[24]), .out(out_b[24]));
  inverter inv_stage0_25 (.vdd(vdd), .gnd(gnd), .in(in[25]), .out(out_b[25]));
  inverter inv_stage0_26 (.vdd(vdd), .gnd(gnd), .in(in[26]), .out(out_b[26]));
  inverter inv_stage0_27 (.vdd(vdd), .gnd(gnd), .in(in[27]), .out(out_b[27]));
  inverter inv_stage0_28 (.vdd(vdd), .gnd(gnd), .in(in[28]), .out(out_b[28]));
  inverter inv_stage0_29 (.vdd(vdd), .gnd(gnd), .in(in[29]), .out(out_b[29]));
  inverter inv_stage0_30 (.vdd(vdd), .gnd(gnd), .in(in[30]), .out(out_b[30]));
  inverter inv_stage0_31 (.vdd(vdd), .gnd(gnd), .in(in[31]), .out(out_b[31]));
  inverter inv_stage0_32 (.vdd(vdd), .gnd(gnd), .in(in[32]), .out(out_b[32]));
  inverter inv_stage0_33 (.vdd(vdd), .gnd(gnd), .in(in[33]), .out(out_b[33]));
  inverter inv_stage0_34 (.vdd(vdd), .gnd(gnd), .in(in[34]), .out(out_b[34]));
  inverter inv_stage0_35 (.vdd(vdd), .gnd(gnd), .in(in[35]), .out(out_b[35]));
  inverter inv_stage0_36 (.vdd(vdd), .gnd(gnd), .in(in[36]), .out(out_b[36]));
  inverter inv_stage0_37 (.vdd(vdd), .gnd(gnd), .in(in[37]), .out(out_b[37]));
  inverter inv_stage0_38 (.vdd(vdd), .gnd(gnd), .in(in[38]), .out(out_b[38]));
  inverter inv_stage0_39 (.vdd(vdd), .gnd(gnd), .in(in[39]), .out(out_b[39]));
  inverter inv_stage0_40 (.vdd(vdd), .gnd(gnd), .in(in[40]), .out(out_b[40]));
  inverter inv_stage0_41 (.vdd(vdd), .gnd(gnd), .in(in[41]), .out(out_b[41]));
  inverter inv_stage0_42 (.vdd(vdd), .gnd(gnd), .in(in[42]), .out(out_b[42]));
  inverter inv_stage0_43 (.vdd(vdd), .gnd(gnd), .in(in[43]), .out(out_b[43]));
  inverter inv_stage0_44 (.vdd(vdd), .gnd(gnd), .in(in[44]), .out(out_b[44]));
  inverter inv_stage0_45 (.vdd(vdd), .gnd(gnd), .in(in[45]), .out(out_b[45]));
  inverter inv_stage0_46 (.vdd(vdd), .gnd(gnd), .in(in[46]), .out(out_b[46]));
  inverter inv_stage0_47 (.vdd(vdd), .gnd(gnd), .in(in[47]), .out(out_b[47]));
  inverter inv_stage0_48 (.vdd(vdd), .gnd(gnd), .in(in[48]), .out(out_b[48]));
  inverter inv_stage0_49 (.vdd(vdd), .gnd(gnd), .in(in[49]), .out(out_b[49]));
  inverter inv_stage0_50 (.vdd(vdd), .gnd(gnd), .in(in[50]), .out(out_b[50]));
  inverter inv_stage0_51 (.vdd(vdd), .gnd(gnd), .in(in[51]), .out(out_b[51]));
  inverter inv_stage0_52 (.vdd(vdd), .gnd(gnd), .in(in[52]), .out(out_b[52]));
  inverter inv_stage0_53 (.vdd(vdd), .gnd(gnd), .in(in[53]), .out(out_b[53]));
  inverter inv_stage0_54 (.vdd(vdd), .gnd(gnd), .in(in[54]), .out(out_b[54]));
  inverter inv_stage0_55 (.vdd(vdd), .gnd(gnd), .in(in[55]), .out(out_b[55]));
  inverter inv_stage0_56 (.vdd(vdd), .gnd(gnd), .in(in[56]), .out(out_b[56]));
  inverter inv_stage0_57 (.vdd(vdd), .gnd(gnd), .in(in[57]), .out(out_b[57]));
  inverter inv_stage0_58 (.vdd(vdd), .gnd(gnd), .in(in[58]), .out(out_b[58]));
  inverter inv_stage0_59 (.vdd(vdd), .gnd(gnd), .in(in[59]), .out(out_b[59]));
  inverter inv_stage0_60 (.vdd(vdd), .gnd(gnd), .in(in[60]), .out(out_b[60]));
  inverter inv_stage0_61 (.vdd(vdd), .gnd(gnd), .in(in[61]), .out(out_b[61]));
  inverter inv_stage0_62 (.vdd(vdd), .gnd(gnd), .in(in[62]), .out(out_b[62]));
  inverter inv_stage0_63 (.vdd(vdd), .gnd(gnd), .in(in[63]), .out(out_b[63]));
endmodule

// Module name: driver_b_64x64 (stage = 3)
module driver_b_64x64(
  inout vdd,
  inout gnd,
  input [63:0] in, 
  output [63:0] out 
);
  wire [63:0] out_b;
  wire [63:0] out_b_b;
  inverter4 inv4_stage2_0 (.vdd(vdd), .gnd(gnd), .in(out_b[0]), .out(out[0]));
  inverter4 inv4_stage2_1 (.vdd(vdd), .gnd(gnd), .in(out_b[1]), .out(out[1]));
  inverter4 inv4_stage2_2 (.vdd(vdd), .gnd(gnd), .in(out_b[2]), .out(out[2]));
  inverter4 inv4_stage2_3 (.vdd(vdd), .gnd(gnd), .in(out_b[3]), .out(out[3]));
  inverter4 inv4_stage2_4 (.vdd(vdd), .gnd(gnd), .in(out_b[4]), .out(out[4]));
  inverter4 inv4_stage2_5 (.vdd(vdd), .gnd(gnd), .in(out_b[5]), .out(out[5]));
  inverter4 inv4_stage2_6 (.vdd(vdd), .gnd(gnd), .in(out_b[6]), .out(out[6]));
  inverter4 inv4_stage2_7 (.vdd(vdd), .gnd(gnd), .in(out_b[7]), .out(out[7]));
  inverter4 inv4_stage2_8 (.vdd(vdd), .gnd(gnd), .in(out_b[8]), .out(out[8]));
  inverter4 inv4_stage2_9 (.vdd(vdd), .gnd(gnd), .in(out_b[9]), .out(out[9]));
  inverter4 inv4_stage2_10 (.vdd(vdd), .gnd(gnd), .in(out_b[10]), .out(out[10]));
  inverter4 inv4_stage2_11 (.vdd(vdd), .gnd(gnd), .in(out_b[11]), .out(out[11]));
  inverter4 inv4_stage2_12 (.vdd(vdd), .gnd(gnd), .in(out_b[12]), .out(out[12]));
  inverter4 inv4_stage2_13 (.vdd(vdd), .gnd(gnd), .in(out_b[13]), .out(out[13]));
  inverter4 inv4_stage2_14 (.vdd(vdd), .gnd(gnd), .in(out_b[14]), .out(out[14]));
  inverter4 inv4_stage2_15 (.vdd(vdd), .gnd(gnd), .in(out_b[15]), .out(out[15]));
  inverter4 inv4_stage2_16 (.vdd(vdd), .gnd(gnd), .in(out_b[16]), .out(out[16]));
  inverter4 inv4_stage2_17 (.vdd(vdd), .gnd(gnd), .in(out_b[17]), .out(out[17]));
  inverter4 inv4_stage2_18 (.vdd(vdd), .gnd(gnd), .in(out_b[18]), .out(out[18]));
  inverter4 inv4_stage2_19 (.vdd(vdd), .gnd(gnd), .in(out_b[19]), .out(out[19]));
  inverter4 inv4_stage2_20 (.vdd(vdd), .gnd(gnd), .in(out_b[20]), .out(out[20]));
  inverter4 inv4_stage2_21 (.vdd(vdd), .gnd(gnd), .in(out_b[21]), .out(out[21]));
  inverter4 inv4_stage2_22 (.vdd(vdd), .gnd(gnd), .in(out_b[22]), .out(out[22]));
  inverter4 inv4_stage2_23 (.vdd(vdd), .gnd(gnd), .in(out_b[23]), .out(out[23]));
  inverter4 inv4_stage2_24 (.vdd(vdd), .gnd(gnd), .in(out_b[24]), .out(out[24]));
  inverter4 inv4_stage2_25 (.vdd(vdd), .gnd(gnd), .in(out_b[25]), .out(out[25]));
  inverter4 inv4_stage2_26 (.vdd(vdd), .gnd(gnd), .in(out_b[26]), .out(out[26]));
  inverter4 inv4_stage2_27 (.vdd(vdd), .gnd(gnd), .in(out_b[27]), .out(out[27]));
  inverter4 inv4_stage2_28 (.vdd(vdd), .gnd(gnd), .in(out_b[28]), .out(out[28]));
  inverter4 inv4_stage2_29 (.vdd(vdd), .gnd(gnd), .in(out_b[29]), .out(out[29]));
  inverter4 inv4_stage2_30 (.vdd(vdd), .gnd(gnd), .in(out_b[30]), .out(out[30]));
  inverter4 inv4_stage2_31 (.vdd(vdd), .gnd(gnd), .in(out_b[31]), .out(out[31]));
  inverter4 inv4_stage2_32 (.vdd(vdd), .gnd(gnd), .in(out_b[32]), .out(out[32]));
  inverter4 inv4_stage2_33 (.vdd(vdd), .gnd(gnd), .in(out_b[33]), .out(out[33]));
  inverter4 inv4_stage2_34 (.vdd(vdd), .gnd(gnd), .in(out_b[34]), .out(out[34]));
  inverter4 inv4_stage2_35 (.vdd(vdd), .gnd(gnd), .in(out_b[35]), .out(out[35]));
  inverter4 inv4_stage2_36 (.vdd(vdd), .gnd(gnd), .in(out_b[36]), .out(out[36]));
  inverter4 inv4_stage2_37 (.vdd(vdd), .gnd(gnd), .in(out_b[37]), .out(out[37]));
  inverter4 inv4_stage2_38 (.vdd(vdd), .gnd(gnd), .in(out_b[38]), .out(out[38]));
  inverter4 inv4_stage2_39 (.vdd(vdd), .gnd(gnd), .in(out_b[39]), .out(out[39]));
  inverter4 inv4_stage2_40 (.vdd(vdd), .gnd(gnd), .in(out_b[40]), .out(out[40]));
  inverter4 inv4_stage2_41 (.vdd(vdd), .gnd(gnd), .in(out_b[41]), .out(out[41]));
  inverter4 inv4_stage2_42 (.vdd(vdd), .gnd(gnd), .in(out_b[42]), .out(out[42]));
  inverter4 inv4_stage2_43 (.vdd(vdd), .gnd(gnd), .in(out_b[43]), .out(out[43]));
  inverter4 inv4_stage2_44 (.vdd(vdd), .gnd(gnd), .in(out_b[44]), .out(out[44]));
  inverter4 inv4_stage2_45 (.vdd(vdd), .gnd(gnd), .in(out_b[45]), .out(out[45]));
  inverter4 inv4_stage2_46 (.vdd(vdd), .gnd(gnd), .in(out_b[46]), .out(out[46]));
  inverter4 inv4_stage2_47 (.vdd(vdd), .gnd(gnd), .in(out_b[47]), .out(out[47]));
  inverter4 inv4_stage2_48 (.vdd(vdd), .gnd(gnd), .in(out_b[48]), .out(out[48]));
  inverter4 inv4_stage2_49 (.vdd(vdd), .gnd(gnd), .in(out_b[49]), .out(out[49]));
  inverter4 inv4_stage2_50 (.vdd(vdd), .gnd(gnd), .in(out_b[50]), .out(out[50]));
  inverter4 inv4_stage2_51 (.vdd(vdd), .gnd(gnd), .in(out_b[51]), .out(out[51]));
  inverter4 inv4_stage2_52 (.vdd(vdd), .gnd(gnd), .in(out_b[52]), .out(out[52]));
  inverter4 inv4_stage2_53 (.vdd(vdd), .gnd(gnd), .in(out_b[53]), .out(out[53]));
  inverter4 inv4_stage2_54 (.vdd(vdd), .gnd(gnd), .in(out_b[54]), .out(out[54]));
  inverter4 inv4_stage2_55 (.vdd(vdd), .gnd(gnd), .in(out_b[55]), .out(out[55]));
  inverter4 inv4_stage2_56 (.vdd(vdd), .gnd(gnd), .in(out_b[56]), .out(out[56]));
  inverter4 inv4_stage2_57 (.vdd(vdd), .gnd(gnd), .in(out_b[57]), .out(out[57]));
  inverter4 inv4_stage2_58 (.vdd(vdd), .gnd(gnd), .in(out_b[58]), .out(out[58]));
  inverter4 inv4_stage2_59 (.vdd(vdd), .gnd(gnd), .in(out_b[59]), .out(out[59]));
  inverter4 inv4_stage2_60 (.vdd(vdd), .gnd(gnd), .in(out_b[60]), .out(out[60]));
  inverter4 inv4_stage2_61 (.vdd(vdd), .gnd(gnd), .in(out_b[61]), .out(out[61]));
  inverter4 inv4_stage2_62 (.vdd(vdd), .gnd(gnd), .in(out_b[62]), .out(out[62]));
  inverter4 inv4_stage2_63 (.vdd(vdd), .gnd(gnd), .in(out_b[63]), .out(out[63]));
  inverter inv_stage1_0 (.vdd(vdd), .gnd(gnd), .in(out_b_b[0]), .out(out_b[0]));
  inverter inv_stage1_1 (.vdd(vdd), .gnd(gnd), .in(out_b_b[1]), .out(out_b[1]));
  inverter inv_stage1_2 (.vdd(vdd), .gnd(gnd), .in(out_b_b[2]), .out(out_b[2]));
  inverter inv_stage1_3 (.vdd(vdd), .gnd(gnd), .in(out_b_b[3]), .out(out_b[3]));
  inverter inv_stage1_4 (.vdd(vdd), .gnd(gnd), .in(out_b_b[4]), .out(out_b[4]));
  inverter inv_stage1_5 (.vdd(vdd), .gnd(gnd), .in(out_b_b[5]), .out(out_b[5]));
  inverter inv_stage1_6 (.vdd(vdd), .gnd(gnd), .in(out_b_b[6]), .out(out_b[6]));
  inverter inv_stage1_7 (.vdd(vdd), .gnd(gnd), .in(out_b_b[7]), .out(out_b[7]));
  inverter inv_stage1_8 (.vdd(vdd), .gnd(gnd), .in(out_b_b[8]), .out(out_b[8]));
  inverter inv_stage1_9 (.vdd(vdd), .gnd(gnd), .in(out_b_b[9]), .out(out_b[9]));
  inverter inv_stage1_10 (.vdd(vdd), .gnd(gnd), .in(out_b_b[10]), .out(out_b[10]));
  inverter inv_stage1_11 (.vdd(vdd), .gnd(gnd), .in(out_b_b[11]), .out(out_b[11]));
  inverter inv_stage1_12 (.vdd(vdd), .gnd(gnd), .in(out_b_b[12]), .out(out_b[12]));
  inverter inv_stage1_13 (.vdd(vdd), .gnd(gnd), .in(out_b_b[13]), .out(out_b[13]));
  inverter inv_stage1_14 (.vdd(vdd), .gnd(gnd), .in(out_b_b[14]), .out(out_b[14]));
  inverter inv_stage1_15 (.vdd(vdd), .gnd(gnd), .in(out_b_b[15]), .out(out_b[15]));
  inverter inv_stage1_16 (.vdd(vdd), .gnd(gnd), .in(out_b_b[16]), .out(out_b[16]));
  inverter inv_stage1_17 (.vdd(vdd), .gnd(gnd), .in(out_b_b[17]), .out(out_b[17]));
  inverter inv_stage1_18 (.vdd(vdd), .gnd(gnd), .in(out_b_b[18]), .out(out_b[18]));
  inverter inv_stage1_19 (.vdd(vdd), .gnd(gnd), .in(out_b_b[19]), .out(out_b[19]));
  inverter inv_stage1_20 (.vdd(vdd), .gnd(gnd), .in(out_b_b[20]), .out(out_b[20]));
  inverter inv_stage1_21 (.vdd(vdd), .gnd(gnd), .in(out_b_b[21]), .out(out_b[21]));
  inverter inv_stage1_22 (.vdd(vdd), .gnd(gnd), .in(out_b_b[22]), .out(out_b[22]));
  inverter inv_stage1_23 (.vdd(vdd), .gnd(gnd), .in(out_b_b[23]), .out(out_b[23]));
  inverter inv_stage1_24 (.vdd(vdd), .gnd(gnd), .in(out_b_b[24]), .out(out_b[24]));
  inverter inv_stage1_25 (.vdd(vdd), .gnd(gnd), .in(out_b_b[25]), .out(out_b[25]));
  inverter inv_stage1_26 (.vdd(vdd), .gnd(gnd), .in(out_b_b[26]), .out(out_b[26]));
  inverter inv_stage1_27 (.vdd(vdd), .gnd(gnd), .in(out_b_b[27]), .out(out_b[27]));
  inverter inv_stage1_28 (.vdd(vdd), .gnd(gnd), .in(out_b_b[28]), .out(out_b[28]));
  inverter inv_stage1_29 (.vdd(vdd), .gnd(gnd), .in(out_b_b[29]), .out(out_b[29]));
  inverter inv_stage1_30 (.vdd(vdd), .gnd(gnd), .in(out_b_b[30]), .out(out_b[30]));
  inverter inv_stage1_31 (.vdd(vdd), .gnd(gnd), .in(out_b_b[31]), .out(out_b[31]));
  inverter inv_stage1_32 (.vdd(vdd), .gnd(gnd), .in(out_b_b[32]), .out(out_b[32]));
  inverter inv_stage1_33 (.vdd(vdd), .gnd(gnd), .in(out_b_b[33]), .out(out_b[33]));
  inverter inv_stage1_34 (.vdd(vdd), .gnd(gnd), .in(out_b_b[34]), .out(out_b[34]));
  inverter inv_stage1_35 (.vdd(vdd), .gnd(gnd), .in(out_b_b[35]), .out(out_b[35]));
  inverter inv_stage1_36 (.vdd(vdd), .gnd(gnd), .in(out_b_b[36]), .out(out_b[36]));
  inverter inv_stage1_37 (.vdd(vdd), .gnd(gnd), .in(out_b_b[37]), .out(out_b[37]));
  inverter inv_stage1_38 (.vdd(vdd), .gnd(gnd), .in(out_b_b[38]), .out(out_b[38]));
  inverter inv_stage1_39 (.vdd(vdd), .gnd(gnd), .in(out_b_b[39]), .out(out_b[39]));
  inverter inv_stage1_40 (.vdd(vdd), .gnd(gnd), .in(out_b_b[40]), .out(out_b[40]));
  inverter inv_stage1_41 (.vdd(vdd), .gnd(gnd), .in(out_b_b[41]), .out(out_b[41]));
  inverter inv_stage1_42 (.vdd(vdd), .gnd(gnd), .in(out_b_b[42]), .out(out_b[42]));
  inverter inv_stage1_43 (.vdd(vdd), .gnd(gnd), .in(out_b_b[43]), .out(out_b[43]));
  inverter inv_stage1_44 (.vdd(vdd), .gnd(gnd), .in(out_b_b[44]), .out(out_b[44]));
  inverter inv_stage1_45 (.vdd(vdd), .gnd(gnd), .in(out_b_b[45]), .out(out_b[45]));
  inverter inv_stage1_46 (.vdd(vdd), .gnd(gnd), .in(out_b_b[46]), .out(out_b[46]));
  inverter inv_stage1_47 (.vdd(vdd), .gnd(gnd), .in(out_b_b[47]), .out(out_b[47]));
  inverter inv_stage1_48 (.vdd(vdd), .gnd(gnd), .in(out_b_b[48]), .out(out_b[48]));
  inverter inv_stage1_49 (.vdd(vdd), .gnd(gnd), .in(out_b_b[49]), .out(out_b[49]));
  inverter inv_stage1_50 (.vdd(vdd), .gnd(gnd), .in(out_b_b[50]), .out(out_b[50]));
  inverter inv_stage1_51 (.vdd(vdd), .gnd(gnd), .in(out_b_b[51]), .out(out_b[51]));
  inverter inv_stage1_52 (.vdd(vdd), .gnd(gnd), .in(out_b_b[52]), .out(out_b[52]));
  inverter inv_stage1_53 (.vdd(vdd), .gnd(gnd), .in(out_b_b[53]), .out(out_b[53]));
  inverter inv_stage1_54 (.vdd(vdd), .gnd(gnd), .in(out_b_b[54]), .out(out_b[54]));
  inverter inv_stage1_55 (.vdd(vdd), .gnd(gnd), .in(out_b_b[55]), .out(out_b[55]));
  inverter inv_stage1_56 (.vdd(vdd), .gnd(gnd), .in(out_b_b[56]), .out(out_b[56]));
  inverter inv_stage1_57 (.vdd(vdd), .gnd(gnd), .in(out_b_b[57]), .out(out_b[57]));
  inverter inv_stage1_58 (.vdd(vdd), .gnd(gnd), .in(out_b_b[58]), .out(out_b[58]));
  inverter inv_stage1_59 (.vdd(vdd), .gnd(gnd), .in(out_b_b[59]), .out(out_b[59]));
  inverter inv_stage1_60 (.vdd(vdd), .gnd(gnd), .in(out_b_b[60]), .out(out_b[60]));
  inverter inv_stage1_61 (.vdd(vdd), .gnd(gnd), .in(out_b_b[61]), .out(out_b[61]));
  inverter inv_stage1_62 (.vdd(vdd), .gnd(gnd), .in(out_b_b[62]), .out(out_b[62]));
  inverter inv_stage1_63 (.vdd(vdd), .gnd(gnd), .in(out_b_b[63]), .out(out_b[63]));
  inverter inv_stage0_0 (.vdd(vdd), .gnd(gnd), .in(in[0]), .out(out_b_b[0]));
  inverter inv_stage0_1 (.vdd(vdd), .gnd(gnd), .in(in[1]), .out(out_b_b[1]));
  inverter inv_stage0_2 (.vdd(vdd), .gnd(gnd), .in(in[2]), .out(out_b_b[2]));
  inverter inv_stage0_3 (.vdd(vdd), .gnd(gnd), .in(in[3]), .out(out_b_b[3]));
  inverter inv_stage0_4 (.vdd(vdd), .gnd(gnd), .in(in[4]), .out(out_b_b[4]));
  inverter inv_stage0_5 (.vdd(vdd), .gnd(gnd), .in(in[5]), .out(out_b_b[5]));
  inverter inv_stage0_6 (.vdd(vdd), .gnd(gnd), .in(in[6]), .out(out_b_b[6]));
  inverter inv_stage0_7 (.vdd(vdd), .gnd(gnd), .in(in[7]), .out(out_b_b[7]));
  inverter inv_stage0_8 (.vdd(vdd), .gnd(gnd), .in(in[8]), .out(out_b_b[8]));
  inverter inv_stage0_9 (.vdd(vdd), .gnd(gnd), .in(in[9]), .out(out_b_b[9]));
  inverter inv_stage0_10 (.vdd(vdd), .gnd(gnd), .in(in[10]), .out(out_b_b[10]));
  inverter inv_stage0_11 (.vdd(vdd), .gnd(gnd), .in(in[11]), .out(out_b_b[11]));
  inverter inv_stage0_12 (.vdd(vdd), .gnd(gnd), .in(in[12]), .out(out_b_b[12]));
  inverter inv_stage0_13 (.vdd(vdd), .gnd(gnd), .in(in[13]), .out(out_b_b[13]));
  inverter inv_stage0_14 (.vdd(vdd), .gnd(gnd), .in(in[14]), .out(out_b_b[14]));
  inverter inv_stage0_15 (.vdd(vdd), .gnd(gnd), .in(in[15]), .out(out_b_b[15]));
  inverter inv_stage0_16 (.vdd(vdd), .gnd(gnd), .in(in[16]), .out(out_b_b[16]));
  inverter inv_stage0_17 (.vdd(vdd), .gnd(gnd), .in(in[17]), .out(out_b_b[17]));
  inverter inv_stage0_18 (.vdd(vdd), .gnd(gnd), .in(in[18]), .out(out_b_b[18]));
  inverter inv_stage0_19 (.vdd(vdd), .gnd(gnd), .in(in[19]), .out(out_b_b[19]));
  inverter inv_stage0_20 (.vdd(vdd), .gnd(gnd), .in(in[20]), .out(out_b_b[20]));
  inverter inv_stage0_21 (.vdd(vdd), .gnd(gnd), .in(in[21]), .out(out_b_b[21]));
  inverter inv_stage0_22 (.vdd(vdd), .gnd(gnd), .in(in[22]), .out(out_b_b[22]));
  inverter inv_stage0_23 (.vdd(vdd), .gnd(gnd), .in(in[23]), .out(out_b_b[23]));
  inverter inv_stage0_24 (.vdd(vdd), .gnd(gnd), .in(in[24]), .out(out_b_b[24]));
  inverter inv_stage0_25 (.vdd(vdd), .gnd(gnd), .in(in[25]), .out(out_b_b[25]));
  inverter inv_stage0_26 (.vdd(vdd), .gnd(gnd), .in(in[26]), .out(out_b_b[26]));
  inverter inv_stage0_27 (.vdd(vdd), .gnd(gnd), .in(in[27]), .out(out_b_b[27]));
  inverter inv_stage0_28 (.vdd(vdd), .gnd(gnd), .in(in[28]), .out(out_b_b[28]));
  inverter inv_stage0_29 (.vdd(vdd), .gnd(gnd), .in(in[29]), .out(out_b_b[29]));
  inverter inv_stage0_30 (.vdd(vdd), .gnd(gnd), .in(in[30]), .out(out_b_b[30]));
  inverter inv_stage0_31 (.vdd(vdd), .gnd(gnd), .in(in[31]), .out(out_b_b[31]));
  inverter inv_stage0_32 (.vdd(vdd), .gnd(gnd), .in(in[32]), .out(out_b_b[32]));
  inverter inv_stage0_33 (.vdd(vdd), .gnd(gnd), .in(in[33]), .out(out_b_b[33]));
  inverter inv_stage0_34 (.vdd(vdd), .gnd(gnd), .in(in[34]), .out(out_b_b[34]));
  inverter inv_stage0_35 (.vdd(vdd), .gnd(gnd), .in(in[35]), .out(out_b_b[35]));
  inverter inv_stage0_36 (.vdd(vdd), .gnd(gnd), .in(in[36]), .out(out_b_b[36]));
  inverter inv_stage0_37 (.vdd(vdd), .gnd(gnd), .in(in[37]), .out(out_b_b[37]));
  inverter inv_stage0_38 (.vdd(vdd), .gnd(gnd), .in(in[38]), .out(out_b_b[38]));
  inverter inv_stage0_39 (.vdd(vdd), .gnd(gnd), .in(in[39]), .out(out_b_b[39]));
  inverter inv_stage0_40 (.vdd(vdd), .gnd(gnd), .in(in[40]), .out(out_b_b[40]));
  inverter inv_stage0_41 (.vdd(vdd), .gnd(gnd), .in(in[41]), .out(out_b_b[41]));
  inverter inv_stage0_42 (.vdd(vdd), .gnd(gnd), .in(in[42]), .out(out_b_b[42]));
  inverter inv_stage0_43 (.vdd(vdd), .gnd(gnd), .in(in[43]), .out(out_b_b[43]));
  inverter inv_stage0_44 (.vdd(vdd), .gnd(gnd), .in(in[44]), .out(out_b_b[44]));
  inverter inv_stage0_45 (.vdd(vdd), .gnd(gnd), .in(in[45]), .out(out_b_b[45]));
  inverter inv_stage0_46 (.vdd(vdd), .gnd(gnd), .in(in[46]), .out(out_b_b[46]));
  inverter inv_stage0_47 (.vdd(vdd), .gnd(gnd), .in(in[47]), .out(out_b_b[47]));
  inverter inv_stage0_48 (.vdd(vdd), .gnd(gnd), .in(in[48]), .out(out_b_b[48]));
  inverter inv_stage0_49 (.vdd(vdd), .gnd(gnd), .in(in[49]), .out(out_b_b[49]));
  inverter inv_stage0_50 (.vdd(vdd), .gnd(gnd), .in(in[50]), .out(out_b_b[50]));
  inverter inv_stage0_51 (.vdd(vdd), .gnd(gnd), .in(in[51]), .out(out_b_b[51]));
  inverter inv_stage0_52 (.vdd(vdd), .gnd(gnd), .in(in[52]), .out(out_b_b[52]));
  inverter inv_stage0_53 (.vdd(vdd), .gnd(gnd), .in(in[53]), .out(out_b_b[53]));
  inverter inv_stage0_54 (.vdd(vdd), .gnd(gnd), .in(in[54]), .out(out_b_b[54]));
  inverter inv_stage0_55 (.vdd(vdd), .gnd(gnd), .in(in[55]), .out(out_b_b[55]));
  inverter inv_stage0_56 (.vdd(vdd), .gnd(gnd), .in(in[56]), .out(out_b_b[56]));
  inverter inv_stage0_57 (.vdd(vdd), .gnd(gnd), .in(in[57]), .out(out_b_b[57]));
  inverter inv_stage0_58 (.vdd(vdd), .gnd(gnd), .in(in[58]), .out(out_b_b[58]));
  inverter inv_stage0_59 (.vdd(vdd), .gnd(gnd), .in(in[59]), .out(out_b_b[59]));
  inverter inv_stage0_60 (.vdd(vdd), .gnd(gnd), .in(in[60]), .out(out_b_b[60]));
  inverter inv_stage0_61 (.vdd(vdd), .gnd(gnd), .in(in[61]), .out(out_b_b[61]));
  inverter inv_stage0_62 (.vdd(vdd), .gnd(gnd), .in(in[62]), .out(out_b_b[62]));
  inverter inv_stage0_63 (.vdd(vdd), .gnd(gnd), .in(in[63]), .out(out_b_b[63]));
endmodule
// End of module definition.

// Module name: sram_64x4
module sram_64x4 (
  inout vdd,
  inout gnd,
  input [63:0] wl, 
  input [63:0] in_b, 
  inout [3:0] bl,
  inout [3:0] bl_b,
  output [3:0] bitcell_out_0, 
  output [3:0] bitcell_out_1, 
  output [3:0] bitcell_out_2, 
  output [3:0] bitcell_out_3, 
  output [3:0] bitcell_out_4, 
  output [3:0] bitcell_out_5, 
  output [3:0] bitcell_out_6, 
  output [3:0] bitcell_out_7, 
  output [3:0] bitcell_out_8, 
  output [3:0] bitcell_out_9, 
  output [3:0] bitcell_out_10, 
  output [3:0] bitcell_out_11, 
  output [3:0] bitcell_out_12, 
  output [3:0] bitcell_out_13, 
  output [3:0] bitcell_out_14, 
  output [3:0] bitcell_out_15, 
  output [3:0] bitcell_out_16, 
  output [3:0] bitcell_out_17, 
  output [3:0] bitcell_out_18, 
  output [3:0] bitcell_out_19, 
  output [3:0] bitcell_out_20, 
  output [3:0] bitcell_out_21, 
  output [3:0] bitcell_out_22, 
  output [3:0] bitcell_out_23, 
  output [3:0] bitcell_out_24, 
  output [3:0] bitcell_out_25, 
  output [3:0] bitcell_out_26, 
  output [3:0] bitcell_out_27, 
  output [3:0] bitcell_out_28, 
  output [3:0] bitcell_out_29, 
  output [3:0] bitcell_out_30, 
  output [3:0] bitcell_out_31, 
  output [3:0] bitcell_out_32, 
  output [3:0] bitcell_out_33, 
  output [3:0] bitcell_out_34, 
  output [3:0] bitcell_out_35, 
  output [3:0] bitcell_out_36, 
  output [3:0] bitcell_out_37, 
  output [3:0] bitcell_out_38, 
  output [3:0] bitcell_out_39, 
  output [3:0] bitcell_out_40, 
  output [3:0] bitcell_out_41, 
  output [3:0] bitcell_out_42, 
  output [3:0] bitcell_out_43, 
  output [3:0] bitcell_out_44, 
  output [3:0] bitcell_out_45, 
  output [3:0] bitcell_out_46, 
  output [3:0] bitcell_out_47, 
  output [3:0] bitcell_out_48, 
  output [3:0] bitcell_out_49, 
  output [3:0] bitcell_out_50, 
  output [3:0] bitcell_out_51, 
  output [3:0] bitcell_out_52, 
  output [3:0] bitcell_out_53, 
  output [3:0] bitcell_out_54, 
  output [3:0] bitcell_out_55, 
  output [3:0] bitcell_out_56, 
  output [3:0] bitcell_out_57, 
  output [3:0] bitcell_out_58, 
  output [3:0] bitcell_out_59, 
  output [3:0] bitcell_out_60, 
  output [3:0] bitcell_out_61, 
  output [3:0] bitcell_out_62, 
  output [3:0] bitcell_out_63
);
  dcim_bitcell bitcell_0_0 (.vdd(vdd), .gnd(gnd), .wl(wl[0]), .in_b(in_b[0]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_0[0]));
  dcim_bitcell bitcell_0_1 (.vdd(vdd), .gnd(gnd), .wl(wl[0]), .in_b(in_b[0]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_0[1]));
  dcim_bitcell bitcell_0_2 (.vdd(vdd), .gnd(gnd), .wl(wl[0]), .in_b(in_b[0]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_0[2]));
  dcim_bitcell bitcell_0_3 (.vdd(vdd), .gnd(gnd), .wl(wl[0]), .in_b(in_b[0]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_0[3]));
  dcim_bitcell bitcell_1_0 (.vdd(vdd), .gnd(gnd), .wl(wl[1]), .in_b(in_b[1]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_1[0]));
  dcim_bitcell bitcell_1_1 (.vdd(vdd), .gnd(gnd), .wl(wl[1]), .in_b(in_b[1]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_1[1]));
  dcim_bitcell bitcell_1_2 (.vdd(vdd), .gnd(gnd), .wl(wl[1]), .in_b(in_b[1]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_1[2]));
  dcim_bitcell bitcell_1_3 (.vdd(vdd), .gnd(gnd), .wl(wl[1]), .in_b(in_b[1]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_1[3]));
  dcim_bitcell bitcell_2_0 (.vdd(vdd), .gnd(gnd), .wl(wl[2]), .in_b(in_b[2]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_2[0]));
  dcim_bitcell bitcell_2_1 (.vdd(vdd), .gnd(gnd), .wl(wl[2]), .in_b(in_b[2]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_2[1]));
  dcim_bitcell bitcell_2_2 (.vdd(vdd), .gnd(gnd), .wl(wl[2]), .in_b(in_b[2]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_2[2]));
  dcim_bitcell bitcell_2_3 (.vdd(vdd), .gnd(gnd), .wl(wl[2]), .in_b(in_b[2]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_2[3]));
  dcim_bitcell bitcell_3_0 (.vdd(vdd), .gnd(gnd), .wl(wl[3]), .in_b(in_b[3]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_3[0]));
  dcim_bitcell bitcell_3_1 (.vdd(vdd), .gnd(gnd), .wl(wl[3]), .in_b(in_b[3]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_3[1]));
  dcim_bitcell bitcell_3_2 (.vdd(vdd), .gnd(gnd), .wl(wl[3]), .in_b(in_b[3]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_3[2]));
  dcim_bitcell bitcell_3_3 (.vdd(vdd), .gnd(gnd), .wl(wl[3]), .in_b(in_b[3]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_3[3]));
  dcim_bitcell bitcell_4_0 (.vdd(vdd), .gnd(gnd), .wl(wl[4]), .in_b(in_b[4]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_4[0]));
  dcim_bitcell bitcell_4_1 (.vdd(vdd), .gnd(gnd), .wl(wl[4]), .in_b(in_b[4]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_4[1]));
  dcim_bitcell bitcell_4_2 (.vdd(vdd), .gnd(gnd), .wl(wl[4]), .in_b(in_b[4]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_4[2]));
  dcim_bitcell bitcell_4_3 (.vdd(vdd), .gnd(gnd), .wl(wl[4]), .in_b(in_b[4]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_4[3]));
  dcim_bitcell bitcell_5_0 (.vdd(vdd), .gnd(gnd), .wl(wl[5]), .in_b(in_b[5]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_5[0]));
  dcim_bitcell bitcell_5_1 (.vdd(vdd), .gnd(gnd), .wl(wl[5]), .in_b(in_b[5]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_5[1]));
  dcim_bitcell bitcell_5_2 (.vdd(vdd), .gnd(gnd), .wl(wl[5]), .in_b(in_b[5]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_5[2]));
  dcim_bitcell bitcell_5_3 (.vdd(vdd), .gnd(gnd), .wl(wl[5]), .in_b(in_b[5]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_5[3]));
  dcim_bitcell bitcell_6_0 (.vdd(vdd), .gnd(gnd), .wl(wl[6]), .in_b(in_b[6]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_6[0]));
  dcim_bitcell bitcell_6_1 (.vdd(vdd), .gnd(gnd), .wl(wl[6]), .in_b(in_b[6]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_6[1]));
  dcim_bitcell bitcell_6_2 (.vdd(vdd), .gnd(gnd), .wl(wl[6]), .in_b(in_b[6]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_6[2]));
  dcim_bitcell bitcell_6_3 (.vdd(vdd), .gnd(gnd), .wl(wl[6]), .in_b(in_b[6]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_6[3]));
  dcim_bitcell bitcell_7_0 (.vdd(vdd), .gnd(gnd), .wl(wl[7]), .in_b(in_b[7]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_7[0]));
  dcim_bitcell bitcell_7_1 (.vdd(vdd), .gnd(gnd), .wl(wl[7]), .in_b(in_b[7]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_7[1]));
  dcim_bitcell bitcell_7_2 (.vdd(vdd), .gnd(gnd), .wl(wl[7]), .in_b(in_b[7]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_7[2]));
  dcim_bitcell bitcell_7_3 (.vdd(vdd), .gnd(gnd), .wl(wl[7]), .in_b(in_b[7]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_7[3]));
  dcim_bitcell bitcell_8_0 (.vdd(vdd), .gnd(gnd), .wl(wl[8]), .in_b(in_b[8]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_8[0]));
  dcim_bitcell bitcell_8_1 (.vdd(vdd), .gnd(gnd), .wl(wl[8]), .in_b(in_b[8]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_8[1]));
  dcim_bitcell bitcell_8_2 (.vdd(vdd), .gnd(gnd), .wl(wl[8]), .in_b(in_b[8]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_8[2]));
  dcim_bitcell bitcell_8_3 (.vdd(vdd), .gnd(gnd), .wl(wl[8]), .in_b(in_b[8]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_8[3]));
  dcim_bitcell bitcell_9_0 (.vdd(vdd), .gnd(gnd), .wl(wl[9]), .in_b(in_b[9]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_9[0]));
  dcim_bitcell bitcell_9_1 (.vdd(vdd), .gnd(gnd), .wl(wl[9]), .in_b(in_b[9]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_9[1]));
  dcim_bitcell bitcell_9_2 (.vdd(vdd), .gnd(gnd), .wl(wl[9]), .in_b(in_b[9]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_9[2]));
  dcim_bitcell bitcell_9_3 (.vdd(vdd), .gnd(gnd), .wl(wl[9]), .in_b(in_b[9]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_9[3]));
  dcim_bitcell bitcell_10_0 (.vdd(vdd), .gnd(gnd), .wl(wl[10]), .in_b(in_b[10]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_10[0]));
  dcim_bitcell bitcell_10_1 (.vdd(vdd), .gnd(gnd), .wl(wl[10]), .in_b(in_b[10]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_10[1]));
  dcim_bitcell bitcell_10_2 (.vdd(vdd), .gnd(gnd), .wl(wl[10]), .in_b(in_b[10]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_10[2]));
  dcim_bitcell bitcell_10_3 (.vdd(vdd), .gnd(gnd), .wl(wl[10]), .in_b(in_b[10]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_10[3]));
  dcim_bitcell bitcell_11_0 (.vdd(vdd), .gnd(gnd), .wl(wl[11]), .in_b(in_b[11]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_11[0]));
  dcim_bitcell bitcell_11_1 (.vdd(vdd), .gnd(gnd), .wl(wl[11]), .in_b(in_b[11]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_11[1]));
  dcim_bitcell bitcell_11_2 (.vdd(vdd), .gnd(gnd), .wl(wl[11]), .in_b(in_b[11]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_11[2]));
  dcim_bitcell bitcell_11_3 (.vdd(vdd), .gnd(gnd), .wl(wl[11]), .in_b(in_b[11]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_11[3]));
  dcim_bitcell bitcell_12_0 (.vdd(vdd), .gnd(gnd), .wl(wl[12]), .in_b(in_b[12]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_12[0]));
  dcim_bitcell bitcell_12_1 (.vdd(vdd), .gnd(gnd), .wl(wl[12]), .in_b(in_b[12]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_12[1]));
  dcim_bitcell bitcell_12_2 (.vdd(vdd), .gnd(gnd), .wl(wl[12]), .in_b(in_b[12]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_12[2]));
  dcim_bitcell bitcell_12_3 (.vdd(vdd), .gnd(gnd), .wl(wl[12]), .in_b(in_b[12]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_12[3]));
  dcim_bitcell bitcell_13_0 (.vdd(vdd), .gnd(gnd), .wl(wl[13]), .in_b(in_b[13]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_13[0]));
  dcim_bitcell bitcell_13_1 (.vdd(vdd), .gnd(gnd), .wl(wl[13]), .in_b(in_b[13]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_13[1]));
  dcim_bitcell bitcell_13_2 (.vdd(vdd), .gnd(gnd), .wl(wl[13]), .in_b(in_b[13]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_13[2]));
  dcim_bitcell bitcell_13_3 (.vdd(vdd), .gnd(gnd), .wl(wl[13]), .in_b(in_b[13]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_13[3]));
  dcim_bitcell bitcell_14_0 (.vdd(vdd), .gnd(gnd), .wl(wl[14]), .in_b(in_b[14]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_14[0]));
  dcim_bitcell bitcell_14_1 (.vdd(vdd), .gnd(gnd), .wl(wl[14]), .in_b(in_b[14]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_14[1]));
  dcim_bitcell bitcell_14_2 (.vdd(vdd), .gnd(gnd), .wl(wl[14]), .in_b(in_b[14]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_14[2]));
  dcim_bitcell bitcell_14_3 (.vdd(vdd), .gnd(gnd), .wl(wl[14]), .in_b(in_b[14]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_14[3]));
  dcim_bitcell bitcell_15_0 (.vdd(vdd), .gnd(gnd), .wl(wl[15]), .in_b(in_b[15]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_15[0]));
  dcim_bitcell bitcell_15_1 (.vdd(vdd), .gnd(gnd), .wl(wl[15]), .in_b(in_b[15]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_15[1]));
  dcim_bitcell bitcell_15_2 (.vdd(vdd), .gnd(gnd), .wl(wl[15]), .in_b(in_b[15]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_15[2]));
  dcim_bitcell bitcell_15_3 (.vdd(vdd), .gnd(gnd), .wl(wl[15]), .in_b(in_b[15]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_15[3]));
  dcim_bitcell bitcell_16_0 (.vdd(vdd), .gnd(gnd), .wl(wl[16]), .in_b(in_b[16]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_16[0]));
  dcim_bitcell bitcell_16_1 (.vdd(vdd), .gnd(gnd), .wl(wl[16]), .in_b(in_b[16]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_16[1]));
  dcim_bitcell bitcell_16_2 (.vdd(vdd), .gnd(gnd), .wl(wl[16]), .in_b(in_b[16]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_16[2]));
  dcim_bitcell bitcell_16_3 (.vdd(vdd), .gnd(gnd), .wl(wl[16]), .in_b(in_b[16]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_16[3]));
  dcim_bitcell bitcell_17_0 (.vdd(vdd), .gnd(gnd), .wl(wl[17]), .in_b(in_b[17]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_17[0]));
  dcim_bitcell bitcell_17_1 (.vdd(vdd), .gnd(gnd), .wl(wl[17]), .in_b(in_b[17]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_17[1]));
  dcim_bitcell bitcell_17_2 (.vdd(vdd), .gnd(gnd), .wl(wl[17]), .in_b(in_b[17]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_17[2]));
  dcim_bitcell bitcell_17_3 (.vdd(vdd), .gnd(gnd), .wl(wl[17]), .in_b(in_b[17]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_17[3]));
  dcim_bitcell bitcell_18_0 (.vdd(vdd), .gnd(gnd), .wl(wl[18]), .in_b(in_b[18]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_18[0]));
  dcim_bitcell bitcell_18_1 (.vdd(vdd), .gnd(gnd), .wl(wl[18]), .in_b(in_b[18]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_18[1]));
  dcim_bitcell bitcell_18_2 (.vdd(vdd), .gnd(gnd), .wl(wl[18]), .in_b(in_b[18]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_18[2]));
  dcim_bitcell bitcell_18_3 (.vdd(vdd), .gnd(gnd), .wl(wl[18]), .in_b(in_b[18]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_18[3]));
  dcim_bitcell bitcell_19_0 (.vdd(vdd), .gnd(gnd), .wl(wl[19]), .in_b(in_b[19]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_19[0]));
  dcim_bitcell bitcell_19_1 (.vdd(vdd), .gnd(gnd), .wl(wl[19]), .in_b(in_b[19]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_19[1]));
  dcim_bitcell bitcell_19_2 (.vdd(vdd), .gnd(gnd), .wl(wl[19]), .in_b(in_b[19]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_19[2]));
  dcim_bitcell bitcell_19_3 (.vdd(vdd), .gnd(gnd), .wl(wl[19]), .in_b(in_b[19]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_19[3]));
  dcim_bitcell bitcell_20_0 (.vdd(vdd), .gnd(gnd), .wl(wl[20]), .in_b(in_b[20]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_20[0]));
  dcim_bitcell bitcell_20_1 (.vdd(vdd), .gnd(gnd), .wl(wl[20]), .in_b(in_b[20]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_20[1]));
  dcim_bitcell bitcell_20_2 (.vdd(vdd), .gnd(gnd), .wl(wl[20]), .in_b(in_b[20]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_20[2]));
  dcim_bitcell bitcell_20_3 (.vdd(vdd), .gnd(gnd), .wl(wl[20]), .in_b(in_b[20]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_20[3]));
  dcim_bitcell bitcell_21_0 (.vdd(vdd), .gnd(gnd), .wl(wl[21]), .in_b(in_b[21]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_21[0]));
  dcim_bitcell bitcell_21_1 (.vdd(vdd), .gnd(gnd), .wl(wl[21]), .in_b(in_b[21]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_21[1]));
  dcim_bitcell bitcell_21_2 (.vdd(vdd), .gnd(gnd), .wl(wl[21]), .in_b(in_b[21]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_21[2]));
  dcim_bitcell bitcell_21_3 (.vdd(vdd), .gnd(gnd), .wl(wl[21]), .in_b(in_b[21]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_21[3]));
  dcim_bitcell bitcell_22_0 (.vdd(vdd), .gnd(gnd), .wl(wl[22]), .in_b(in_b[22]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_22[0]));
  dcim_bitcell bitcell_22_1 (.vdd(vdd), .gnd(gnd), .wl(wl[22]), .in_b(in_b[22]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_22[1]));
  dcim_bitcell bitcell_22_2 (.vdd(vdd), .gnd(gnd), .wl(wl[22]), .in_b(in_b[22]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_22[2]));
  dcim_bitcell bitcell_22_3 (.vdd(vdd), .gnd(gnd), .wl(wl[22]), .in_b(in_b[22]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_22[3]));
  dcim_bitcell bitcell_23_0 (.vdd(vdd), .gnd(gnd), .wl(wl[23]), .in_b(in_b[23]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_23[0]));
  dcim_bitcell bitcell_23_1 (.vdd(vdd), .gnd(gnd), .wl(wl[23]), .in_b(in_b[23]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_23[1]));
  dcim_bitcell bitcell_23_2 (.vdd(vdd), .gnd(gnd), .wl(wl[23]), .in_b(in_b[23]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_23[2]));
  dcim_bitcell bitcell_23_3 (.vdd(vdd), .gnd(gnd), .wl(wl[23]), .in_b(in_b[23]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_23[3]));
  dcim_bitcell bitcell_24_0 (.vdd(vdd), .gnd(gnd), .wl(wl[24]), .in_b(in_b[24]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_24[0]));
  dcim_bitcell bitcell_24_1 (.vdd(vdd), .gnd(gnd), .wl(wl[24]), .in_b(in_b[24]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_24[1]));
  dcim_bitcell bitcell_24_2 (.vdd(vdd), .gnd(gnd), .wl(wl[24]), .in_b(in_b[24]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_24[2]));
  dcim_bitcell bitcell_24_3 (.vdd(vdd), .gnd(gnd), .wl(wl[24]), .in_b(in_b[24]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_24[3]));
  dcim_bitcell bitcell_25_0 (.vdd(vdd), .gnd(gnd), .wl(wl[25]), .in_b(in_b[25]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_25[0]));
  dcim_bitcell bitcell_25_1 (.vdd(vdd), .gnd(gnd), .wl(wl[25]), .in_b(in_b[25]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_25[1]));
  dcim_bitcell bitcell_25_2 (.vdd(vdd), .gnd(gnd), .wl(wl[25]), .in_b(in_b[25]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_25[2]));
  dcim_bitcell bitcell_25_3 (.vdd(vdd), .gnd(gnd), .wl(wl[25]), .in_b(in_b[25]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_25[3]));
  dcim_bitcell bitcell_26_0 (.vdd(vdd), .gnd(gnd), .wl(wl[26]), .in_b(in_b[26]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_26[0]));
  dcim_bitcell bitcell_26_1 (.vdd(vdd), .gnd(gnd), .wl(wl[26]), .in_b(in_b[26]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_26[1]));
  dcim_bitcell bitcell_26_2 (.vdd(vdd), .gnd(gnd), .wl(wl[26]), .in_b(in_b[26]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_26[2]));
  dcim_bitcell bitcell_26_3 (.vdd(vdd), .gnd(gnd), .wl(wl[26]), .in_b(in_b[26]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_26[3]));
  dcim_bitcell bitcell_27_0 (.vdd(vdd), .gnd(gnd), .wl(wl[27]), .in_b(in_b[27]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_27[0]));
  dcim_bitcell bitcell_27_1 (.vdd(vdd), .gnd(gnd), .wl(wl[27]), .in_b(in_b[27]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_27[1]));
  dcim_bitcell bitcell_27_2 (.vdd(vdd), .gnd(gnd), .wl(wl[27]), .in_b(in_b[27]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_27[2]));
  dcim_bitcell bitcell_27_3 (.vdd(vdd), .gnd(gnd), .wl(wl[27]), .in_b(in_b[27]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_27[3]));
  dcim_bitcell bitcell_28_0 (.vdd(vdd), .gnd(gnd), .wl(wl[28]), .in_b(in_b[28]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_28[0]));
  dcim_bitcell bitcell_28_1 (.vdd(vdd), .gnd(gnd), .wl(wl[28]), .in_b(in_b[28]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_28[1]));
  dcim_bitcell bitcell_28_2 (.vdd(vdd), .gnd(gnd), .wl(wl[28]), .in_b(in_b[28]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_28[2]));
  dcim_bitcell bitcell_28_3 (.vdd(vdd), .gnd(gnd), .wl(wl[28]), .in_b(in_b[28]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_28[3]));
  dcim_bitcell bitcell_29_0 (.vdd(vdd), .gnd(gnd), .wl(wl[29]), .in_b(in_b[29]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_29[0]));
  dcim_bitcell bitcell_29_1 (.vdd(vdd), .gnd(gnd), .wl(wl[29]), .in_b(in_b[29]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_29[1]));
  dcim_bitcell bitcell_29_2 (.vdd(vdd), .gnd(gnd), .wl(wl[29]), .in_b(in_b[29]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_29[2]));
  dcim_bitcell bitcell_29_3 (.vdd(vdd), .gnd(gnd), .wl(wl[29]), .in_b(in_b[29]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_29[3]));
  dcim_bitcell bitcell_30_0 (.vdd(vdd), .gnd(gnd), .wl(wl[30]), .in_b(in_b[30]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_30[0]));
  dcim_bitcell bitcell_30_1 (.vdd(vdd), .gnd(gnd), .wl(wl[30]), .in_b(in_b[30]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_30[1]));
  dcim_bitcell bitcell_30_2 (.vdd(vdd), .gnd(gnd), .wl(wl[30]), .in_b(in_b[30]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_30[2]));
  dcim_bitcell bitcell_30_3 (.vdd(vdd), .gnd(gnd), .wl(wl[30]), .in_b(in_b[30]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_30[3]));
  dcim_bitcell bitcell_31_0 (.vdd(vdd), .gnd(gnd), .wl(wl[31]), .in_b(in_b[31]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_31[0]));
  dcim_bitcell bitcell_31_1 (.vdd(vdd), .gnd(gnd), .wl(wl[31]), .in_b(in_b[31]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_31[1]));
  dcim_bitcell bitcell_31_2 (.vdd(vdd), .gnd(gnd), .wl(wl[31]), .in_b(in_b[31]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_31[2]));
  dcim_bitcell bitcell_31_3 (.vdd(vdd), .gnd(gnd), .wl(wl[31]), .in_b(in_b[31]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_31[3]));
  dcim_bitcell bitcell_32_0 (.vdd(vdd), .gnd(gnd), .wl(wl[32]), .in_b(in_b[32]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_32[0]));
  dcim_bitcell bitcell_32_1 (.vdd(vdd), .gnd(gnd), .wl(wl[32]), .in_b(in_b[32]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_32[1]));
  dcim_bitcell bitcell_32_2 (.vdd(vdd), .gnd(gnd), .wl(wl[32]), .in_b(in_b[32]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_32[2]));
  dcim_bitcell bitcell_32_3 (.vdd(vdd), .gnd(gnd), .wl(wl[32]), .in_b(in_b[32]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_32[3]));
  dcim_bitcell bitcell_33_0 (.vdd(vdd), .gnd(gnd), .wl(wl[33]), .in_b(in_b[33]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_33[0]));
  dcim_bitcell bitcell_33_1 (.vdd(vdd), .gnd(gnd), .wl(wl[33]), .in_b(in_b[33]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_33[1]));
  dcim_bitcell bitcell_33_2 (.vdd(vdd), .gnd(gnd), .wl(wl[33]), .in_b(in_b[33]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_33[2]));
  dcim_bitcell bitcell_33_3 (.vdd(vdd), .gnd(gnd), .wl(wl[33]), .in_b(in_b[33]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_33[3]));
  dcim_bitcell bitcell_34_0 (.vdd(vdd), .gnd(gnd), .wl(wl[34]), .in_b(in_b[34]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_34[0]));
  dcim_bitcell bitcell_34_1 (.vdd(vdd), .gnd(gnd), .wl(wl[34]), .in_b(in_b[34]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_34[1]));
  dcim_bitcell bitcell_34_2 (.vdd(vdd), .gnd(gnd), .wl(wl[34]), .in_b(in_b[34]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_34[2]));
  dcim_bitcell bitcell_34_3 (.vdd(vdd), .gnd(gnd), .wl(wl[34]), .in_b(in_b[34]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_34[3]));
  dcim_bitcell bitcell_35_0 (.vdd(vdd), .gnd(gnd), .wl(wl[35]), .in_b(in_b[35]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_35[0]));
  dcim_bitcell bitcell_35_1 (.vdd(vdd), .gnd(gnd), .wl(wl[35]), .in_b(in_b[35]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_35[1]));
  dcim_bitcell bitcell_35_2 (.vdd(vdd), .gnd(gnd), .wl(wl[35]), .in_b(in_b[35]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_35[2]));
  dcim_bitcell bitcell_35_3 (.vdd(vdd), .gnd(gnd), .wl(wl[35]), .in_b(in_b[35]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_35[3]));
  dcim_bitcell bitcell_36_0 (.vdd(vdd), .gnd(gnd), .wl(wl[36]), .in_b(in_b[36]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_36[0]));
  dcim_bitcell bitcell_36_1 (.vdd(vdd), .gnd(gnd), .wl(wl[36]), .in_b(in_b[36]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_36[1]));
  dcim_bitcell bitcell_36_2 (.vdd(vdd), .gnd(gnd), .wl(wl[36]), .in_b(in_b[36]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_36[2]));
  dcim_bitcell bitcell_36_3 (.vdd(vdd), .gnd(gnd), .wl(wl[36]), .in_b(in_b[36]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_36[3]));
  dcim_bitcell bitcell_37_0 (.vdd(vdd), .gnd(gnd), .wl(wl[37]), .in_b(in_b[37]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_37[0]));
  dcim_bitcell bitcell_37_1 (.vdd(vdd), .gnd(gnd), .wl(wl[37]), .in_b(in_b[37]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_37[1]));
  dcim_bitcell bitcell_37_2 (.vdd(vdd), .gnd(gnd), .wl(wl[37]), .in_b(in_b[37]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_37[2]));
  dcim_bitcell bitcell_37_3 (.vdd(vdd), .gnd(gnd), .wl(wl[37]), .in_b(in_b[37]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_37[3]));
  dcim_bitcell bitcell_38_0 (.vdd(vdd), .gnd(gnd), .wl(wl[38]), .in_b(in_b[38]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_38[0]));
  dcim_bitcell bitcell_38_1 (.vdd(vdd), .gnd(gnd), .wl(wl[38]), .in_b(in_b[38]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_38[1]));
  dcim_bitcell bitcell_38_2 (.vdd(vdd), .gnd(gnd), .wl(wl[38]), .in_b(in_b[38]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_38[2]));
  dcim_bitcell bitcell_38_3 (.vdd(vdd), .gnd(gnd), .wl(wl[38]), .in_b(in_b[38]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_38[3]));
  dcim_bitcell bitcell_39_0 (.vdd(vdd), .gnd(gnd), .wl(wl[39]), .in_b(in_b[39]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_39[0]));
  dcim_bitcell bitcell_39_1 (.vdd(vdd), .gnd(gnd), .wl(wl[39]), .in_b(in_b[39]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_39[1]));
  dcim_bitcell bitcell_39_2 (.vdd(vdd), .gnd(gnd), .wl(wl[39]), .in_b(in_b[39]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_39[2]));
  dcim_bitcell bitcell_39_3 (.vdd(vdd), .gnd(gnd), .wl(wl[39]), .in_b(in_b[39]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_39[3]));
  dcim_bitcell bitcell_40_0 (.vdd(vdd), .gnd(gnd), .wl(wl[40]), .in_b(in_b[40]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_40[0]));
  dcim_bitcell bitcell_40_1 (.vdd(vdd), .gnd(gnd), .wl(wl[40]), .in_b(in_b[40]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_40[1]));
  dcim_bitcell bitcell_40_2 (.vdd(vdd), .gnd(gnd), .wl(wl[40]), .in_b(in_b[40]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_40[2]));
  dcim_bitcell bitcell_40_3 (.vdd(vdd), .gnd(gnd), .wl(wl[40]), .in_b(in_b[40]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_40[3]));
  dcim_bitcell bitcell_41_0 (.vdd(vdd), .gnd(gnd), .wl(wl[41]), .in_b(in_b[41]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_41[0]));
  dcim_bitcell bitcell_41_1 (.vdd(vdd), .gnd(gnd), .wl(wl[41]), .in_b(in_b[41]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_41[1]));
  dcim_bitcell bitcell_41_2 (.vdd(vdd), .gnd(gnd), .wl(wl[41]), .in_b(in_b[41]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_41[2]));
  dcim_bitcell bitcell_41_3 (.vdd(vdd), .gnd(gnd), .wl(wl[41]), .in_b(in_b[41]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_41[3]));
  dcim_bitcell bitcell_42_0 (.vdd(vdd), .gnd(gnd), .wl(wl[42]), .in_b(in_b[42]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_42[0]));
  dcim_bitcell bitcell_42_1 (.vdd(vdd), .gnd(gnd), .wl(wl[42]), .in_b(in_b[42]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_42[1]));
  dcim_bitcell bitcell_42_2 (.vdd(vdd), .gnd(gnd), .wl(wl[42]), .in_b(in_b[42]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_42[2]));
  dcim_bitcell bitcell_42_3 (.vdd(vdd), .gnd(gnd), .wl(wl[42]), .in_b(in_b[42]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_42[3]));
  dcim_bitcell bitcell_43_0 (.vdd(vdd), .gnd(gnd), .wl(wl[43]), .in_b(in_b[43]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_43[0]));
  dcim_bitcell bitcell_43_1 (.vdd(vdd), .gnd(gnd), .wl(wl[43]), .in_b(in_b[43]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_43[1]));
  dcim_bitcell bitcell_43_2 (.vdd(vdd), .gnd(gnd), .wl(wl[43]), .in_b(in_b[43]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_43[2]));
  dcim_bitcell bitcell_43_3 (.vdd(vdd), .gnd(gnd), .wl(wl[43]), .in_b(in_b[43]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_43[3]));
  dcim_bitcell bitcell_44_0 (.vdd(vdd), .gnd(gnd), .wl(wl[44]), .in_b(in_b[44]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_44[0]));
  dcim_bitcell bitcell_44_1 (.vdd(vdd), .gnd(gnd), .wl(wl[44]), .in_b(in_b[44]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_44[1]));
  dcim_bitcell bitcell_44_2 (.vdd(vdd), .gnd(gnd), .wl(wl[44]), .in_b(in_b[44]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_44[2]));
  dcim_bitcell bitcell_44_3 (.vdd(vdd), .gnd(gnd), .wl(wl[44]), .in_b(in_b[44]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_44[3]));
  dcim_bitcell bitcell_45_0 (.vdd(vdd), .gnd(gnd), .wl(wl[45]), .in_b(in_b[45]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_45[0]));
  dcim_bitcell bitcell_45_1 (.vdd(vdd), .gnd(gnd), .wl(wl[45]), .in_b(in_b[45]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_45[1]));
  dcim_bitcell bitcell_45_2 (.vdd(vdd), .gnd(gnd), .wl(wl[45]), .in_b(in_b[45]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_45[2]));
  dcim_bitcell bitcell_45_3 (.vdd(vdd), .gnd(gnd), .wl(wl[45]), .in_b(in_b[45]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_45[3]));
  dcim_bitcell bitcell_46_0 (.vdd(vdd), .gnd(gnd), .wl(wl[46]), .in_b(in_b[46]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_46[0]));
  dcim_bitcell bitcell_46_1 (.vdd(vdd), .gnd(gnd), .wl(wl[46]), .in_b(in_b[46]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_46[1]));
  dcim_bitcell bitcell_46_2 (.vdd(vdd), .gnd(gnd), .wl(wl[46]), .in_b(in_b[46]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_46[2]));
  dcim_bitcell bitcell_46_3 (.vdd(vdd), .gnd(gnd), .wl(wl[46]), .in_b(in_b[46]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_46[3]));
  dcim_bitcell bitcell_47_0 (.vdd(vdd), .gnd(gnd), .wl(wl[47]), .in_b(in_b[47]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_47[0]));
  dcim_bitcell bitcell_47_1 (.vdd(vdd), .gnd(gnd), .wl(wl[47]), .in_b(in_b[47]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_47[1]));
  dcim_bitcell bitcell_47_2 (.vdd(vdd), .gnd(gnd), .wl(wl[47]), .in_b(in_b[47]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_47[2]));
  dcim_bitcell bitcell_47_3 (.vdd(vdd), .gnd(gnd), .wl(wl[47]), .in_b(in_b[47]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_47[3]));
  dcim_bitcell bitcell_48_0 (.vdd(vdd), .gnd(gnd), .wl(wl[48]), .in_b(in_b[48]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_48[0]));
  dcim_bitcell bitcell_48_1 (.vdd(vdd), .gnd(gnd), .wl(wl[48]), .in_b(in_b[48]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_48[1]));
  dcim_bitcell bitcell_48_2 (.vdd(vdd), .gnd(gnd), .wl(wl[48]), .in_b(in_b[48]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_48[2]));
  dcim_bitcell bitcell_48_3 (.vdd(vdd), .gnd(gnd), .wl(wl[48]), .in_b(in_b[48]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_48[3]));
  dcim_bitcell bitcell_49_0 (.vdd(vdd), .gnd(gnd), .wl(wl[49]), .in_b(in_b[49]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_49[0]));
  dcim_bitcell bitcell_49_1 (.vdd(vdd), .gnd(gnd), .wl(wl[49]), .in_b(in_b[49]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_49[1]));
  dcim_bitcell bitcell_49_2 (.vdd(vdd), .gnd(gnd), .wl(wl[49]), .in_b(in_b[49]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_49[2]));
  dcim_bitcell bitcell_49_3 (.vdd(vdd), .gnd(gnd), .wl(wl[49]), .in_b(in_b[49]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_49[3]));
  dcim_bitcell bitcell_50_0 (.vdd(vdd), .gnd(gnd), .wl(wl[50]), .in_b(in_b[50]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_50[0]));
  dcim_bitcell bitcell_50_1 (.vdd(vdd), .gnd(gnd), .wl(wl[50]), .in_b(in_b[50]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_50[1]));
  dcim_bitcell bitcell_50_2 (.vdd(vdd), .gnd(gnd), .wl(wl[50]), .in_b(in_b[50]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_50[2]));
  dcim_bitcell bitcell_50_3 (.vdd(vdd), .gnd(gnd), .wl(wl[50]), .in_b(in_b[50]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_50[3]));
  dcim_bitcell bitcell_51_0 (.vdd(vdd), .gnd(gnd), .wl(wl[51]), .in_b(in_b[51]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_51[0]));
  dcim_bitcell bitcell_51_1 (.vdd(vdd), .gnd(gnd), .wl(wl[51]), .in_b(in_b[51]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_51[1]));
  dcim_bitcell bitcell_51_2 (.vdd(vdd), .gnd(gnd), .wl(wl[51]), .in_b(in_b[51]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_51[2]));
  dcim_bitcell bitcell_51_3 (.vdd(vdd), .gnd(gnd), .wl(wl[51]), .in_b(in_b[51]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_51[3]));
  dcim_bitcell bitcell_52_0 (.vdd(vdd), .gnd(gnd), .wl(wl[52]), .in_b(in_b[52]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_52[0]));
  dcim_bitcell bitcell_52_1 (.vdd(vdd), .gnd(gnd), .wl(wl[52]), .in_b(in_b[52]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_52[1]));
  dcim_bitcell bitcell_52_2 (.vdd(vdd), .gnd(gnd), .wl(wl[52]), .in_b(in_b[52]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_52[2]));
  dcim_bitcell bitcell_52_3 (.vdd(vdd), .gnd(gnd), .wl(wl[52]), .in_b(in_b[52]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_52[3]));
  dcim_bitcell bitcell_53_0 (.vdd(vdd), .gnd(gnd), .wl(wl[53]), .in_b(in_b[53]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_53[0]));
  dcim_bitcell bitcell_53_1 (.vdd(vdd), .gnd(gnd), .wl(wl[53]), .in_b(in_b[53]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_53[1]));
  dcim_bitcell bitcell_53_2 (.vdd(vdd), .gnd(gnd), .wl(wl[53]), .in_b(in_b[53]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_53[2]));
  dcim_bitcell bitcell_53_3 (.vdd(vdd), .gnd(gnd), .wl(wl[53]), .in_b(in_b[53]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_53[3]));
  dcim_bitcell bitcell_54_0 (.vdd(vdd), .gnd(gnd), .wl(wl[54]), .in_b(in_b[54]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_54[0]));
  dcim_bitcell bitcell_54_1 (.vdd(vdd), .gnd(gnd), .wl(wl[54]), .in_b(in_b[54]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_54[1]));
  dcim_bitcell bitcell_54_2 (.vdd(vdd), .gnd(gnd), .wl(wl[54]), .in_b(in_b[54]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_54[2]));
  dcim_bitcell bitcell_54_3 (.vdd(vdd), .gnd(gnd), .wl(wl[54]), .in_b(in_b[54]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_54[3]));
  dcim_bitcell bitcell_55_0 (.vdd(vdd), .gnd(gnd), .wl(wl[55]), .in_b(in_b[55]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_55[0]));
  dcim_bitcell bitcell_55_1 (.vdd(vdd), .gnd(gnd), .wl(wl[55]), .in_b(in_b[55]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_55[1]));
  dcim_bitcell bitcell_55_2 (.vdd(vdd), .gnd(gnd), .wl(wl[55]), .in_b(in_b[55]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_55[2]));
  dcim_bitcell bitcell_55_3 (.vdd(vdd), .gnd(gnd), .wl(wl[55]), .in_b(in_b[55]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_55[3]));
  dcim_bitcell bitcell_56_0 (.vdd(vdd), .gnd(gnd), .wl(wl[56]), .in_b(in_b[56]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_56[0]));
  dcim_bitcell bitcell_56_1 (.vdd(vdd), .gnd(gnd), .wl(wl[56]), .in_b(in_b[56]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_56[1]));
  dcim_bitcell bitcell_56_2 (.vdd(vdd), .gnd(gnd), .wl(wl[56]), .in_b(in_b[56]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_56[2]));
  dcim_bitcell bitcell_56_3 (.vdd(vdd), .gnd(gnd), .wl(wl[56]), .in_b(in_b[56]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_56[3]));
  dcim_bitcell bitcell_57_0 (.vdd(vdd), .gnd(gnd), .wl(wl[57]), .in_b(in_b[57]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_57[0]));
  dcim_bitcell bitcell_57_1 (.vdd(vdd), .gnd(gnd), .wl(wl[57]), .in_b(in_b[57]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_57[1]));
  dcim_bitcell bitcell_57_2 (.vdd(vdd), .gnd(gnd), .wl(wl[57]), .in_b(in_b[57]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_57[2]));
  dcim_bitcell bitcell_57_3 (.vdd(vdd), .gnd(gnd), .wl(wl[57]), .in_b(in_b[57]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_57[3]));
  dcim_bitcell bitcell_58_0 (.vdd(vdd), .gnd(gnd), .wl(wl[58]), .in_b(in_b[58]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_58[0]));
  dcim_bitcell bitcell_58_1 (.vdd(vdd), .gnd(gnd), .wl(wl[58]), .in_b(in_b[58]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_58[1]));
  dcim_bitcell bitcell_58_2 (.vdd(vdd), .gnd(gnd), .wl(wl[58]), .in_b(in_b[58]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_58[2]));
  dcim_bitcell bitcell_58_3 (.vdd(vdd), .gnd(gnd), .wl(wl[58]), .in_b(in_b[58]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_58[3]));
  dcim_bitcell bitcell_59_0 (.vdd(vdd), .gnd(gnd), .wl(wl[59]), .in_b(in_b[59]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_59[0]));
  dcim_bitcell bitcell_59_1 (.vdd(vdd), .gnd(gnd), .wl(wl[59]), .in_b(in_b[59]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_59[1]));
  dcim_bitcell bitcell_59_2 (.vdd(vdd), .gnd(gnd), .wl(wl[59]), .in_b(in_b[59]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_59[2]));
  dcim_bitcell bitcell_59_3 (.vdd(vdd), .gnd(gnd), .wl(wl[59]), .in_b(in_b[59]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_59[3]));
  dcim_bitcell bitcell_60_0 (.vdd(vdd), .gnd(gnd), .wl(wl[60]), .in_b(in_b[60]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_60[0]));
  dcim_bitcell bitcell_60_1 (.vdd(vdd), .gnd(gnd), .wl(wl[60]), .in_b(in_b[60]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_60[1]));
  dcim_bitcell bitcell_60_2 (.vdd(vdd), .gnd(gnd), .wl(wl[60]), .in_b(in_b[60]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_60[2]));
  dcim_bitcell bitcell_60_3 (.vdd(vdd), .gnd(gnd), .wl(wl[60]), .in_b(in_b[60]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_60[3]));
  dcim_bitcell bitcell_61_0 (.vdd(vdd), .gnd(gnd), .wl(wl[61]), .in_b(in_b[61]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_61[0]));
  dcim_bitcell bitcell_61_1 (.vdd(vdd), .gnd(gnd), .wl(wl[61]), .in_b(in_b[61]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_61[1]));
  dcim_bitcell bitcell_61_2 (.vdd(vdd), .gnd(gnd), .wl(wl[61]), .in_b(in_b[61]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_61[2]));
  dcim_bitcell bitcell_61_3 (.vdd(vdd), .gnd(gnd), .wl(wl[61]), .in_b(in_b[61]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_61[3]));
  dcim_bitcell bitcell_62_0 (.vdd(vdd), .gnd(gnd), .wl(wl[62]), .in_b(in_b[62]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_62[0]));
  dcim_bitcell bitcell_62_1 (.vdd(vdd), .gnd(gnd), .wl(wl[62]), .in_b(in_b[62]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_62[1]));
  dcim_bitcell bitcell_62_2 (.vdd(vdd), .gnd(gnd), .wl(wl[62]), .in_b(in_b[62]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_62[2]));
  dcim_bitcell bitcell_62_3 (.vdd(vdd), .gnd(gnd), .wl(wl[62]), .in_b(in_b[62]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_62[3]));
  dcim_bitcell bitcell_63_0 (.vdd(vdd), .gnd(gnd), .wl(wl[63]), .in_b(in_b[63]), .bl(bl[0]), .bl_b(bl_b[0]), .out(bitcell_out_63[0]));
  dcim_bitcell bitcell_63_1 (.vdd(vdd), .gnd(gnd), .wl(wl[63]), .in_b(in_b[63]), .bl(bl[1]), .bl_b(bl_b[1]), .out(bitcell_out_63[1]));
  dcim_bitcell bitcell_63_2 (.vdd(vdd), .gnd(gnd), .wl(wl[63]), .in_b(in_b[63]), .bl(bl[2]), .bl_b(bl_b[2]), .out(bitcell_out_63[2]));
  dcim_bitcell bitcell_63_3 (.vdd(vdd), .gnd(gnd), .wl(wl[63]), .in_b(in_b[63]), .bl(bl[3]), .bl_b(bl_b[3]), .out(bitcell_out_63[3]));
endmodule
// End of module definition.

// Module name: sram_rw_4bit
module sram_rw_4bit (
  inout vdd,
  inout gnd,
  inout [3:0] bl,
  inout [3:0] bl_b,
  input pe, 
  input ysw, 
  input ysr, 
  input spe, 
  input se, 
  input [3:0] din,
  output [3:0] dout
);
  sram_rw rw_0 (.vdd(vdd), .gnd(gnd), .bl(bl[0]), .bl_b(bl_b[0]), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din[0]), .dout(dout[0]));
  sram_rw rw_1 (.vdd(vdd), .gnd(gnd), .bl(bl[1]), .bl_b(bl_b[1]), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din[1]), .dout(dout[1]));
  sram_rw rw_2 (.vdd(vdd), .gnd(gnd), .bl(bl[2]), .bl_b(bl_b[2]), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din[2]), .dout(dout[2]));
  sram_rw rw_3 (.vdd(vdd), .gnd(gnd), .bl(bl[3]), .bl_b(bl_b[3]), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din[3]), .dout(dout[3]));
endmodule
// End of module definition.

// Module name: sram_64x4_with_rw
module sram_64x4_with_rw (
  inout vdd,
  inout gnd,
  input pe, 
  input ysw, 
  input ysr, 
  input spe, 
  input se, 
  input [63:0] wl, 
  input [63:0] in_b, 
  input [3:0] din,
  output [3:0] dout,
  output [3:0] bitcell_out_0, 
  output [3:0] bitcell_out_1, 
  output [3:0] bitcell_out_2, 
  output [3:0] bitcell_out_3, 
  output [3:0] bitcell_out_4, 
  output [3:0] bitcell_out_5, 
  output [3:0] bitcell_out_6, 
  output [3:0] bitcell_out_7, 
  output [3:0] bitcell_out_8, 
  output [3:0] bitcell_out_9, 
  output [3:0] bitcell_out_10, 
  output [3:0] bitcell_out_11, 
  output [3:0] bitcell_out_12, 
  output [3:0] bitcell_out_13, 
  output [3:0] bitcell_out_14, 
  output [3:0] bitcell_out_15, 
  output [3:0] bitcell_out_16, 
  output [3:0] bitcell_out_17, 
  output [3:0] bitcell_out_18, 
  output [3:0] bitcell_out_19, 
  output [3:0] bitcell_out_20, 
  output [3:0] bitcell_out_21, 
  output [3:0] bitcell_out_22, 
  output [3:0] bitcell_out_23, 
  output [3:0] bitcell_out_24, 
  output [3:0] bitcell_out_25, 
  output [3:0] bitcell_out_26, 
  output [3:0] bitcell_out_27, 
  output [3:0] bitcell_out_28, 
  output [3:0] bitcell_out_29, 
  output [3:0] bitcell_out_30, 
  output [3:0] bitcell_out_31, 
  output [3:0] bitcell_out_32, 
  output [3:0] bitcell_out_33, 
  output [3:0] bitcell_out_34, 
  output [3:0] bitcell_out_35, 
  output [3:0] bitcell_out_36, 
  output [3:0] bitcell_out_37, 
  output [3:0] bitcell_out_38, 
  output [3:0] bitcell_out_39, 
  output [3:0] bitcell_out_40, 
  output [3:0] bitcell_out_41, 
  output [3:0] bitcell_out_42, 
  output [3:0] bitcell_out_43, 
  output [3:0] bitcell_out_44, 
  output [3:0] bitcell_out_45, 
  output [3:0] bitcell_out_46, 
  output [3:0] bitcell_out_47, 
  output [3:0] bitcell_out_48, 
  output [3:0] bitcell_out_49, 
  output [3:0] bitcell_out_50, 
  output [3:0] bitcell_out_51, 
  output [3:0] bitcell_out_52, 
  output [3:0] bitcell_out_53, 
  output [3:0] bitcell_out_54, 
  output [3:0] bitcell_out_55, 
  output [3:0] bitcell_out_56, 
  output [3:0] bitcell_out_57, 
  output [3:0] bitcell_out_58, 
  output [3:0] bitcell_out_59, 
  output [3:0] bitcell_out_60, 
  output [3:0] bitcell_out_61, 
  output [3:0] bitcell_out_62, 
  output [3:0] bitcell_out_63
);
  wire [3:0] bl;
  wire [3:0] bl_b;
  sram_64x4 sram (.vdd(vdd), .gnd(gnd), .wl(wl), .in_b(in_b), .bl(bl), .bl_b(bl_b), .bitcell_out_0(bitcell_out_0), .bitcell_out_1(bitcell_out_1), .bitcell_out_2(bitcell_out_2), .bitcell_out_3(bitcell_out_3), .bitcell_out_4(bitcell_out_4), .bitcell_out_5(bitcell_out_5), .bitcell_out_6(bitcell_out_6), .bitcell_out_7(bitcell_out_7), .bitcell_out_8(bitcell_out_8), .bitcell_out_9(bitcell_out_9), .bitcell_out_10(bitcell_out_10), .bitcell_out_11(bitcell_out_11), .bitcell_out_12(bitcell_out_12), .bitcell_out_13(bitcell_out_13), .bitcell_out_14(bitcell_out_14), .bitcell_out_15(bitcell_out_15), .bitcell_out_16(bitcell_out_16), .bitcell_out_17(bitcell_out_17), .bitcell_out_18(bitcell_out_18), .bitcell_out_19(bitcell_out_19), .bitcell_out_20(bitcell_out_20), .bitcell_out_21(bitcell_out_21), .bitcell_out_22(bitcell_out_22), .bitcell_out_23(bitcell_out_23), .bitcell_out_24(bitcell_out_24), .bitcell_out_25(bitcell_out_25), .bitcell_out_26(bitcell_out_26), .bitcell_out_27(bitcell_out_27), .bitcell_out_28(bitcell_out_28), .bitcell_out_29(bitcell_out_29), .bitcell_out_30(bitcell_out_30), .bitcell_out_31(bitcell_out_31), .bitcell_out_32(bitcell_out_32), .bitcell_out_33(bitcell_out_33), .bitcell_out_34(bitcell_out_34), .bitcell_out_35(bitcell_out_35), .bitcell_out_36(bitcell_out_36), .bitcell_out_37(bitcell_out_37), .bitcell_out_38(bitcell_out_38), .bitcell_out_39(bitcell_out_39), .bitcell_out_40(bitcell_out_40), .bitcell_out_41(bitcell_out_41), .bitcell_out_42(bitcell_out_42), .bitcell_out_43(bitcell_out_43), .bitcell_out_44(bitcell_out_44), .bitcell_out_45(bitcell_out_45), .bitcell_out_46(bitcell_out_46), .bitcell_out_47(bitcell_out_47), .bitcell_out_48(bitcell_out_48), .bitcell_out_49(bitcell_out_49), .bitcell_out_50(bitcell_out_50), .bitcell_out_51(bitcell_out_51), .bitcell_out_52(bitcell_out_52), .bitcell_out_53(bitcell_out_53), .bitcell_out_54(bitcell_out_54), .bitcell_out_55(bitcell_out_55), .bitcell_out_56(bitcell_out_56), .bitcell_out_57(bitcell_out_57), .bitcell_out_58(bitcell_out_58), .bitcell_out_59(bitcell_out_59), .bitcell_out_60(bitcell_out_60), .bitcell_out_61(bitcell_out_61), .bitcell_out_62(bitcell_out_62), .bitcell_out_63(bitcell_out_63));
  sram_rw_4bit sram_rw (.vdd(vdd), .gnd(gnd), .bl(bl), .bl_b(bl_b), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .din(din), .dout(dout));
endmodule
// End of module definition.

// Module name: adder_4bit_sign_extension
module adder_4bit_sign_extension (
  inout vdd,
  inout gnd,
  input sign,
  input [3:0] a,
  input [3:0] b,
  output [4:0] s
);
  wire [3:0] c;
  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  adder_sign_extension fa_4 (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[3]), .b(b[3]), .cin(c[3]), .s(s[4]));
endmodule
// End of module definition.

// Module name: adder_5bit_sign_extension
module adder_5bit_sign_extension (
  inout vdd,
  inout gnd,
  input sign,
  input [4:0] a,
  input [4:0] b,
  output [5:0] s
);
  wire [4:0] c;
  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  full_adder fa_4 (.vdd(vdd), .gnd(gnd), .a(a[4]), .b(b[4]), .cin(c[3]), .s(s[4]), .cout(c[4]));
  adder_sign_extension fa_5 (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[4]), .b(b[4]), .cin(c[4]), .s(s[5]));
endmodule
// End of module definition.

// Module name: adder_6bit_sign_extension
module adder_6bit_sign_extension (
  inout vdd,
  inout gnd,
  input sign,
  input [5:0] a,
  input [5:0] b,
  output [6:0] s
);
  wire [5:0] c;
  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  full_adder fa_4 (.vdd(vdd), .gnd(gnd), .a(a[4]), .b(b[4]), .cin(c[3]), .s(s[4]), .cout(c[4]));
  full_adder fa_5 (.vdd(vdd), .gnd(gnd), .a(a[5]), .b(b[5]), .cin(c[4]), .s(s[5]), .cout(c[5]));
  adder_sign_extension fa_6 (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[5]), .b(b[5]), .cin(c[5]), .s(s[6]));
endmodule
// End of module definition.

// Module name: adder_7bit_sign_extension
module adder_7bit_sign_extension (
  inout vdd,
  inout gnd,
  input sign,
  input [6:0] a,
  input [6:0] b,
  output [7:0] s
);
  wire [6:0] c;
  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  full_adder fa_4 (.vdd(vdd), .gnd(gnd), .a(a[4]), .b(b[4]), .cin(c[3]), .s(s[4]), .cout(c[4]));
  full_adder fa_5 (.vdd(vdd), .gnd(gnd), .a(a[5]), .b(b[5]), .cin(c[4]), .s(s[5]), .cout(c[5]));
  full_adder fa_6 (.vdd(vdd), .gnd(gnd), .a(a[6]), .b(b[6]), .cin(c[5]), .s(s[6]), .cout(c[6]));
  adder_sign_extension fa_7 (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[6]), .b(b[6]), .cin(c[6]), .s(s[7]));
endmodule
// End of module definition.

// Module name: adder_8bit_sign_extension
module adder_8bit_sign_extension (
  inout vdd,
  inout gnd,
  input sign,
  input [7:0] a,
  input [7:0] b,
  output [8:0] s
);
  wire [7:0] c;
  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  full_adder fa_4 (.vdd(vdd), .gnd(gnd), .a(a[4]), .b(b[4]), .cin(c[3]), .s(s[4]), .cout(c[4]));
  full_adder fa_5 (.vdd(vdd), .gnd(gnd), .a(a[5]), .b(b[5]), .cin(c[4]), .s(s[5]), .cout(c[5]));
  full_adder fa_6 (.vdd(vdd), .gnd(gnd), .a(a[6]), .b(b[6]), .cin(c[5]), .s(s[6]), .cout(c[6]));
  full_adder fa_7 (.vdd(vdd), .gnd(gnd), .a(a[7]), .b(b[7]), .cin(c[6]), .s(s[7]), .cout(c[7]));
  adder_sign_extension fa_8 (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[7]), .b(b[7]), .cin(c[7]), .s(s[8]));
endmodule
// End of module definition.

// Module name: adder_9bit_sign_extension
module adder_9bit_sign_extension (
  inout vdd,
  inout gnd,
  input sign,
  input [8:0] a,
  input [8:0] b,
  output [9:0] s
);
  wire [8:0] c;
  half_adder ha_0 (.vdd(vdd), .gnd(gnd), .a(a[0]), .b(b[0]), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  full_adder fa_4 (.vdd(vdd), .gnd(gnd), .a(a[4]), .b(b[4]), .cin(c[3]), .s(s[4]), .cout(c[4]));
  full_adder fa_5 (.vdd(vdd), .gnd(gnd), .a(a[5]), .b(b[5]), .cin(c[4]), .s(s[5]), .cout(c[5]));
  full_adder fa_6 (.vdd(vdd), .gnd(gnd), .a(a[6]), .b(b[6]), .cin(c[5]), .s(s[6]), .cout(c[6]));
  full_adder fa_7 (.vdd(vdd), .gnd(gnd), .a(a[7]), .b(b[7]), .cin(c[6]), .s(s[7]), .cout(c[7]));
  full_adder fa_8 (.vdd(vdd), .gnd(gnd), .a(a[8]), .b(b[8]), .cin(c[7]), .s(s[8]), .cout(c[8]));
  adder_sign_extension fa_9 (.vdd(vdd), .gnd(gnd), .sign(sign), .a(a[8]), .b(b[8]), .cin(c[8]), .s(s[9]));
endmodule
// End of module definition.

// Module name: adder_tree_4bit_to_10bit
module adder_tree_4bit_to_10bit (
  inout vdd,
  inout gnd,
  input sign_weight, 
  input [3:0] in_0,
  input [3:0] in_1,
  input [3:0] in_2,
  input [3:0] in_3,
  input [3:0] in_4,
  input [3:0] in_5,
  input [3:0] in_6,
  input [3:0] in_7,
  input [3:0] in_8,
  input [3:0] in_9,
  input [3:0] in_10,
  input [3:0] in_11,
  input [3:0] in_12,
  input [3:0] in_13,
  input [3:0] in_14,
  input [3:0] in_15,
  input [3:0] in_16,
  input [3:0] in_17,
  input [3:0] in_18,
  input [3:0] in_19,
  input [3:0] in_20,
  input [3:0] in_21,
  input [3:0] in_22,
  input [3:0] in_23,
  input [3:0] in_24,
  input [3:0] in_25,
  input [3:0] in_26,
  input [3:0] in_27,
  input [3:0] in_28,
  input [3:0] in_29,
  input [3:0] in_30,
  input [3:0] in_31,
  input [3:0] in_32,
  input [3:0] in_33,
  input [3:0] in_34,
  input [3:0] in_35,
  input [3:0] in_36,
  input [3:0] in_37,
  input [3:0] in_38,
  input [3:0] in_39,
  input [3:0] in_40,
  input [3:0] in_41,
  input [3:0] in_42,
  input [3:0] in_43,
  input [3:0] in_44,
  input [3:0] in_45,
  input [3:0] in_46,
  input [3:0] in_47,
  input [3:0] in_48,
  input [3:0] in_49,
  input [3:0] in_50,
  input [3:0] in_51,
  input [3:0] in_52,
  input [3:0] in_53,
  input [3:0] in_54,
  input [3:0] in_55,
  input [3:0] in_56,
  input [3:0] in_57,
  input [3:0] in_58,
  input [3:0] in_59,
  input [3:0] in_60,
  input [3:0] in_61,
  input [3:0] in_62,
  input [3:0] in_63,
  output [9:0] out
);
  wire [4:0] sum_4bit_0;
  wire [4:0] sum_4bit_1;
  wire [4:0] sum_4bit_2;
  wire [4:0] sum_4bit_3;
  wire [4:0] sum_4bit_4;
  wire [4:0] sum_4bit_5;
  wire [4:0] sum_4bit_6;
  wire [4:0] sum_4bit_7;
  wire [4:0] sum_4bit_8;
  wire [4:0] sum_4bit_9;
  wire [4:0] sum_4bit_10;
  wire [4:0] sum_4bit_11;
  wire [4:0] sum_4bit_12;
  wire [4:0] sum_4bit_13;
  wire [4:0] sum_4bit_14;
  wire [4:0] sum_4bit_15;
  wire [4:0] sum_4bit_16;
  wire [4:0] sum_4bit_17;
  wire [4:0] sum_4bit_18;
  wire [4:0] sum_4bit_19;
  wire [4:0] sum_4bit_20;
  wire [4:0] sum_4bit_21;
  wire [4:0] sum_4bit_22;
  wire [4:0] sum_4bit_23;
  wire [4:0] sum_4bit_24;
  wire [4:0] sum_4bit_25;
  wire [4:0] sum_4bit_26;
  wire [4:0] sum_4bit_27;
  wire [4:0] sum_4bit_28;
  wire [4:0] sum_4bit_29;
  wire [4:0] sum_4bit_30;
  wire [4:0] sum_4bit_31;
  wire [5:0] sum_5bit_0;
  wire [5:0] sum_5bit_1;
  wire [5:0] sum_5bit_2;
  wire [5:0] sum_5bit_3;
  wire [5:0] sum_5bit_4;
  wire [5:0] sum_5bit_5;
  wire [5:0] sum_5bit_6;
  wire [5:0] sum_5bit_7;
  wire [5:0] sum_5bit_8;
  wire [5:0] sum_5bit_9;
  wire [5:0] sum_5bit_10;
  wire [5:0] sum_5bit_11;
  wire [5:0] sum_5bit_12;
  wire [5:0] sum_5bit_13;
  wire [5:0] sum_5bit_14;
  wire [5:0] sum_5bit_15;
  wire [6:0] sum_6bit_0;
  wire [6:0] sum_6bit_1;
  wire [6:0] sum_6bit_2;
  wire [6:0] sum_6bit_3;
  wire [6:0] sum_6bit_4;
  wire [6:0] sum_6bit_5;
  wire [6:0] sum_6bit_6;
  wire [6:0] sum_6bit_7;
  wire [7:0] sum_7bit_0;
  wire [7:0] sum_7bit_1;
  wire [7:0] sum_7bit_2;
  wire [7:0] sum_7bit_3;
  wire [8:0] sum_8bit_0;
  wire [8:0] sum_8bit_1;
  adder_4bit_sign_extension adder_4bit_0 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_0), .b(in_1), .s(sum_4bit_0));
  adder_4bit_sign_extension adder_4bit_1 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_2), .b(in_3), .s(sum_4bit_1));
  adder_4bit_sign_extension adder_4bit_2 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_4), .b(in_5), .s(sum_4bit_2));
  adder_4bit_sign_extension adder_4bit_3 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_6), .b(in_7), .s(sum_4bit_3));
  adder_4bit_sign_extension adder_4bit_4 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_8), .b(in_9), .s(sum_4bit_4));
  adder_4bit_sign_extension adder_4bit_5 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_10), .b(in_11), .s(sum_4bit_5));
  adder_4bit_sign_extension adder_4bit_6 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_12), .b(in_13), .s(sum_4bit_6));
  adder_4bit_sign_extension adder_4bit_7 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_14), .b(in_15), .s(sum_4bit_7));
  adder_4bit_sign_extension adder_4bit_8 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_16), .b(in_17), .s(sum_4bit_8));
  adder_4bit_sign_extension adder_4bit_9 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_18), .b(in_19), .s(sum_4bit_9));
  adder_4bit_sign_extension adder_4bit_10 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_20), .b(in_21), .s(sum_4bit_10));
  adder_4bit_sign_extension adder_4bit_11 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_22), .b(in_23), .s(sum_4bit_11));
  adder_4bit_sign_extension adder_4bit_12 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_24), .b(in_25), .s(sum_4bit_12));
  adder_4bit_sign_extension adder_4bit_13 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_26), .b(in_27), .s(sum_4bit_13));
  adder_4bit_sign_extension adder_4bit_14 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_28), .b(in_29), .s(sum_4bit_14));
  adder_4bit_sign_extension adder_4bit_15 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_30), .b(in_31), .s(sum_4bit_15));
  adder_4bit_sign_extension adder_4bit_16 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_32), .b(in_33), .s(sum_4bit_16));
  adder_4bit_sign_extension adder_4bit_17 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_34), .b(in_35), .s(sum_4bit_17));
  adder_4bit_sign_extension adder_4bit_18 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_36), .b(in_37), .s(sum_4bit_18));
  adder_4bit_sign_extension adder_4bit_19 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_38), .b(in_39), .s(sum_4bit_19));
  adder_4bit_sign_extension adder_4bit_20 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_40), .b(in_41), .s(sum_4bit_20));
  adder_4bit_sign_extension adder_4bit_21 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_42), .b(in_43), .s(sum_4bit_21));
  adder_4bit_sign_extension adder_4bit_22 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_44), .b(in_45), .s(sum_4bit_22));
  adder_4bit_sign_extension adder_4bit_23 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_46), .b(in_47), .s(sum_4bit_23));
  adder_4bit_sign_extension adder_4bit_24 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_48), .b(in_49), .s(sum_4bit_24));
  adder_4bit_sign_extension adder_4bit_25 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_50), .b(in_51), .s(sum_4bit_25));
  adder_4bit_sign_extension adder_4bit_26 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_52), .b(in_53), .s(sum_4bit_26));
  adder_4bit_sign_extension adder_4bit_27 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_54), .b(in_55), .s(sum_4bit_27));
  adder_4bit_sign_extension adder_4bit_28 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_56), .b(in_57), .s(sum_4bit_28));
  adder_4bit_sign_extension adder_4bit_29 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_58), .b(in_59), .s(sum_4bit_29));
  adder_4bit_sign_extension adder_4bit_30 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_60), .b(in_61), .s(sum_4bit_30));
  adder_4bit_sign_extension adder_4bit_31 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(in_62), .b(in_63), .s(sum_4bit_31));
  adder_5bit_sign_extension adder_5bit_0 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_0), .b(sum_4bit_1), .s(sum_5bit_0));
  adder_5bit_sign_extension adder_5bit_1 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_2), .b(sum_4bit_3), .s(sum_5bit_1));
  adder_5bit_sign_extension adder_5bit_2 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_4), .b(sum_4bit_5), .s(sum_5bit_2));
  adder_5bit_sign_extension adder_5bit_3 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_6), .b(sum_4bit_7), .s(sum_5bit_3));
  adder_5bit_sign_extension adder_5bit_4 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_8), .b(sum_4bit_9), .s(sum_5bit_4));
  adder_5bit_sign_extension adder_5bit_5 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_10), .b(sum_4bit_11), .s(sum_5bit_5));
  adder_5bit_sign_extension adder_5bit_6 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_12), .b(sum_4bit_13), .s(sum_5bit_6));
  adder_5bit_sign_extension adder_5bit_7 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_14), .b(sum_4bit_15), .s(sum_5bit_7));
  adder_5bit_sign_extension adder_5bit_8 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_16), .b(sum_4bit_17), .s(sum_5bit_8));
  adder_5bit_sign_extension adder_5bit_9 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_18), .b(sum_4bit_19), .s(sum_5bit_9));
  adder_5bit_sign_extension adder_5bit_10 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_20), .b(sum_4bit_21), .s(sum_5bit_10));
  adder_5bit_sign_extension adder_5bit_11 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_22), .b(sum_4bit_23), .s(sum_5bit_11));
  adder_5bit_sign_extension adder_5bit_12 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_24), .b(sum_4bit_25), .s(sum_5bit_12));
  adder_5bit_sign_extension adder_5bit_13 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_26), .b(sum_4bit_27), .s(sum_5bit_13));
  adder_5bit_sign_extension adder_5bit_14 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_28), .b(sum_4bit_29), .s(sum_5bit_14));
  adder_5bit_sign_extension adder_5bit_15 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_4bit_30), .b(sum_4bit_31), .s(sum_5bit_15));
  adder_6bit_sign_extension adder_6bit_0 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_0), .b(sum_5bit_1), .s(sum_6bit_0));
  adder_6bit_sign_extension adder_6bit_1 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_2), .b(sum_5bit_3), .s(sum_6bit_1));
  adder_6bit_sign_extension adder_6bit_2 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_4), .b(sum_5bit_5), .s(sum_6bit_2));
  adder_6bit_sign_extension adder_6bit_3 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_6), .b(sum_5bit_7), .s(sum_6bit_3));
  adder_6bit_sign_extension adder_6bit_4 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_8), .b(sum_5bit_9), .s(sum_6bit_4));
  adder_6bit_sign_extension adder_6bit_5 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_10), .b(sum_5bit_11), .s(sum_6bit_5));
  adder_6bit_sign_extension adder_6bit_6 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_12), .b(sum_5bit_13), .s(sum_6bit_6));
  adder_6bit_sign_extension adder_6bit_7 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_5bit_14), .b(sum_5bit_15), .s(sum_6bit_7));
  adder_7bit_sign_extension adder_7bit_0 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_6bit_0), .b(sum_6bit_1), .s(sum_7bit_0));
  adder_7bit_sign_extension adder_7bit_1 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_6bit_2), .b(sum_6bit_3), .s(sum_7bit_1));
  adder_7bit_sign_extension adder_7bit_2 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_6bit_4), .b(sum_6bit_5), .s(sum_7bit_2));
  adder_7bit_sign_extension adder_7bit_3 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_6bit_6), .b(sum_6bit_7), .s(sum_7bit_3));
  adder_8bit_sign_extension adder_8bit_0 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_7bit_0), .b(sum_7bit_1), .s(sum_8bit_0));
  adder_8bit_sign_extension adder_8bit_1 (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_7bit_2), .b(sum_7bit_3), .s(sum_8bit_1));
  adder_9bit_sign_extension adder_9bit (.vdd(vdd), .gnd(gnd), .sign(sign_weight), .a(sum_8bit_0), .b(sum_8bit_1), .s(out));
endmodule
// End of module definition.

// Module name: adder_14bit_with_cin_for_acc
module adder_14bit_with_cin_for_acc (
  inout vdd,
  inout gnd,
  input c_in,
  input [9:0] a_0_to_9,
  input a_10,
  input a_11,
  input a_12,
  input a_13,
  input b_0,
  input [12:0] b_1_to_13,
  output [13:0] s
);
  wire [13:0] c;
  full_adder fa_0 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[0]), .b(b_0), .cin(c_in), .s(s[0]), .cout(c[0]));
  full_adder fa_1 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[1]), .b(b_1_to_13[0]), .cin(c[0]), .s(s[1]), .cout(c[1]));
  full_adder fa_2 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[2]), .b(b_1_to_13[1]), .cin(c[1]), .s(s[2]), .cout(c[2]));
  full_adder fa_3 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[3]), .b(b_1_to_13[2]), .cin(c[2]), .s(s[3]), .cout(c[3]));
  full_adder fa_4 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[4]), .b(b_1_to_13[3]), .cin(c[3]), .s(s[4]), .cout(c[4]));
  full_adder fa_5 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[5]), .b(b_1_to_13[4]), .cin(c[4]), .s(s[5]), .cout(c[5]));
  full_adder fa_6 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[6]), .b(b_1_to_13[5]), .cin(c[5]), .s(s[6]), .cout(c[6]));
  full_adder fa_7 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[7]), .b(b_1_to_13[6]), .cin(c[6]), .s(s[7]), .cout(c[7]));
  full_adder fa_8 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[8]), .b(b_1_to_13[7]), .cin(c[7]), .s(s[8]), .cout(c[8]));
  full_adder fa_9 (.vdd(vdd), .gnd(gnd), .a(a_0_to_9[9]), .b(b_1_to_13[8]), .cin(c[8]), .s(s[9]), .cout(c[9]));
  full_adder fa_10 (.vdd(vdd), .gnd(gnd), .a(a_10), .b(b_1_to_13[9]), .cin(c[9]), .s(s[10]), .cout(c[10]));
  full_adder fa_11 (.vdd(vdd), .gnd(gnd), .a(a_11), .b(b_1_to_13[10]), .cin(c[10]), .s(s[11]), .cout(c[11]));
  full_adder fa_12 (.vdd(vdd), .gnd(gnd), .a(a_12), .b(b_1_to_13[11]), .cin(c[11]), .s(s[12]), .cout(c[12]));
  full_adder fa_13 (.vdd(vdd), .gnd(gnd), .a(a_13), .b(b_1_to_13[12]), .cin(c[12]), .s(s[13]), .cout(c[13]));
endmodule
// End of module definition.

// Module name: dff_10bit
module dff_10bit (
  inout vdd,
  inout gnd,
  input clk, 
  input rst_b, 
  input [9:0] in,
  output [9:0] out
);
  dff dff_0 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[0]), .out(out[0]));
  dff dff_1 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[1]), .out(out[1]));
  dff dff_2 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[2]), .out(out[2]));
  dff dff_3 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[3]), .out(out[3]));
  dff dff_4 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[4]), .out(out[4]));
  dff dff_5 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[5]), .out(out[5]));
  dff dff_6 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[6]), .out(out[6]));
  dff dff_7 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[7]), .out(out[7]));
  dff dff_8 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[8]), .out(out[8]));
  dff dff_9 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[9]), .out(out[9]));
endmodule
// End of module definition.

// Module name: dff_13bit
module dff_13bit (
  inout vdd,
  inout gnd,
  input clk, 
  input rst_b, 
  input [12:0] in,
  output [12:0] out
);
  dff dff_0 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[0]), .out(out[0]));
  dff dff_1 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[1]), .out(out[1]));
  dff dff_2 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[2]), .out(out[2]));
  dff dff_3 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[3]), .out(out[3]));
  dff dff_4 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[4]), .out(out[4]));
  dff dff_5 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[5]), .out(out[5]));
  dff dff_6 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[6]), .out(out[6]));
  dff dff_7 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[7]), .out(out[7]));
  dff dff_8 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[8]), .out(out[8]));
  dff dff_9 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[9]), .out(out[9]));
  dff dff_10 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[10]), .out(out[10]));
  dff dff_11 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[11]), .out(out[11]));
  dff dff_12 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[12]), .out(out[12]));
endmodule
// End of module definition.

// Module name: dff_14bit
module dff_14bit (
  inout vdd,
  inout gnd,
  input clk, 
  input rst_b, 
  input [13:0] in,
  output [13:0] out
);
  dff dff_0 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[0]), .out(out[0]));
  dff dff_1 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[1]), .out(out[1]));
  dff dff_2 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[2]), .out(out[2]));
  dff dff_3 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[3]), .out(out[3]));
  dff dff_4 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[4]), .out(out[4]));
  dff dff_5 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[5]), .out(out[5]));
  dff dff_6 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[6]), .out(out[6]));
  dff dff_7 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[7]), .out(out[7]));
  dff dff_8 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[8]), .out(out[8]));
  dff dff_9 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[9]), .out(out[9]));
  dff dff_10 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[10]), .out(out[10]));
  dff dff_11 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[11]), .out(out[11]));
  dff dff_12 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[12]), .out(out[12]));
  dff dff_13 (.vdd(vdd), .gnd(gnd), .clk(clk), .rst_b(rst_b), .in(in[13]), .out(out[13]));
endmodule
// End of module definition.

// Module name: inverse_mux_10bit
module inverse_mux_10bit (
  inout vdd,
  inout gnd,
  input sign,
  input [9:0] in,
  output [9:0] out
);
  wire sign_b;
  wire [9:0] in_b; 
  wire [9:0] in_0; 
  wire [9:0] in_1; 
  inverter inv_sign (.vdd(vdd), .gnd(gnd), .in(sign), .out(sign_b));
  inverter inv_in_0 (.vdd(vdd), .gnd(gnd), .in(in[0]), .out(in_b[0]));
  inverter inv_in_1 (.vdd(vdd), .gnd(gnd), .in(in[1]), .out(in_b[1]));
  inverter inv_in_2 (.vdd(vdd), .gnd(gnd), .in(in[2]), .out(in_b[2]));
  inverter inv_in_3 (.vdd(vdd), .gnd(gnd), .in(in[3]), .out(in_b[3]));
  inverter inv_in_4 (.vdd(vdd), .gnd(gnd), .in(in[4]), .out(in_b[4]));
  inverter inv_in_5 (.vdd(vdd), .gnd(gnd), .in(in[5]), .out(in_b[5]));
  inverter inv_in_6 (.vdd(vdd), .gnd(gnd), .in(in[6]), .out(in_b[6]));
  inverter inv_in_7 (.vdd(vdd), .gnd(gnd), .in(in[7]), .out(in_b[7]));
  inverter inv_in_8 (.vdd(vdd), .gnd(gnd), .in(in[8]), .out(in_b[8]));
  inverter inv_in_9 (.vdd(vdd), .gnd(gnd), .in(in[9]), .out(in_b[9]));
  nand2 in_0_0 (.vdd(vdd), .gnd(gnd), .in_0(in[0]), .in_1(sign_b), .out(in_0[0]));
  nand2 in_1_0 (.vdd(vdd), .gnd(gnd), .in_0(in_b[0]), .in_1(sign), .out(in_1[0]));
  nand2 in_0_1 (.vdd(vdd), .gnd(gnd), .in_0(in[1]), .in_1(sign_b), .out(in_0[1]));
  nand2 in_1_1 (.vdd(vdd), .gnd(gnd), .in_0(in_b[1]), .in_1(sign), .out(in_1[1]));
  nand2 in_0_2 (.vdd(vdd), .gnd(gnd), .in_0(in[2]), .in_1(sign_b), .out(in_0[2]));
  nand2 in_1_2 (.vdd(vdd), .gnd(gnd), .in_0(in_b[2]), .in_1(sign), .out(in_1[2]));
  nand2 in_0_3 (.vdd(vdd), .gnd(gnd), .in_0(in[3]), .in_1(sign_b), .out(in_0[3]));
  nand2 in_1_3 (.vdd(vdd), .gnd(gnd), .in_0(in_b[3]), .in_1(sign), .out(in_1[3]));
  nand2 in_0_4 (.vdd(vdd), .gnd(gnd), .in_0(in[4]), .in_1(sign_b), .out(in_0[4]));
  nand2 in_1_4 (.vdd(vdd), .gnd(gnd), .in_0(in_b[4]), .in_1(sign), .out(in_1[4]));
  nand2 in_0_5 (.vdd(vdd), .gnd(gnd), .in_0(in[5]), .in_1(sign_b), .out(in_0[5]));
  nand2 in_1_5 (.vdd(vdd), .gnd(gnd), .in_0(in_b[5]), .in_1(sign), .out(in_1[5]));
  nand2 in_0_6 (.vdd(vdd), .gnd(gnd), .in_0(in[6]), .in_1(sign_b), .out(in_0[6]));
  nand2 in_1_6 (.vdd(vdd), .gnd(gnd), .in_0(in_b[6]), .in_1(sign), .out(in_1[6]));
  nand2 in_0_7 (.vdd(vdd), .gnd(gnd), .in_0(in[7]), .in_1(sign_b), .out(in_0[7]));
  nand2 in_1_7 (.vdd(vdd), .gnd(gnd), .in_0(in_b[7]), .in_1(sign), .out(in_1[7]));
  nand2 in_0_8 (.vdd(vdd), .gnd(gnd), .in_0(in[8]), .in_1(sign_b), .out(in_0[8]));
  nand2 in_1_8 (.vdd(vdd), .gnd(gnd), .in_0(in_b[8]), .in_1(sign), .out(in_1[8]));
  nand2 in_0_9 (.vdd(vdd), .gnd(gnd), .in_0(in[9]), .in_1(sign_b), .out(in_0[9]));
  nand2 in_1_9 (.vdd(vdd), .gnd(gnd), .in_0(in_b[9]), .in_1(sign), .out(in_1[9]));
  nand2 out_0 (.vdd(vdd), .gnd(gnd), .in_0(in_0[0]), .in_1(in_1[0]), .out(out[0]));
  nand2 out_1 (.vdd(vdd), .gnd(gnd), .in_0(in_0[1]), .in_1(in_1[1]), .out(out[1]));
  nand2 out_2 (.vdd(vdd), .gnd(gnd), .in_0(in_0[2]), .in_1(in_1[2]), .out(out[2]));
  nand2 out_3 (.vdd(vdd), .gnd(gnd), .in_0(in_0[3]), .in_1(in_1[3]), .out(out[3]));
  nand2 out_4 (.vdd(vdd), .gnd(gnd), .in_0(in_0[4]), .in_1(in_1[4]), .out(out[4]));
  nand2 out_5 (.vdd(vdd), .gnd(gnd), .in_0(in_0[5]), .in_1(in_1[5]), .out(out[5]));
  nand2 out_6 (.vdd(vdd), .gnd(gnd), .in_0(in_0[6]), .in_1(in_1[6]), .out(out[6]));
  nand2 out_7 (.vdd(vdd), .gnd(gnd), .in_0(in_0[7]), .in_1(in_1[7]), .out(out[7]));
  nand2 out_8 (.vdd(vdd), .gnd(gnd), .in_0(in_0[8]), .in_1(in_1[8]), .out(out[8]));
  nand2 out_9 (.vdd(vdd), .gnd(gnd), .in_0(in_0[9]), .in_1(in_1[9]), .out(out[9]));
endmodule
// End of module definition.

// Module name: accumulator_10bit_to_14bit
module accumulator_10bit_to_14bit(
  inout vdd,
  inout gnd,
  input clk_psum, 
  input clk_shift, 
  input clk_out, 
  input rst_b, 
  input sign_weight, 
  input sign_in,
  input in_msb,
  input [9:0] in,
  output [13:0] out,
  output sign_out
);
  wire [9:0] psum;
  wire [9:0] complement;
  wire extension;
  wire [12:0] shift;
  wire [13:0] sum;
  wire sign_in_msb_b;
  wire sign_in_msb;
  wire sign_out_b;
  wire tie_to_low;
  nor2 nor_sign_out (.vdd(vdd), .gnd(gnd), .in_0(sign_weight), .in_1(sign_in), .out(sign_out_b));
  inverter inv_sign_out (.vdd(vdd), .gnd(gnd), .in(sign_out_b), .out(sign_out));
  nand2 nand_acc (.vdd(vdd), .gnd(gnd), .in_0(sign_in), .in_1(in_msb), .out(sign_in_msb_b));
  inverter inv_acc (.vdd(vdd), .gnd(gnd), .in(sign_in_msb_b), .out(sign_in_msb));
  dff_10bit dff_psum (.vdd(vdd), .gnd(gnd), .clk(clk_psum), .rst_b(rst_b), .in(in), .out(psum));
  inverse_mux_10bit inverse_mux (.vdd(vdd), .gnd(gnd), .sign(sign_in_msb), .in(psum), .out(complement));
  mux_2_1 mux (.vdd(vdd), .gnd(gnd), .s(sign_weight), .in_0(sign_in_msb), .in_1(complement[9]), .out(extension));
  tiel tie_low (.vdd(vdd), .gnd(gnd), .out(tie_to_low));
  adder_14bit_with_cin_for_acc adder (.vdd(vdd), .gnd(gnd), .c_in(sign_in_msb), .a_0_to_9(complement), .a_10(extension), .a_11(extension), .a_12(extension), .a_13(extension), .b_0(tie_to_low), .b_1_to_13(shift), .s(sum));
  dff_13bit dff_shift (.vdd(vdd), .gnd(gnd), .clk(clk_shift), .rst_b(rst_b), .in(sum[12:0]), .out(shift));
  dff_14bit dff_out (.vdd(vdd), .gnd(gnd), .clk(clk_out), .rst_b(rst_b), .in(sum), .out(out));
endmodule
// End of module definition.

// Module name: dcim_column_64x4x4
module dcim_column_64x4x4(
  inout vdd,
  inout gnd,
  input clk_psum, 
  input clk_shift, 
  input clk_out, 
  input rst_b, 
  input sign_weight, 
  input sign_in, 
  input in_msb, 
  input pe, 
  input ysw, 
  input ysr, 
  input spe, 
  input se, 
  input [63:0] wl, 
  input [63:0] in_b, 
  input [3:0] din,
  output [3:0] dout,
  output [13:0] column_psum,
  output sign_out
);
  wire [3:0] bitcell_out_0;
  wire [3:0] bitcell_out_1;
  wire [3:0] bitcell_out_2;
  wire [3:0] bitcell_out_3;
  wire [3:0] bitcell_out_4;
  wire [3:0] bitcell_out_5;
  wire [3:0] bitcell_out_6;
  wire [3:0] bitcell_out_7;
  wire [3:0] bitcell_out_8;
  wire [3:0] bitcell_out_9;
  wire [3:0] bitcell_out_10;
  wire [3:0] bitcell_out_11;
  wire [3:0] bitcell_out_12;
  wire [3:0] bitcell_out_13;
  wire [3:0] bitcell_out_14;
  wire [3:0] bitcell_out_15;
  wire [3:0] bitcell_out_16;
  wire [3:0] bitcell_out_17;
  wire [3:0] bitcell_out_18;
  wire [3:0] bitcell_out_19;
  wire [3:0] bitcell_out_20;
  wire [3:0] bitcell_out_21;
  wire [3:0] bitcell_out_22;
  wire [3:0] bitcell_out_23;
  wire [3:0] bitcell_out_24;
  wire [3:0] bitcell_out_25;
  wire [3:0] bitcell_out_26;
  wire [3:0] bitcell_out_27;
  wire [3:0] bitcell_out_28;
  wire [3:0] bitcell_out_29;
  wire [3:0] bitcell_out_30;
  wire [3:0] bitcell_out_31;
  wire [3:0] bitcell_out_32;
  wire [3:0] bitcell_out_33;
  wire [3:0] bitcell_out_34;
  wire [3:0] bitcell_out_35;
  wire [3:0] bitcell_out_36;
  wire [3:0] bitcell_out_37;
  wire [3:0] bitcell_out_38;
  wire [3:0] bitcell_out_39;
  wire [3:0] bitcell_out_40;
  wire [3:0] bitcell_out_41;
  wire [3:0] bitcell_out_42;
  wire [3:0] bitcell_out_43;
  wire [3:0] bitcell_out_44;
  wire [3:0] bitcell_out_45;
  wire [3:0] bitcell_out_46;
  wire [3:0] bitcell_out_47;
  wire [3:0] bitcell_out_48;
  wire [3:0] bitcell_out_49;
  wire [3:0] bitcell_out_50;
  wire [3:0] bitcell_out_51;
  wire [3:0] bitcell_out_52;
  wire [3:0] bitcell_out_53;
  wire [3:0] bitcell_out_54;
  wire [3:0] bitcell_out_55;
  wire [3:0] bitcell_out_56;
  wire [3:0] bitcell_out_57;
  wire [3:0] bitcell_out_58;
  wire [3:0] bitcell_out_59;
  wire [3:0] bitcell_out_60;
  wire [3:0] bitcell_out_61;
  wire [3:0] bitcell_out_62;
  wire [3:0] bitcell_out_63;
  wire [9:0] psum;
  sram_64x4_with_rw sram_with_rw (.vdd(vdd), .gnd(gnd), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din), .dout(dout), .bitcell_out_0(bitcell_out_0), .bitcell_out_1(bitcell_out_1), .bitcell_out_2(bitcell_out_2), .bitcell_out_3(bitcell_out_3), .bitcell_out_4(bitcell_out_4), .bitcell_out_5(bitcell_out_5), .bitcell_out_6(bitcell_out_6), .bitcell_out_7(bitcell_out_7), .bitcell_out_8(bitcell_out_8), .bitcell_out_9(bitcell_out_9), .bitcell_out_10(bitcell_out_10), .bitcell_out_11(bitcell_out_11), .bitcell_out_12(bitcell_out_12), .bitcell_out_13(bitcell_out_13), .bitcell_out_14(bitcell_out_14), .bitcell_out_15(bitcell_out_15), .bitcell_out_16(bitcell_out_16), .bitcell_out_17(bitcell_out_17), .bitcell_out_18(bitcell_out_18), .bitcell_out_19(bitcell_out_19), .bitcell_out_20(bitcell_out_20), .bitcell_out_21(bitcell_out_21), .bitcell_out_22(bitcell_out_22), .bitcell_out_23(bitcell_out_23), .bitcell_out_24(bitcell_out_24), .bitcell_out_25(bitcell_out_25), .bitcell_out_26(bitcell_out_26), .bitcell_out_27(bitcell_out_27), .bitcell_out_28(bitcell_out_28), .bitcell_out_29(bitcell_out_29), .bitcell_out_30(bitcell_out_30), .bitcell_out_31(bitcell_out_31), .bitcell_out_32(bitcell_out_32), .bitcell_out_33(bitcell_out_33), .bitcell_out_34(bitcell_out_34), .bitcell_out_35(bitcell_out_35), .bitcell_out_36(bitcell_out_36), .bitcell_out_37(bitcell_out_37), .bitcell_out_38(bitcell_out_38), .bitcell_out_39(bitcell_out_39), .bitcell_out_40(bitcell_out_40), .bitcell_out_41(bitcell_out_41), .bitcell_out_42(bitcell_out_42), .bitcell_out_43(bitcell_out_43), .bitcell_out_44(bitcell_out_44), .bitcell_out_45(bitcell_out_45), .bitcell_out_46(bitcell_out_46), .bitcell_out_47(bitcell_out_47), .bitcell_out_48(bitcell_out_48), .bitcell_out_49(bitcell_out_49), .bitcell_out_50(bitcell_out_50), .bitcell_out_51(bitcell_out_51), .bitcell_out_52(bitcell_out_52), .bitcell_out_53(bitcell_out_53), .bitcell_out_54(bitcell_out_54), .bitcell_out_55(bitcell_out_55), .bitcell_out_56(bitcell_out_56), .bitcell_out_57(bitcell_out_57), .bitcell_out_58(bitcell_out_58), .bitcell_out_59(bitcell_out_59), .bitcell_out_60(bitcell_out_60), .bitcell_out_61(bitcell_out_61), .bitcell_out_62(bitcell_out_62), .bitcell_out_63(bitcell_out_63));
  adder_tree_4bit_to_10bit adder_tree (.vdd(vdd), .gnd(gnd), .sign_weight(sign_weight), .in_0(bitcell_out_0), .in_1(bitcell_out_1), .in_2(bitcell_out_2), .in_3(bitcell_out_3), .in_4(bitcell_out_4), .in_5(bitcell_out_5), .in_6(bitcell_out_6), .in_7(bitcell_out_7), .in_8(bitcell_out_8), .in_9(bitcell_out_9), .in_10(bitcell_out_10), .in_11(bitcell_out_11), .in_12(bitcell_out_12), .in_13(bitcell_out_13), .in_14(bitcell_out_14), .in_15(bitcell_out_15), .in_16(bitcell_out_16), .in_17(bitcell_out_17), .in_18(bitcell_out_18), .in_19(bitcell_out_19), .in_20(bitcell_out_20), .in_21(bitcell_out_21), .in_22(bitcell_out_22), .in_23(bitcell_out_23), .in_24(bitcell_out_24), .in_25(bitcell_out_25), .in_26(bitcell_out_26), .in_27(bitcell_out_27), .in_28(bitcell_out_28), .in_29(bitcell_out_29), .in_30(bitcell_out_30), .in_31(bitcell_out_31), .in_32(bitcell_out_32), .in_33(bitcell_out_33), .in_34(bitcell_out_34), .in_35(bitcell_out_35), .in_36(bitcell_out_36), .in_37(bitcell_out_37), .in_38(bitcell_out_38), .in_39(bitcell_out_39), .in_40(bitcell_out_40), .in_41(bitcell_out_41), .in_42(bitcell_out_42), .in_43(bitcell_out_43), .in_44(bitcell_out_44), .in_45(bitcell_out_45), .in_46(bitcell_out_46), .in_47(bitcell_out_47), .in_48(bitcell_out_48), .in_49(bitcell_out_49), .in_50(bitcell_out_50), .in_51(bitcell_out_51), .in_52(bitcell_out_52), .in_53(bitcell_out_53), .in_54(bitcell_out_54), .in_55(bitcell_out_55), .in_56(bitcell_out_56), .in_57(bitcell_out_57), .in_58(bitcell_out_58), .in_59(bitcell_out_59), .in_60(bitcell_out_60), .in_61(bitcell_out_61), .in_62(bitcell_out_62), .in_63(bitcell_out_63), .out(psum));
  accumulator_10bit_to_14bit accumulator (.vdd(vdd), .gnd(gnd), .clk_psum(clk_psum), .clk_shift(clk_shift), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight), .sign_in(sign_in), .in_msb(in_msb), .in(psum), .out(column_psum), .sign_out(sign_out));
endmodule
// End of module definition.

// Module name: dcim_macro_64x64_for_4bitx4bit
module dcim_macro_64x64_for_4bitx4bit(
  inout vdd,
  inout gnd,
  input clk, 
  input rst, 
  input [1:0] r_w_cim, 
  input start, 
  input [15:0] sign_weight, 
  input sign_in, 
  input [5:0] wl_address, 
  input [63:0] in, 
  input [63:0] din, 
  output [63:0] dout, 
  output [15:0] sign_out, 
  output rd_data_enable, 
  output cim_data_enable, 
  output busy, 
  output [13:0] out_0,
  output [13:0] out_1,
  output [13:0] out_2,
  output [13:0] out_3,
  output [13:0] out_4,
  output [13:0] out_5,
  output [13:0] out_6,
  output [13:0] out_7,
  output [13:0] out_8,
  output [13:0] out_9,
  output [13:0] out_10,
  output [13:0] out_11,
  output [13:0] out_12,
  output [13:0] out_13,
  output [13:0] out_14,
  output [13:0] out_15
);
  wire clk_b; 
  wire wl_enable; 
  wire pe; 
  wire ysw; 
  wire ysr; 
  wire spe; 
  wire se; 
  wire rst_b; 
  wire in_msb; 
  wire clk_out; 
  wire [63:0] wl_address_decoded; 
  wire [63:0] wl; 
  wire [63:0] in_b; 
  wire sign_out_b; 
  control_for_4bit_input control (.vdd(vdd), .gnd(gnd), .clk(clk), .rst(rst), .r_w_cim(r_w_cim), .start(start), .wl_enable(wl_enable), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .rd_data_enable(rd_data_enable), .clk_b(clk_b), .rst_b(rst_b), .in_msb(in_msb), .clk_out(clk_out), .cim_data_enable(cim_data_enable), .busy(busy));
  decoder_6_to_64 decoder (.vdd(vdd), .gnd(gnd), .enable(wl_enable), .in(wl_address), .out(wl_address_decoded));
  driver_64x64 driver_for_wl (.vdd(vdd), .gnd(gnd), .in(wl_address_decoded), .out(wl));
  driver_b_64x64 driver_for_input (.vdd(vdd), .gnd(gnd), .in(in), .out(in_b));
  dcim_column_64x4x4 dcim_column_0 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[0]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[3:0]), .dout(dout[3:0]), .column_psum(out_0), .sign_out(sign_out[0]));
  dcim_column_64x4x4 dcim_column_1 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[1]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[7:4]), .dout(dout[7:4]), .column_psum(out_1), .sign_out(sign_out[1]));
  dcim_column_64x4x4 dcim_column_2 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[2]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[11:8]), .dout(dout[11:8]), .column_psum(out_2), .sign_out(sign_out[2]));
  dcim_column_64x4x4 dcim_column_3 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[3]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[15:12]), .dout(dout[15:12]), .column_psum(out_3), .sign_out(sign_out[3]));
  dcim_column_64x4x4 dcim_column_4 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[4]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[19:16]), .dout(dout[19:16]), .column_psum(out_4), .sign_out(sign_out[4]));
  dcim_column_64x4x4 dcim_column_5 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[5]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[23:20]), .dout(dout[23:20]), .column_psum(out_5), .sign_out(sign_out[5]));
  dcim_column_64x4x4 dcim_column_6 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[6]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[27:24]), .dout(dout[27:24]), .column_psum(out_6), .sign_out(sign_out[6]));
  dcim_column_64x4x4 dcim_column_7 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[7]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[31:28]), .dout(dout[31:28]), .column_psum(out_7), .sign_out(sign_out[7]));
  dcim_column_64x4x4 dcim_column_8 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[8]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[35:32]), .dout(dout[35:32]), .column_psum(out_8), .sign_out(sign_out[8]));
  dcim_column_64x4x4 dcim_column_9 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[9]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[39:36]), .dout(dout[39:36]), .column_psum(out_9), .sign_out(sign_out[9]));
  dcim_column_64x4x4 dcim_column_10 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[10]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[43:40]), .dout(dout[43:40]), .column_psum(out_10), .sign_out(sign_out[10]));
  dcim_column_64x4x4 dcim_column_11 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[11]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[47:44]), .dout(dout[47:44]), .column_psum(out_11), .sign_out(sign_out[11]));
  dcim_column_64x4x4 dcim_column_12 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[12]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[51:48]), .dout(dout[51:48]), .column_psum(out_12), .sign_out(sign_out[12]));
  dcim_column_64x4x4 dcim_column_13 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[13]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[55:52]), .dout(dout[55:52]), .column_psum(out_13), .sign_out(sign_out[13]));
  dcim_column_64x4x4 dcim_column_14 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[14]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[59:56]), .dout(dout[59:56]), .column_psum(out_14), .sign_out(sign_out[14]));
  dcim_column_64x4x4 dcim_column_15 (.vdd(vdd), .gnd(gnd), .clk_psum(clk), .clk_shift(clk_b), .clk_out(clk_out), .rst_b(rst_b), .sign_weight(sign_weight[15]), .sign_in(sign_in), .in_msb(in_msb), .pe(pe), .ysw(ysw), .ysr(ysr), .spe(spe), .se(se), .wl(wl), .in_b(in_b), .din(din[63:60]), .dout(dout[63:60]), .column_psum(out_15), .sign_out(sign_out[15]));
endmodule
// End of module definition.

