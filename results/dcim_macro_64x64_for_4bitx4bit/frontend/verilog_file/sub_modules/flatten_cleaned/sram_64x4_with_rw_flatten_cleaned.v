
module sram_64x4_with_rw(pe, ysw, ysr, spe, se, \wl<0> , \wl<1> , \wl<2> , \wl<3> , \wl<4> , \wl<5> , \wl<6> , \wl<7> , \wl<8> , \wl<9> , \wl<10> , \wl<11> , \wl<12> , \wl<13> , \wl<14> , \wl<15> , \wl<16> , \wl<17> , \wl<18> , \wl<19> , \wl<20> , \wl<21> , \wl<22> , \wl<23> , \wl<24> , \wl<25> , \wl<26> , \wl<27> , \wl<28> , \wl<29> , \wl<30> , \wl<31> , \wl<32> , \wl<33> , \wl<34> , \wl<35> , \wl<36> , \wl<37> , \wl<38> , \wl<39> , \wl<40> , \wl<41> , \wl<42> , \wl<43> , \wl<44> , \wl<45> , \wl<46> , \wl<47> , \wl<48> , \wl<49> , \wl<50> , \wl<51> , \wl<52> , \wl<53> , \wl<54> , \wl<55> , \wl<56> , \wl<57> , \wl<58> , \wl<59> , \wl<60> , \wl<61> , \wl<62> , \wl<63> , \in_b<0> , \in_b<1> , \in_b<2> , \in_b<3> , \in_b<4> , \in_b<5> , \in_b<6> , \in_b<7> , \in_b<8> , \in_b<9> , \in_b<10> , \in_b<11> , \in_b<12> , \in_b<13> , \in_b<14> , \in_b<15> , \in_b<16> , \in_b<17> , \in_b<18> , \in_b<19> , \in_b<20> , \in_b<21> , \in_b<22> , \in_b<23> , \in_b<24> , \in_b<25> , \in_b<26> , \in_b<27> , \in_b<28> , \in_b<29> , \in_b<30> , \in_b<31> , \in_b<32> , \in_b<33> , \in_b<34> , \in_b<35> , \in_b<36> , \in_b<37> , \in_b<38> , \in_b<39> , \in_b<40> , \in_b<41> , \in_b<42> , \in_b<43> , \in_b<44> , \in_b<45> , \in_b<46> , \in_b<47> , \in_b<48> , \in_b<49> , \in_b<50> , \in_b<51> , \in_b<52> , \in_b<53> , \in_b<54> , \in_b<55> , \in_b<56> , \in_b<57> , \in_b<58> , \in_b<59> , \in_b<60> , \in_b<61> , \in_b<62> , \in_b<63> , \din<0> , \din<1> , \din<2> , \din<3> , \dout<0> , \dout<1> , \dout<2> , \dout<3> , \bitcell_out_0<0> , \bitcell_out_0<1> , \bitcell_out_0<2> , \bitcell_out_0<3> , \bitcell_out_1<0> , \bitcell_out_1<1> , \bitcell_out_1<2> , \bitcell_out_1<3> , \bitcell_out_2<0> , \bitcell_out_2<1> , \bitcell_out_2<2> , \bitcell_out_2<3> , \bitcell_out_3<0> , \bitcell_out_3<1> , \bitcell_out_3<2> , \bitcell_out_3<3> , \bitcell_out_4<0> , \bitcell_out_4<1> , \bitcell_out_4<2> , \bitcell_out_4<3> , \bitcell_out_5<0> , \bitcell_out_5<1> , \bitcell_out_5<2> , \bitcell_out_5<3> , \bitcell_out_6<0> , \bitcell_out_6<1> , \bitcell_out_6<2> , \bitcell_out_6<3> , \bitcell_out_7<0> , \bitcell_out_7<1> , \bitcell_out_7<2> , \bitcell_out_7<3> , \bitcell_out_8<0> , \bitcell_out_8<1> , \bitcell_out_8<2> , \bitcell_out_8<3> , \bitcell_out_9<0> , \bitcell_out_9<1> , \bitcell_out_9<2> , \bitcell_out_9<3> , \bitcell_out_10<0> , \bitcell_out_10<1> , \bitcell_out_10<2> , \bitcell_out_10<3> , \bitcell_out_11<0> , \bitcell_out_11<1> , \bitcell_out_11<2> , \bitcell_out_11<3> , \bitcell_out_12<0> , \bitcell_out_12<1> , \bitcell_out_12<2> , \bitcell_out_12<3> , \bitcell_out_13<0> , \bitcell_out_13<1> , \bitcell_out_13<2> , \bitcell_out_13<3> , \bitcell_out_14<0> , \bitcell_out_14<1> , \bitcell_out_14<2> , \bitcell_out_14<3> , \bitcell_out_15<0> , \bitcell_out_15<1> , \bitcell_out_15<2> , \bitcell_out_15<3> , \bitcell_out_16<0> , \bitcell_out_16<1> , \bitcell_out_16<2> , \bitcell_out_16<3> , \bitcell_out_17<0> , \bitcell_out_17<1> , \bitcell_out_17<2> , \bitcell_out_17<3> , \bitcell_out_18<0> , \bitcell_out_18<1> , \bitcell_out_18<2> , \bitcell_out_18<3> , \bitcell_out_19<0> , \bitcell_out_19<1> , \bitcell_out_19<2> , \bitcell_out_19<3> , \bitcell_out_20<0> , \bitcell_out_20<1> , \bitcell_out_20<2> , \bitcell_out_20<3> , \bitcell_out_21<0> , \bitcell_out_21<1> , \bitcell_out_21<2> , \bitcell_out_21<3> , \bitcell_out_22<0> , \bitcell_out_22<1> , \bitcell_out_22<2> , \bitcell_out_22<3> , \bitcell_out_23<0> , \bitcell_out_23<1> , \bitcell_out_23<2> , \bitcell_out_23<3> , \bitcell_out_24<0> , \bitcell_out_24<1> , \bitcell_out_24<2> , \bitcell_out_24<3> , \bitcell_out_25<0> , \bitcell_out_25<1> , \bitcell_out_25<2> , \bitcell_out_25<3> , \bitcell_out_26<0> , \bitcell_out_26<1> , \bitcell_out_26<2> , \bitcell_out_26<3> , \bitcell_out_27<0> , \bitcell_out_27<1> , \bitcell_out_27<2> , \bitcell_out_27<3> , \bitcell_out_28<0> , \bitcell_out_28<1> , \bitcell_out_28<2> , \bitcell_out_28<3> , \bitcell_out_29<0> , \bitcell_out_29<1> , \bitcell_out_29<2> , \bitcell_out_29<3> , \bitcell_out_30<0> , \bitcell_out_30<1> , \bitcell_out_30<2> , \bitcell_out_30<3> , \bitcell_out_31<0> , \bitcell_out_31<1> , \bitcell_out_31<2> , \bitcell_out_31<3> , \bitcell_out_32<0> , \bitcell_out_32<1> , \bitcell_out_32<2> , \bitcell_out_32<3> , \bitcell_out_33<0> , \bitcell_out_33<1> , \bitcell_out_33<2> , \bitcell_out_33<3> , \bitcell_out_34<0> , \bitcell_out_34<1> , \bitcell_out_34<2> , \bitcell_out_34<3> , \bitcell_out_35<0> , \bitcell_out_35<1> , \bitcell_out_35<2> , \bitcell_out_35<3> , \bitcell_out_36<0> , \bitcell_out_36<1> , \bitcell_out_36<2> , \bitcell_out_36<3> , \bitcell_out_37<0> , \bitcell_out_37<1> , \bitcell_out_37<2> , \bitcell_out_37<3> , \bitcell_out_38<0> , \bitcell_out_38<1> , \bitcell_out_38<2> , \bitcell_out_38<3> , \bitcell_out_39<0> , \bitcell_out_39<1> , \bitcell_out_39<2> , \bitcell_out_39<3> , \bitcell_out_40<0> , \bitcell_out_40<1> , \bitcell_out_40<2> , \bitcell_out_40<3> , \bitcell_out_41<0> , \bitcell_out_41<1> , \bitcell_out_41<2> , \bitcell_out_41<3> , \bitcell_out_42<0> , \bitcell_out_42<1> , \bitcell_out_42<2> , \bitcell_out_42<3> , \bitcell_out_43<0> , \bitcell_out_43<1> , \bitcell_out_43<2> , \bitcell_out_43<3> , \bitcell_out_44<0> , \bitcell_out_44<1> , \bitcell_out_44<2> , \bitcell_out_44<3> , \bitcell_out_45<0> , \bitcell_out_45<1> , \bitcell_out_45<2> , \bitcell_out_45<3> , \bitcell_out_46<0> , \bitcell_out_46<1> , \bitcell_out_46<2> , \bitcell_out_46<3> , \bitcell_out_47<0> , \bitcell_out_47<1> , \bitcell_out_47<2> , \bitcell_out_47<3> , \bitcell_out_48<0> , \bitcell_out_48<1> , \bitcell_out_48<2> , \bitcell_out_48<3> , \bitcell_out_49<0> , \bitcell_out_49<1> , \bitcell_out_49<2> , \bitcell_out_49<3> , \bitcell_out_50<0> , \bitcell_out_50<1> , \bitcell_out_50<2> , \bitcell_out_50<3> , \bitcell_out_51<0> , \bitcell_out_51<1> , \bitcell_out_51<2> , \bitcell_out_51<3> , \bitcell_out_52<0> , \bitcell_out_52<1> , \bitcell_out_52<2> , \bitcell_out_52<3> , \bitcell_out_53<0> , \bitcell_out_53<1> , \bitcell_out_53<2> , \bitcell_out_53<3> , \bitcell_out_54<0> , \bitcell_out_54<1> , \bitcell_out_54<2> , \bitcell_out_54<3> , \bitcell_out_55<0> , \bitcell_out_55<1> , \bitcell_out_55<2> , \bitcell_out_55<3> , \bitcell_out_56<0> , \bitcell_out_56<1> , \bitcell_out_56<2> , \bitcell_out_56<3> , \bitcell_out_57<0> , \bitcell_out_57<1> , \bitcell_out_57<2> , \bitcell_out_57<3> , \bitcell_out_58<0> , \bitcell_out_58<1> , \bitcell_out_58<2> , \bitcell_out_58<3> , \bitcell_out_59<0> , \bitcell_out_59<1> , \bitcell_out_59<2> , \bitcell_out_59<3> , \bitcell_out_60<0> , \bitcell_out_60<1> , \bitcell_out_60<2> , \bitcell_out_60<3> , \bitcell_out_61<0> , \bitcell_out_61<1> , \bitcell_out_61<2> , \bitcell_out_61<3> , \bitcell_out_62<0> , \bitcell_out_62<1> , \bitcell_out_62<2> , \bitcell_out_62<3> , \bitcell_out_63<0> , \bitcell_out_63<1> , \bitcell_out_63<2> , \bitcell_out_63<3> );
  output \bitcell_out_0<0> ;
  output \bitcell_out_0<1> ;
  output \bitcell_out_0<2> ;
  output \bitcell_out_0<3> ;
  output \bitcell_out_10<0> ;
  output \bitcell_out_10<1> ;
  output \bitcell_out_10<2> ;
  output \bitcell_out_10<3> ;
  output \bitcell_out_11<0> ;
  output \bitcell_out_11<1> ;
  output \bitcell_out_11<2> ;
  output \bitcell_out_11<3> ;
  output \bitcell_out_12<0> ;
  output \bitcell_out_12<1> ;
  output \bitcell_out_12<2> ;
  output \bitcell_out_12<3> ;
  output \bitcell_out_13<0> ;
  output \bitcell_out_13<1> ;
  output \bitcell_out_13<2> ;
  output \bitcell_out_13<3> ;
  output \bitcell_out_14<0> ;
  output \bitcell_out_14<1> ;
  output \bitcell_out_14<2> ;
  output \bitcell_out_14<3> ;
  output \bitcell_out_15<0> ;
  output \bitcell_out_15<1> ;
  output \bitcell_out_15<2> ;
  output \bitcell_out_15<3> ;
  output \bitcell_out_16<0> ;
  output \bitcell_out_16<1> ;
  output \bitcell_out_16<2> ;
  output \bitcell_out_16<3> ;
  output \bitcell_out_17<0> ;
  output \bitcell_out_17<1> ;
  output \bitcell_out_17<2> ;
  output \bitcell_out_17<3> ;
  output \bitcell_out_18<0> ;
  output \bitcell_out_18<1> ;
  output \bitcell_out_18<2> ;
  output \bitcell_out_18<3> ;
  output \bitcell_out_19<0> ;
  output \bitcell_out_19<1> ;
  output \bitcell_out_19<2> ;
  output \bitcell_out_19<3> ;
  output \bitcell_out_1<0> ;
  output \bitcell_out_1<1> ;
  output \bitcell_out_1<2> ;
  output \bitcell_out_1<3> ;
  output \bitcell_out_20<0> ;
  output \bitcell_out_20<1> ;
  output \bitcell_out_20<2> ;
  output \bitcell_out_20<3> ;
  output \bitcell_out_21<0> ;
  output \bitcell_out_21<1> ;
  output \bitcell_out_21<2> ;
  output \bitcell_out_21<3> ;
  output \bitcell_out_22<0> ;
  output \bitcell_out_22<1> ;
  output \bitcell_out_22<2> ;
  output \bitcell_out_22<3> ;
  output \bitcell_out_23<0> ;
  output \bitcell_out_23<1> ;
  output \bitcell_out_23<2> ;
  output \bitcell_out_23<3> ;
  output \bitcell_out_24<0> ;
  output \bitcell_out_24<1> ;
  output \bitcell_out_24<2> ;
  output \bitcell_out_24<3> ;
  output \bitcell_out_25<0> ;
  output \bitcell_out_25<1> ;
  output \bitcell_out_25<2> ;
  output \bitcell_out_25<3> ;
  output \bitcell_out_26<0> ;
  output \bitcell_out_26<1> ;
  output \bitcell_out_26<2> ;
  output \bitcell_out_26<3> ;
  output \bitcell_out_27<0> ;
  output \bitcell_out_27<1> ;
  output \bitcell_out_27<2> ;
  output \bitcell_out_27<3> ;
  output \bitcell_out_28<0> ;
  output \bitcell_out_28<1> ;
  output \bitcell_out_28<2> ;
  output \bitcell_out_28<3> ;
  output \bitcell_out_29<0> ;
  output \bitcell_out_29<1> ;
  output \bitcell_out_29<2> ;
  output \bitcell_out_29<3> ;
  output \bitcell_out_2<0> ;
  output \bitcell_out_2<1> ;
  output \bitcell_out_2<2> ;
  output \bitcell_out_2<3> ;
  output \bitcell_out_30<0> ;
  output \bitcell_out_30<1> ;
  output \bitcell_out_30<2> ;
  output \bitcell_out_30<3> ;
  output \bitcell_out_31<0> ;
  output \bitcell_out_31<1> ;
  output \bitcell_out_31<2> ;
  output \bitcell_out_31<3> ;
  output \bitcell_out_32<0> ;
  output \bitcell_out_32<1> ;
  output \bitcell_out_32<2> ;
  output \bitcell_out_32<3> ;
  output \bitcell_out_33<0> ;
  output \bitcell_out_33<1> ;
  output \bitcell_out_33<2> ;
  output \bitcell_out_33<3> ;
  output \bitcell_out_34<0> ;
  output \bitcell_out_34<1> ;
  output \bitcell_out_34<2> ;
  output \bitcell_out_34<3> ;
  output \bitcell_out_35<0> ;
  output \bitcell_out_35<1> ;
  output \bitcell_out_35<2> ;
  output \bitcell_out_35<3> ;
  output \bitcell_out_36<0> ;
  output \bitcell_out_36<1> ;
  output \bitcell_out_36<2> ;
  output \bitcell_out_36<3> ;
  output \bitcell_out_37<0> ;
  output \bitcell_out_37<1> ;
  output \bitcell_out_37<2> ;
  output \bitcell_out_37<3> ;
  output \bitcell_out_38<0> ;
  output \bitcell_out_38<1> ;
  output \bitcell_out_38<2> ;
  output \bitcell_out_38<3> ;
  output \bitcell_out_39<0> ;
  output \bitcell_out_39<1> ;
  output \bitcell_out_39<2> ;
  output \bitcell_out_39<3> ;
  output \bitcell_out_3<0> ;
  output \bitcell_out_3<1> ;
  output \bitcell_out_3<2> ;
  output \bitcell_out_3<3> ;
  output \bitcell_out_40<0> ;
  output \bitcell_out_40<1> ;
  output \bitcell_out_40<2> ;
  output \bitcell_out_40<3> ;
  output \bitcell_out_41<0> ;
  output \bitcell_out_41<1> ;
  output \bitcell_out_41<2> ;
  output \bitcell_out_41<3> ;
  output \bitcell_out_42<0> ;
  output \bitcell_out_42<1> ;
  output \bitcell_out_42<2> ;
  output \bitcell_out_42<3> ;
  output \bitcell_out_43<0> ;
  output \bitcell_out_43<1> ;
  output \bitcell_out_43<2> ;
  output \bitcell_out_43<3> ;
  output \bitcell_out_44<0> ;
  output \bitcell_out_44<1> ;
  output \bitcell_out_44<2> ;
  output \bitcell_out_44<3> ;
  output \bitcell_out_45<0> ;
  output \bitcell_out_45<1> ;
  output \bitcell_out_45<2> ;
  output \bitcell_out_45<3> ;
  output \bitcell_out_46<0> ;
  output \bitcell_out_46<1> ;
  output \bitcell_out_46<2> ;
  output \bitcell_out_46<3> ;
  output \bitcell_out_47<0> ;
  output \bitcell_out_47<1> ;
  output \bitcell_out_47<2> ;
  output \bitcell_out_47<3> ;
  output \bitcell_out_48<0> ;
  output \bitcell_out_48<1> ;
  output \bitcell_out_48<2> ;
  output \bitcell_out_48<3> ;
  output \bitcell_out_49<0> ;
  output \bitcell_out_49<1> ;
  output \bitcell_out_49<2> ;
  output \bitcell_out_49<3> ;
  output \bitcell_out_4<0> ;
  output \bitcell_out_4<1> ;
  output \bitcell_out_4<2> ;
  output \bitcell_out_4<3> ;
  output \bitcell_out_50<0> ;
  output \bitcell_out_50<1> ;
  output \bitcell_out_50<2> ;
  output \bitcell_out_50<3> ;
  output \bitcell_out_51<0> ;
  output \bitcell_out_51<1> ;
  output \bitcell_out_51<2> ;
  output \bitcell_out_51<3> ;
  output \bitcell_out_52<0> ;
  output \bitcell_out_52<1> ;
  output \bitcell_out_52<2> ;
  output \bitcell_out_52<3> ;
  output \bitcell_out_53<0> ;
  output \bitcell_out_53<1> ;
  output \bitcell_out_53<2> ;
  output \bitcell_out_53<3> ;
  output \bitcell_out_54<0> ;
  output \bitcell_out_54<1> ;
  output \bitcell_out_54<2> ;
  output \bitcell_out_54<3> ;
  output \bitcell_out_55<0> ;
  output \bitcell_out_55<1> ;
  output \bitcell_out_55<2> ;
  output \bitcell_out_55<3> ;
  output \bitcell_out_56<0> ;
  output \bitcell_out_56<1> ;
  output \bitcell_out_56<2> ;
  output \bitcell_out_56<3> ;
  output \bitcell_out_57<0> ;
  output \bitcell_out_57<1> ;
  output \bitcell_out_57<2> ;
  output \bitcell_out_57<3> ;
  output \bitcell_out_58<0> ;
  output \bitcell_out_58<1> ;
  output \bitcell_out_58<2> ;
  output \bitcell_out_58<3> ;
  output \bitcell_out_59<0> ;
  output \bitcell_out_59<1> ;
  output \bitcell_out_59<2> ;
  output \bitcell_out_59<3> ;
  output \bitcell_out_5<0> ;
  output \bitcell_out_5<1> ;
  output \bitcell_out_5<2> ;
  output \bitcell_out_5<3> ;
  output \bitcell_out_60<0> ;
  output \bitcell_out_60<1> ;
  output \bitcell_out_60<2> ;
  output \bitcell_out_60<3> ;
  output \bitcell_out_61<0> ;
  output \bitcell_out_61<1> ;
  output \bitcell_out_61<2> ;
  output \bitcell_out_61<3> ;
  output \bitcell_out_62<0> ;
  output \bitcell_out_62<1> ;
  output \bitcell_out_62<2> ;
  output \bitcell_out_62<3> ;
  output \bitcell_out_63<0> ;
  output \bitcell_out_63<1> ;
  output \bitcell_out_63<2> ;
  output \bitcell_out_63<3> ;
  output \bitcell_out_6<0> ;
  output \bitcell_out_6<1> ;
  output \bitcell_out_6<2> ;
  output \bitcell_out_6<3> ;
  output \bitcell_out_7<0> ;
  output \bitcell_out_7<1> ;
  output \bitcell_out_7<2> ;
  output \bitcell_out_7<3> ;
  output \bitcell_out_8<0> ;
  output \bitcell_out_8<1> ;
  output \bitcell_out_8<2> ;
  output \bitcell_out_8<3> ;
  output \bitcell_out_9<0> ;
  output \bitcell_out_9<1> ;
  output \bitcell_out_9<2> ;
  output \bitcell_out_9<3> ;
  wire \bl<0> ;
  wire \bl<1> ;
  wire \bl<2> ;
  wire \bl<3> ;
  wire \bl_b<0> ;
  wire \bl_b<1> ;
  wire \bl_b<2> ;
  wire \bl_b<3> ;
  input \din<0> ;
  input \din<1> ;
  input \din<2> ;
  input \din<3> ;
  output \dout<0> ;
  output \dout<1> ;
  output \dout<2> ;
  output \dout<3> ;
  input \in_b<0> ;
  input \in_b<10> ;
  input \in_b<11> ;
  input \in_b<12> ;
  input \in_b<13> ;
  input \in_b<14> ;
  input \in_b<15> ;
  input \in_b<16> ;
  input \in_b<17> ;
  input \in_b<18> ;
  input \in_b<19> ;
  input \in_b<1> ;
  input \in_b<20> ;
  input \in_b<21> ;
  input \in_b<22> ;
  input \in_b<23> ;
  input \in_b<24> ;
  input \in_b<25> ;
  input \in_b<26> ;
  input \in_b<27> ;
  input \in_b<28> ;
  input \in_b<29> ;
  input \in_b<2> ;
  input \in_b<30> ;
  input \in_b<31> ;
  input \in_b<32> ;
  input \in_b<33> ;
  input \in_b<34> ;
  input \in_b<35> ;
  input \in_b<36> ;
  input \in_b<37> ;
  input \in_b<38> ;
  input \in_b<39> ;
  input \in_b<3> ;
  input \in_b<40> ;
  input \in_b<41> ;
  input \in_b<42> ;
  input \in_b<43> ;
  input \in_b<44> ;
  input \in_b<45> ;
  input \in_b<46> ;
  input \in_b<47> ;
  input \in_b<48> ;
  input \in_b<49> ;
  input \in_b<4> ;
  input \in_b<50> ;
  input \in_b<51> ;
  input \in_b<52> ;
  input \in_b<53> ;
  input \in_b<54> ;
  input \in_b<55> ;
  input \in_b<56> ;
  input \in_b<57> ;
  input \in_b<58> ;
  input \in_b<59> ;
  input \in_b<5> ;
  input \in_b<60> ;
  input \in_b<61> ;
  input \in_b<62> ;
  input \in_b<63> ;
  input \in_b<6> ;
  input \in_b<7> ;
  input \in_b<8> ;
  input \in_b<9> ;
  input pe;
  input se;
  input spe;
  wire \sram.bitcell_out_0<0> ;
  wire \sram.bitcell_out_0<1> ;
  wire \sram.bitcell_out_0<2> ;
  wire \sram.bitcell_out_0<3> ;
  wire \sram.bitcell_out_10<0> ;
  wire \sram.bitcell_out_10<1> ;
  wire \sram.bitcell_out_10<2> ;
  wire \sram.bitcell_out_10<3> ;
  wire \sram.bitcell_out_11<0> ;
  wire \sram.bitcell_out_11<1> ;
  wire \sram.bitcell_out_11<2> ;
  wire \sram.bitcell_out_11<3> ;
  wire \sram.bitcell_out_12<0> ;
  wire \sram.bitcell_out_12<1> ;
  wire \sram.bitcell_out_12<2> ;
  wire \sram.bitcell_out_12<3> ;
  wire \sram.bitcell_out_13<0> ;
  wire \sram.bitcell_out_13<1> ;
  wire \sram.bitcell_out_13<2> ;
  wire \sram.bitcell_out_13<3> ;
  wire \sram.bitcell_out_14<0> ;
  wire \sram.bitcell_out_14<1> ;
  wire \sram.bitcell_out_14<2> ;
  wire \sram.bitcell_out_14<3> ;
  wire \sram.bitcell_out_15<0> ;
  wire \sram.bitcell_out_15<1> ;
  wire \sram.bitcell_out_15<2> ;
  wire \sram.bitcell_out_15<3> ;
  wire \sram.bitcell_out_16<0> ;
  wire \sram.bitcell_out_16<1> ;
  wire \sram.bitcell_out_16<2> ;
  wire \sram.bitcell_out_16<3> ;
  wire \sram.bitcell_out_17<0> ;
  wire \sram.bitcell_out_17<1> ;
  wire \sram.bitcell_out_17<2> ;
  wire \sram.bitcell_out_17<3> ;
  wire \sram.bitcell_out_18<0> ;
  wire \sram.bitcell_out_18<1> ;
  wire \sram.bitcell_out_18<2> ;
  wire \sram.bitcell_out_18<3> ;
  wire \sram.bitcell_out_19<0> ;
  wire \sram.bitcell_out_19<1> ;
  wire \sram.bitcell_out_19<2> ;
  wire \sram.bitcell_out_19<3> ;
  wire \sram.bitcell_out_1<0> ;
  wire \sram.bitcell_out_1<1> ;
  wire \sram.bitcell_out_1<2> ;
  wire \sram.bitcell_out_1<3> ;
  wire \sram.bitcell_out_20<0> ;
  wire \sram.bitcell_out_20<1> ;
  wire \sram.bitcell_out_20<2> ;
  wire \sram.bitcell_out_20<3> ;
  wire \sram.bitcell_out_21<0> ;
  wire \sram.bitcell_out_21<1> ;
  wire \sram.bitcell_out_21<2> ;
  wire \sram.bitcell_out_21<3> ;
  wire \sram.bitcell_out_22<0> ;
  wire \sram.bitcell_out_22<1> ;
  wire \sram.bitcell_out_22<2> ;
  wire \sram.bitcell_out_22<3> ;
  wire \sram.bitcell_out_23<0> ;
  wire \sram.bitcell_out_23<1> ;
  wire \sram.bitcell_out_23<2> ;
  wire \sram.bitcell_out_23<3> ;
  wire \sram.bitcell_out_24<0> ;
  wire \sram.bitcell_out_24<1> ;
  wire \sram.bitcell_out_24<2> ;
  wire \sram.bitcell_out_24<3> ;
  wire \sram.bitcell_out_25<0> ;
  wire \sram.bitcell_out_25<1> ;
  wire \sram.bitcell_out_25<2> ;
  wire \sram.bitcell_out_25<3> ;
  wire \sram.bitcell_out_26<0> ;
  wire \sram.bitcell_out_26<1> ;
  wire \sram.bitcell_out_26<2> ;
  wire \sram.bitcell_out_26<3> ;
  wire \sram.bitcell_out_27<0> ;
  wire \sram.bitcell_out_27<1> ;
  wire \sram.bitcell_out_27<2> ;
  wire \sram.bitcell_out_27<3> ;
  wire \sram.bitcell_out_28<0> ;
  wire \sram.bitcell_out_28<1> ;
  wire \sram.bitcell_out_28<2> ;
  wire \sram.bitcell_out_28<3> ;
  wire \sram.bitcell_out_29<0> ;
  wire \sram.bitcell_out_29<1> ;
  wire \sram.bitcell_out_29<2> ;
  wire \sram.bitcell_out_29<3> ;
  wire \sram.bitcell_out_2<0> ;
  wire \sram.bitcell_out_2<1> ;
  wire \sram.bitcell_out_2<2> ;
  wire \sram.bitcell_out_2<3> ;
  wire \sram.bitcell_out_30<0> ;
  wire \sram.bitcell_out_30<1> ;
  wire \sram.bitcell_out_30<2> ;
  wire \sram.bitcell_out_30<3> ;
  wire \sram.bitcell_out_31<0> ;
  wire \sram.bitcell_out_31<1> ;
  wire \sram.bitcell_out_31<2> ;
  wire \sram.bitcell_out_31<3> ;
  wire \sram.bitcell_out_32<0> ;
  wire \sram.bitcell_out_32<1> ;
  wire \sram.bitcell_out_32<2> ;
  wire \sram.bitcell_out_32<3> ;
  wire \sram.bitcell_out_33<0> ;
  wire \sram.bitcell_out_33<1> ;
  wire \sram.bitcell_out_33<2> ;
  wire \sram.bitcell_out_33<3> ;
  wire \sram.bitcell_out_34<0> ;
  wire \sram.bitcell_out_34<1> ;
  wire \sram.bitcell_out_34<2> ;
  wire \sram.bitcell_out_34<3> ;
  wire \sram.bitcell_out_35<0> ;
  wire \sram.bitcell_out_35<1> ;
  wire \sram.bitcell_out_35<2> ;
  wire \sram.bitcell_out_35<3> ;
  wire \sram.bitcell_out_36<0> ;
  wire \sram.bitcell_out_36<1> ;
  wire \sram.bitcell_out_36<2> ;
  wire \sram.bitcell_out_36<3> ;
  wire \sram.bitcell_out_37<0> ;
  wire \sram.bitcell_out_37<1> ;
  wire \sram.bitcell_out_37<2> ;
  wire \sram.bitcell_out_37<3> ;
  wire \sram.bitcell_out_38<0> ;
  wire \sram.bitcell_out_38<1> ;
  wire \sram.bitcell_out_38<2> ;
  wire \sram.bitcell_out_38<3> ;
  wire \sram.bitcell_out_39<0> ;
  wire \sram.bitcell_out_39<1> ;
  wire \sram.bitcell_out_39<2> ;
  wire \sram.bitcell_out_39<3> ;
  wire \sram.bitcell_out_3<0> ;
  wire \sram.bitcell_out_3<1> ;
  wire \sram.bitcell_out_3<2> ;
  wire \sram.bitcell_out_3<3> ;
  wire \sram.bitcell_out_40<0> ;
  wire \sram.bitcell_out_40<1> ;
  wire \sram.bitcell_out_40<2> ;
  wire \sram.bitcell_out_40<3> ;
  wire \sram.bitcell_out_41<0> ;
  wire \sram.bitcell_out_41<1> ;
  wire \sram.bitcell_out_41<2> ;
  wire \sram.bitcell_out_41<3> ;
  wire \sram.bitcell_out_42<0> ;
  wire \sram.bitcell_out_42<1> ;
  wire \sram.bitcell_out_42<2> ;
  wire \sram.bitcell_out_42<3> ;
  wire \sram.bitcell_out_43<0> ;
  wire \sram.bitcell_out_43<1> ;
  wire \sram.bitcell_out_43<2> ;
  wire \sram.bitcell_out_43<3> ;
  wire \sram.bitcell_out_44<0> ;
  wire \sram.bitcell_out_44<1> ;
  wire \sram.bitcell_out_44<2> ;
  wire \sram.bitcell_out_44<3> ;
  wire \sram.bitcell_out_45<0> ;
  wire \sram.bitcell_out_45<1> ;
  wire \sram.bitcell_out_45<2> ;
  wire \sram.bitcell_out_45<3> ;
  wire \sram.bitcell_out_46<0> ;
  wire \sram.bitcell_out_46<1> ;
  wire \sram.bitcell_out_46<2> ;
  wire \sram.bitcell_out_46<3> ;
  wire \sram.bitcell_out_47<0> ;
  wire \sram.bitcell_out_47<1> ;
  wire \sram.bitcell_out_47<2> ;
  wire \sram.bitcell_out_47<3> ;
  wire \sram.bitcell_out_48<0> ;
  wire \sram.bitcell_out_48<1> ;
  wire \sram.bitcell_out_48<2> ;
  wire \sram.bitcell_out_48<3> ;
  wire \sram.bitcell_out_49<0> ;
  wire \sram.bitcell_out_49<1> ;
  wire \sram.bitcell_out_49<2> ;
  wire \sram.bitcell_out_49<3> ;
  wire \sram.bitcell_out_4<0> ;
  wire \sram.bitcell_out_4<1> ;
  wire \sram.bitcell_out_4<2> ;
  wire \sram.bitcell_out_4<3> ;
  wire \sram.bitcell_out_50<0> ;
  wire \sram.bitcell_out_50<1> ;
  wire \sram.bitcell_out_50<2> ;
  wire \sram.bitcell_out_50<3> ;
  wire \sram.bitcell_out_51<0> ;
  wire \sram.bitcell_out_51<1> ;
  wire \sram.bitcell_out_51<2> ;
  wire \sram.bitcell_out_51<3> ;
  wire \sram.bitcell_out_52<0> ;
  wire \sram.bitcell_out_52<1> ;
  wire \sram.bitcell_out_52<2> ;
  wire \sram.bitcell_out_52<3> ;
  wire \sram.bitcell_out_53<0> ;
  wire \sram.bitcell_out_53<1> ;
  wire \sram.bitcell_out_53<2> ;
  wire \sram.bitcell_out_53<3> ;
  wire \sram.bitcell_out_54<0> ;
  wire \sram.bitcell_out_54<1> ;
  wire \sram.bitcell_out_54<2> ;
  wire \sram.bitcell_out_54<3> ;
  wire \sram.bitcell_out_55<0> ;
  wire \sram.bitcell_out_55<1> ;
  wire \sram.bitcell_out_55<2> ;
  wire \sram.bitcell_out_55<3> ;
  wire \sram.bitcell_out_56<0> ;
  wire \sram.bitcell_out_56<1> ;
  wire \sram.bitcell_out_56<2> ;
  wire \sram.bitcell_out_56<3> ;
  wire \sram.bitcell_out_57<0> ;
  wire \sram.bitcell_out_57<1> ;
  wire \sram.bitcell_out_57<2> ;
  wire \sram.bitcell_out_57<3> ;
  wire \sram.bitcell_out_58<0> ;
  wire \sram.bitcell_out_58<1> ;
  wire \sram.bitcell_out_58<2> ;
  wire \sram.bitcell_out_58<3> ;
  wire \sram.bitcell_out_59<0> ;
  wire \sram.bitcell_out_59<1> ;
  wire \sram.bitcell_out_59<2> ;
  wire \sram.bitcell_out_59<3> ;
  wire \sram.bitcell_out_5<0> ;
  wire \sram.bitcell_out_5<1> ;
  wire \sram.bitcell_out_5<2> ;
  wire \sram.bitcell_out_5<3> ;
  wire \sram.bitcell_out_60<0> ;
  wire \sram.bitcell_out_60<1> ;
  wire \sram.bitcell_out_60<2> ;
  wire \sram.bitcell_out_60<3> ;
  wire \sram.bitcell_out_61<0> ;
  wire \sram.bitcell_out_61<1> ;
  wire \sram.bitcell_out_61<2> ;
  wire \sram.bitcell_out_61<3> ;
  wire \sram.bitcell_out_62<0> ;
  wire \sram.bitcell_out_62<1> ;
  wire \sram.bitcell_out_62<2> ;
  wire \sram.bitcell_out_62<3> ;
  wire \sram.bitcell_out_63<0> ;
  wire \sram.bitcell_out_63<1> ;
  wire \sram.bitcell_out_63<2> ;
  wire \sram.bitcell_out_63<3> ;
  wire \sram.bitcell_out_6<0> ;
  wire \sram.bitcell_out_6<1> ;
  wire \sram.bitcell_out_6<2> ;
  wire \sram.bitcell_out_6<3> ;
  wire \sram.bitcell_out_7<0> ;
  wire \sram.bitcell_out_7<1> ;
  wire \sram.bitcell_out_7<2> ;
  wire \sram.bitcell_out_7<3> ;
  wire \sram.bitcell_out_8<0> ;
  wire \sram.bitcell_out_8<1> ;
  wire \sram.bitcell_out_8<2> ;
  wire \sram.bitcell_out_8<3> ;
  wire \sram.bitcell_out_9<0> ;
  wire \sram.bitcell_out_9<1> ;
  wire \sram.bitcell_out_9<2> ;
  wire \sram.bitcell_out_9<3> ;
  wire \sram.bl<0> ;
  wire \sram.bl<1> ;
  wire \sram.bl<2> ;
  wire \sram.bl<3> ;
  wire \sram.bl_b<0> ;
  wire \sram.bl_b<1> ;
  wire \sram.bl_b<2> ;
  wire \sram.bl_b<3> ;
  wire \sram.in_b<0> ;
  wire \sram.in_b<10> ;
  wire \sram.in_b<11> ;
  wire \sram.in_b<12> ;
  wire \sram.in_b<13> ;
  wire \sram.in_b<14> ;
  wire \sram.in_b<15> ;
  wire \sram.in_b<16> ;
  wire \sram.in_b<17> ;
  wire \sram.in_b<18> ;
  wire \sram.in_b<19> ;
  wire \sram.in_b<1> ;
  wire \sram.in_b<20> ;
  wire \sram.in_b<21> ;
  wire \sram.in_b<22> ;
  wire \sram.in_b<23> ;
  wire \sram.in_b<24> ;
  wire \sram.in_b<25> ;
  wire \sram.in_b<26> ;
  wire \sram.in_b<27> ;
  wire \sram.in_b<28> ;
  wire \sram.in_b<29> ;
  wire \sram.in_b<2> ;
  wire \sram.in_b<30> ;
  wire \sram.in_b<31> ;
  wire \sram.in_b<32> ;
  wire \sram.in_b<33> ;
  wire \sram.in_b<34> ;
  wire \sram.in_b<35> ;
  wire \sram.in_b<36> ;
  wire \sram.in_b<37> ;
  wire \sram.in_b<38> ;
  wire \sram.in_b<39> ;
  wire \sram.in_b<3> ;
  wire \sram.in_b<40> ;
  wire \sram.in_b<41> ;
  wire \sram.in_b<42> ;
  wire \sram.in_b<43> ;
  wire \sram.in_b<44> ;
  wire \sram.in_b<45> ;
  wire \sram.in_b<46> ;
  wire \sram.in_b<47> ;
  wire \sram.in_b<48> ;
  wire \sram.in_b<49> ;
  wire \sram.in_b<4> ;
  wire \sram.in_b<50> ;
  wire \sram.in_b<51> ;
  wire \sram.in_b<52> ;
  wire \sram.in_b<53> ;
  wire \sram.in_b<54> ;
  wire \sram.in_b<55> ;
  wire \sram.in_b<56> ;
  wire \sram.in_b<57> ;
  wire \sram.in_b<58> ;
  wire \sram.in_b<59> ;
  wire \sram.in_b<5> ;
  wire \sram.in_b<60> ;
  wire \sram.in_b<61> ;
  wire \sram.in_b<62> ;
  wire \sram.in_b<63> ;
  wire \sram.in_b<6> ;
  wire \sram.in_b<7> ;
  wire \sram.in_b<8> ;
  wire \sram.in_b<9> ;
  wire \sram.wl<0> ;
  wire \sram.wl<10> ;
  wire \sram.wl<11> ;
  wire \sram.wl<12> ;
  wire \sram.wl<13> ;
  wire \sram.wl<14> ;
  wire \sram.wl<15> ;
  wire \sram.wl<16> ;
  wire \sram.wl<17> ;
  wire \sram.wl<18> ;
  wire \sram.wl<19> ;
  wire \sram.wl<1> ;
  wire \sram.wl<20> ;
  wire \sram.wl<21> ;
  wire \sram.wl<22> ;
  wire \sram.wl<23> ;
  wire \sram.wl<24> ;
  wire \sram.wl<25> ;
  wire \sram.wl<26> ;
  wire \sram.wl<27> ;
  wire \sram.wl<28> ;
  wire \sram.wl<29> ;
  wire \sram.wl<2> ;
  wire \sram.wl<30> ;
  wire \sram.wl<31> ;
  wire \sram.wl<32> ;
  wire \sram.wl<33> ;
  wire \sram.wl<34> ;
  wire \sram.wl<35> ;
  wire \sram.wl<36> ;
  wire \sram.wl<37> ;
  wire \sram.wl<38> ;
  wire \sram.wl<39> ;
  wire \sram.wl<3> ;
  wire \sram.wl<40> ;
  wire \sram.wl<41> ;
  wire \sram.wl<42> ;
  wire \sram.wl<43> ;
  wire \sram.wl<44> ;
  wire \sram.wl<45> ;
  wire \sram.wl<46> ;
  wire \sram.wl<47> ;
  wire \sram.wl<48> ;
  wire \sram.wl<49> ;
  wire \sram.wl<4> ;
  wire \sram.wl<50> ;
  wire \sram.wl<51> ;
  wire \sram.wl<52> ;
  wire \sram.wl<53> ;
  wire \sram.wl<54> ;
  wire \sram.wl<55> ;
  wire \sram.wl<56> ;
  wire \sram.wl<57> ;
  wire \sram.wl<58> ;
  wire \sram.wl<59> ;
  wire \sram.wl<5> ;
  wire \sram.wl<60> ;
  wire \sram.wl<61> ;
  wire \sram.wl<62> ;
  wire \sram.wl<63> ;
  wire \sram.wl<6> ;
  wire \sram.wl<7> ;
  wire \sram.wl<8> ;
  wire \sram.wl<9> ;
  wire \sram_rw.bl<0> ;
  wire \sram_rw.bl<1> ;
  wire \sram_rw.bl<2> ;
  wire \sram_rw.bl<3> ;
  wire \sram_rw.bl_b<0> ;
  wire \sram_rw.bl_b<1> ;
  wire \sram_rw.bl_b<2> ;
  wire \sram_rw.bl_b<3> ;
  wire \sram_rw.din<0> ;
  wire \sram_rw.din<1> ;
  wire \sram_rw.din<2> ;
  wire \sram_rw.din<3> ;
  wire \sram_rw.dout<0> ;
  wire \sram_rw.dout<1> ;
  wire \sram_rw.dout<2> ;
  wire \sram_rw.dout<3> ;
  wire \sram_rw.pe ;
  wire \sram_rw.se ;
  wire \sram_rw.spe ;
  wire \sram_rw.ysr ;
  wire \sram_rw.ysw ;
  input \wl<0> ;
  input \wl<10> ;
  input \wl<11> ;
  input \wl<12> ;
  input \wl<13> ;
  input \wl<14> ;
  input \wl<15> ;
  input \wl<16> ;
  input \wl<17> ;
  input \wl<18> ;
  input \wl<19> ;
  input \wl<1> ;
  input \wl<20> ;
  input \wl<21> ;
  input \wl<22> ;
  input \wl<23> ;
  input \wl<24> ;
  input \wl<25> ;
  input \wl<26> ;
  input \wl<27> ;
  input \wl<28> ;
  input \wl<29> ;
  input \wl<2> ;
  input \wl<30> ;
  input \wl<31> ;
  input \wl<32> ;
  input \wl<33> ;
  input \wl<34> ;
  input \wl<35> ;
  input \wl<36> ;
  input \wl<37> ;
  input \wl<38> ;
  input \wl<39> ;
  input \wl<3> ;
  input \wl<40> ;
  input \wl<41> ;
  input \wl<42> ;
  input \wl<43> ;
  input \wl<44> ;
  input \wl<45> ;
  input \wl<46> ;
  input \wl<47> ;
  input \wl<48> ;
  input \wl<49> ;
  input \wl<4> ;
  input \wl<50> ;
  input \wl<51> ;
  input \wl<52> ;
  input \wl<53> ;
  input \wl<54> ;
  input \wl<55> ;
  input \wl<56> ;
  input \wl<57> ;
  input \wl<58> ;
  input \wl<59> ;
  input \wl<5> ;
  input \wl<60> ;
  input \wl<61> ;
  input \wl<62> ;
  input \wl<63> ;
  input \wl<6> ;
  input \wl<7> ;
  input \wl<8> ;
  input \wl<9> ;
  input ysr;
  input ysw;
  dcim_bitcell \sram.bitcell_0_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<0> ),    .out(\sram.bitcell_out_0<0> ),    .wl(\wl<0> )
  );
  dcim_bitcell \sram.bitcell_0_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<0> ),    .out(\sram.bitcell_out_0<1> ),    .wl(\wl<0> )
  );
  dcim_bitcell \sram.bitcell_0_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<0> ),    .out(\sram.bitcell_out_0<2> ),    .wl(\wl<0> )
  );
  dcim_bitcell \sram.bitcell_0_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<0> ),    .out(\sram.bitcell_out_0<3> ),    .wl(\wl<0> )
  );
  dcim_bitcell \sram.bitcell_10_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<10> ),    .out(\sram.bitcell_out_10<0> ),    .wl(\wl<10> )
  );
  dcim_bitcell \sram.bitcell_10_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<10> ),    .out(\sram.bitcell_out_10<1> ),    .wl(\wl<10> )
  );
  dcim_bitcell \sram.bitcell_10_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<10> ),    .out(\sram.bitcell_out_10<2> ),    .wl(\wl<10> )
  );
  dcim_bitcell \sram.bitcell_10_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<10> ),    .out(\sram.bitcell_out_10<3> ),    .wl(\wl<10> )
  );
  dcim_bitcell \sram.bitcell_11_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<11> ),    .out(\sram.bitcell_out_11<0> ),    .wl(\wl<11> )
  );
  dcim_bitcell \sram.bitcell_11_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<11> ),    .out(\sram.bitcell_out_11<1> ),    .wl(\wl<11> )
  );
  dcim_bitcell \sram.bitcell_11_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<11> ),    .out(\sram.bitcell_out_11<2> ),    .wl(\wl<11> )
  );
  dcim_bitcell \sram.bitcell_11_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<11> ),    .out(\sram.bitcell_out_11<3> ),    .wl(\wl<11> )
  );
  dcim_bitcell \sram.bitcell_12_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<12> ),    .out(\sram.bitcell_out_12<0> ),    .wl(\wl<12> )
  );
  dcim_bitcell \sram.bitcell_12_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<12> ),    .out(\sram.bitcell_out_12<1> ),    .wl(\wl<12> )
  );
  dcim_bitcell \sram.bitcell_12_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<12> ),    .out(\sram.bitcell_out_12<2> ),    .wl(\wl<12> )
  );
  dcim_bitcell \sram.bitcell_12_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<12> ),    .out(\sram.bitcell_out_12<3> ),    .wl(\wl<12> )
  );
  dcim_bitcell \sram.bitcell_13_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<13> ),    .out(\sram.bitcell_out_13<0> ),    .wl(\wl<13> )
  );
  dcim_bitcell \sram.bitcell_13_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<13> ),    .out(\sram.bitcell_out_13<1> ),    .wl(\wl<13> )
  );
  dcim_bitcell \sram.bitcell_13_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<13> ),    .out(\sram.bitcell_out_13<2> ),    .wl(\wl<13> )
  );
  dcim_bitcell \sram.bitcell_13_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<13> ),    .out(\sram.bitcell_out_13<3> ),    .wl(\wl<13> )
  );
  dcim_bitcell \sram.bitcell_14_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<14> ),    .out(\sram.bitcell_out_14<0> ),    .wl(\wl<14> )
  );
  dcim_bitcell \sram.bitcell_14_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<14> ),    .out(\sram.bitcell_out_14<1> ),    .wl(\wl<14> )
  );
  dcim_bitcell \sram.bitcell_14_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<14> ),    .out(\sram.bitcell_out_14<2> ),    .wl(\wl<14> )
  );
  dcim_bitcell \sram.bitcell_14_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<14> ),    .out(\sram.bitcell_out_14<3> ),    .wl(\wl<14> )
  );
  dcim_bitcell \sram.bitcell_15_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<15> ),    .out(\sram.bitcell_out_15<0> ),    .wl(\wl<15> )
  );
  dcim_bitcell \sram.bitcell_15_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<15> ),    .out(\sram.bitcell_out_15<1> ),    .wl(\wl<15> )
  );
  dcim_bitcell \sram.bitcell_15_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<15> ),    .out(\sram.bitcell_out_15<2> ),    .wl(\wl<15> )
  );
  dcim_bitcell \sram.bitcell_15_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<15> ),    .out(\sram.bitcell_out_15<3> ),    .wl(\wl<15> )
  );
  dcim_bitcell \sram.bitcell_16_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<16> ),    .out(\sram.bitcell_out_16<0> ),    .wl(\wl<16> )
  );
  dcim_bitcell \sram.bitcell_16_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<16> ),    .out(\sram.bitcell_out_16<1> ),    .wl(\wl<16> )
  );
  dcim_bitcell \sram.bitcell_16_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<16> ),    .out(\sram.bitcell_out_16<2> ),    .wl(\wl<16> )
  );
  dcim_bitcell \sram.bitcell_16_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<16> ),    .out(\sram.bitcell_out_16<3> ),    .wl(\wl<16> )
  );
  dcim_bitcell \sram.bitcell_17_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<17> ),    .out(\sram.bitcell_out_17<0> ),    .wl(\wl<17> )
  );
  dcim_bitcell \sram.bitcell_17_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<17> ),    .out(\sram.bitcell_out_17<1> ),    .wl(\wl<17> )
  );
  dcim_bitcell \sram.bitcell_17_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<17> ),    .out(\sram.bitcell_out_17<2> ),    .wl(\wl<17> )
  );
  dcim_bitcell \sram.bitcell_17_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<17> ),    .out(\sram.bitcell_out_17<3> ),    .wl(\wl<17> )
  );
  dcim_bitcell \sram.bitcell_18_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<18> ),    .out(\sram.bitcell_out_18<0> ),    .wl(\wl<18> )
  );
  dcim_bitcell \sram.bitcell_18_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<18> ),    .out(\sram.bitcell_out_18<1> ),    .wl(\wl<18> )
  );
  dcim_bitcell \sram.bitcell_18_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<18> ),    .out(\sram.bitcell_out_18<2> ),    .wl(\wl<18> )
  );
  dcim_bitcell \sram.bitcell_18_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<18> ),    .out(\sram.bitcell_out_18<3> ),    .wl(\wl<18> )
  );
  dcim_bitcell \sram.bitcell_19_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<19> ),    .out(\sram.bitcell_out_19<0> ),    .wl(\wl<19> )
  );
  dcim_bitcell \sram.bitcell_19_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<19> ),    .out(\sram.bitcell_out_19<1> ),    .wl(\wl<19> )
  );
  dcim_bitcell \sram.bitcell_19_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<19> ),    .out(\sram.bitcell_out_19<2> ),    .wl(\wl<19> )
  );
  dcim_bitcell \sram.bitcell_19_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<19> ),    .out(\sram.bitcell_out_19<3> ),    .wl(\wl<19> )
  );
  dcim_bitcell \sram.bitcell_1_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<1> ),    .out(\sram.bitcell_out_1<0> ),    .wl(\wl<1> )
  );
  dcim_bitcell \sram.bitcell_1_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<1> ),    .out(\sram.bitcell_out_1<1> ),    .wl(\wl<1> )
  );
  dcim_bitcell \sram.bitcell_1_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<1> ),    .out(\sram.bitcell_out_1<2> ),    .wl(\wl<1> )
  );
  dcim_bitcell \sram.bitcell_1_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<1> ),    .out(\sram.bitcell_out_1<3> ),    .wl(\wl<1> )
  );
  dcim_bitcell \sram.bitcell_20_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<20> ),    .out(\sram.bitcell_out_20<0> ),    .wl(\wl<20> )
  );
  dcim_bitcell \sram.bitcell_20_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<20> ),    .out(\sram.bitcell_out_20<1> ),    .wl(\wl<20> )
  );
  dcim_bitcell \sram.bitcell_20_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<20> ),    .out(\sram.bitcell_out_20<2> ),    .wl(\wl<20> )
  );
  dcim_bitcell \sram.bitcell_20_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<20> ),    .out(\sram.bitcell_out_20<3> ),    .wl(\wl<20> )
  );
  dcim_bitcell \sram.bitcell_21_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<21> ),    .out(\sram.bitcell_out_21<0> ),    .wl(\wl<21> )
  );
  dcim_bitcell \sram.bitcell_21_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<21> ),    .out(\sram.bitcell_out_21<1> ),    .wl(\wl<21> )
  );
  dcim_bitcell \sram.bitcell_21_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<21> ),    .out(\sram.bitcell_out_21<2> ),    .wl(\wl<21> )
  );
  dcim_bitcell \sram.bitcell_21_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<21> ),    .out(\sram.bitcell_out_21<3> ),    .wl(\wl<21> )
  );
  dcim_bitcell \sram.bitcell_22_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<22> ),    .out(\sram.bitcell_out_22<0> ),    .wl(\wl<22> )
  );
  dcim_bitcell \sram.bitcell_22_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<22> ),    .out(\sram.bitcell_out_22<1> ),    .wl(\wl<22> )
  );
  dcim_bitcell \sram.bitcell_22_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<22> ),    .out(\sram.bitcell_out_22<2> ),    .wl(\wl<22> )
  );
  dcim_bitcell \sram.bitcell_22_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<22> ),    .out(\sram.bitcell_out_22<3> ),    .wl(\wl<22> )
  );
  dcim_bitcell \sram.bitcell_23_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<23> ),    .out(\sram.bitcell_out_23<0> ),    .wl(\wl<23> )
  );
  dcim_bitcell \sram.bitcell_23_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<23> ),    .out(\sram.bitcell_out_23<1> ),    .wl(\wl<23> )
  );
  dcim_bitcell \sram.bitcell_23_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<23> ),    .out(\sram.bitcell_out_23<2> ),    .wl(\wl<23> )
  );
  dcim_bitcell \sram.bitcell_23_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<23> ),    .out(\sram.bitcell_out_23<3> ),    .wl(\wl<23> )
  );
  dcim_bitcell \sram.bitcell_24_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<24> ),    .out(\sram.bitcell_out_24<0> ),    .wl(\wl<24> )
  );
  dcim_bitcell \sram.bitcell_24_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<24> ),    .out(\sram.bitcell_out_24<1> ),    .wl(\wl<24> )
  );
  dcim_bitcell \sram.bitcell_24_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<24> ),    .out(\sram.bitcell_out_24<2> ),    .wl(\wl<24> )
  );
  dcim_bitcell \sram.bitcell_24_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<24> ),    .out(\sram.bitcell_out_24<3> ),    .wl(\wl<24> )
  );
  dcim_bitcell \sram.bitcell_25_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<25> ),    .out(\sram.bitcell_out_25<0> ),    .wl(\wl<25> )
  );
  dcim_bitcell \sram.bitcell_25_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<25> ),    .out(\sram.bitcell_out_25<1> ),    .wl(\wl<25> )
  );
  dcim_bitcell \sram.bitcell_25_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<25> ),    .out(\sram.bitcell_out_25<2> ),    .wl(\wl<25> )
  );
  dcim_bitcell \sram.bitcell_25_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<25> ),    .out(\sram.bitcell_out_25<3> ),    .wl(\wl<25> )
  );
  dcim_bitcell \sram.bitcell_26_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<26> ),    .out(\sram.bitcell_out_26<0> ),    .wl(\wl<26> )
  );
  dcim_bitcell \sram.bitcell_26_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<26> ),    .out(\sram.bitcell_out_26<1> ),    .wl(\wl<26> )
  );
  dcim_bitcell \sram.bitcell_26_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<26> ),    .out(\sram.bitcell_out_26<2> ),    .wl(\wl<26> )
  );
  dcim_bitcell \sram.bitcell_26_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<26> ),    .out(\sram.bitcell_out_26<3> ),    .wl(\wl<26> )
  );
  dcim_bitcell \sram.bitcell_27_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<27> ),    .out(\sram.bitcell_out_27<0> ),    .wl(\wl<27> )
  );
  dcim_bitcell \sram.bitcell_27_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<27> ),    .out(\sram.bitcell_out_27<1> ),    .wl(\wl<27> )
  );
  dcim_bitcell \sram.bitcell_27_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<27> ),    .out(\sram.bitcell_out_27<2> ),    .wl(\wl<27> )
  );
  dcim_bitcell \sram.bitcell_27_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<27> ),    .out(\sram.bitcell_out_27<3> ),    .wl(\wl<27> )
  );
  dcim_bitcell \sram.bitcell_28_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<28> ),    .out(\sram.bitcell_out_28<0> ),    .wl(\wl<28> )
  );
  dcim_bitcell \sram.bitcell_28_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<28> ),    .out(\sram.bitcell_out_28<1> ),    .wl(\wl<28> )
  );
  dcim_bitcell \sram.bitcell_28_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<28> ),    .out(\sram.bitcell_out_28<2> ),    .wl(\wl<28> )
  );
  dcim_bitcell \sram.bitcell_28_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<28> ),    .out(\sram.bitcell_out_28<3> ),    .wl(\wl<28> )
  );
  dcim_bitcell \sram.bitcell_29_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<29> ),    .out(\sram.bitcell_out_29<0> ),    .wl(\wl<29> )
  );
  dcim_bitcell \sram.bitcell_29_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<29> ),    .out(\sram.bitcell_out_29<1> ),    .wl(\wl<29> )
  );
  dcim_bitcell \sram.bitcell_29_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<29> ),    .out(\sram.bitcell_out_29<2> ),    .wl(\wl<29> )
  );
  dcim_bitcell \sram.bitcell_29_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<29> ),    .out(\sram.bitcell_out_29<3> ),    .wl(\wl<29> )
  );
  dcim_bitcell \sram.bitcell_2_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<2> ),    .out(\sram.bitcell_out_2<0> ),    .wl(\wl<2> )
  );
  dcim_bitcell \sram.bitcell_2_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<2> ),    .out(\sram.bitcell_out_2<1> ),    .wl(\wl<2> )
  );
  dcim_bitcell \sram.bitcell_2_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<2> ),    .out(\sram.bitcell_out_2<2> ),    .wl(\wl<2> )
  );
  dcim_bitcell \sram.bitcell_2_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<2> ),    .out(\sram.bitcell_out_2<3> ),    .wl(\wl<2> )
  );
  dcim_bitcell \sram.bitcell_30_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<30> ),    .out(\sram.bitcell_out_30<0> ),    .wl(\wl<30> )
  );
  dcim_bitcell \sram.bitcell_30_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<30> ),    .out(\sram.bitcell_out_30<1> ),    .wl(\wl<30> )
  );
  dcim_bitcell \sram.bitcell_30_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<30> ),    .out(\sram.bitcell_out_30<2> ),    .wl(\wl<30> )
  );
  dcim_bitcell \sram.bitcell_30_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<30> ),    .out(\sram.bitcell_out_30<3> ),    .wl(\wl<30> )
  );
  dcim_bitcell \sram.bitcell_31_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<31> ),    .out(\sram.bitcell_out_31<0> ),    .wl(\wl<31> )
  );
  dcim_bitcell \sram.bitcell_31_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<31> ),    .out(\sram.bitcell_out_31<1> ),    .wl(\wl<31> )
  );
  dcim_bitcell \sram.bitcell_31_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<31> ),    .out(\sram.bitcell_out_31<2> ),    .wl(\wl<31> )
  );
  dcim_bitcell \sram.bitcell_31_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<31> ),    .out(\sram.bitcell_out_31<3> ),    .wl(\wl<31> )
  );
  dcim_bitcell \sram.bitcell_32_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<32> ),    .out(\sram.bitcell_out_32<0> ),    .wl(\wl<32> )
  );
  dcim_bitcell \sram.bitcell_32_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<32> ),    .out(\sram.bitcell_out_32<1> ),    .wl(\wl<32> )
  );
  dcim_bitcell \sram.bitcell_32_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<32> ),    .out(\sram.bitcell_out_32<2> ),    .wl(\wl<32> )
  );
  dcim_bitcell \sram.bitcell_32_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<32> ),    .out(\sram.bitcell_out_32<3> ),    .wl(\wl<32> )
  );
  dcim_bitcell \sram.bitcell_33_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<33> ),    .out(\sram.bitcell_out_33<0> ),    .wl(\wl<33> )
  );
  dcim_bitcell \sram.bitcell_33_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<33> ),    .out(\sram.bitcell_out_33<1> ),    .wl(\wl<33> )
  );
  dcim_bitcell \sram.bitcell_33_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<33> ),    .out(\sram.bitcell_out_33<2> ),    .wl(\wl<33> )
  );
  dcim_bitcell \sram.bitcell_33_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<33> ),    .out(\sram.bitcell_out_33<3> ),    .wl(\wl<33> )
  );
  dcim_bitcell \sram.bitcell_34_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<34> ),    .out(\sram.bitcell_out_34<0> ),    .wl(\wl<34> )
  );
  dcim_bitcell \sram.bitcell_34_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<34> ),    .out(\sram.bitcell_out_34<1> ),    .wl(\wl<34> )
  );
  dcim_bitcell \sram.bitcell_34_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<34> ),    .out(\sram.bitcell_out_34<2> ),    .wl(\wl<34> )
  );
  dcim_bitcell \sram.bitcell_34_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<34> ),    .out(\sram.bitcell_out_34<3> ),    .wl(\wl<34> )
  );
  dcim_bitcell \sram.bitcell_35_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<35> ),    .out(\sram.bitcell_out_35<0> ),    .wl(\wl<35> )
  );
  dcim_bitcell \sram.bitcell_35_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<35> ),    .out(\sram.bitcell_out_35<1> ),    .wl(\wl<35> )
  );
  dcim_bitcell \sram.bitcell_35_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<35> ),    .out(\sram.bitcell_out_35<2> ),    .wl(\wl<35> )
  );
  dcim_bitcell \sram.bitcell_35_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<35> ),    .out(\sram.bitcell_out_35<3> ),    .wl(\wl<35> )
  );
  dcim_bitcell \sram.bitcell_36_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<36> ),    .out(\sram.bitcell_out_36<0> ),    .wl(\wl<36> )
  );
  dcim_bitcell \sram.bitcell_36_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<36> ),    .out(\sram.bitcell_out_36<1> ),    .wl(\wl<36> )
  );
  dcim_bitcell \sram.bitcell_36_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<36> ),    .out(\sram.bitcell_out_36<2> ),    .wl(\wl<36> )
  );
  dcim_bitcell \sram.bitcell_36_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<36> ),    .out(\sram.bitcell_out_36<3> ),    .wl(\wl<36> )
  );
  dcim_bitcell \sram.bitcell_37_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<37> ),    .out(\sram.bitcell_out_37<0> ),    .wl(\wl<37> )
  );
  dcim_bitcell \sram.bitcell_37_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<37> ),    .out(\sram.bitcell_out_37<1> ),    .wl(\wl<37> )
  );
  dcim_bitcell \sram.bitcell_37_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<37> ),    .out(\sram.bitcell_out_37<2> ),    .wl(\wl<37> )
  );
  dcim_bitcell \sram.bitcell_37_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<37> ),    .out(\sram.bitcell_out_37<3> ),    .wl(\wl<37> )
  );
  dcim_bitcell \sram.bitcell_38_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<38> ),    .out(\sram.bitcell_out_38<0> ),    .wl(\wl<38> )
  );
  dcim_bitcell \sram.bitcell_38_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<38> ),    .out(\sram.bitcell_out_38<1> ),    .wl(\wl<38> )
  );
  dcim_bitcell \sram.bitcell_38_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<38> ),    .out(\sram.bitcell_out_38<2> ),    .wl(\wl<38> )
  );
  dcim_bitcell \sram.bitcell_38_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<38> ),    .out(\sram.bitcell_out_38<3> ),    .wl(\wl<38> )
  );
  dcim_bitcell \sram.bitcell_39_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<39> ),    .out(\sram.bitcell_out_39<0> ),    .wl(\wl<39> )
  );
  dcim_bitcell \sram.bitcell_39_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<39> ),    .out(\sram.bitcell_out_39<1> ),    .wl(\wl<39> )
  );
  dcim_bitcell \sram.bitcell_39_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<39> ),    .out(\sram.bitcell_out_39<2> ),    .wl(\wl<39> )
  );
  dcim_bitcell \sram.bitcell_39_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<39> ),    .out(\sram.bitcell_out_39<3> ),    .wl(\wl<39> )
  );
  dcim_bitcell \sram.bitcell_3_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<3> ),    .out(\sram.bitcell_out_3<0> ),    .wl(\wl<3> )
  );
  dcim_bitcell \sram.bitcell_3_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<3> ),    .out(\sram.bitcell_out_3<1> ),    .wl(\wl<3> )
  );
  dcim_bitcell \sram.bitcell_3_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<3> ),    .out(\sram.bitcell_out_3<2> ),    .wl(\wl<3> )
  );
  dcim_bitcell \sram.bitcell_3_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<3> ),    .out(\sram.bitcell_out_3<3> ),    .wl(\wl<3> )
  );
  dcim_bitcell \sram.bitcell_40_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<40> ),    .out(\sram.bitcell_out_40<0> ),    .wl(\wl<40> )
  );
  dcim_bitcell \sram.bitcell_40_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<40> ),    .out(\sram.bitcell_out_40<1> ),    .wl(\wl<40> )
  );
  dcim_bitcell \sram.bitcell_40_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<40> ),    .out(\sram.bitcell_out_40<2> ),    .wl(\wl<40> )
  );
  dcim_bitcell \sram.bitcell_40_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<40> ),    .out(\sram.bitcell_out_40<3> ),    .wl(\wl<40> )
  );
  dcim_bitcell \sram.bitcell_41_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<41> ),    .out(\sram.bitcell_out_41<0> ),    .wl(\wl<41> )
  );
  dcim_bitcell \sram.bitcell_41_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<41> ),    .out(\sram.bitcell_out_41<1> ),    .wl(\wl<41> )
  );
  dcim_bitcell \sram.bitcell_41_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<41> ),    .out(\sram.bitcell_out_41<2> ),    .wl(\wl<41> )
  );
  dcim_bitcell \sram.bitcell_41_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<41> ),    .out(\sram.bitcell_out_41<3> ),    .wl(\wl<41> )
  );
  dcim_bitcell \sram.bitcell_42_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<42> ),    .out(\sram.bitcell_out_42<0> ),    .wl(\wl<42> )
  );
  dcim_bitcell \sram.bitcell_42_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<42> ),    .out(\sram.bitcell_out_42<1> ),    .wl(\wl<42> )
  );
  dcim_bitcell \sram.bitcell_42_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<42> ),    .out(\sram.bitcell_out_42<2> ),    .wl(\wl<42> )
  );
  dcim_bitcell \sram.bitcell_42_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<42> ),    .out(\sram.bitcell_out_42<3> ),    .wl(\wl<42> )
  );
  dcim_bitcell \sram.bitcell_43_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<43> ),    .out(\sram.bitcell_out_43<0> ),    .wl(\wl<43> )
  );
  dcim_bitcell \sram.bitcell_43_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<43> ),    .out(\sram.bitcell_out_43<1> ),    .wl(\wl<43> )
  );
  dcim_bitcell \sram.bitcell_43_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<43> ),    .out(\sram.bitcell_out_43<2> ),    .wl(\wl<43> )
  );
  dcim_bitcell \sram.bitcell_43_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<43> ),    .out(\sram.bitcell_out_43<3> ),    .wl(\wl<43> )
  );
  dcim_bitcell \sram.bitcell_44_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<44> ),    .out(\sram.bitcell_out_44<0> ),    .wl(\wl<44> )
  );
  dcim_bitcell \sram.bitcell_44_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<44> ),    .out(\sram.bitcell_out_44<1> ),    .wl(\wl<44> )
  );
  dcim_bitcell \sram.bitcell_44_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<44> ),    .out(\sram.bitcell_out_44<2> ),    .wl(\wl<44> )
  );
  dcim_bitcell \sram.bitcell_44_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<44> ),    .out(\sram.bitcell_out_44<3> ),    .wl(\wl<44> )
  );
  dcim_bitcell \sram.bitcell_45_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<45> ),    .out(\sram.bitcell_out_45<0> ),    .wl(\wl<45> )
  );
  dcim_bitcell \sram.bitcell_45_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<45> ),    .out(\sram.bitcell_out_45<1> ),    .wl(\wl<45> )
  );
  dcim_bitcell \sram.bitcell_45_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<45> ),    .out(\sram.bitcell_out_45<2> ),    .wl(\wl<45> )
  );
  dcim_bitcell \sram.bitcell_45_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<45> ),    .out(\sram.bitcell_out_45<3> ),    .wl(\wl<45> )
  );
  dcim_bitcell \sram.bitcell_46_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<46> ),    .out(\sram.bitcell_out_46<0> ),    .wl(\wl<46> )
  );
  dcim_bitcell \sram.bitcell_46_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<46> ),    .out(\sram.bitcell_out_46<1> ),    .wl(\wl<46> )
  );
  dcim_bitcell \sram.bitcell_46_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<46> ),    .out(\sram.bitcell_out_46<2> ),    .wl(\wl<46> )
  );
  dcim_bitcell \sram.bitcell_46_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<46> ),    .out(\sram.bitcell_out_46<3> ),    .wl(\wl<46> )
  );
  dcim_bitcell \sram.bitcell_47_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<47> ),    .out(\sram.bitcell_out_47<0> ),    .wl(\wl<47> )
  );
  dcim_bitcell \sram.bitcell_47_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<47> ),    .out(\sram.bitcell_out_47<1> ),    .wl(\wl<47> )
  );
  dcim_bitcell \sram.bitcell_47_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<47> ),    .out(\sram.bitcell_out_47<2> ),    .wl(\wl<47> )
  );
  dcim_bitcell \sram.bitcell_47_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<47> ),    .out(\sram.bitcell_out_47<3> ),    .wl(\wl<47> )
  );
  dcim_bitcell \sram.bitcell_48_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<48> ),    .out(\sram.bitcell_out_48<0> ),    .wl(\wl<48> )
  );
  dcim_bitcell \sram.bitcell_48_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<48> ),    .out(\sram.bitcell_out_48<1> ),    .wl(\wl<48> )
  );
  dcim_bitcell \sram.bitcell_48_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<48> ),    .out(\sram.bitcell_out_48<2> ),    .wl(\wl<48> )
  );
  dcim_bitcell \sram.bitcell_48_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<48> ),    .out(\sram.bitcell_out_48<3> ),    .wl(\wl<48> )
  );
  dcim_bitcell \sram.bitcell_49_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<49> ),    .out(\sram.bitcell_out_49<0> ),    .wl(\wl<49> )
  );
  dcim_bitcell \sram.bitcell_49_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<49> ),    .out(\sram.bitcell_out_49<1> ),    .wl(\wl<49> )
  );
  dcim_bitcell \sram.bitcell_49_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<49> ),    .out(\sram.bitcell_out_49<2> ),    .wl(\wl<49> )
  );
  dcim_bitcell \sram.bitcell_49_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<49> ),    .out(\sram.bitcell_out_49<3> ),    .wl(\wl<49> )
  );
  dcim_bitcell \sram.bitcell_4_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<4> ),    .out(\sram.bitcell_out_4<0> ),    .wl(\wl<4> )
  );
  dcim_bitcell \sram.bitcell_4_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<4> ),    .out(\sram.bitcell_out_4<1> ),    .wl(\wl<4> )
  );
  dcim_bitcell \sram.bitcell_4_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<4> ),    .out(\sram.bitcell_out_4<2> ),    .wl(\wl<4> )
  );
  dcim_bitcell \sram.bitcell_4_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<4> ),    .out(\sram.bitcell_out_4<3> ),    .wl(\wl<4> )
  );
  dcim_bitcell \sram.bitcell_50_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<50> ),    .out(\sram.bitcell_out_50<0> ),    .wl(\wl<50> )
  );
  dcim_bitcell \sram.bitcell_50_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<50> ),    .out(\sram.bitcell_out_50<1> ),    .wl(\wl<50> )
  );
  dcim_bitcell \sram.bitcell_50_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<50> ),    .out(\sram.bitcell_out_50<2> ),    .wl(\wl<50> )
  );
  dcim_bitcell \sram.bitcell_50_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<50> ),    .out(\sram.bitcell_out_50<3> ),    .wl(\wl<50> )
  );
  dcim_bitcell \sram.bitcell_51_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<51> ),    .out(\sram.bitcell_out_51<0> ),    .wl(\wl<51> )
  );
  dcim_bitcell \sram.bitcell_51_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<51> ),    .out(\sram.bitcell_out_51<1> ),    .wl(\wl<51> )
  );
  dcim_bitcell \sram.bitcell_51_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<51> ),    .out(\sram.bitcell_out_51<2> ),    .wl(\wl<51> )
  );
  dcim_bitcell \sram.bitcell_51_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<51> ),    .out(\sram.bitcell_out_51<3> ),    .wl(\wl<51> )
  );
  dcim_bitcell \sram.bitcell_52_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<52> ),    .out(\sram.bitcell_out_52<0> ),    .wl(\wl<52> )
  );
  dcim_bitcell \sram.bitcell_52_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<52> ),    .out(\sram.bitcell_out_52<1> ),    .wl(\wl<52> )
  );
  dcim_bitcell \sram.bitcell_52_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<52> ),    .out(\sram.bitcell_out_52<2> ),    .wl(\wl<52> )
  );
  dcim_bitcell \sram.bitcell_52_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<52> ),    .out(\sram.bitcell_out_52<3> ),    .wl(\wl<52> )
  );
  dcim_bitcell \sram.bitcell_53_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<53> ),    .out(\sram.bitcell_out_53<0> ),    .wl(\wl<53> )
  );
  dcim_bitcell \sram.bitcell_53_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<53> ),    .out(\sram.bitcell_out_53<1> ),    .wl(\wl<53> )
  );
  dcim_bitcell \sram.bitcell_53_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<53> ),    .out(\sram.bitcell_out_53<2> ),    .wl(\wl<53> )
  );
  dcim_bitcell \sram.bitcell_53_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<53> ),    .out(\sram.bitcell_out_53<3> ),    .wl(\wl<53> )
  );
  dcim_bitcell \sram.bitcell_54_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<54> ),    .out(\sram.bitcell_out_54<0> ),    .wl(\wl<54> )
  );
  dcim_bitcell \sram.bitcell_54_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<54> ),    .out(\sram.bitcell_out_54<1> ),    .wl(\wl<54> )
  );
  dcim_bitcell \sram.bitcell_54_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<54> ),    .out(\sram.bitcell_out_54<2> ),    .wl(\wl<54> )
  );
  dcim_bitcell \sram.bitcell_54_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<54> ),    .out(\sram.bitcell_out_54<3> ),    .wl(\wl<54> )
  );
  dcim_bitcell \sram.bitcell_55_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<55> ),    .out(\sram.bitcell_out_55<0> ),    .wl(\wl<55> )
  );
  dcim_bitcell \sram.bitcell_55_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<55> ),    .out(\sram.bitcell_out_55<1> ),    .wl(\wl<55> )
  );
  dcim_bitcell \sram.bitcell_55_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<55> ),    .out(\sram.bitcell_out_55<2> ),    .wl(\wl<55> )
  );
  dcim_bitcell \sram.bitcell_55_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<55> ),    .out(\sram.bitcell_out_55<3> ),    .wl(\wl<55> )
  );
  dcim_bitcell \sram.bitcell_56_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<56> ),    .out(\sram.bitcell_out_56<0> ),    .wl(\wl<56> )
  );
  dcim_bitcell \sram.bitcell_56_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<56> ),    .out(\sram.bitcell_out_56<1> ),    .wl(\wl<56> )
  );
  dcim_bitcell \sram.bitcell_56_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<56> ),    .out(\sram.bitcell_out_56<2> ),    .wl(\wl<56> )
  );
  dcim_bitcell \sram.bitcell_56_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<56> ),    .out(\sram.bitcell_out_56<3> ),    .wl(\wl<56> )
  );
  dcim_bitcell \sram.bitcell_57_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<57> ),    .out(\sram.bitcell_out_57<0> ),    .wl(\wl<57> )
  );
  dcim_bitcell \sram.bitcell_57_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<57> ),    .out(\sram.bitcell_out_57<1> ),    .wl(\wl<57> )
  );
  dcim_bitcell \sram.bitcell_57_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<57> ),    .out(\sram.bitcell_out_57<2> ),    .wl(\wl<57> )
  );
  dcim_bitcell \sram.bitcell_57_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<57> ),    .out(\sram.bitcell_out_57<3> ),    .wl(\wl<57> )
  );
  dcim_bitcell \sram.bitcell_58_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<58> ),    .out(\sram.bitcell_out_58<0> ),    .wl(\wl<58> )
  );
  dcim_bitcell \sram.bitcell_58_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<58> ),    .out(\sram.bitcell_out_58<1> ),    .wl(\wl<58> )
  );
  dcim_bitcell \sram.bitcell_58_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<58> ),    .out(\sram.bitcell_out_58<2> ),    .wl(\wl<58> )
  );
  dcim_bitcell \sram.bitcell_58_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<58> ),    .out(\sram.bitcell_out_58<3> ),    .wl(\wl<58> )
  );
  dcim_bitcell \sram.bitcell_59_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<59> ),    .out(\sram.bitcell_out_59<0> ),    .wl(\wl<59> )
  );
  dcim_bitcell \sram.bitcell_59_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<59> ),    .out(\sram.bitcell_out_59<1> ),    .wl(\wl<59> )
  );
  dcim_bitcell \sram.bitcell_59_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<59> ),    .out(\sram.bitcell_out_59<2> ),    .wl(\wl<59> )
  );
  dcim_bitcell \sram.bitcell_59_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<59> ),    .out(\sram.bitcell_out_59<3> ),    .wl(\wl<59> )
  );
  dcim_bitcell \sram.bitcell_5_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<5> ),    .out(\sram.bitcell_out_5<0> ),    .wl(\wl<5> )
  );
  dcim_bitcell \sram.bitcell_5_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<5> ),    .out(\sram.bitcell_out_5<1> ),    .wl(\wl<5> )
  );
  dcim_bitcell \sram.bitcell_5_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<5> ),    .out(\sram.bitcell_out_5<2> ),    .wl(\wl<5> )
  );
  dcim_bitcell \sram.bitcell_5_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<5> ),    .out(\sram.bitcell_out_5<3> ),    .wl(\wl<5> )
  );
  dcim_bitcell \sram.bitcell_60_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<60> ),    .out(\sram.bitcell_out_60<0> ),    .wl(\wl<60> )
  );
  dcim_bitcell \sram.bitcell_60_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<60> ),    .out(\sram.bitcell_out_60<1> ),    .wl(\wl<60> )
  );
  dcim_bitcell \sram.bitcell_60_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<60> ),    .out(\sram.bitcell_out_60<2> ),    .wl(\wl<60> )
  );
  dcim_bitcell \sram.bitcell_60_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<60> ),    .out(\sram.bitcell_out_60<3> ),    .wl(\wl<60> )
  );
  dcim_bitcell \sram.bitcell_61_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<61> ),    .out(\sram.bitcell_out_61<0> ),    .wl(\wl<61> )
  );
  dcim_bitcell \sram.bitcell_61_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<61> ),    .out(\sram.bitcell_out_61<1> ),    .wl(\wl<61> )
  );
  dcim_bitcell \sram.bitcell_61_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<61> ),    .out(\sram.bitcell_out_61<2> ),    .wl(\wl<61> )
  );
  dcim_bitcell \sram.bitcell_61_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<61> ),    .out(\sram.bitcell_out_61<3> ),    .wl(\wl<61> )
  );
  dcim_bitcell \sram.bitcell_62_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<62> ),    .out(\sram.bitcell_out_62<0> ),    .wl(\wl<62> )
  );
  dcim_bitcell \sram.bitcell_62_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<62> ),    .out(\sram.bitcell_out_62<1> ),    .wl(\wl<62> )
  );
  dcim_bitcell \sram.bitcell_62_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<62> ),    .out(\sram.bitcell_out_62<2> ),    .wl(\wl<62> )
  );
  dcim_bitcell \sram.bitcell_62_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<62> ),    .out(\sram.bitcell_out_62<3> ),    .wl(\wl<62> )
  );
  dcim_bitcell \sram.bitcell_63_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<63> ),    .out(\sram.bitcell_out_63<0> ),    .wl(\wl<63> )
  );
  dcim_bitcell \sram.bitcell_63_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<63> ),    .out(\sram.bitcell_out_63<1> ),    .wl(\wl<63> )
  );
  dcim_bitcell \sram.bitcell_63_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<63> ),    .out(\sram.bitcell_out_63<2> ),    .wl(\wl<63> )
  );
  dcim_bitcell \sram.bitcell_63_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<63> ),    .out(\sram.bitcell_out_63<3> ),    .wl(\wl<63> )
  );
  dcim_bitcell \sram.bitcell_6_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<6> ),    .out(\sram.bitcell_out_6<0> ),    .wl(\wl<6> )
  );
  dcim_bitcell \sram.bitcell_6_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<6> ),    .out(\sram.bitcell_out_6<1> ),    .wl(\wl<6> )
  );
  dcim_bitcell \sram.bitcell_6_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<6> ),    .out(\sram.bitcell_out_6<2> ),    .wl(\wl<6> )
  );
  dcim_bitcell \sram.bitcell_6_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<6> ),    .out(\sram.bitcell_out_6<3> ),    .wl(\wl<6> )
  );
  dcim_bitcell \sram.bitcell_7_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<7> ),    .out(\sram.bitcell_out_7<0> ),    .wl(\wl<7> )
  );
  dcim_bitcell \sram.bitcell_7_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<7> ),    .out(\sram.bitcell_out_7<1> ),    .wl(\wl<7> )
  );
  dcim_bitcell \sram.bitcell_7_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<7> ),    .out(\sram.bitcell_out_7<2> ),    .wl(\wl<7> )
  );
  dcim_bitcell \sram.bitcell_7_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<7> ),    .out(\sram.bitcell_out_7<3> ),    .wl(\wl<7> )
  );
  dcim_bitcell \sram.bitcell_8_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<8> ),    .out(\sram.bitcell_out_8<0> ),    .wl(\wl<8> )
  );
  dcim_bitcell \sram.bitcell_8_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<8> ),    .out(\sram.bitcell_out_8<1> ),    .wl(\wl<8> )
  );
  dcim_bitcell \sram.bitcell_8_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<8> ),    .out(\sram.bitcell_out_8<2> ),    .wl(\wl<8> )
  );
  dcim_bitcell \sram.bitcell_8_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<8> ),    .out(\sram.bitcell_out_8<3> ),    .wl(\wl<8> )
  );
  dcim_bitcell \sram.bitcell_9_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .in_b(\in_b<9> ),    .out(\sram.bitcell_out_9<0> ),    .wl(\wl<9> )
  );
  dcim_bitcell \sram.bitcell_9_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .in_b(\in_b<9> ),    .out(\sram.bitcell_out_9<1> ),    .wl(\wl<9> )
  );
  dcim_bitcell \sram.bitcell_9_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .in_b(\in_b<9> ),    .out(\sram.bitcell_out_9<2> ),    .wl(\wl<9> )
  );
  dcim_bitcell \sram.bitcell_9_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .in_b(\in_b<9> ),    .out(\sram.bitcell_out_9<3> ),    .wl(\wl<9> )
  );
  sram_rw \sram_rw.rw_0  (    .bl(\sram.bl<0> ),    .bl_b(\sram.bl_b<0> ),    .din(\din<0> ),    .dout(\sram_rw.dout<0> ),    .pe(pe),    .se(se),    .spe(spe),    .ysr(ysr),    .ysw(ysw)
  );
  sram_rw \sram_rw.rw_1  (    .bl(\sram.bl<1> ),    .bl_b(\sram.bl_b<1> ),    .din(\din<1> ),    .dout(\sram_rw.dout<1> ),    .pe(pe),    .se(se),    .spe(spe),    .ysr(ysr),    .ysw(ysw)
  );
  sram_rw \sram_rw.rw_2  (    .bl(\sram.bl<2> ),    .bl_b(\sram.bl_b<2> ),    .din(\din<2> ),    .dout(\sram_rw.dout<2> ),    .pe(pe),    .se(se),    .spe(spe),    .ysr(ysr),    .ysw(ysw)
  );
  sram_rw \sram_rw.rw_3  (    .bl(\sram.bl<3> ),    .bl_b(\sram.bl_b<3> ),    .din(\din<3> ),    .dout(\sram_rw.dout<3> ),    .pe(pe),    .se(se),    .spe(spe),    .ysr(ysr),    .ysw(ysw)
  );
  assign \bl_b<3>  = \sram.bl_b<3> ;
  assign \bl_b<2>  = \sram.bl_b<2> ;
  assign \bl_b<1>  = \sram.bl_b<1> ;
  assign \bl_b<0>  = \sram.bl_b<0> ;
  assign \bl<3>  = \sram.bl<3> ;
  assign \bl<2>  = \sram.bl<2> ;
  assign \bl<1>  = \sram.bl<1> ;
  assign \bl<0>  = \sram.bl<0> ;
  assign \bitcell_out_63<3>  = \sram.bitcell_out_63<3> ;
  assign \bitcell_out_63<2>  = \sram.bitcell_out_63<2> ;
  assign \bitcell_out_63<1>  = \sram.bitcell_out_63<1> ;
  assign \bitcell_out_63<0>  = \sram.bitcell_out_63<0> ;
  assign \bitcell_out_62<3>  = \sram.bitcell_out_62<3> ;
  assign \bitcell_out_62<2>  = \sram.bitcell_out_62<2> ;
  assign \bitcell_out_62<1>  = \sram.bitcell_out_62<1> ;
  assign \bitcell_out_62<0>  = \sram.bitcell_out_62<0> ;
  assign \bitcell_out_61<3>  = \sram.bitcell_out_61<3> ;
  assign \bitcell_out_61<2>  = \sram.bitcell_out_61<2> ;
  assign \bitcell_out_61<1>  = \sram.bitcell_out_61<1> ;
  assign \bitcell_out_61<0>  = \sram.bitcell_out_61<0> ;
  assign \bitcell_out_60<3>  = \sram.bitcell_out_60<3> ;
  assign \bitcell_out_60<2>  = \sram.bitcell_out_60<2> ;
  assign \bitcell_out_60<1>  = \sram.bitcell_out_60<1> ;
  assign \bitcell_out_60<0>  = \sram.bitcell_out_60<0> ;
  assign \bitcell_out_59<3>  = \sram.bitcell_out_59<3> ;
  assign \bitcell_out_59<2>  = \sram.bitcell_out_59<2> ;
  assign \bitcell_out_59<1>  = \sram.bitcell_out_59<1> ;
  assign \bitcell_out_59<0>  = \sram.bitcell_out_59<0> ;
  assign \bitcell_out_58<3>  = \sram.bitcell_out_58<3> ;
  assign \bitcell_out_58<2>  = \sram.bitcell_out_58<2> ;
  assign \bitcell_out_58<1>  = \sram.bitcell_out_58<1> ;
  assign \bitcell_out_58<0>  = \sram.bitcell_out_58<0> ;
  assign \bitcell_out_55<3>  = \sram.bitcell_out_55<3> ;
  assign \bitcell_out_55<2>  = \sram.bitcell_out_55<2> ;
  assign \bitcell_out_55<1>  = \sram.bitcell_out_55<1> ;
  assign \bitcell_out_55<0>  = \sram.bitcell_out_55<0> ;
  assign \bitcell_out_54<3>  = \sram.bitcell_out_54<3> ;
  assign \bitcell_out_54<2>  = \sram.bitcell_out_54<2> ;
  assign \bitcell_out_54<1>  = \sram.bitcell_out_54<1> ;
  assign \bitcell_out_54<0>  = \sram.bitcell_out_54<0> ;
  assign \bitcell_out_53<3>  = \sram.bitcell_out_53<3> ;
  assign \bitcell_out_53<2>  = \sram.bitcell_out_53<2> ;
  assign \bitcell_out_53<1>  = \sram.bitcell_out_53<1> ;
  assign \bitcell_out_53<0>  = \sram.bitcell_out_53<0> ;
  assign \bitcell_out_52<3>  = \sram.bitcell_out_52<3> ;
  assign \bitcell_out_52<2>  = \sram.bitcell_out_52<2> ;
  assign \bitcell_out_52<1>  = \sram.bitcell_out_52<1> ;
  assign \bitcell_out_52<0>  = \sram.bitcell_out_52<0> ;
  assign \bitcell_out_51<3>  = \sram.bitcell_out_51<3> ;
  assign \bitcell_out_51<2>  = \sram.bitcell_out_51<2> ;
  assign \bitcell_out_51<1>  = \sram.bitcell_out_51<1> ;
  assign \bitcell_out_51<0>  = \sram.bitcell_out_51<0> ;
  assign \bitcell_out_50<3>  = \sram.bitcell_out_50<3> ;
  assign \bitcell_out_50<2>  = \sram.bitcell_out_50<2> ;
  assign \bitcell_out_50<1>  = \sram.bitcell_out_50<1> ;
  assign \bitcell_out_50<0>  = \sram.bitcell_out_50<0> ;
  assign \bitcell_out_49<3>  = \sram.bitcell_out_49<3> ;
  assign \bitcell_out_49<2>  = \sram.bitcell_out_49<2> ;
  assign \bitcell_out_49<1>  = \sram.bitcell_out_49<1> ;
  assign \bitcell_out_49<0>  = \sram.bitcell_out_49<0> ;
  assign \bitcell_out_48<3>  = \sram.bitcell_out_48<3> ;
  assign \bitcell_out_48<2>  = \sram.bitcell_out_48<2> ;
  assign \bitcell_out_48<1>  = \sram.bitcell_out_48<1> ;
  assign \bitcell_out_48<0>  = \sram.bitcell_out_48<0> ;
  assign \bitcell_out_47<3>  = \sram.bitcell_out_47<3> ;
  assign \bitcell_out_47<2>  = \sram.bitcell_out_47<2> ;
  assign \bitcell_out_47<1>  = \sram.bitcell_out_47<1> ;
  assign \bitcell_out_47<0>  = \sram.bitcell_out_47<0> ;
  assign \bitcell_out_46<3>  = \sram.bitcell_out_46<3> ;
  assign \bitcell_out_46<2>  = \sram.bitcell_out_46<2> ;
  assign \bitcell_out_46<1>  = \sram.bitcell_out_46<1> ;
  assign \bitcell_out_46<0>  = \sram.bitcell_out_46<0> ;
  assign \bitcell_out_45<3>  = \sram.bitcell_out_45<3> ;
  assign \bitcell_out_45<2>  = \sram.bitcell_out_45<2> ;
  assign \bitcell_out_45<1>  = \sram.bitcell_out_45<1> ;
  assign \bitcell_out_45<0>  = \sram.bitcell_out_45<0> ;
  assign \bitcell_out_44<3>  = \sram.bitcell_out_44<3> ;
  assign \bitcell_out_44<2>  = \sram.bitcell_out_44<2> ;
  assign \bitcell_out_44<1>  = \sram.bitcell_out_44<1> ;
  assign \bitcell_out_44<0>  = \sram.bitcell_out_44<0> ;
  assign \bitcell_out_43<3>  = \sram.bitcell_out_43<3> ;
  assign \bitcell_out_43<2>  = \sram.bitcell_out_43<2> ;
  assign \bitcell_out_43<1>  = \sram.bitcell_out_43<1> ;
  assign \bitcell_out_43<0>  = \sram.bitcell_out_43<0> ;
  assign \bitcell_out_42<3>  = \sram.bitcell_out_42<3> ;
  assign \bitcell_out_42<2>  = \sram.bitcell_out_42<2> ;
  assign \bitcell_out_42<1>  = \sram.bitcell_out_42<1> ;
  assign \bitcell_out_42<0>  = \sram.bitcell_out_42<0> ;
  assign \bitcell_out_41<3>  = \sram.bitcell_out_41<3> ;
  assign \bitcell_out_41<2>  = \sram.bitcell_out_41<2> ;
  assign \bitcell_out_41<1>  = \sram.bitcell_out_41<1> ;
  assign \bitcell_out_41<0>  = \sram.bitcell_out_41<0> ;
  assign \bitcell_out_40<3>  = \sram.bitcell_out_40<3> ;
  assign \bitcell_out_40<2>  = \sram.bitcell_out_40<2> ;
  assign \bitcell_out_40<1>  = \sram.bitcell_out_40<1> ;
  assign \bitcell_out_40<0>  = \sram.bitcell_out_40<0> ;
  assign \bitcell_out_39<3>  = \sram.bitcell_out_39<3> ;
  assign \bitcell_out_39<2>  = \sram.bitcell_out_39<2> ;
  assign \bitcell_out_39<1>  = \sram.bitcell_out_39<1> ;
  assign \bitcell_out_39<0>  = \sram.bitcell_out_39<0> ;
  assign \bitcell_out_38<3>  = \sram.bitcell_out_38<3> ;
  assign \bitcell_out_38<2>  = \sram.bitcell_out_38<2> ;
  assign \bitcell_out_38<1>  = \sram.bitcell_out_38<1> ;
  assign \bitcell_out_38<0>  = \sram.bitcell_out_38<0> ;
  assign \bitcell_out_37<3>  = \sram.bitcell_out_37<3> ;
  assign \bitcell_out_37<2>  = \sram.bitcell_out_37<2> ;
  assign \bitcell_out_37<1>  = \sram.bitcell_out_37<1> ;
  assign \bitcell_out_37<0>  = \sram.bitcell_out_37<0> ;
  assign \bitcell_out_36<3>  = \sram.bitcell_out_36<3> ;
  assign \bitcell_out_36<2>  = \sram.bitcell_out_36<2> ;
  assign \bitcell_out_36<1>  = \sram.bitcell_out_36<1> ;
  assign \bitcell_out_36<0>  = \sram.bitcell_out_36<0> ;
  assign \bitcell_out_35<3>  = \sram.bitcell_out_35<3> ;
  assign \bitcell_out_35<2>  = \sram.bitcell_out_35<2> ;
  assign \bitcell_out_35<1>  = \sram.bitcell_out_35<1> ;
  assign \bitcell_out_35<0>  = \sram.bitcell_out_35<0> ;
  assign \bitcell_out_34<3>  = \sram.bitcell_out_34<3> ;
  assign \bitcell_out_34<2>  = \sram.bitcell_out_34<2> ;
  assign \bitcell_out_34<1>  = \sram.bitcell_out_34<1> ;
  assign \bitcell_out_34<0>  = \sram.bitcell_out_34<0> ;
  assign \bitcell_out_33<3>  = \sram.bitcell_out_33<3> ;
  assign \bitcell_out_33<2>  = \sram.bitcell_out_33<2> ;
  assign \bitcell_out_33<1>  = \sram.bitcell_out_33<1> ;
  assign \bitcell_out_33<0>  = \sram.bitcell_out_33<0> ;
  assign \bitcell_out_32<3>  = \sram.bitcell_out_32<3> ;
  assign \bitcell_out_32<2>  = \sram.bitcell_out_32<2> ;
  assign \bitcell_out_32<1>  = \sram.bitcell_out_32<1> ;
  assign \bitcell_out_32<0>  = \sram.bitcell_out_32<0> ;
  assign \bitcell_out_31<3>  = \sram.bitcell_out_31<3> ;
  assign \bitcell_out_31<2>  = \sram.bitcell_out_31<2> ;
  assign \bitcell_out_31<1>  = \sram.bitcell_out_31<1> ;
  assign \bitcell_out_31<0>  = \sram.bitcell_out_31<0> ;
  assign \bitcell_out_30<3>  = \sram.bitcell_out_30<3> ;
  assign \bitcell_out_30<2>  = \sram.bitcell_out_30<2> ;
  assign \bitcell_out_30<1>  = \sram.bitcell_out_30<1> ;
  assign \bitcell_out_30<0>  = \sram.bitcell_out_30<0> ;
  assign \bitcell_out_29<3>  = \sram.bitcell_out_29<3> ;
  assign \bitcell_out_29<2>  = \sram.bitcell_out_29<2> ;
  assign \bitcell_out_29<1>  = \sram.bitcell_out_29<1> ;
  assign \bitcell_out_29<0>  = \sram.bitcell_out_29<0> ;
  assign \bitcell_out_28<3>  = \sram.bitcell_out_28<3> ;
  assign \bitcell_out_28<2>  = \sram.bitcell_out_28<2> ;
  assign \bitcell_out_28<1>  = \sram.bitcell_out_28<1> ;
  assign \bitcell_out_28<0>  = \sram.bitcell_out_28<0> ;
  assign \bitcell_out_27<3>  = \sram.bitcell_out_27<3> ;
  assign \bitcell_out_27<2>  = \sram.bitcell_out_27<2> ;
  assign \bitcell_out_27<1>  = \sram.bitcell_out_27<1> ;
  assign \bitcell_out_27<0>  = \sram.bitcell_out_27<0> ;
  assign \bitcell_out_26<3>  = \sram.bitcell_out_26<3> ;
  assign \bitcell_out_26<2>  = \sram.bitcell_out_26<2> ;
  assign \bitcell_out_26<1>  = \sram.bitcell_out_26<1> ;
  assign \bitcell_out_26<0>  = \sram.bitcell_out_26<0> ;
  assign \bitcell_out_25<3>  = \sram.bitcell_out_25<3> ;
  assign \bitcell_out_25<2>  = \sram.bitcell_out_25<2> ;
  assign \bitcell_out_25<1>  = \sram.bitcell_out_25<1> ;
  assign \bitcell_out_25<0>  = \sram.bitcell_out_25<0> ;
  assign \bitcell_out_24<3>  = \sram.bitcell_out_24<3> ;
  assign \bitcell_out_24<2>  = \sram.bitcell_out_24<2> ;
  assign \bitcell_out_24<1>  = \sram.bitcell_out_24<1> ;
  assign \bitcell_out_24<0>  = \sram.bitcell_out_24<0> ;
  assign \bitcell_out_57<3>  = \sram.bitcell_out_57<3> ;
  assign \bitcell_out_57<2>  = \sram.bitcell_out_57<2> ;
  assign \bitcell_out_57<1>  = \sram.bitcell_out_57<1> ;
  assign \bitcell_out_57<0>  = \sram.bitcell_out_57<0> ;
  assign \bitcell_out_56<3>  = \sram.bitcell_out_56<3> ;
  assign \bitcell_out_56<2>  = \sram.bitcell_out_56<2> ;
  assign \bitcell_out_56<1>  = \sram.bitcell_out_56<1> ;
  assign \bitcell_out_56<0>  = \sram.bitcell_out_56<0> ;
  assign \bitcell_out_23<3>  = \sram.bitcell_out_23<3> ;
  assign \bitcell_out_23<2>  = \sram.bitcell_out_23<2> ;
  assign \bitcell_out_23<1>  = \sram.bitcell_out_23<1> ;
  assign \bitcell_out_23<0>  = \sram.bitcell_out_23<0> ;
  assign \bitcell_out_22<3>  = \sram.bitcell_out_22<3> ;
  assign \bitcell_out_22<2>  = \sram.bitcell_out_22<2> ;
  assign \bitcell_out_22<1>  = \sram.bitcell_out_22<1> ;
  assign \bitcell_out_22<0>  = \sram.bitcell_out_22<0> ;
  assign \bitcell_out_21<3>  = \sram.bitcell_out_21<3> ;
  assign \bitcell_out_21<2>  = \sram.bitcell_out_21<2> ;
  assign \bitcell_out_21<1>  = \sram.bitcell_out_21<1> ;
  assign \bitcell_out_21<0>  = \sram.bitcell_out_21<0> ;
  assign \bitcell_out_20<3>  = \sram.bitcell_out_20<3> ;
  assign \bitcell_out_20<2>  = \sram.bitcell_out_20<2> ;
  assign \bitcell_out_20<1>  = \sram.bitcell_out_20<1> ;
  assign \bitcell_out_20<0>  = \sram.bitcell_out_20<0> ;
  assign \bitcell_out_19<3>  = \sram.bitcell_out_19<3> ;
  assign \bitcell_out_19<2>  = \sram.bitcell_out_19<2> ;
  assign \bitcell_out_19<1>  = \sram.bitcell_out_19<1> ;
  assign \bitcell_out_19<0>  = \sram.bitcell_out_19<0> ;
  assign \bitcell_out_18<3>  = \sram.bitcell_out_18<3> ;
  assign \bitcell_out_18<2>  = \sram.bitcell_out_18<2> ;
  assign \bitcell_out_18<1>  = \sram.bitcell_out_18<1> ;
  assign \bitcell_out_18<0>  = \sram.bitcell_out_18<0> ;
  assign \bitcell_out_17<3>  = \sram.bitcell_out_17<3> ;
  assign \bitcell_out_17<2>  = \sram.bitcell_out_17<2> ;
  assign \bitcell_out_17<1>  = \sram.bitcell_out_17<1> ;
  assign \bitcell_out_17<0>  = \sram.bitcell_out_17<0> ;
  assign \bitcell_out_16<3>  = \sram.bitcell_out_16<3> ;
  assign \bitcell_out_16<2>  = \sram.bitcell_out_16<2> ;
  assign \bitcell_out_16<1>  = \sram.bitcell_out_16<1> ;
  assign \bitcell_out_16<0>  = \sram.bitcell_out_16<0> ;
  assign \bitcell_out_15<3>  = \sram.bitcell_out_15<3> ;
  assign \bitcell_out_15<2>  = \sram.bitcell_out_15<2> ;
  assign \bitcell_out_15<1>  = \sram.bitcell_out_15<1> ;
  assign \bitcell_out_15<0>  = \sram.bitcell_out_15<0> ;
  assign \bitcell_out_14<3>  = \sram.bitcell_out_14<3> ;
  assign \bitcell_out_14<2>  = \sram.bitcell_out_14<2> ;
  assign \bitcell_out_14<1>  = \sram.bitcell_out_14<1> ;
  assign \bitcell_out_14<0>  = \sram.bitcell_out_14<0> ;
  assign \bitcell_out_13<3>  = \sram.bitcell_out_13<3> ;
  assign \bitcell_out_13<2>  = \sram.bitcell_out_13<2> ;
  assign \bitcell_out_13<1>  = \sram.bitcell_out_13<1> ;
  assign \bitcell_out_13<0>  = \sram.bitcell_out_13<0> ;
  assign \bitcell_out_12<3>  = \sram.bitcell_out_12<3> ;
  assign \bitcell_out_12<2>  = \sram.bitcell_out_12<2> ;
  assign \bitcell_out_12<1>  = \sram.bitcell_out_12<1> ;
  assign \bitcell_out_12<0>  = \sram.bitcell_out_12<0> ;
  assign \bitcell_out_11<3>  = \sram.bitcell_out_11<3> ;
  assign \bitcell_out_11<2>  = \sram.bitcell_out_11<2> ;
  assign \bitcell_out_11<1>  = \sram.bitcell_out_11<1> ;
  assign \bitcell_out_11<0>  = \sram.bitcell_out_11<0> ;
  assign \bitcell_out_10<3>  = \sram.bitcell_out_10<3> ;
  assign \bitcell_out_10<2>  = \sram.bitcell_out_10<2> ;
  assign \bitcell_out_10<1>  = \sram.bitcell_out_10<1> ;
  assign \bitcell_out_10<0>  = \sram.bitcell_out_10<0> ;
  assign \bitcell_out_9<3>  = \sram.bitcell_out_9<3> ;
  assign \bitcell_out_9<2>  = \sram.bitcell_out_9<2> ;
  assign \bitcell_out_9<1>  = \sram.bitcell_out_9<1> ;
  assign \bitcell_out_9<0>  = \sram.bitcell_out_9<0> ;
  assign \bitcell_out_8<3>  = \sram.bitcell_out_8<3> ;
  assign \bitcell_out_8<2>  = \sram.bitcell_out_8<2> ;
  assign \bitcell_out_8<1>  = \sram.bitcell_out_8<1> ;
  assign \bitcell_out_8<0>  = \sram.bitcell_out_8<0> ;
  assign \bitcell_out_3<3>  = \sram.bitcell_out_3<3> ;
  assign \bitcell_out_3<2>  = \sram.bitcell_out_3<2> ;
  assign \bitcell_out_3<1>  = \sram.bitcell_out_3<1> ;
  assign \bitcell_out_3<0>  = \sram.bitcell_out_3<0> ;
  assign \bitcell_out_7<3>  = \sram.bitcell_out_7<3> ;
  assign \bitcell_out_7<2>  = \sram.bitcell_out_7<2> ;
  assign \bitcell_out_7<1>  = \sram.bitcell_out_7<1> ;
  assign \bitcell_out_7<0>  = \sram.bitcell_out_7<0> ;
  assign \bitcell_out_6<3>  = \sram.bitcell_out_6<3> ;
  assign \bitcell_out_6<2>  = \sram.bitcell_out_6<2> ;
  assign \bitcell_out_6<1>  = \sram.bitcell_out_6<1> ;
  assign \bitcell_out_6<0>  = \sram.bitcell_out_6<0> ;
  assign \bitcell_out_4<3>  = \sram.bitcell_out_4<3> ;
  assign \bitcell_out_4<2>  = \sram.bitcell_out_4<2> ;
  assign \bitcell_out_4<1>  = \sram.bitcell_out_4<1> ;
  assign \bitcell_out_4<0>  = \sram.bitcell_out_4<0> ;
  assign \bitcell_out_2<3>  = \sram.bitcell_out_2<3> ;
  assign \bitcell_out_2<2>  = \sram.bitcell_out_2<2> ;
  assign \bitcell_out_2<1>  = \sram.bitcell_out_2<1> ;
  assign \bitcell_out_2<0>  = \sram.bitcell_out_2<0> ;
  assign \bitcell_out_1<3>  = \sram.bitcell_out_1<3> ;
  assign \bitcell_out_1<2>  = \sram.bitcell_out_1<2> ;
  assign \bitcell_out_1<1>  = \sram.bitcell_out_1<1> ;
  assign \bitcell_out_1<0>  = \sram.bitcell_out_1<0> ;
  assign \bitcell_out_0<3>  = \sram.bitcell_out_0<3> ;
  assign \bitcell_out_0<2>  = \sram.bitcell_out_0<2> ;
  assign \bitcell_out_0<1>  = \sram.bitcell_out_0<1> ;
  assign \bitcell_out_0<0>  = \sram.bitcell_out_0<0> ;
  assign \dout<3>  = \sram_rw.dout<3> ;
  assign \dout<2>  = \sram_rw.dout<2> ;
  assign \dout<1>  = \sram_rw.dout<1> ;
  assign \dout<0>  = \sram_rw.dout<0> ;
  assign \bitcell_out_5<3>  = \sram.bitcell_out_5<3> ;
  assign \bitcell_out_5<2>  = \sram.bitcell_out_5<2> ;
  assign \bitcell_out_5<1>  = \sram.bitcell_out_5<1> ;
  assign \bitcell_out_5<0>  = \sram.bitcell_out_5<0> ;
  assign \sram_rw.bl<3>  = \sram.bl<3> ;
  assign \sram_rw.bl<2>  = \sram.bl<2> ;
  assign \sram_rw.bl<1>  = \sram.bl<1> ;
  assign \sram_rw.bl<0>  = \sram.bl<0> ;
  assign \sram_rw.bl_b<3>  = \sram.bl_b<3> ;
  assign \sram_rw.bl_b<2>  = \sram.bl_b<2> ;
  assign \sram_rw.bl_b<1>  = \sram.bl_b<1> ;
  assign \sram_rw.bl_b<0>  = \sram.bl_b<0> ;
  assign \sram.wl<63>  = \wl<63> ;
  assign \sram.wl<62>  = \wl<62> ;
  assign \sram.wl<61>  = \wl<61> ;
  assign \sram.wl<60>  = \wl<60> ;
  assign \sram.wl<59>  = \wl<59> ;
  assign \sram.wl<58>  = \wl<58> ;
  assign \sram.wl<57>  = \wl<57> ;
  assign \sram.wl<56>  = \wl<56> ;
  assign \sram.wl<55>  = \wl<55> ;
  assign \sram.wl<54>  = \wl<54> ;
  assign \sram.wl<53>  = \wl<53> ;
  assign \sram.wl<52>  = \wl<52> ;
  assign \sram.wl<51>  = \wl<51> ;
  assign \sram.wl<50>  = \wl<50> ;
  assign \sram.wl<49>  = \wl<49> ;
  assign \sram.wl<48>  = \wl<48> ;
  assign \sram.wl<47>  = \wl<47> ;
  assign \sram.wl<46>  = \wl<46> ;
  assign \sram.wl<45>  = \wl<45> ;
  assign \sram.wl<44>  = \wl<44> ;
  assign \sram.wl<43>  = \wl<43> ;
  assign \sram.wl<42>  = \wl<42> ;
  assign \sram.wl<41>  = \wl<41> ;
  assign \sram.wl<40>  = \wl<40> ;
  assign \sram.wl<39>  = \wl<39> ;
  assign \sram.wl<38>  = \wl<38> ;
  assign \sram.wl<37>  = \wl<37> ;
  assign \sram.wl<36>  = \wl<36> ;
  assign \sram.wl<35>  = \wl<35> ;
  assign \sram.wl<34>  = \wl<34> ;
  assign \sram.wl<33>  = \wl<33> ;
  assign \sram.wl<32>  = \wl<32> ;
  assign \sram.wl<31>  = \wl<31> ;
  assign \sram.wl<30>  = \wl<30> ;
  assign \sram.wl<29>  = \wl<29> ;
  assign \sram.wl<28>  = \wl<28> ;
  assign \sram.wl<27>  = \wl<27> ;
  assign \sram.wl<26>  = \wl<26> ;
  assign \sram.wl<25>  = \wl<25> ;
  assign \sram.wl<24>  = \wl<24> ;
  assign \sram.wl<23>  = \wl<23> ;
  assign \sram.wl<22>  = \wl<22> ;
  assign \sram.wl<21>  = \wl<21> ;
  assign \sram.wl<20>  = \wl<20> ;
  assign \sram.wl<19>  = \wl<19> ;
  assign \sram.wl<18>  = \wl<18> ;
  assign \sram.wl<17>  = \wl<17> ;
  assign \sram.wl<16>  = \wl<16> ;
  assign \sram.wl<15>  = \wl<15> ;
  assign \sram.wl<14>  = \wl<14> ;
  assign \sram.wl<13>  = \wl<13> ;
  assign \sram.wl<12>  = \wl<12> ;
  assign \sram.wl<11>  = \wl<11> ;
  assign \sram.wl<10>  = \wl<10> ;
  assign \sram.wl<9>  = \wl<9> ;
  assign \sram.wl<8>  = \wl<8> ;
  assign \sram.wl<7>  = \wl<7> ;
  assign \sram.wl<6>  = \wl<6> ;
  assign \sram.wl<5>  = \wl<5> ;
  assign \sram.wl<4>  = \wl<4> ;
  assign \sram.wl<3>  = \wl<3> ;
  assign \sram.wl<2>  = \wl<2> ;
  assign \sram.wl<1>  = \wl<1> ;
  assign \sram.wl<0>  = \wl<0> ;
  assign \sram.in_b<63>  = \in_b<63> ;
  assign \sram.in_b<62>  = \in_b<62> ;
  assign \sram.in_b<61>  = \in_b<61> ;
  assign \sram.in_b<60>  = \in_b<60> ;
  assign \sram.in_b<59>  = \in_b<59> ;
  assign \sram.in_b<58>  = \in_b<58> ;
  assign \sram.in_b<57>  = \in_b<57> ;
  assign \sram.in_b<56>  = \in_b<56> ;
  assign \sram.in_b<55>  = \in_b<55> ;
  assign \sram.in_b<54>  = \in_b<54> ;
  assign \sram.in_b<53>  = \in_b<53> ;
  assign \sram.in_b<52>  = \in_b<52> ;
  assign \sram.in_b<51>  = \in_b<51> ;
  assign \sram.in_b<50>  = \in_b<50> ;
  assign \sram.in_b<49>  = \in_b<49> ;
  assign \sram.in_b<48>  = \in_b<48> ;
  assign \sram.in_b<47>  = \in_b<47> ;
  assign \sram.in_b<46>  = \in_b<46> ;
  assign \sram.in_b<45>  = \in_b<45> ;
  assign \sram.in_b<44>  = \in_b<44> ;
  assign \sram.in_b<43>  = \in_b<43> ;
  assign \sram.in_b<42>  = \in_b<42> ;
  assign \sram.in_b<41>  = \in_b<41> ;
  assign \sram.in_b<40>  = \in_b<40> ;
  assign \sram.in_b<39>  = \in_b<39> ;
  assign \sram.in_b<38>  = \in_b<38> ;
  assign \sram.in_b<37>  = \in_b<37> ;
  assign \sram.in_b<36>  = \in_b<36> ;
  assign \sram.in_b<35>  = \in_b<35> ;
  assign \sram.in_b<34>  = \in_b<34> ;
  assign \sram.in_b<33>  = \in_b<33> ;
  assign \sram.in_b<32>  = \in_b<32> ;
  assign \sram.in_b<31>  = \in_b<31> ;
  assign \sram.in_b<30>  = \in_b<30> ;
  assign \sram.in_b<29>  = \in_b<29> ;
  assign \sram.in_b<28>  = \in_b<28> ;
  assign \sram.in_b<27>  = \in_b<27> ;
  assign \sram.in_b<26>  = \in_b<26> ;
  assign \sram.in_b<25>  = \in_b<25> ;
  assign \sram.in_b<24>  = \in_b<24> ;
  assign \sram.in_b<23>  = \in_b<23> ;
  assign \sram.in_b<22>  = \in_b<22> ;
  assign \sram.in_b<21>  = \in_b<21> ;
  assign \sram.in_b<20>  = \in_b<20> ;
  assign \sram.in_b<19>  = \in_b<19> ;
  assign \sram.in_b<18>  = \in_b<18> ;
  assign \sram.in_b<17>  = \in_b<17> ;
  assign \sram.in_b<16>  = \in_b<16> ;
  assign \sram.in_b<15>  = \in_b<15> ;
  assign \sram.in_b<14>  = \in_b<14> ;
  assign \sram.in_b<13>  = \in_b<13> ;
  assign \sram.in_b<12>  = \in_b<12> ;
  assign \sram.in_b<11>  = \in_b<11> ;
  assign \sram.in_b<10>  = \in_b<10> ;
  assign \sram.in_b<9>  = \in_b<9> ;
  assign \sram.in_b<8>  = \in_b<8> ;
  assign \sram.in_b<7>  = \in_b<7> ;
  assign \sram.in_b<6>  = \in_b<6> ;
  assign \sram.in_b<5>  = \in_b<5> ;
  assign \sram.in_b<4>  = \in_b<4> ;
  assign \sram.in_b<3>  = \in_b<3> ;
  assign \sram.in_b<2>  = \in_b<2> ;
  assign \sram.in_b<1>  = \in_b<1> ;
  assign \sram.in_b<0>  = \in_b<0> ;
  assign \sram_rw.din<3>  = \din<3> ;
  assign \sram_rw.din<2>  = \din<2> ;
  assign \sram_rw.din<1>  = \din<1> ;
  assign \sram_rw.din<0>  = \din<0> ;
  assign \sram_rw.pe  = pe;
  assign \sram_rw.ysw  = ysw;
  assign \sram_rw.ysr  = ysr;
  assign \sram_rw.spe  = spe;
  assign \sram_rw.se  = se;
endmodule
