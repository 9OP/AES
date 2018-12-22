## COMPILATION SOURCES
rm -rf ./lib/lib_sources/
rm -rf ./lib/AESLibrary/

## (re) creation des lib de compilation
vlib ./lib/lib_sources
vmap lib_sources ./lib/lib_sources

vlib ./lib/AESLibrary
vmap AESLibrary ./lib/AESLibrary

##compilation
vcom -work AESLibrary ./sources/state_definition_package.vhd
vcom -work AESLibrary ./sources/KeyExpansion_table.vhd
vcom -work lib_sources ./sources/SBOX.vhd
vcom -work lib_sources ./sources/InvSubByte.vhd
vcom -work lib_sources ./sources/InvShiftRow.vhd
vcom -work lib_sources ./sources/InvMixColumnElementary.vhd
vcom -work lib_sources ./sources/InvMixColumn.vhd
vcom -work lib_sources ./sources/AddRoundKey.vhd
vcom -work lib_sources ./sources/counter.vhd
vcom -work lib_sources ./sources/RegisterComp.vhd
vcom -work lib_sources ./sources/InvAESRound.vhd 
vcom -work lib_sources ./sources/FSM_InvAES.vhd

##vcom -work lib_sources ./sources/InvAES.vhd


## COMPILATION TESTBENCH
rm -rf ./lib/lib_bench/

##(re) creation de la lib
vlib ./lib/lib_bench
vmap lib_bench ./lib/lib_bench

##compilation
vcom -work lib_bench ./bench/InvSubByte_tb.vhd
vcom -work lib_bench ./bench/InvShiftRow_tb.vhd
vcom -work lib_bench ./bench/InvMixColumn_tb.vhd
vcom -work lib_bench ./bench/AddRoundKey_tb.vhd
vcom -work lib_bench ./bench/counter_tb.vhd
vcom -work lib_bench ./bench/InvAESRound_tb.vhd
vcom -work lib_bench ./bench/FSM_InvAES_tb.vhd

