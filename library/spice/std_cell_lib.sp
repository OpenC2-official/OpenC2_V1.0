** Cell name: inverter
.subckt inverter vdd gnd in out
mnmos out in gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
mpmos out in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends inverter
** End of subcircuit definition.

** Cell name: nand2
.subckt nand2 vdd gnd in_0 in_1 out
m1 net1 in_1 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 out in_0 net1 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 out in_0 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 out in_1 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends nand2
** End of subcircuit definition.

** Cell name: nor2
.subckt nor2 vdd gnd in_0 in_1 out
m1 net_pmos in_0 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 out in_1 net_pmos vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 out in_0 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 out in_1 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends nor2
** End of subcircuit definition.

** Cell name: xor2
.subckt xor2 vdd gnd in_0 in_1 out
xi0 vdd gnd in_0 in_1 net1 nor2
m2 out net1 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 net2 in_1 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 out in_0 net2 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net3 in_1 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net3 in_0 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 out net1 net3 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends xor2
** End of subcircuit definition.

** Cell name: sram
.subckt sram vdd gnd bl bl_b wl q_b
m1 bl_b wl q_b gnd NMOS_VTL L=50e-9 W=150e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 q wl bl gnd NMOS_VTL L=50e-9 W=150e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 q q_b gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 q_b q gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 q_b q vdd vdd PMOS_VTL L=50e-9 W=120e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 q q_b vdd vdd PMOS_VTL L=50e-9 W=120e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends sram
** End of subcircuit definition.

** Cell name: dcim_bitcell
.subckt dcim_bitcell vdd gnd wl in_b bl bl_b out
xi1 vdd gnd bl bl_b wl weight_b sram
xi2 vdd gnd weight_b in_b out nor2
.ends dcim_bitcell
** End of subcircuit definition.

** Cell name: trans_gate
.subckt trans_gate vdd gnd ctrl in out
m0 in ctrl out gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out ctrl_b in vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi0 vdd gnd ctrl ctrl_b inverter
.ends trans_gate
** End of subcircuit definition.

** Cell name: trans_gate_b
.subckt trans_gate_b vdd gnd ctrl_b in out
m0 in ctrl out gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out ctrl_b in vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi0 vdd gnd ctrl_b ctrl inverter
.ends trans_gate_b
** End of subcircuit definition.

** Cell name: precharge
.subckt precharge vdd gnd bl bl_b pe
m2 bl_b pe bl vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 bl pe vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 bl_b pe vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends precharge
** End of subcircuit definition.

** Cell name: col_mux
.subckt col_mux vdd gnd bl bl_b read read_b write write_b ysr ysw
xi0 vdd gnd ysr bl_b read trans_gate_b
xi1 vdd gnd ysr bl read_b trans_gate_b
xi2 vdd gnd ysw write_b bl trans_gate
xi3 vdd gnd ysw write bl_b trans_gate
.ends col_mux
** End of subcircuit definition.

** Cell name: sense_amp
.subckt sense_amp vdd gnd read read_b se spe
m7 read_b read vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 read read_b vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 read spe read_b vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 read_b spe vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 read spe vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 read_b read net1 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 read read_b net1 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m8 net1 se gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends sense_amp
** End of subcircuit definition.

** Cell name: write_amp
.subckt write_amp vdd gnd din write write_b
xi0 vdd gnd din din_b inverter
xi1 vdd gnd din write inverter
xi2 vdd gnd din_b write_b inverter
.ends write_amp
** End of subcircuit definition.

** Cell name: output_ff
.subckt output_ff vdd gnd dout read read_b
xi1 vdd gnd read net1 dout nand2
xi0 vdd gnd dout read_b net1 nand2
.ends output_ff
** End of subcircuit definition.

** Cell name: sram_rw
.subckt sram_rw vdd gnd bl bl_b din dout pe ysw ysr spe se
xi0 vdd gnd bl bl_b pe precharge
xi1 vdd gnd bl bl_b read read_b write write_b ysr ysw col_mux
xi2 vdd gnd read read_b se spe sense_amp
xi3 vdd gnd din write write_b write_amp
xi4 vdd gnd dout read read_b output_ff
.ends sram_rw
** End of subcircuit definition.

** Cell name: half_adder
.subckt half_adder vdd gnd a b s cout 
xi1 vdd gnd a b cout_bar nand2
xi2 vdd gnd cout_bar cout inverter
xi3 vdd gnd a b s xor2
.ends half_adder
** End of subcircuit definition.

** Cell name: full_adder
.subckt full_adder vdd gnd a b cin s cout
m54 s net3 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m50 net3 cin net6 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m49 net6 b net5 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m48 net5 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m29 net4 b net9 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m30 net9 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m31 net4 cin net10 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m33 net10 b vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m38 cout net4 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m41 net1 b vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m40 net1 cin vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m32 net10 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m43 net3 net4 net1 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m42 net1 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m55 s net3 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m53 net3 a net7 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m52 net7 b net8 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m51 net8 cin gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m47 net3 net4 net2 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m45 net2 b gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m46 net2 cin gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m28 net4 b net11 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m39 cout net4 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m35 net4 cin net12 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m34 net11 a gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m36 net12 a gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m44 net2 a gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m37 net12 b gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends full_adder
** End of subcircuit definition.

** Cell name: adder_sign_extension
.subckt adder_sign_extension vdd gnd sign a b cin s
m8 s net3 net8 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m7 net8 sign vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 s net5 net2 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net2 net11 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net5 b net1 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net1 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 net5 net3 net4 vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 net4 b vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net4 a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m17 net10 net11 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m16 s net3 net10 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m15 net7 b gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m14 net7 a gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m13 net6 a gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m12 net5 b net6 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m11 net13 sign gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m10 s net5 net13 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m9 net5 net3 net7 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi3 vdd gnd sign net11 inverter
xi2 vdd gnd cin net3 inverter
.ends adder_sign_extension
** End of subcircuit definition.

** Cell name: mux_2_1
.subckt mux_2_1 vdd gnd s in_0 in_1 out
xi2 vdd gnd net1 net2 out nand2
xi1 vdd gnd s in_1 net2 nand2
xi0 vdd gnd in_0 net3 net1 nand2
xi3 vdd gnd s net3 inverter
.ends mux_2_1
** End of subcircuit definition.

** Cell name: nand3
.subckt nand3 vdd gnd in_0 in_1 in_2 out 
m2 out in_2 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in_1 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 out in_0 vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net2 in_2 gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net1 in_1 net2 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 out in_0 net1 gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends nand3
** End of subcircuit definition.

** Cell name: dff
.subckt dff vdd gnd clk rst_b in out 
xi13 vdd gnd out net9 rst_b out_b nand3
xi18 vdd gnd clk net4 inverter
xi17 vdd gnd net4 net3 inverter
xi9 vdd gnd in net5 inverter
xi16 vdd gnd net1 out_b out nand2
xi15 vdd gnd net2 net3 net1 nand2
xi14 vdd gnd net3 net7 net9 nand2
xi12 vdd gnd in net4 net8 nand2
xi11 vdd gnd net8 net7 net2 nand2
xi10 vdd gnd net2 net6 net7 nand2
xi1 vdd gnd net4 net5 net6 nand2
.ends dff
** End of subcircuit definition.

** Cell name: tiel
.subckt tiel vdd gnd out
mnmos out net gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
mpmos net net vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends tiel
** End of subcircuit definition.

** Cell name: tieh
.subckt tieh vdd gnd out
mnmos net net gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
mpmos out net vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends tieh
** End of subcircuit definition.