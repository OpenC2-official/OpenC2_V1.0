
module control_for_4bit_input(clk, rst, \r_w_cim<0> , \r_w_cim<1> , start, wl_enable, pe, ysw, ysr, spe, se, rd_data_enable, clk_b, rst_b, in_msb, clk_out, cim_data_enable, busy);
  wire _000_;
  wire \_001_<0> ;
  wire \_001_<1> ;
  wire \_001_<2> ;
  wire _002_;
  wire \_003_<0> ;
  wire \_003_<1> ;
  wire \_004_<0> ;
  wire \_004_<1> ;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  output busy;
  output cim_data_enable;
  wire \cim_state_reg<0> ;
  wire \cim_state_reg<1> ;
  wire \cim_state_reg<2> ;
  input clk;
  output clk_b;
  output clk_out;
  output in_msb;
  output pe;
  input \r_w_cim<0> ;
  input \r_w_cim<1> ;
  wire \r_w_cim_reg<0> ;
  wire \r_w_cim_reg<1> ;
  output rd_data_enable;
  input rst;
  output rst_b;
  wire \rw_state_reg<0> ;
  wire \rw_state_reg<1> ;
  output se;
  output spe;
  input start;
  output wl_enable;
  output ysr;
  output ysw;
  inverter _103_ (    .in(_072_),    .out(_022_)
  );
  inverter _104_ (    .in(_070_),    .out(_023_)
  );
  inverter _105_ (    .in(_080_),    .out(_024_)
  );
  inverter _106_ (    .in(_077_),    .out(_025_)
  );
  inverter _107_ (    .in(_078_),    .out(_026_)
  );
  inverter _108_ (    .in(_073_),    .out(_027_)
  );
  inverter _109_ (    .in(_075_),    .out(_028_)
  );
  inverter _110_ (    .in(_020_),    .out(_021_)
  );
  nor2 _111_ (    .in_0(_025_),    .in_1(_078_),    .out(_029_)
  );
  nand2 _112_ (    .in_0(_077_),    .in_1(_026_),    .out(_030_)
  );
  nor2 _113_ (    .in_0(_077_),    .in_1(_026_),    .out(_031_)
  );
  xor2 _114_ (    .in_0(_077_),    .in_1(_078_),    .out(_032_)
  );
  nand2 _115_ (    .in_0(_072_),    .in_1(_073_),    .out(_033_)
  );
  inverter _116_ (    .in(_033_),    .out(_034_)
  );
  xor2 _117_ (    .in_0(_072_),    .in_1(_073_),    .out(_035_)
  );
  nand2 _118_ (    .in_0(_032_),    .in_1(_035_),    .out(_036_)
  );
  inverter _119_ (    .in(_036_),    .out(_069_)
  );
  nor2 _120_ (    .in_0(_018_),    .in_1(_017_),    .out(_037_)
  );
  nand2 _121_ (    .in_0(_019_),    .in_1(_037_),    .out(_038_)
  );
  nor2 _122_ (    .in_0(_019_),    .in_1(_037_),    .out(_039_)
  );
  inverter _123_ (    .in(_039_),    .out(_040_)
  );
  xor2 _124_ (    .in_0(_019_),    .in_1(_037_),    .out(_041_)
  );
  nand2 _125_ (    .in_0(_036_),    .in_1(_041_),    .out(_016_)
  );
  nor2 _126_ (    .in_0(_072_),    .in_1(_027_),    .out(_042_)
  );
  nand2 _127_ (    .in_0(_032_),    .in_1(_042_),    .out(_043_)
  );
  inverter _128_ (    .in(_043_),    .out(_083_)
  );
  nor2 _129_ (    .in_0(_022_),    .in_1(_073_),    .out(_044_)
  );
  nand2 _130_ (    .in_0(_031_),    .in_1(_044_),    .out(_045_)
  );
  inverter _131_ (    .in(_045_),    .out(_074_)
  );
  nand2 _132_ (    .in_0(_043_),    .in_1(_045_),    .out(_082_)
  );
  nand2 _133_ (    .in_0(_029_),    .in_1(_044_),    .out(_046_)
  );
  nand2 _134_ (    .in_0(_043_),    .in_1(_046_),    .out(_081_)
  );
  nor2 _135_ (    .in_0(_019_),    .in_1(_018_),    .out(_047_)
  );
  nand2 _136_ (    .in_0(_017_),    .in_1(_047_),    .out(_076_)
  );
  nand2 _137_ (    .in_0(_045_),    .in_1(_046_),    .out(_079_)
  );
  nor2 _138_ (    .in_0(_024_),    .in_1(_016_),    .out(_048_)
  );
  nand2 _139_ (    .in_0(_071_),    .in_1(_048_),    .out(_049_)
  );
  nor2 _140_ (    .in_0(_070_),    .in_1(_049_),    .out(_050_)
  );
  nand2 _141_ (    .in_0(_070_),    .in_1(_048_),    .out(_051_)
  );
  nor2 _142_ (    .in_0(_071_),    .in_1(_051_),    .out(_052_)
  );
  nor2 _143_ (    .in_0(_050_),    .in_1(_052_),    .out(_053_)
  );
  nor2 _144_ (    .in_0(_075_),    .in_1(_053_),    .out(_012_)
  );
  nand2 _145_ (    .in_0(_028_),    .in_1(_035_),    .out(_054_)
  );
  nor2 _146_ (    .in_0(_030_),    .in_1(_054_),    .out(_013_)
  );
  nor2 _147_ (    .in_0(_075_),    .in_1(_038_),    .out(_005_)
  );
  nor2 _148_ (    .in_0(_075_),    .in_1(_076_),    .out(_009_)
  );
  nor2 _149_ (    .in_0(_033_),    .in_1(_040_),    .out(_055_)
  );
  nand2 _150_ (    .in_0(_034_),    .in_1(_039_),    .out(_056_)
  );
  nor2 _151_ (    .in_0(_017_),    .in_1(_056_),    .out(_057_)
  );
  nor2 _152_ (    .in_0(_023_),    .in_1(_049_),    .out(_058_)
  );
  nor2 _153_ (    .in_0(_057_),    .in_1(_058_),    .out(_059_)
  );
  nor2 _154_ (    .in_0(_075_),    .in_1(_059_),    .out(_006_)
  );
  nand2 _155_ (    .in_0(_018_),    .in_1(_017_),    .out(_060_)
  );
  inverter _156_ (    .in(_060_),    .out(_061_)
  );
  nand2 _157_ (    .in_0(_028_),    .in_1(_055_),    .out(_062_)
  );
  nor2 _158_ (    .in_0(_061_),    .in_1(_062_),    .out(_007_)
  );
  nor2 _159_ (    .in_0(_060_),    .in_1(_062_),    .out(_008_)
  );
  nand2 _160_ (    .in_0(_072_),    .in_1(_049_),    .out(_063_)
  );
  nand2 _161_ (    .in_0(_051_),    .in_1(_063_),    .out(_064_)
  );
  inverter _162_ (    .in(_064_),    .out(_065_)
  );
  nor2 _163_ (    .in_0(_075_),    .in_1(_065_),    .out(_010_)
  );
  nand2 _164_ (    .in_0(_073_),    .in_1(_051_),    .out(_066_)
  );
  nand2 _165_ (    .in_0(_049_),    .in_1(_066_),    .out(_067_)
  );
  inverter _166_ (    .in(_067_),    .out(_068_)
  );
  nor2 _167_ (    .in_0(_075_),    .in_1(_068_),    .out(_011_)
  );
  inverter _168_ (    .in(_020_),    .out(_014_)
  );
  inverter _169_ (    .in(_020_),    .out(_015_)
  );
  tieh _170_ (    .out(_084_)
  );
  tieh _171_ (    .out(_085_)
  );
  tieh _172_ (    .out(_086_)
  );
  tieh _173_ (    .out(_087_)
  );
  tieh _174_ (    .out(_088_)
  );
  tieh _175_ (    .out(_089_)
  );
  tieh _176_ (    .out(_090_)
  );
  tieh _177_ (    .out(_091_)
  );
  tieh _178_ (    .out(_092_)
  );
  buffer _200_ (    .in(clk_out),    .out(cim_data_enable)
  );
  buffer _202_ (    .in(rd_data_enable),    .out(se)
  );
  buffer _203_ (    .in(\r_w_cim_reg<0> ),    .out(_072_)
  );
  buffer _204_ (    .in(\r_w_cim<0> ),    .out(_070_)
  );
  buffer _205_ (    .in(_016_),    .out(busy)
  );
  buffer _206_ (    .in(start),    .out(_080_)
  );
  buffer _207_ (    .in(\r_w_cim<1> ),    .out(_071_)
  );
  buffer _208_ (    .in(_083_),    .out(ysw)
  );
  buffer _209_ (    .in(_074_),    .out(rd_data_enable)
  );
  buffer _210_ (    .in(_082_),    .out(ysr)
  );
  buffer _211_ (    .in(\rw_state_reg<0> ),    .out(_077_)
  );
  buffer _212_ (    .in(\cim_state_reg<2> ),    .out(_019_)
  );
  buffer _213_ (    .in(\rw_state_reg<1> ),    .out(_078_)
  );
  buffer _214_ (    .in(_081_),    .out(wl_enable)
  );
  buffer _215_ (    .in(\cim_state_reg<1> ),    .out(_018_)
  );
  buffer _216_ (    .in(_076_),    .out(rst_b)
  );
  buffer _217_ (    .in(\cim_state_reg<0> ),    .out(_017_)
  );
  buffer _218_ (    .in(_079_),    .out(spe)
  );
  buffer _219_ (    .in(_069_),    .out(pe)
  );
  buffer _220_ (    .in(\r_w_cim_reg<1> ),    .out(_073_)
  );
  buffer _221_ (    .in(rst),    .out(_075_)
  );
  buffer _222_ (    .in(_012_),    .out(\_004_<0> )
  );
  buffer _223_ (    .in(_013_),    .out(\_004_<1> )
  );
  buffer _224_ (    .in(_005_),    .out(_000_)
  );
  buffer _225_ (    .in(_009_),    .out(_002_)
  );
  buffer _226_ (    .in(_006_),    .out(\_001_<0> )
  );
  buffer _227_ (    .in(_007_),    .out(\_001_<1> )
  );
  buffer _228_ (    .in(_008_),    .out(\_001_<2> )
  );
  buffer _229_ (    .in(_010_),    .out(\_003_<0> )
  );
  buffer _230_ (    .in(_011_),    .out(\_003_<1> )
  );
  buffer _231_ (    .in(clk),    .out(_020_)
  );
  buffer _232_ (    .in(_021_),    .out(clk_b)
  );
  buffer _233_ (    .in(_014_),    .out(_093_)
  );
  buffer _234_ (    .in(_015_),    .out(_094_)
  );
  dff _235_ (    .clk(_093_),    .in(_002_),    .out(in_msb),    .rst_b(_092_)
  );
  dff _236_ (    .clk(_094_),    .in(_000_),    .out(clk_out),    .rst_b(_091_)
  );
  dff _237_ (    .clk(clk),    .in(\_004_<0> ),    .out(\rw_state_reg<0> ),    .rst_b(_085_)
  );
  dff _238_ (    .clk(clk),    .in(\_004_<1> ),    .out(\rw_state_reg<1> ),    .rst_b(_086_)
  );
  dff _239_ (    .clk(clk),    .in(\_003_<0> ),    .out(\r_w_cim_reg<0> ),    .rst_b(_087_)
  );
  dff _240_ (    .clk(clk),    .in(\_003_<1> ),    .out(\r_w_cim_reg<1> ),    .rst_b(_088_)
  );
  dff _241_ (    .clk(clk),    .in(\_001_<0> ),    .out(\cim_state_reg<0> ),    .rst_b(_089_)
  );
  dff _242_ (    .clk(clk),    .in(\_001_<1> ),    .out(\cim_state_reg<1> ),    .rst_b(_090_)
  );
  dff _243_ (    .clk(clk),    .in(\_001_<2> ),    .out(\cim_state_reg<2> ),    .rst_b(_084_)
  );
endmodule
