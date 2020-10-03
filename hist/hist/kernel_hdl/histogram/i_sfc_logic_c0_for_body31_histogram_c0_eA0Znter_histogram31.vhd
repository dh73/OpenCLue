-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from i_sfc_logic_c0_for_body31_histogram_c0_enter_histogram31
-- VHDL created on Tue Sep 29 21:59:37 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity i_sfc_logic_c0_for_body31_histogram_c0_enter_histogram31 is
    port (
        in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi5_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi5_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi5_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi5_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi5_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi5_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_histogram5_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_histogram5_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body31_histogram_c0_enter_histogram31;

architecture normal of i_sfc_logic_c0_for_body31_histogram_c0_enter_histogram31 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_unnamed_histogram5_histogram38 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_histogram_sync_buffer_histogram33 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_local_size_0_sync_buffer_histogram40 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add40_histogram_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx33_histogram_histogram35_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx33_histogram_histogram35_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx33_histogram_histogram35_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx33_histogram_histogram35_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx33_histogram_histogram35_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx33_histogram_histogram35_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx35_histogram_histogram36_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom32_histogram_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_256_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add40_histogram_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add40_histogram_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add40_histogram_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add40_histogram_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_arrayidx35_histogram_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_arrayidx35_histogram_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx35_histogram_vt_select_63_b : STD_LOGIC_VECTOR (61 downto 0);
    signal i_cmp15_neg_rm3_histogram_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp15_rm4_histogram_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp15_rm4_histogram_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp15_rm4_histogram_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp15_rm4_histogram_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp29_histogram_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp29_histogram_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp29_histogram_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp29_histogram_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_syncbuf_histogram_sync_buffer_histogram_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_local_size_0_sync_buffer_histogram_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_histogram43_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_histogram_histogram36_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist4_i_cmp15_rm4_histogram_c_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp15_neg_rm3_histogram_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_arrayidx33_histogram_histogram35_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_bgTrunc_i_add40_histogram_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_bgTrunc_i_add40_histogram_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_reset0 : std_logic;
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_iq : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i : signal is true;
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_eq : signal is true;
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_q : signal is true;
    signal redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_reset0 : std_logic;
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_iq : STD_LOGIC_VECTOR (9 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i : signal is true;
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_eq : std_logic;
    attribute preserve of redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_eq : signal is true;
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_q : signal is true;
    signal redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_reset0 : std_logic;
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_iq : STD_LOGIC_VECTOR (17 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i : signal is true;
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_eq : std_logic;
    attribute preserve of redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_eq : signal is true;
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_q : signal is true;
    signal redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_reset0 : std_logic;
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_iq : STD_LOGIC_VECTOR (17 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i : signal is true;
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_eq : std_logic;
    attribute preserve of redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_eq : signal is true;
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_q : signal is true;
    signal redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_reset0 : std_logic;
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_i : signal is true;
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_q : signal is true;
    signal redist6_sync_in_aunroll_x_in_c0_eni3_1_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist7_sync_in_aunroll_x_in_i_valid_3(DELAY,107)
    redist7_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist7_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist8_sync_in_aunroll_x_in_i_valid_5(DELAY,108)
    redist8_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_sync_in_aunroll_x_in_i_valid_3_q, xout => redist8_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- c_i32_256(CONSTANT,32)
    c_i32_256_q <= "00000000000000000000000100000000";

    -- i_syncbuf_local_size_0_sync_buffer_histogram(BLACKBOX,46)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_local_size_0_sync_buffer_histogram : i_syncbuf_local_size_0_sync_buffer_histogram40
    PORT MAP (
        in_buffer_in => in_local_size_0,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist7_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_local_size_0_sync_buffer_histogram_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_notEnable(LOGICAL,156)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_nor(LOGICAL,157)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_nor_q <= not (redist6_sync_in_aunroll_x_in_c0_eni3_1_3_notEnable_q or redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_q);

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_cmpReg(REG,155)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena(REG,158)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_sync_in_aunroll_x_in_c0_eni3_1_3_nor_q = "1") THEN
                redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_sync_in_aunroll_x_in_c0_eni3_1_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_enaAnd(LOGICAL,159)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_enaAnd_q <= redist6_sync_in_aunroll_x_in_c0_eni3_1_3_sticky_ena_q and VCC_q;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt(COUNTER,153)
    -- low=0, high=1, step=1, init=0
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_i <= redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_i, 1)));

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_wraddr(REG,154)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_1_3_wraddr_q <= STD_LOGIC_VECTOR(redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem(DUALMEM,152)
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni3_1);
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_aa <= redist6_sync_in_aunroll_x_in_c0_eni3_1_3_wraddr_q;
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_ab <= redist6_sync_in_aunroll_x_in_c0_eni3_1_3_rdcnt_q;
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_reset0 <= not (resetn);
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist6_sync_in_aunroll_x_in_c0_eni3_1_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_reset0,
        clock1 => clock,
        address_a => redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_aa,
        data_a => redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_ab,
        q_b => redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_iq
    );
    redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_q <= redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_iq(31 downto 0);

    -- i_add40_histogram(ADD,35)@4
    i_add40_histogram_a <= STD_LOGIC_VECTOR("0" & redist6_sync_in_aunroll_x_in_c0_eni3_1_3_mem_q);
    i_add40_histogram_b <= STD_LOGIC_VECTOR("0" & i_syncbuf_local_size_0_sync_buffer_histogram_out_buffer_out);
    i_add40_histogram_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add40_histogram_a) + UNSIGNED(i_add40_histogram_b));
    i_add40_histogram_q <= i_add40_histogram_o(32 downto 0);

    -- bgTrunc_i_add40_histogram_sel_x(BITSELECT,2)@4
    bgTrunc_i_add40_histogram_sel_x_b <= i_add40_histogram_q(31 downto 0);

    -- redist10_bgTrunc_i_add40_histogram_sel_x_b_1(DELAY,110)
    redist10_bgTrunc_i_add40_histogram_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add40_histogram_sel_x_b, xout => redist10_bgTrunc_i_add40_histogram_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp29_histogram(COMPARE,41)@5 + 1
    i_cmp29_histogram_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist10_bgTrunc_i_add40_histogram_sel_x_b_1_q(31)) & redist10_bgTrunc_i_add40_histogram_sel_x_b_1_q));
    i_cmp29_histogram_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp29_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp29_histogram_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp29_histogram_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp29_histogram_a) - SIGNED(i_cmp29_histogram_b));
        END IF;
    END PROCESS;
    i_cmp29_histogram_c(0) <= i_cmp29_histogram_o(33);

    -- i_cmp15_rm4_histogram(COMPARE,40)@1
    i_cmp15_rm4_histogram_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => in_c0_eni3_2(31)) & in_c0_eni3_2));
    i_cmp15_rm4_histogram_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_256_q(31)) & c_i32_256_q));
    i_cmp15_rm4_histogram_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp15_rm4_histogram_a) - SIGNED(i_cmp15_rm4_histogram_b));
    i_cmp15_rm4_histogram_c(0) <= i_cmp15_rm4_histogram_o(33);

    -- redist4_i_cmp15_rm4_histogram_c_5(DELAY,104)
    redist4_i_cmp15_rm4_histogram_c_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp15_rm4_histogram_c, xout => redist4_i_cmp15_rm4_histogram_c_5_q, clk => clock, aclr => resetn );

    -- i_unnamed_histogram43(LOGICAL,47)@6
    i_unnamed_histogram43_q <= redist4_i_cmp15_rm4_histogram_c_5_q and i_cmp29_histogram_c;

    -- redist11_bgTrunc_i_add40_histogram_sel_x_b_2(DELAY,111)
    redist11_bgTrunc_i_add40_histogram_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_bgTrunc_i_add40_histogram_sel_x_b_1_q, xout => redist11_bgTrunc_i_add40_histogram_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_cmp15_neg_rm3_histogram(LOGICAL,39)@1
    i_cmp15_neg_rm3_histogram_q <= i_cmp15_rm4_histogram_c xor VCC_q;

    -- i_arrayidx33_histogram_histogram35_mult_multconst_x(CONSTANT,9)
    i_arrayidx33_histogram_histogram35_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_idxprom32_histogram_sel_x(BITSELECT,25)@1
    i_idxprom32_histogram_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(in_c0_eni3_1(31 downto 0)), 64)));

    -- i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select(BITSELECT,99)@1
    i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b <= i_idxprom32_histogram_sel_x_b(17 downto 0);
    i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c <= i_idxprom32_histogram_sel_x_b(63 downto 54);
    i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d <= i_idxprom32_histogram_sel_x_b(35 downto 18);
    i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e <= i_idxprom32_histogram_sel_x_b(53 downto 36);

    -- i_arrayidx35_histogram_histogram36_mult_x_im3_shift0(BITSHIFT,96)@1
    i_arrayidx35_histogram_histogram36_mult_x_im3_shift0_qint <= i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx35_histogram_histogram36_mult_x_im3_shift0_q <= i_arrayidx35_histogram_histogram36_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_align_15(BITSHIFT,86)@1
    i_arrayidx35_histogram_histogram36_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx35_histogram_histogram36_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx35_histogram_histogram36_mult_x_align_15_q <= i_arrayidx35_histogram_histogram36_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_im6_shift0(BITSHIFT,97)@1
    i_arrayidx35_histogram_histogram36_mult_x_im6_shift0_qint <= i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx35_histogram_histogram36_mult_x_im6_shift0_q <= i_arrayidx35_histogram_histogram36_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_align_14(BITSHIFT,85)@1
    i_arrayidx35_histogram_histogram36_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx35_histogram_histogram36_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx35_histogram_histogram36_mult_x_align_14_q <= i_arrayidx35_histogram_histogram36_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_join_16(BITJOIN,87)@1
    i_arrayidx35_histogram_histogram36_mult_x_join_16_q <= i_arrayidx35_histogram_histogram36_mult_x_align_15_q & i_arrayidx35_histogram_histogram36_mult_x_align_14_q;

    -- i_arrayidx35_histogram_histogram36_mult_x_im9_shift0(BITSHIFT,98)@1
    i_arrayidx35_histogram_histogram36_mult_x_im9_shift0_qint <= i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx35_histogram_histogram36_mult_x_im9_shift0_q <= i_arrayidx35_histogram_histogram36_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_align_12(BITSHIFT,83)@1
    i_arrayidx35_histogram_histogram36_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx35_histogram_histogram36_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx35_histogram_histogram36_mult_x_align_12_q <= i_arrayidx35_histogram_histogram36_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_im0_shift0(BITSHIFT,95)@1
    i_arrayidx35_histogram_histogram36_mult_x_im0_shift0_qint <= i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx35_histogram_histogram36_mult_x_im0_shift0_q <= i_arrayidx35_histogram_histogram36_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_x_join_13(BITJOIN,84)@1
    i_arrayidx35_histogram_histogram36_mult_x_join_13_q <= i_arrayidx35_histogram_histogram36_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx35_histogram_histogram36_mult_x_im0_shift0_q);

    -- i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0(ADD,88)@1
    i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx35_histogram_histogram36_mult_x_join_13_q);
    i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx35_histogram_histogram36_mult_x_join_16_q);
    i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_b));
    i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_q <= i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx35_histogram_histogram36_mult_extender_x(BITJOIN,18)@1
    i_arrayidx35_histogram_histogram36_mult_extender_x_q <= i_arrayidx33_histogram_histogram35_mult_multconst_x_q & i_arrayidx35_histogram_histogram36_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx35_histogram_histogram36_trunc_sel_x(BITSELECT,20)@1
    i_arrayidx35_histogram_histogram36_trunc_sel_x_b <= i_arrayidx35_histogram_histogram36_mult_extender_x_q(63 downto 0);

    -- i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x(BITSELECT,15)@1
    i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx35_histogram_histogram36_trunc_sel_x_b);
    i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x_b <= i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx35_histogram_vt_select_63(BITSELECT,38)@1
    i_arrayidx35_histogram_vt_select_63_b <= i_arrayidx35_histogram_histogram36_dupName_0_trunc_sel_x_b(63 downto 2);

    -- i_arrayidx35_histogram_vt_const_1(CONSTANT,36)
    i_arrayidx35_histogram_vt_const_1_q <= "00";

    -- i_arrayidx35_histogram_vt_join(BITJOIN,37)@1
    i_arrayidx35_histogram_vt_join_q <= i_arrayidx35_histogram_vt_select_63_b & i_arrayidx35_histogram_vt_const_1_q;

    -- i_load_unnamed_histogram5_histogram(BLACKBOX,44)@1
    -- in in_i_stall@20000000
    -- out out_o_readdata@6
    -- out out_o_stall@5
    -- out out_o_valid@6
    -- out out_unnamed_histogram5_avm_address@20000000
    -- out out_unnamed_histogram5_avm_burstcount@20000000
    -- out out_unnamed_histogram5_avm_byteenable@20000000
    -- out out_unnamed_histogram5_avm_enable@20000000
    -- out out_unnamed_histogram5_avm_read@20000000
    -- out out_unnamed_histogram5_avm_write@20000000
    -- out out_unnamed_histogram5_avm_writedata@20000000
    thei_load_unnamed_histogram5_histogram : i_load_unnamed_histogram5_histogram38
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx35_histogram_vt_join_q,
        in_i_bitwiseor => in_c0_eni3_3,
        in_i_predicate => i_cmp15_neg_rm3_histogram_q,
        in_i_stall => GND_q,
        in_i_valid => in_i_valid,
        in_unnamed_histogram5_avm_readdata => in_unnamed_histogram5_avm_readdata,
        in_unnamed_histogram5_avm_readdatavalid => in_unnamed_histogram5_avm_readdatavalid,
        in_unnamed_histogram5_avm_waitrequest => in_unnamed_histogram5_avm_waitrequest,
        in_unnamed_histogram5_avm_writeack => in_unnamed_histogram5_avm_writeack,
        out_o_readdata => i_load_unnamed_histogram5_histogram_out_o_readdata,
        out_unnamed_histogram5_avm_address => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_address,
        out_unnamed_histogram5_avm_burstcount => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_burstcount,
        out_unnamed_histogram5_avm_byteenable => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_byteenable,
        out_unnamed_histogram5_avm_enable => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_enable,
        out_unnamed_histogram5_avm_read => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_read,
        out_unnamed_histogram5_avm_write => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_write,
        out_unnamed_histogram5_avm_writedata => i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_cmp15_neg_rm3_histogram_q_5(DELAY,105)
    redist5_i_cmp15_neg_rm3_histogram_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp15_neg_rm3_histogram_q, xout => redist5_i_cmp15_neg_rm3_histogram_q_5_q, clk => clock, aclr => resetn );

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_notEnable(LOGICAL,128)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_nor(LOGICAL,129)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_nor_q <= not (redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_notEnable_q or redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_q);

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_last(CONSTANT,125)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_last_q <= "01";

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmp(LOGICAL,126)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmp_q <= "1" WHEN redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_last_q = redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_q ELSE "0";

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmpReg(REG,127)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmpReg_q <= STD_LOGIC_VECTOR(redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmp_q);
        END IF;
    END PROCESS;

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena(REG,130)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_nor_q = "1") THEN
                redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_enaAnd(LOGICAL,131)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_enaAnd_q <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_sticky_ena_q and VCC_q;

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt(COUNTER,123)
    -- low=0, high=2, step=1, init=0
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_eq <= '1';
            ELSE
                redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_eq <= '0';
            END IF;
            IF (redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_eq = '1') THEN
                redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i + 2;
            ELSE
                redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_i, 2)));

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_wraddr(REG,124)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_wraddr_q <= STD_LOGIC_VECTOR(redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem(DUALMEM,122)
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_ia <= STD_LOGIC_VECTOR(i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c);
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_aa <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_wraddr_q;
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_ab <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_rdcnt_q;
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_reset0 <= not (resetn);
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 10,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_reset0,
        clock1 => clock,
        address_a => redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_aa,
        data_a => redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_ab,
        q_b => redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_iq
    );
    redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_q <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_iq(9 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_im3_shift0(BITSHIFT,92)@5
    i_arrayidx33_histogram_histogram35_mult_x_im3_shift0_qint <= redist1_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_c_4_mem_q & "00";
    i_arrayidx33_histogram_histogram35_mult_x_im3_shift0_q <= i_arrayidx33_histogram_histogram35_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_align_15(BITSHIFT,68)@5
    i_arrayidx33_histogram_histogram35_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx33_histogram_histogram35_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx33_histogram_histogram35_mult_x_align_15_q <= i_arrayidx33_histogram_histogram35_mult_x_align_15_qint(27 downto 0);

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_notEnable(LOGICAL,138)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_nor(LOGICAL,139)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_nor_q <= not (redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_notEnable_q or redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_q);

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_last(CONSTANT,135)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_last_q <= "01";

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmp(LOGICAL,136)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmp_q <= "1" WHEN redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_last_q = redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_q ELSE "0";

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmpReg(REG,137)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmpReg_q <= STD_LOGIC_VECTOR(redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena(REG,140)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_nor_q = "1") THEN
                redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_enaAnd(LOGICAL,141)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_enaAnd_q <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_sticky_ena_q and VCC_q;

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt(COUNTER,133)
    -- low=0, high=2, step=1, init=0
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_eq <= '1';
            ELSE
                redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_eq <= '0';
            END IF;
            IF (redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_eq = '1') THEN
                redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i + 2;
            ELSE
                redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_i, 2)));

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_wraddr(REG,134)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_wraddr_q <= STD_LOGIC_VECTOR(redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem(DUALMEM,132)
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_ia <= STD_LOGIC_VECTOR(i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d);
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_aa <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_wraddr_q;
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_ab <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_rdcnt_q;
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_reset0 <= not (resetn);
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 18,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_reset0,
        clock1 => clock,
        address_a => redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_aa,
        data_a => redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_ab,
        q_b => redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_iq
    );
    redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_q <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_iq(17 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_im6_shift0(BITSHIFT,93)@5
    i_arrayidx33_histogram_histogram35_mult_x_im6_shift0_qint <= redist2_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_d_4_mem_q & "00";
    i_arrayidx33_histogram_histogram35_mult_x_im6_shift0_q <= i_arrayidx33_histogram_histogram35_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_align_14(BITSHIFT,67)@5
    i_arrayidx33_histogram_histogram35_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx33_histogram_histogram35_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx33_histogram_histogram35_mult_x_align_14_q <= i_arrayidx33_histogram_histogram35_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_join_16(BITJOIN,69)@5
    i_arrayidx33_histogram_histogram35_mult_x_join_16_q <= i_arrayidx33_histogram_histogram35_mult_x_align_15_q & i_arrayidx33_histogram_histogram35_mult_x_align_14_q;

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_notEnable(LOGICAL,148)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_nor(LOGICAL,149)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_nor_q <= not (redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_notEnable_q or redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_q);

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_last(CONSTANT,145)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_last_q <= "01";

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmp(LOGICAL,146)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmp_q <= "1" WHEN redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_last_q = redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_q ELSE "0";

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmpReg(REG,147)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmpReg_q <= STD_LOGIC_VECTOR(redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmp_q);
        END IF;
    END PROCESS;

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena(REG,150)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_nor_q = "1") THEN
                redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_enaAnd(LOGICAL,151)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_enaAnd_q <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_sticky_ena_q and VCC_q;

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt(COUNTER,143)
    -- low=0, high=2, step=1, init=0
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_eq <= '1';
            ELSE
                redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_eq <= '0';
            END IF;
            IF (redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_eq = '1') THEN
                redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i + 2;
            ELSE
                redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_i, 2)));

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_wraddr(REG,144)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_wraddr_q <= STD_LOGIC_VECTOR(redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem(DUALMEM,142)
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_ia <= STD_LOGIC_VECTOR(i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e);
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_aa <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_wraddr_q;
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_ab <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_rdcnt_q;
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_reset0 <= not (resetn);
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 18,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_reset0,
        clock1 => clock,
        address_a => redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_aa,
        data_a => redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_ab,
        q_b => redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_iq
    );
    redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_q <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_iq(17 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_im9_shift0(BITSHIFT,94)@5
    i_arrayidx33_histogram_histogram35_mult_x_im9_shift0_qint <= redist3_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_e_4_mem_q & "00";
    i_arrayidx33_histogram_histogram35_mult_x_im9_shift0_q <= i_arrayidx33_histogram_histogram35_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_align_12(BITSHIFT,65)@5
    i_arrayidx33_histogram_histogram35_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx33_histogram_histogram35_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx33_histogram_histogram35_mult_x_align_12_q <= i_arrayidx33_histogram_histogram35_mult_x_align_12_qint(35 downto 0);

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_notEnable(LOGICAL,118)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_nor(LOGICAL,119)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_nor_q <= not (redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_notEnable_q or redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_q);

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_last(CONSTANT,115)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_last_q <= "01";

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmp(LOGICAL,116)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmp_q <= "1" WHEN redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_last_q = redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_q ELSE "0";

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmpReg(REG,117)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena(REG,120)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_nor_q = "1") THEN
                redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_enaAnd(LOGICAL,121)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_enaAnd_q <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_sticky_ena_q and VCC_q;

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt(COUNTER,113)
    -- low=0, high=2, step=1, init=0
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_eq <= '1';
            ELSE
                redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_eq = '1') THEN
                redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i + 2;
            ELSE
                redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_i, 2)));

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_wraddr(REG,114)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem(DUALMEM,112)
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_ia <= STD_LOGIC_VECTOR(i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b);
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_aa <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_wraddr_q;
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_ab <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_rdcnt_q;
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_reset0 <= not (resetn);
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 18,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_aa,
        data_a => redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_ab,
        q_b => redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_iq
    );
    redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_q <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_iq(17 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_im0_shift0(BITSHIFT,91)@5
    i_arrayidx33_histogram_histogram35_mult_x_im0_shift0_qint <= redist0_i_arrayidx33_histogram_histogram35_mult_x_bs1_merged_bit_select_b_4_mem_q & "00";
    i_arrayidx33_histogram_histogram35_mult_x_im0_shift0_q <= i_arrayidx33_histogram_histogram35_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_x_join_13(BITJOIN,66)@5
    i_arrayidx33_histogram_histogram35_mult_x_join_13_q <= i_arrayidx33_histogram_histogram35_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx33_histogram_histogram35_mult_x_im0_shift0_q);

    -- i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0(ADD,70)@5
    i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx33_histogram_histogram35_mult_x_join_13_q);
    i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx33_histogram_histogram35_mult_x_join_16_q);
    i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_b));
    i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_q <= i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx33_histogram_histogram35_mult_extender_x(BITJOIN,8)@5
    i_arrayidx33_histogram_histogram35_mult_extender_x_q <= i_arrayidx33_histogram_histogram35_mult_multconst_x_q & i_arrayidx33_histogram_histogram35_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx33_histogram_histogram35_trunc_sel_x(BITSELECT,10)@5
    i_arrayidx33_histogram_histogram35_trunc_sel_x_b <= i_arrayidx33_histogram_histogram35_mult_extender_x_q(63 downto 0);

    -- redist9_i_arrayidx33_histogram_histogram35_trunc_sel_x_b_1(DELAY,109)
    redist9_i_arrayidx33_histogram_histogram35_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx33_histogram_histogram35_trunc_sel_x_b, xout => redist9_i_arrayidx33_histogram_histogram35_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_histogram_sync_buffer_histogram(BLACKBOX,45)@0
    -- in in_i_dependence@6
    -- in in_valid_in@6
    -- out out_buffer_out@6
    -- out out_valid_out@6
    thei_syncbuf_histogram_sync_buffer_histogram : i_syncbuf_histogram_sync_buffer_histogram33
    PORT MAP (
        in_buffer_in => in_histogram,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_histogram_sync_buffer_histogram_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx33_histogram_histogram35_add_x(ADD,11)@6
    i_arrayidx33_histogram_histogram35_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_histogram_sync_buffer_histogram_out_buffer_out);
    i_arrayidx33_histogram_histogram35_add_x_b <= STD_LOGIC_VECTOR("0" & redist9_i_arrayidx33_histogram_histogram35_trunc_sel_x_b_1_q);
    i_arrayidx33_histogram_histogram35_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx33_histogram_histogram35_add_x_a) + UNSIGNED(i_arrayidx33_histogram_histogram35_add_x_b));
    i_arrayidx33_histogram_histogram35_add_x_q <= i_arrayidx33_histogram_histogram35_add_x_o(64 downto 0);

    -- i_arrayidx33_histogram_histogram35_dupName_0_trunc_sel_x(BITSELECT,5)@6
    i_arrayidx33_histogram_histogram35_dupName_0_trunc_sel_x_b <= i_arrayidx33_histogram_histogram35_add_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,27)@6
    out_c0_exi5_0 <= GND_q;
    out_c0_exi5_1 <= i_arrayidx33_histogram_histogram35_dupName_0_trunc_sel_x_b;
    out_c0_exi5_2 <= redist5_i_cmp15_neg_rm3_histogram_q_5_q;
    out_c0_exi5_3 <= i_load_unnamed_histogram5_histogram_out_o_readdata;
    out_c0_exi5_4 <= redist11_bgTrunc_i_add40_histogram_sel_x_b_2_q;
    out_c0_exi5_5 <= i_unnamed_histogram43_q;
    out_o_valid <= redist8_sync_in_aunroll_x_in_i_valid_5_q;

    -- ext_sig_sync_out(GPOUT,34)
    out_unnamed_histogram5_avm_address <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_address;
    out_unnamed_histogram5_avm_enable <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_enable;
    out_unnamed_histogram5_avm_read <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_read;
    out_unnamed_histogram5_avm_write <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_write;
    out_unnamed_histogram5_avm_writedata <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_writedata;
    out_unnamed_histogram5_avm_byteenable <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_byteenable;
    out_unnamed_histogram5_avm_burstcount <= i_load_unnamed_histogram5_histogram_out_unnamed_histogram5_avm_burstcount;

END normal;
