
module accumulator_10bit_to_14bit(clk_psum, clk_shift, clk_out, rst_b, sign_weight, sign_in, in_msb, \in<0> , \in<1> , \in<2> , \in<3> , \in<4> , \in<5> , \in<6> , \in<7> , \in<8> , \in<9> , \out<0> , \out<1> , \out<2> , \out<3> , \out<4> , \out<5> , \out<6> , \out<7> , \out<8> , \out<9> , \out<10> , \out<11> , \out<12> , \out<13> , sign_out);
  wire \adder.a_0_to_9<0> ;
  wire \adder.a_0_to_9<1> ;
  wire \adder.a_0_to_9<2> ;
  wire \adder.a_0_to_9<3> ;
  wire \adder.a_0_to_9<4> ;
  wire \adder.a_0_to_9<5> ;
  wire \adder.a_0_to_9<6> ;
  wire \adder.a_0_to_9<7> ;
  wire \adder.a_0_to_9<8> ;
  wire \adder.a_0_to_9<9> ;
  wire \adder.a_10 ;
  wire \adder.a_11 ;
  wire \adder.a_12 ;
  wire \adder.a_13 ;
  wire \adder.b_0 ;
  wire \adder.b_1_to_13<0> ;
  wire \adder.b_1_to_13<10> ;
  wire \adder.b_1_to_13<11> ;
  wire \adder.b_1_to_13<12> ;
  wire \adder.b_1_to_13<1> ;
  wire \adder.b_1_to_13<2> ;
  wire \adder.b_1_to_13<3> ;
  wire \adder.b_1_to_13<4> ;
  wire \adder.b_1_to_13<5> ;
  wire \adder.b_1_to_13<6> ;
  wire \adder.b_1_to_13<7> ;
  wire \adder.b_1_to_13<8> ;
  wire \adder.b_1_to_13<9> ;
  wire \adder.c<0> ;
  wire \adder.c<10> ;
  wire \adder.c<11> ;
  wire \adder.c<12> ;
  wire \adder.c<13> ;
  wire \adder.c<1> ;
  wire \adder.c<2> ;
  wire \adder.c<3> ;
  wire \adder.c<4> ;
  wire \adder.c<5> ;
  wire \adder.c<6> ;
  wire \adder.c<7> ;
  wire \adder.c<8> ;
  wire \adder.c<9> ;
  wire \adder.c_in ;
  wire \adder.s<0> ;
  wire \adder.s<10> ;
  wire \adder.s<11> ;
  wire \adder.s<12> ;
  wire \adder.s<13> ;
  wire \adder.s<1> ;
  wire \adder.s<2> ;
  wire \adder.s<3> ;
  wire \adder.s<4> ;
  wire \adder.s<5> ;
  wire \adder.s<6> ;
  wire \adder.s<7> ;
  wire \adder.s<8> ;
  wire \adder.s<9> ;
  input clk_out;
  input clk_psum;
  input clk_shift;
  wire \complement<0> ;
  wire \complement<1> ;
  wire \complement<2> ;
  wire \complement<3> ;
  wire \complement<4> ;
  wire \complement<5> ;
  wire \complement<6> ;
  wire \complement<7> ;
  wire \complement<8> ;
  wire \complement<9> ;
  wire \dff_out.clk ;
  wire \dff_out.in<0> ;
  wire \dff_out.in<10> ;
  wire \dff_out.in<11> ;
  wire \dff_out.in<12> ;
  wire \dff_out.in<13> ;
  wire \dff_out.in<1> ;
  wire \dff_out.in<2> ;
  wire \dff_out.in<3> ;
  wire \dff_out.in<4> ;
  wire \dff_out.in<5> ;
  wire \dff_out.in<6> ;
  wire \dff_out.in<7> ;
  wire \dff_out.in<8> ;
  wire \dff_out.in<9> ;
  wire \dff_out.out<0> ;
  wire \dff_out.out<10> ;
  wire \dff_out.out<11> ;
  wire \dff_out.out<12> ;
  wire \dff_out.out<13> ;
  wire \dff_out.out<1> ;
  wire \dff_out.out<2> ;
  wire \dff_out.out<3> ;
  wire \dff_out.out<4> ;
  wire \dff_out.out<5> ;
  wire \dff_out.out<6> ;
  wire \dff_out.out<7> ;
  wire \dff_out.out<8> ;
  wire \dff_out.out<9> ;
  wire \dff_out.rst_b ;
  wire \dff_psum.clk ;
  wire \dff_psum.in<0> ;
  wire \dff_psum.in<1> ;
  wire \dff_psum.in<2> ;
  wire \dff_psum.in<3> ;
  wire \dff_psum.in<4> ;
  wire \dff_psum.in<5> ;
  wire \dff_psum.in<6> ;
  wire \dff_psum.in<7> ;
  wire \dff_psum.in<8> ;
  wire \dff_psum.in<9> ;
  wire \dff_psum.out<0> ;
  wire \dff_psum.out<1> ;
  wire \dff_psum.out<2> ;
  wire \dff_psum.out<3> ;
  wire \dff_psum.out<4> ;
  wire \dff_psum.out<5> ;
  wire \dff_psum.out<6> ;
  wire \dff_psum.out<7> ;
  wire \dff_psum.out<8> ;
  wire \dff_psum.out<9> ;
  wire \dff_psum.rst_b ;
  wire \dff_shift.clk ;
  wire \dff_shift.in<0> ;
  wire \dff_shift.in<10> ;
  wire \dff_shift.in<11> ;
  wire \dff_shift.in<12> ;
  wire \dff_shift.in<1> ;
  wire \dff_shift.in<2> ;
  wire \dff_shift.in<3> ;
  wire \dff_shift.in<4> ;
  wire \dff_shift.in<5> ;
  wire \dff_shift.in<6> ;
  wire \dff_shift.in<7> ;
  wire \dff_shift.in<8> ;
  wire \dff_shift.in<9> ;
  wire \dff_shift.out<0> ;
  wire \dff_shift.out<10> ;
  wire \dff_shift.out<11> ;
  wire \dff_shift.out<12> ;
  wire \dff_shift.out<1> ;
  wire \dff_shift.out<2> ;
  wire \dff_shift.out<3> ;
  wire \dff_shift.out<4> ;
  wire \dff_shift.out<5> ;
  wire \dff_shift.out<6> ;
  wire \dff_shift.out<7> ;
  wire \dff_shift.out<8> ;
  wire \dff_shift.out<9> ;
  wire \dff_shift.rst_b ;
  wire extension;
  input \in<0> ;
  input \in<1> ;
  input \in<2> ;
  input \in<3> ;
  input \in<4> ;
  input \in<5> ;
  input \in<6> ;
  input \in<7> ;
  input \in<8> ;
  input \in<9> ;
  input in_msb;
  wire \inverse_mux.in<0> ;
  wire \inverse_mux.in<1> ;
  wire \inverse_mux.in<2> ;
  wire \inverse_mux.in<3> ;
  wire \inverse_mux.in<4> ;
  wire \inverse_mux.in<5> ;
  wire \inverse_mux.in<6> ;
  wire \inverse_mux.in<7> ;
  wire \inverse_mux.in<8> ;
  wire \inverse_mux.in<9> ;
  wire \inverse_mux.in_0<0> ;
  wire \inverse_mux.in_0<1> ;
  wire \inverse_mux.in_0<2> ;
  wire \inverse_mux.in_0<3> ;
  wire \inverse_mux.in_0<4> ;
  wire \inverse_mux.in_0<5> ;
  wire \inverse_mux.in_0<6> ;
  wire \inverse_mux.in_0<7> ;
  wire \inverse_mux.in_0<8> ;
  wire \inverse_mux.in_0<9> ;
  wire \inverse_mux.in_1<0> ;
  wire \inverse_mux.in_1<1> ;
  wire \inverse_mux.in_1<2> ;
  wire \inverse_mux.in_1<3> ;
  wire \inverse_mux.in_1<4> ;
  wire \inverse_mux.in_1<5> ;
  wire \inverse_mux.in_1<6> ;
  wire \inverse_mux.in_1<7> ;
  wire \inverse_mux.in_1<8> ;
  wire \inverse_mux.in_1<9> ;
  wire \inverse_mux.in_b<0> ;
  wire \inverse_mux.in_b<1> ;
  wire \inverse_mux.in_b<2> ;
  wire \inverse_mux.in_b<3> ;
  wire \inverse_mux.in_b<4> ;
  wire \inverse_mux.in_b<5> ;
  wire \inverse_mux.in_b<6> ;
  wire \inverse_mux.in_b<7> ;
  wire \inverse_mux.in_b<8> ;
  wire \inverse_mux.in_b<9> ;
  wire \inverse_mux.out<0> ;
  wire \inverse_mux.out<1> ;
  wire \inverse_mux.out<2> ;
  wire \inverse_mux.out<3> ;
  wire \inverse_mux.out<4> ;
  wire \inverse_mux.out<5> ;
  wire \inverse_mux.out<6> ;
  wire \inverse_mux.out<7> ;
  wire \inverse_mux.out<8> ;
  wire \inverse_mux.out<9> ;
  wire \inverse_mux.sign ;
  wire \inverse_mux.sign_b ;
  output \out<0> ;
  output \out<10> ;
  output \out<11> ;
  output \out<12> ;
  output \out<13> ;
  output \out<1> ;
  output \out<2> ;
  output \out<3> ;
  output \out<4> ;
  output \out<5> ;
  output \out<6> ;
  output \out<7> ;
  output \out<8> ;
  output \out<9> ;
  wire \psum<0> ;
  wire \psum<1> ;
  wire \psum<2> ;
  wire \psum<3> ;
  wire \psum<4> ;
  wire \psum<5> ;
  wire \psum<6> ;
  wire \psum<7> ;
  wire \psum<8> ;
  wire \psum<9> ;
  input rst_b;
  wire \shift<0> ;
  wire \shift<10> ;
  wire \shift<11> ;
  wire \shift<12> ;
  wire \shift<1> ;
  wire \shift<2> ;
  wire \shift<3> ;
  wire \shift<4> ;
  wire \shift<5> ;
  wire \shift<6> ;
  wire \shift<7> ;
  wire \shift<8> ;
  wire \shift<9> ;
  input sign_in;
  wire sign_in_msb;
  wire sign_in_msb_b;
  output sign_out;
  wire sign_out_b;
  input sign_weight;
  wire \sum<0> ;
  wire \sum<10> ;
  wire \sum<11> ;
  wire \sum<12> ;
  wire \sum<13> ;
  wire \sum<1> ;
  wire \sum<2> ;
  wire \sum<3> ;
  wire \sum<4> ;
  wire \sum<5> ;
  wire \sum<6> ;
  wire \sum<7> ;
  wire \sum<8> ;
  wire \sum<9> ;
  wire tie_to_low;
  full_adder \adder.fa_0  (    .a(\adder.a_0_to_9<0> ),    .b(\adder.b_0 ),    .cin(\adder.c_in ),    .cout(\adder.c<0> ),    .s(\adder.s<0> )
  );
  full_adder \adder.fa_1  (    .a(\adder.a_0_to_9<1> ),    .b(\adder.b_1_to_13<0> ),    .cin(\adder.c<0> ),    .cout(\adder.c<1> ),    .s(\adder.s<1> )
  );
  full_adder \adder.fa_10  (    .a(\adder.a_10 ),    .b(\adder.b_1_to_13<9> ),    .cin(\adder.c<9> ),    .cout(\adder.c<10> ),    .s(\adder.s<10> )
  );
  full_adder \adder.fa_11  (    .a(\adder.a_10 ),    .b(\adder.b_1_to_13<10> ),    .cin(\adder.c<10> ),    .cout(\adder.c<11> ),    .s(\adder.s<11> )
  );
  full_adder \adder.fa_12  (    .a(\adder.a_10 ),    .b(\adder.b_1_to_13<11> ),    .cin(\adder.c<11> ),    .cout(\adder.c<12> ),    .s(\adder.s<12> )
  );
  full_adder \adder.fa_13  (    .a(\adder.a_10 ),    .b(\adder.b_1_to_13<12> ),    .cin(\adder.c<12> ),    .cout(\adder.c<13> ),    .s(\adder.s<13> )
  );
  full_adder \adder.fa_2  (    .a(\adder.a_0_to_9<2> ),    .b(\adder.b_1_to_13<1> ),    .cin(\adder.c<1> ),    .cout(\adder.c<2> ),    .s(\adder.s<2> )
  );
  full_adder \adder.fa_3  (    .a(\adder.a_0_to_9<3> ),    .b(\adder.b_1_to_13<2> ),    .cin(\adder.c<2> ),    .cout(\adder.c<3> ),    .s(\adder.s<3> )
  );
  full_adder \adder.fa_4  (    .a(\adder.a_0_to_9<4> ),    .b(\adder.b_1_to_13<3> ),    .cin(\adder.c<3> ),    .cout(\adder.c<4> ),    .s(\adder.s<4> )
  );
  full_adder \adder.fa_5  (    .a(\adder.a_0_to_9<5> ),    .b(\adder.b_1_to_13<4> ),    .cin(\adder.c<4> ),    .cout(\adder.c<5> ),    .s(\adder.s<5> )
  );
  full_adder \adder.fa_6  (    .a(\adder.a_0_to_9<6> ),    .b(\adder.b_1_to_13<5> ),    .cin(\adder.c<5> ),    .cout(\adder.c<6> ),    .s(\adder.s<6> )
  );
  full_adder \adder.fa_7  (    .a(\adder.a_0_to_9<7> ),    .b(\adder.b_1_to_13<6> ),    .cin(\adder.c<6> ),    .cout(\adder.c<7> ),    .s(\adder.s<7> )
  );
  full_adder \adder.fa_8  (    .a(\adder.a_0_to_9<8> ),    .b(\adder.b_1_to_13<7> ),    .cin(\adder.c<7> ),    .cout(\adder.c<8> ),    .s(\adder.s<8> )
  );
  full_adder \adder.fa_9  (    .a(\adder.a_0_to_9<9> ),    .b(\adder.b_1_to_13<8> ),    .cin(\adder.c<8> ),    .cout(\adder.c<9> ),    .s(\adder.s<9> )
  );
  dff \dff_out.dff_0  (    .clk(clk_out),    .in(\adder.s<0> ),    .out(\dff_out.out<0> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_1  (    .clk(clk_out),    .in(\adder.s<1> ),    .out(\dff_out.out<1> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_10  (    .clk(clk_out),    .in(\adder.s<10> ),    .out(\dff_out.out<10> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_11  (    .clk(clk_out),    .in(\adder.s<11> ),    .out(\dff_out.out<11> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_12  (    .clk(clk_out),    .in(\adder.s<12> ),    .out(\dff_out.out<12> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_13  (    .clk(clk_out),    .in(\adder.s<13> ),    .out(\dff_out.out<13> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_2  (    .clk(clk_out),    .in(\adder.s<2> ),    .out(\dff_out.out<2> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_3  (    .clk(clk_out),    .in(\adder.s<3> ),    .out(\dff_out.out<3> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_4  (    .clk(clk_out),    .in(\adder.s<4> ),    .out(\dff_out.out<4> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_5  (    .clk(clk_out),    .in(\adder.s<5> ),    .out(\dff_out.out<5> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_6  (    .clk(clk_out),    .in(\adder.s<6> ),    .out(\dff_out.out<6> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_7  (    .clk(clk_out),    .in(\adder.s<7> ),    .out(\dff_out.out<7> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_8  (    .clk(clk_out),    .in(\adder.s<8> ),    .out(\dff_out.out<8> ),    .rst_b(rst_b)
  );
  dff \dff_out.dff_9  (    .clk(clk_out),    .in(\adder.s<9> ),    .out(\dff_out.out<9> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_0  (    .clk(clk_psum),    .in(\in<0> ),    .out(\dff_psum.out<0> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_1  (    .clk(clk_psum),    .in(\in<1> ),    .out(\dff_psum.out<1> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_2  (    .clk(clk_psum),    .in(\in<2> ),    .out(\dff_psum.out<2> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_3  (    .clk(clk_psum),    .in(\in<3> ),    .out(\dff_psum.out<3> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_4  (    .clk(clk_psum),    .in(\in<4> ),    .out(\dff_psum.out<4> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_5  (    .clk(clk_psum),    .in(\in<5> ),    .out(\dff_psum.out<5> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_6  (    .clk(clk_psum),    .in(\in<6> ),    .out(\dff_psum.out<6> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_7  (    .clk(clk_psum),    .in(\in<7> ),    .out(\dff_psum.out<7> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_8  (    .clk(clk_psum),    .in(\in<8> ),    .out(\dff_psum.out<8> ),    .rst_b(rst_b)
  );
  dff \dff_psum.dff_9  (    .clk(clk_psum),    .in(\in<9> ),    .out(\dff_psum.out<9> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_0  (    .clk(clk_shift),    .in(\adder.s<0> ),    .out(\adder.b_1_to_13<0> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_1  (    .clk(clk_shift),    .in(\adder.s<1> ),    .out(\adder.b_1_to_13<1> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_10  (    .clk(clk_shift),    .in(\adder.s<10> ),    .out(\adder.b_1_to_13<10> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_11  (    .clk(clk_shift),    .in(\adder.s<11> ),    .out(\adder.b_1_to_13<11> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_12  (    .clk(clk_shift),    .in(\adder.s<12> ),    .out(\adder.b_1_to_13<12> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_2  (    .clk(clk_shift),    .in(\adder.s<2> ),    .out(\adder.b_1_to_13<2> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_3  (    .clk(clk_shift),    .in(\adder.s<3> ),    .out(\adder.b_1_to_13<3> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_4  (    .clk(clk_shift),    .in(\adder.s<4> ),    .out(\adder.b_1_to_13<4> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_5  (    .clk(clk_shift),    .in(\adder.s<5> ),    .out(\adder.b_1_to_13<5> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_6  (    .clk(clk_shift),    .in(\adder.s<6> ),    .out(\adder.b_1_to_13<6> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_7  (    .clk(clk_shift),    .in(\adder.s<7> ),    .out(\adder.b_1_to_13<7> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_8  (    .clk(clk_shift),    .in(\adder.s<8> ),    .out(\adder.b_1_to_13<8> ),    .rst_b(rst_b)
  );
  dff \dff_shift.dff_9  (    .clk(clk_shift),    .in(\adder.s<9> ),    .out(\adder.b_1_to_13<9> ),    .rst_b(rst_b)
  );
  inverter inv_acc (    .in(sign_in_msb_b),    .out(\adder.c_in )
  );
  inverter inv_sign_out (    .in(sign_out_b),    .out(sign_out)
  );
  nand2 \inverse_mux.in_0_0  (    .in_0(\dff_psum.out<0> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<0> )
  );
  nand2 \inverse_mux.in_0_1  (    .in_0(\dff_psum.out<1> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<1> )
  );
  nand2 \inverse_mux.in_0_2  (    .in_0(\dff_psum.out<2> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<2> )
  );
  nand2 \inverse_mux.in_0_3  (    .in_0(\dff_psum.out<3> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<3> )
  );
  nand2 \inverse_mux.in_0_4  (    .in_0(\dff_psum.out<4> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<4> )
  );
  nand2 \inverse_mux.in_0_5  (    .in_0(\dff_psum.out<5> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<5> )
  );
  nand2 \inverse_mux.in_0_6  (    .in_0(\dff_psum.out<6> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<6> )
  );
  nand2 \inverse_mux.in_0_7  (    .in_0(\dff_psum.out<7> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<7> )
  );
  nand2 \inverse_mux.in_0_8  (    .in_0(\dff_psum.out<8> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<8> )
  );
  nand2 \inverse_mux.in_0_9  (    .in_0(\dff_psum.out<9> ),    .in_1(\inverse_mux.sign_b ),    .out(\inverse_mux.in_0<9> )
  );
  nand2 \inverse_mux.in_1_0  (    .in_0(\inverse_mux.in_b<0> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<0> )
  );
  nand2 \inverse_mux.in_1_1  (    .in_0(\inverse_mux.in_b<1> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<1> )
  );
  nand2 \inverse_mux.in_1_2  (    .in_0(\inverse_mux.in_b<2> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<2> )
  );
  nand2 \inverse_mux.in_1_3  (    .in_0(\inverse_mux.in_b<3> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<3> )
  );
  nand2 \inverse_mux.in_1_4  (    .in_0(\inverse_mux.in_b<4> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<4> )
  );
  nand2 \inverse_mux.in_1_5  (    .in_0(\inverse_mux.in_b<5> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<5> )
  );
  nand2 \inverse_mux.in_1_6  (    .in_0(\inverse_mux.in_b<6> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<6> )
  );
  nand2 \inverse_mux.in_1_7  (    .in_0(\inverse_mux.in_b<7> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<7> )
  );
  nand2 \inverse_mux.in_1_8  (    .in_0(\inverse_mux.in_b<8> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<8> )
  );
  nand2 \inverse_mux.in_1_9  (    .in_0(\inverse_mux.in_b<9> ),    .in_1(\adder.c_in ),    .out(\inverse_mux.in_1<9> )
  );
  inverter \inverse_mux.inv_in_0  (    .in(\dff_psum.out<0> ),    .out(\inverse_mux.in_b<0> )
  );
  inverter \inverse_mux.inv_in_1  (    .in(\dff_psum.out<1> ),    .out(\inverse_mux.in_b<1> )
  );
  inverter \inverse_mux.inv_in_2  (    .in(\dff_psum.out<2> ),    .out(\inverse_mux.in_b<2> )
  );
  inverter \inverse_mux.inv_in_3  (    .in(\dff_psum.out<3> ),    .out(\inverse_mux.in_b<3> )
  );
  inverter \inverse_mux.inv_in_4  (    .in(\dff_psum.out<4> ),    .out(\inverse_mux.in_b<4> )
  );
  inverter \inverse_mux.inv_in_5  (    .in(\dff_psum.out<5> ),    .out(\inverse_mux.in_b<5> )
  );
  inverter \inverse_mux.inv_in_6  (    .in(\dff_psum.out<6> ),    .out(\inverse_mux.in_b<6> )
  );
  inverter \inverse_mux.inv_in_7  (    .in(\dff_psum.out<7> ),    .out(\inverse_mux.in_b<7> )
  );
  inverter \inverse_mux.inv_in_8  (    .in(\dff_psum.out<8> ),    .out(\inverse_mux.in_b<8> )
  );
  inverter \inverse_mux.inv_in_9  (    .in(\dff_psum.out<9> ),    .out(\inverse_mux.in_b<9> )
  );
  inverter \inverse_mux.inv_sign  (    .in(\adder.c_in ),    .out(\inverse_mux.sign_b )
  );
  nand2 \inverse_mux.out_0  (    .in_0(\inverse_mux.in_0<0> ),    .in_1(\inverse_mux.in_1<0> ),    .out(\adder.a_0_to_9<0> )
  );
  nand2 \inverse_mux.out_1  (    .in_0(\inverse_mux.in_0<1> ),    .in_1(\inverse_mux.in_1<1> ),    .out(\adder.a_0_to_9<1> )
  );
  nand2 \inverse_mux.out_2  (    .in_0(\inverse_mux.in_0<2> ),    .in_1(\inverse_mux.in_1<2> ),    .out(\adder.a_0_to_9<2> )
  );
  nand2 \inverse_mux.out_3  (    .in_0(\inverse_mux.in_0<3> ),    .in_1(\inverse_mux.in_1<3> ),    .out(\adder.a_0_to_9<3> )
  );
  nand2 \inverse_mux.out_4  (    .in_0(\inverse_mux.in_0<4> ),    .in_1(\inverse_mux.in_1<4> ),    .out(\adder.a_0_to_9<4> )
  );
  nand2 \inverse_mux.out_5  (    .in_0(\inverse_mux.in_0<5> ),    .in_1(\inverse_mux.in_1<5> ),    .out(\adder.a_0_to_9<5> )
  );
  nand2 \inverse_mux.out_6  (    .in_0(\inverse_mux.in_0<6> ),    .in_1(\inverse_mux.in_1<6> ),    .out(\adder.a_0_to_9<6> )
  );
  nand2 \inverse_mux.out_7  (    .in_0(\inverse_mux.in_0<7> ),    .in_1(\inverse_mux.in_1<7> ),    .out(\adder.a_0_to_9<7> )
  );
  nand2 \inverse_mux.out_8  (    .in_0(\inverse_mux.in_0<8> ),    .in_1(\inverse_mux.in_1<8> ),    .out(\adder.a_0_to_9<8> )
  );
  nand2 \inverse_mux.out_9  (    .in_0(\inverse_mux.in_0<9> ),    .in_1(\inverse_mux.in_1<9> ),    .out(\adder.a_0_to_9<9> )
  );
  mux_2_1 mux (    .in_0(\adder.c_in ),    .in_1(\adder.a_0_to_9<9> ),    .out(\adder.a_10 ),    .s(sign_weight)
  );
  nand2 nand_acc (    .in_0(sign_in),    .in_1(in_msb),    .out(sign_in_msb_b)
  );
  nor2 nor_sign_out (    .in_0(sign_weight),    .in_1(sign_in),    .out(sign_out_b)
  );
  tiel tie_low (    .out(\adder.b_0 )
  );
  assign \sum<13>  = \adder.s<13> ;
  assign \sum<12>  = \adder.s<12> ;
  assign \sum<11>  = \adder.s<11> ;
  assign \sum<10>  = \adder.s<10> ;
  assign \sum<9>  = \adder.s<9> ;
  assign \sum<8>  = \adder.s<8> ;
  assign \sum<7>  = \adder.s<7> ;
  assign \sum<6>  = \adder.s<6> ;
  assign \sum<5>  = \adder.s<5> ;
  assign \sum<4>  = \adder.s<4> ;
  assign \sum<3>  = \adder.s<3> ;
  assign \sum<2>  = \adder.s<2> ;
  assign \sum<1>  = \adder.s<1> ;
  assign \sum<0>  = \adder.s<0> ;
  assign \shift<12>  = \adder.b_1_to_13<12> ;
  assign \shift<11>  = \adder.b_1_to_13<11> ;
  assign \shift<10>  = \adder.b_1_to_13<10> ;
  assign \shift<9>  = \adder.b_1_to_13<9> ;
  assign \shift<8>  = \adder.b_1_to_13<8> ;
  assign \shift<7>  = \adder.b_1_to_13<7> ;
  assign \shift<6>  = \adder.b_1_to_13<6> ;
  assign \shift<5>  = \adder.b_1_to_13<5> ;
  assign \shift<4>  = \adder.b_1_to_13<4> ;
  assign \shift<3>  = \adder.b_1_to_13<3> ;
  assign \shift<2>  = \adder.b_1_to_13<2> ;
  assign \shift<1>  = \adder.b_1_to_13<1> ;
  assign \shift<0>  = \adder.b_1_to_13<0> ;
  assign \out<13>  = \dff_out.out<13> ;
  assign \out<12>  = \dff_out.out<12> ;
  assign \out<11>  = \dff_out.out<11> ;
  assign \out<10>  = \dff_out.out<10> ;
  assign \out<9>  = \dff_out.out<9> ;
  assign \out<8>  = \dff_out.out<8> ;
  assign \out<7>  = \dff_out.out<7> ;
  assign \out<6>  = \dff_out.out<6> ;
  assign \out<5>  = \dff_out.out<5> ;
  assign \out<4>  = \dff_out.out<4> ;
  assign \out<3>  = \dff_out.out<3> ;
  assign \out<2>  = \dff_out.out<2> ;
  assign \out<1>  = \dff_out.out<1> ;
  assign \out<0>  = \dff_out.out<0> ;
  assign \complement<9>  = \adder.a_0_to_9<9> ;
  assign \complement<8>  = \adder.a_0_to_9<8> ;
  assign \complement<7>  = \adder.a_0_to_9<7> ;
  assign \complement<6>  = \adder.a_0_to_9<6> ;
  assign \complement<5>  = \adder.a_0_to_9<5> ;
  assign \complement<4>  = \adder.a_0_to_9<4> ;
  assign \complement<3>  = \adder.a_0_to_9<3> ;
  assign \complement<2>  = \adder.a_0_to_9<2> ;
  assign \complement<1>  = \adder.a_0_to_9<1> ;
  assign \complement<0>  = \adder.a_0_to_9<0> ;
  assign \psum<9>  = \dff_psum.out<9> ;
  assign \psum<8>  = \dff_psum.out<8> ;
  assign \psum<7>  = \dff_psum.out<7> ;
  assign \psum<6>  = \dff_psum.out<6> ;
  assign \psum<5>  = \dff_psum.out<5> ;
  assign \psum<4>  = \dff_psum.out<4> ;
  assign \psum<3>  = \dff_psum.out<3> ;
  assign \psum<2>  = \dff_psum.out<2> ;
  assign \psum<1>  = \dff_psum.out<1> ;
  assign \psum<0>  = \dff_psum.out<0> ;
  assign \dff_shift.in<12>  = \adder.s<12> ;
  assign \dff_shift.in<11>  = \adder.s<11> ;
  assign \dff_shift.in<10>  = \adder.s<10> ;
  assign \dff_shift.in<9>  = \adder.s<9> ;
  assign \dff_shift.in<8>  = \adder.s<8> ;
  assign \dff_shift.in<7>  = \adder.s<7> ;
  assign \dff_shift.in<6>  = \adder.s<6> ;
  assign \dff_shift.in<5>  = \adder.s<5> ;
  assign \dff_shift.in<4>  = \adder.s<4> ;
  assign \dff_shift.in<3>  = \adder.s<3> ;
  assign \dff_shift.in<2>  = \adder.s<2> ;
  assign \dff_shift.in<1>  = \adder.s<1> ;
  assign \dff_shift.in<0>  = \adder.s<0> ;
  assign \dff_shift.out<12>  = \adder.b_1_to_13<12> ;
  assign \dff_shift.out<11>  = \adder.b_1_to_13<11> ;
  assign \dff_shift.out<10>  = \adder.b_1_to_13<10> ;
  assign \dff_shift.out<9>  = \adder.b_1_to_13<9> ;
  assign \dff_shift.out<8>  = \adder.b_1_to_13<8> ;
  assign \dff_shift.out<7>  = \adder.b_1_to_13<7> ;
  assign \dff_shift.out<6>  = \adder.b_1_to_13<6> ;
  assign \dff_shift.out<5>  = \adder.b_1_to_13<5> ;
  assign \dff_shift.out<4>  = \adder.b_1_to_13<4> ;
  assign \dff_shift.out<3>  = \adder.b_1_to_13<3> ;
  assign \dff_shift.out<2>  = \adder.b_1_to_13<2> ;
  assign \dff_shift.out<1>  = \adder.b_1_to_13<1> ;
  assign \dff_shift.out<0>  = \adder.b_1_to_13<0> ;
  assign \inverse_mux.out<9>  = \adder.a_0_to_9<9> ;
  assign \inverse_mux.out<8>  = \adder.a_0_to_9<8> ;
  assign \inverse_mux.out<7>  = \adder.a_0_to_9<7> ;
  assign \inverse_mux.out<6>  = \adder.a_0_to_9<6> ;
  assign \inverse_mux.out<5>  = \adder.a_0_to_9<5> ;
  assign \inverse_mux.out<4>  = \adder.a_0_to_9<4> ;
  assign \inverse_mux.out<3>  = \adder.a_0_to_9<3> ;
  assign \inverse_mux.out<2>  = \adder.a_0_to_9<2> ;
  assign \inverse_mux.out<1>  = \adder.a_0_to_9<1> ;
  assign \inverse_mux.out<0>  = \adder.a_0_to_9<0> ;
  assign \inverse_mux.in<9>  = \dff_psum.out<9> ;
  assign \inverse_mux.in<8>  = \dff_psum.out<8> ;
  assign \inverse_mux.in<7>  = \dff_psum.out<7> ;
  assign \inverse_mux.in<6>  = \dff_psum.out<6> ;
  assign \inverse_mux.in<5>  = \dff_psum.out<5> ;
  assign \inverse_mux.in<4>  = \dff_psum.out<4> ;
  assign \inverse_mux.in<3>  = \dff_psum.out<3> ;
  assign \inverse_mux.in<2>  = \dff_psum.out<2> ;
  assign \inverse_mux.in<1>  = \dff_psum.out<1> ;
  assign \inverse_mux.in<0>  = \dff_psum.out<0> ;
  assign \dff_psum.in<9>  = \in<9> ;
  assign \dff_psum.in<8>  = \in<8> ;
  assign \dff_psum.in<7>  = \in<7> ;
  assign \dff_psum.in<6>  = \in<6> ;
  assign \dff_psum.in<5>  = \in<5> ;
  assign \dff_psum.in<4>  = \in<4> ;
  assign \dff_psum.in<3>  = \in<3> ;
  assign \dff_psum.in<2>  = \in<2> ;
  assign \dff_psum.in<1>  = \in<1> ;
  assign \dff_psum.in<0>  = \in<0> ;
  assign \dff_out.clk  = clk_out;
  assign \dff_out.rst_b  = rst_b;
  assign \dff_out.in<13>  = \adder.s<13> ;
  assign \dff_out.in<9>  = \adder.s<9> ;
  assign \adder.a_11  = \adder.a_10 ;
  assign \adder.a_12  = \adder.a_10 ;
  assign \adder.a_13  = \adder.a_10 ;
  assign \dff_out.in<11>  = \adder.s<11> ;
  assign \dff_out.in<10>  = \adder.s<10> ;
  assign \dff_out.in<12>  = \adder.s<12> ;
  assign \dff_shift.clk  = clk_shift;
  assign \dff_shift.rst_b  = rst_b;
  assign \dff_out.in<1>  = \adder.s<1> ;
  assign \dff_out.in<0>  = \adder.s<0> ;
  assign \inverse_mux.sign  = \adder.c_in ;
  assign \dff_out.in<8>  = \adder.s<8> ;
  assign \dff_psum.clk  = clk_psum;
  assign \dff_psum.rst_b  = rst_b;
  assign tie_to_low = \adder.b_0 ;
  assign sign_in_msb = \adder.c_in ;
  assign \dff_out.in<7>  = \adder.s<7> ;
  assign \dff_out.in<6>  = \adder.s<6> ;
  assign extension = \adder.a_10 ;
  assign \dff_out.in<3>  = \adder.s<3> ;
  assign \dff_out.in<2>  = \adder.s<2> ;
  assign \dff_out.in<5>  = \adder.s<5> ;
  assign \dff_out.in<4>  = \adder.s<4> ;
endmodule
