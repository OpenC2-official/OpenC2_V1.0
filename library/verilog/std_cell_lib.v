module inverter(
    input in,
    output out
); 
    assign out = ~in;
endmodule

module nand2(
    input in_0, in_1,
    output out
); 
    assign out = ~ (in_0 & in_1);
endmodule

module nor2(
    input in_0, in_1,
    output out
); 
    assign out = ~ (in_0 | in_1);
endmodule

module buffer(
    input in, 
    output out
);
    assign out = in;
endmodule

module xor2(    
    input in_0, in_1,
    output out
); 
    assign out = in_0 ^ in_1;
endmodule

module mux_2_1( 
    input s, in_0, in_1,
    output out
);
    assign out = s ? in_1 : in_0;
endmodule

module dcim_bitcell(
    input wl, in_b, 
    inout bl, bl_b, 
    output out
); 
endmodule

module sram_rw(
    inout bl, bl_b, 
    input pe, ysw, ysr, spe, se, din, 
    output dout
);  
endmodule

module half_adder(
    input a, b,
    output s, cout
);
    assign s = a ^ b;
    assign cout = a & b;
endmodule

module full_adder(
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module adder_sign_extension(
    input sign, a, b, cin, 
    output s
);
    assign s = (a & sign) ^ (b & sign) ^ cin;
endmodule

module dff(
    input clk, rst_b, in,
    output reg out
);
endmodule

module tiel(
    output out
);
    assign out = 1'b0;
endmodule

module tieh(
    output out
);
    assign out = 1'b1;
endmodule
