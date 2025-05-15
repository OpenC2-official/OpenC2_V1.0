module inverter(
    inout vdd, gnd, 
    input in,
    output out
); 
    assign out = ~in;
endmodule

module nand2(
    inout vdd, gnd, 
    input in_0, in_1,
    output out
); 
    assign out = ~ (in_0 & in_1);
endmodule

module nor2(
    inout vdd, gnd, 
    input in_0, in_1,
    output out
); 
    assign out = ~ (in_0 | in_1);
endmodule

module buffer(
    inout vdd, gnd,     
    input in, 
    output out
);
    assign out = in;
endmodule

module xor2(
    inout vdd, gnd,     
    input in_0, in_1,
    output out
); 
    assign out = in_0 ^ in_1;
endmodule

module mux_2_1(   
    inout vdd, gnd, 
    input s, in_0, in_1,
    output out
);
    assign out = s ? in_1 : in_0;
endmodule

module dcim_bitcell(
    inout vdd, gnd, 
    input wl, in_b, 
    inout bl, bl_b, 
    output out
); 
endmodule

module sram_rw(
    inout vdd, gnd, 
    inout bl, bl_b, 
    input pe, ysw, ysr, spe, se, din, 
    output dout
);  
endmodule

module half_adder(
    inout vdd, gnd, 
    input a, b,
    output s, cout
);
    assign s = a ^ b;
    assign cout = a & b;
endmodule

module full_adder(
    inout vdd, gnd, 
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module adder_sign_extension(
    inout vdd, gnd, 
    input sign, a, b, cin, 
    output s
);
    assign s = (a & sign) ^ (b & sign) ^ cin;
endmodule

module dff(
    inout vdd, gnd, 
    input clk, rst_b, in,
    output reg out
);
  always @(posedge clk or negedge rst_b) begin
    if (~rst_b) begin
        out <= 1'b0;  // 复位
    end else begin
        out <= in;  // 数据输入
    end
  end
endmodule

module tiel(
    inout vdd, gnd,    
    output out
);
    assign out = 1'b0;
endmodule

module tieh(
    inout vdd, gnd,  
    output out
);
    assign out = 1'b1;
endmodule
