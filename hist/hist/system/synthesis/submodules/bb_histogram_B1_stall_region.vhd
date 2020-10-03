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

-- VHDL created from bb_histogram_B1_stall_region
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

entity bb_histogram_B1_stall_region is
    port (
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_014 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_016 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_019 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add : out std_logic_vector(31 downto 0);  -- ufix32
        out_cmp20_GUARD : out std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_019 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B1_stall_region;

architecture normal of bb_histogram_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component histogram_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_histogram0_histogram5 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_local_size_0_sync_buffer2_histogram7 is
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


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_histogram_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_histogram_histogram3_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom_histogram_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_l_grpid_0_addr_zext_histogram_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_255_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_histogram_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_histogram_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_histogram_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_histogram_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_arrayidx_histogram_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_arrayidx_histogram_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_histogram_vt_select_63_b : STD_LOGIC_VECTOR (61 downto 0);
    signal i_cmp15_neg_rm_histogram_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp15_neg_rm_histogram_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp15_neg_rm_histogram_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp15_neg_rm_histogram_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp20_guard_histogram_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp20_histogram_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp20_histogram_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp20_histogram_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp20_histogram_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_l_grpid_0_addr_zext_histogram_vt_const_9_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_l_grpid_0_addr_zext_histogram_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_l_grpid_0_addr_zext_histogram_vt_select_31_b : STD_LOGIC_VECTOR (21 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_syncbuf_local_size_0_sync_buffer2_histogram_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_local_size_0_sync_buffer2_histogram_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_local_size_0_sync_buffer2_histogram_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_cmp15_neg_rm_histogram_c_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_histogram_B1_merge_reg_aunroll_x_out_data_out_2_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_histogram_B1_merge_reg_aunroll_x_out_data_out_4_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_add_histogram_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_histogram_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (223 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B1_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_local_size_0_sync_buffer2_histogram_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_local_size_0_sync_buffer2_histogram_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (223 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_add_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_add_histogram_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_add_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_add_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_guard_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_guard_histogram_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_guard_histogram_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_guard_histogram_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_guard_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_guard_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_histogram_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_histogram_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_histogram_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_histogram_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp20_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_i_cmp20_histogram_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp20_histogram_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp20_histogram_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp20_histogram_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp20_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp20_histogram_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp20_histogram_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp20_histogram_D1 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- bubble_join_i_syncbuf_local_size_0_sync_buffer2_histogram(BITJOIN,122)
    bubble_join_i_syncbuf_local_size_0_sync_buffer2_histogram_q <= i_syncbuf_local_size_0_sync_buffer2_histogram_out_buffer_out;

    -- bubble_select_i_syncbuf_local_size_0_sync_buffer2_histogram(BITSELECT,123)
    bubble_select_i_syncbuf_local_size_0_sync_buffer2_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_local_size_0_sync_buffer2_histogram_q(31 downto 0));

    -- bubble_join_histogram_B1_merge_reg_aunroll_x(BITJOIN,117)
    bubble_join_histogram_B1_merge_reg_aunroll_x_q <= histogram_B1_merge_reg_aunroll_x_out_data_out_6 & histogram_B1_merge_reg_aunroll_x_out_data_out_5 & histogram_B1_merge_reg_aunroll_x_out_data_out_4 & histogram_B1_merge_reg_aunroll_x_out_data_out_3 & histogram_B1_merge_reg_aunroll_x_out_data_out_2 & histogram_B1_merge_reg_aunroll_x_out_data_out_1 & histogram_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_histogram_B1_merge_reg_aunroll_x(BITSELECT,118)
    bubble_select_histogram_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_histogram_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_histogram_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(95 downto 64));
    bubble_select_histogram_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(127 downto 96));
    bubble_select_histogram_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(159 downto 128));
    bubble_select_histogram_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(191 downto 160));
    bubble_select_histogram_B1_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_histogram_B1_merge_reg_aunroll_x_q(223 downto 192));

    -- i_add_histogram(ADD,32)@1
    i_add_histogram_a <= STD_LOGIC_VECTOR("0" & bubble_select_histogram_B1_merge_reg_aunroll_x_b);
    i_add_histogram_b <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_local_size_0_sync_buffer2_histogram_b);
    i_add_histogram_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_histogram_a) + UNSIGNED(i_add_histogram_b));
    i_add_histogram_q <= i_add_histogram_o(32 downto 0);

    -- bgTrunc_i_add_histogram_sel_x(BITSELECT,2)@1
    bgTrunc_i_add_histogram_sel_x_b <= i_add_histogram_q(31 downto 0);

    -- redist11_bgTrunc_i_add_histogram_sel_x_b_1_0(REG,114)
    redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backEN = "1") THEN
                redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_add_histogram_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_i_cmp20_histogram(STALLREG,200)
    SR_SE_i_cmp20_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp20_histogram_r_valid <= (others => '0');
            SR_SE_i_cmp20_histogram_r_data0 <= (others => '-');
            SR_SE_i_cmp20_histogram_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp20_histogram_r_valid <= SE_i_cmp20_histogram_backStall and (SR_SE_i_cmp20_histogram_r_valid or SR_SE_i_cmp20_histogram_i_valid);

            IF (SR_SE_i_cmp20_histogram_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp20_histogram_r_data0 <= STD_LOGIC_VECTOR(redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q);
                SR_SE_i_cmp20_histogram_r_data1 <= STD_LOGIC_VECTOR(redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp20_histogram_i_valid <= SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_V0;
    -- Stall signal propagation
    SR_SE_i_cmp20_histogram_backStall <= SR_SE_i_cmp20_histogram_r_valid or not (SR_SE_i_cmp20_histogram_i_valid);

    -- Valid
    SR_SE_i_cmp20_histogram_V <= SR_SE_i_cmp20_histogram_r_valid WHEN SR_SE_i_cmp20_histogram_r_valid = "1" ELSE SR_SE_i_cmp20_histogram_i_valid;

    -- Data0
    SR_SE_i_cmp20_histogram_D0 <= SR_SE_i_cmp20_histogram_r_data0 WHEN SR_SE_i_cmp20_histogram_r_valid = "1" ELSE redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_cmp20_histogram_D1 <= SR_SE_i_cmp20_histogram_r_data1 WHEN SR_SE_i_cmp20_histogram_r_valid = "1" ELSE redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_q;

    -- SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0(STALLENABLE,177)
    -- Valid signal propagation
    SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_V0 <= SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_s_tv_0 <= SR_SE_i_cmp20_histogram_backStall and SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backEN <= not (SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_v_s_0 <= SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backEN and SE_i_add_histogram_V0;
    -- Backward Stall generation
    SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backStall <= not (SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_v_s_0);
    SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backEN = "0") THEN
                SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0 <= SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0 and SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_R_v_0 <= SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram(STALLENABLE,148)
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg0 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg1 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed0 <= (not (bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_out) and SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid) or SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg0;
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed1 <= (not (SE_i_add_histogram_backStall) and SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid) or SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_StallValid <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_backStall and SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid;
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_toReg0 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_StallValid and SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed0;
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_toReg1 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_StallValid and SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_or0 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed0;
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireStall <= not (SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_consumed1 and SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_or0);
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_backStall <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_V0 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid and not (SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg0);
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_V1 <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid and not (SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_wireValid <= i_syncbuf_local_size_0_sync_buffer2_histogram_out_valid_out;

    -- SE_i_add_histogram(STALLENABLE,137)
    -- Valid signal propagation
    SE_i_add_histogram_V0 <= SE_i_add_histogram_wireValid;
    -- Backward Stall generation
    SE_i_add_histogram_backStall <= SE_redist11_bgTrunc_i_add_histogram_sel_x_b_1_0_backStall or not (SE_i_add_histogram_wireValid);
    -- Computing multiple Valid(s)
    SE_i_add_histogram_and0 <= SE_out_histogram_B1_merge_reg_aunroll_x_V1;
    SE_i_add_histogram_wireValid <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_V1 and SE_i_add_histogram_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_local_size_0_sync_buffer2_histogram(BLACKBOX,47)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_local_size_0_sync_buffer2_histogram : i_syncbuf_local_size_0_sync_buffer2_histogram7
    PORT MAP (
        in_buffer_in => in_local_size_0,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_backStall,
        in_valid_in => SE_out_histogram_B1_merge_reg_aunroll_x_V0,
        out_buffer_out => i_syncbuf_local_size_0_sync_buffer2_histogram_out_buffer_out,
        out_stall_out => i_syncbuf_local_size_0_sync_buffer2_histogram_out_stall_out,
        out_valid_out => i_syncbuf_local_size_0_sync_buffer2_histogram_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,149)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= histogram_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,126)
    bubble_join_stall_entry_q <= in_local_linear_id23 & in_local_id_019 & in_l_grpid_0_addr7 & in_l_grpid_06 & in_i_016 & in_global_id_014 & in_acl_hw_wg_id29;

    -- bubble_select_stall_entry(BITSELECT,127)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 192));

    -- histogram_B1_merge_reg_aunroll_x(BLACKBOX,10)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thehistogram_B1_merge_reg_aunroll_x : histogram_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_d,
        in_data_in_1 => bubble_select_stall_entry_e,
        in_data_in_2 => bubble_select_stall_entry_f,
        in_data_in_3 => bubble_select_stall_entry_c,
        in_data_in_4 => bubble_select_stall_entry_g,
        in_data_in_5 => bubble_select_stall_entry_h,
        in_data_in_6 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_histogram_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => histogram_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => histogram_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => histogram_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => histogram_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => histogram_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => histogram_B1_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => histogram_B1_merge_reg_aunroll_x_out_data_out_6,
        out_stall_out => histogram_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => histogram_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_histogram_B1_merge_reg_aunroll_x(STALLENABLE,131)
    SE_out_histogram_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_histogram_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_histogram_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_histogram_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_histogram_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_histogram_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_histogram_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_histogram_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_histogram_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_histogram_B1_merge_reg_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_histogram_B1_merge_reg_aunroll_x_consumed0 <= (not (i_syncbuf_local_size_0_sync_buffer2_histogram_out_stall_out) and SE_out_histogram_B1_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_histogram_B1_merge_reg_aunroll_x_consumed1 <= (not (SE_i_add_histogram_backStall) and SE_out_histogram_B1_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_histogram_B1_merge_reg_aunroll_x_consumed2 <= (not (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backStall) and SE_out_histogram_B1_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B1_merge_reg_aunroll_x_fromReg2;
    -- Consuming
    SE_out_histogram_B1_merge_reg_aunroll_x_StallValid <= SE_out_histogram_B1_merge_reg_aunroll_x_backStall and SE_out_histogram_B1_merge_reg_aunroll_x_wireValid;
    SE_out_histogram_B1_merge_reg_aunroll_x_toReg0 <= SE_out_histogram_B1_merge_reg_aunroll_x_StallValid and SE_out_histogram_B1_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B1_merge_reg_aunroll_x_toReg1 <= SE_out_histogram_B1_merge_reg_aunroll_x_StallValid and SE_out_histogram_B1_merge_reg_aunroll_x_consumed1;
    SE_out_histogram_B1_merge_reg_aunroll_x_toReg2 <= SE_out_histogram_B1_merge_reg_aunroll_x_StallValid and SE_out_histogram_B1_merge_reg_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_histogram_B1_merge_reg_aunroll_x_or0 <= SE_out_histogram_B1_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B1_merge_reg_aunroll_x_or1 <= SE_out_histogram_B1_merge_reg_aunroll_x_consumed1 and SE_out_histogram_B1_merge_reg_aunroll_x_or0;
    SE_out_histogram_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_histogram_B1_merge_reg_aunroll_x_consumed2 and SE_out_histogram_B1_merge_reg_aunroll_x_or1);
    SE_out_histogram_B1_merge_reg_aunroll_x_backStall <= SE_out_histogram_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_histogram_B1_merge_reg_aunroll_x_V0 <= SE_out_histogram_B1_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_histogram_B1_merge_reg_aunroll_x_V1 <= SE_out_histogram_B1_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_histogram_B1_merge_reg_aunroll_x_V2 <= SE_out_histogram_B1_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B1_merge_reg_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_histogram_B1_merge_reg_aunroll_x_wireValid <= histogram_B1_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0(STALLENABLE,164)
    -- Valid signal propagation
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V0 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0;
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V1 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0 <= SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backStall and SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0;
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_1 <= i_store_unnamed_histogram0_histogram_out_o_stall and SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_or0 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0;
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN <= not (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_1 or SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN and SE_out_histogram_B1_merge_reg_aunroll_x_V2;
    -- Backward Stall generation
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backStall <= not (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0);
    SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= (others => '0');
            SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "0") THEN
                SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 and SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0;
            ELSE
                SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0;
            END IF;

            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "0") THEN
                SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1 and SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_1;
            ELSE
                SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_1 <= SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0(STALLENABLE,162)
    -- Valid signal propagation
    SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_V0 <= SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_s_tv_0 <= SE_i_cmp20_guard_histogram_backStall and SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN <= not (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_v_s_0 <= SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN and SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V0;
    -- Backward Stall generation
    SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backStall <= not (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_v_s_0);
    SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "0") THEN
                SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0 <= SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0 and SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_s_tv_0;
            ELSE
                SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_R_v_0 <= SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- c_i32_0gr(CONSTANT,26)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0(REG,108)
    redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- c_i32_255(CONSTANT,27)
    c_i32_255_q <= "00000000000000000000000011111111";

    -- i_cmp15_neg_rm_histogram(COMPARE,36)@2
    i_cmp15_neg_rm_histogram_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_255_q(31)) & c_i32_255_q));
    i_cmp15_neg_rm_histogram_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q(31)) & redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q));
    i_cmp15_neg_rm_histogram_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp15_neg_rm_histogram_a) - SIGNED(i_cmp15_neg_rm_histogram_b));
    i_cmp15_neg_rm_histogram_c(0) <= i_cmp15_neg_rm_histogram_o(33);

    -- redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0(REG,104)
    redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- i_l_grpid_0_addr_zext_histogram_sel_x(BITSELECT,22)@2
    i_l_grpid_0_addr_zext_histogram_sel_x_b <= std_logic_vector(resize(unsigned(redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q(31 downto 0)), 64));

    -- i_l_grpid_0_addr_zext_histogram_vt_select_31(BITSELECT,45)@2
    i_l_grpid_0_addr_zext_histogram_vt_select_31_b <= i_l_grpid_0_addr_zext_histogram_sel_x_b(31 downto 10);

    -- i_l_grpid_0_addr_zext_histogram_vt_const_9(CONSTANT,43)
    i_l_grpid_0_addr_zext_histogram_vt_const_9_q <= "0000000000";

    -- i_l_grpid_0_addr_zext_histogram_vt_join(BITJOIN,44)@2
    i_l_grpid_0_addr_zext_histogram_vt_join_q <= c_i32_0gr_q & i_l_grpid_0_addr_zext_histogram_vt_select_31_b & i_l_grpid_0_addr_zext_histogram_vt_const_9_q;

    -- i_arrayidx_histogram_histogram3_mult_multconst_x(CONSTANT,15)
    i_arrayidx_histogram_histogram3_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0(REG,101)
    redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom_histogram_sel_x(BITSELECT,21)@2
    i_idxprom_histogram_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q(31 downto 0)), 64)));

    -- i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select(BITSELECT,85)@2
    i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_b <= i_idxprom_histogram_sel_x_b(17 downto 0);
    i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_c <= i_idxprom_histogram_sel_x_b(63 downto 54);
    i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_d <= i_idxprom_histogram_sel_x_b(35 downto 18);
    i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_e <= i_idxprom_histogram_sel_x_b(53 downto 36);

    -- i_arrayidx_histogram_histogram3_mult_x_im3_shift0(BITSHIFT,82)@2
    i_arrayidx_histogram_histogram3_mult_x_im3_shift0_qint <= i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_histogram_histogram3_mult_x_im3_shift0_q <= i_arrayidx_histogram_histogram3_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_align_15(BITSHIFT,75)@2
    i_arrayidx_histogram_histogram3_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_histogram_histogram3_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx_histogram_histogram3_mult_x_align_15_q <= i_arrayidx_histogram_histogram3_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_im6_shift0(BITSHIFT,83)@2
    i_arrayidx_histogram_histogram3_mult_x_im6_shift0_qint <= i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_histogram_histogram3_mult_x_im6_shift0_q <= i_arrayidx_histogram_histogram3_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_align_14(BITSHIFT,74)@2
    i_arrayidx_histogram_histogram3_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_histogram_histogram3_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_histogram_histogram3_mult_x_align_14_q <= i_arrayidx_histogram_histogram3_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_join_16(BITJOIN,76)@2
    i_arrayidx_histogram_histogram3_mult_x_join_16_q <= i_arrayidx_histogram_histogram3_mult_x_align_15_q & i_arrayidx_histogram_histogram3_mult_x_align_14_q;

    -- i_arrayidx_histogram_histogram3_mult_x_im9_shift0(BITSHIFT,84)@2
    i_arrayidx_histogram_histogram3_mult_x_im9_shift0_qint <= i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_histogram_histogram3_mult_x_im9_shift0_q <= i_arrayidx_histogram_histogram3_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_align_12(BITSHIFT,72)@2
    i_arrayidx_histogram_histogram3_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_histogram_histogram3_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx_histogram_histogram3_mult_x_align_12_q <= i_arrayidx_histogram_histogram3_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_im0_shift0(BITSHIFT,81)@2
    i_arrayidx_histogram_histogram3_mult_x_im0_shift0_qint <= i_arrayidx_histogram_histogram3_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_histogram_histogram3_mult_x_im0_shift0_q <= i_arrayidx_histogram_histogram3_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_x_join_13(BITJOIN,73)@2
    i_arrayidx_histogram_histogram3_mult_x_join_13_q <= i_arrayidx_histogram_histogram3_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_histogram_histogram3_mult_x_im0_shift0_q);

    -- i_arrayidx_histogram_histogram3_mult_x_result_add_0_0(ADD,77)@2
    i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_histogram_histogram3_mult_x_join_13_q);
    i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_histogram_histogram3_mult_x_join_16_q);
    i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_b));
    i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_q <= i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_histogram_histogram3_mult_extender_x(BITJOIN,14)@2
    i_arrayidx_histogram_histogram3_mult_extender_x_q <= i_arrayidx_histogram_histogram3_mult_multconst_x_q & i_arrayidx_histogram_histogram3_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_histogram_histogram3_trunc_sel_x(BITSELECT,16)@2
    i_arrayidx_histogram_histogram3_trunc_sel_x_b <= i_arrayidx_histogram_histogram3_mult_extender_x_q(63 downto 0);

    -- i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x(BITSELECT,11)@2
    i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx_histogram_histogram3_trunc_sel_x_b);
    i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x_b <= i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx_histogram_vt_select_63(BITSELECT,35)@2
    i_arrayidx_histogram_vt_select_63_b <= i_arrayidx_histogram_histogram3_dupName_0_trunc_sel_x_b(63 downto 2);

    -- i_arrayidx_histogram_vt_const_1(CONSTANT,33)
    i_arrayidx_histogram_vt_const_1_q <= "00";

    -- i_arrayidx_histogram_vt_join(BITJOIN,34)@2
    i_arrayidx_histogram_vt_join_q <= i_arrayidx_histogram_vt_select_63_b & i_arrayidx_histogram_vt_const_1_q;

    -- i_store_unnamed_histogram0_histogram(BLACKBOX,46)@2
    -- in in_i_stall@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@3
    -- out out_unnamed_histogram0_avm_address@20000000
    -- out out_unnamed_histogram0_avm_burstcount@20000000
    -- out out_unnamed_histogram0_avm_byteenable@20000000
    -- out out_unnamed_histogram0_avm_enable@20000000
    -- out out_unnamed_histogram0_avm_read@20000000
    -- out out_unnamed_histogram0_avm_write@20000000
    -- out out_unnamed_histogram0_avm_writedata@20000000
    thei_store_unnamed_histogram0_histogram : i_store_unnamed_histogram0_histogram5
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_histogram_vt_join_q,
        in_i_bitwiseor => i_l_grpid_0_addr_zext_histogram_vt_join_q,
        in_i_predicate => i_cmp15_neg_rm_histogram_c,
        in_i_stall => SE_i_cmp20_guard_histogram_backStall,
        in_i_valid => SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V1,
        in_i_writedata => c_i32_0gr_q,
        in_unnamed_histogram0_avm_readdata => in_unnamed_histogram0_avm_readdata,
        in_unnamed_histogram0_avm_readdatavalid => in_unnamed_histogram0_avm_readdatavalid,
        in_unnamed_histogram0_avm_waitrequest => in_unnamed_histogram0_avm_waitrequest,
        in_unnamed_histogram0_avm_writeack => in_unnamed_histogram0_avm_writeack,
        out_o_stall => i_store_unnamed_histogram0_histogram_out_o_stall,
        out_o_valid => i_store_unnamed_histogram0_histogram_out_o_valid,
        out_unnamed_histogram0_avm_address => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_address,
        out_unnamed_histogram0_avm_burstcount => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_burstcount,
        out_unnamed_histogram0_avm_byteenable => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_byteenable,
        out_unnamed_histogram0_avm_enable => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_enable,
        out_unnamed_histogram0_avm_read => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_read,
        out_unnamed_histogram0_avm_write => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_write,
        out_unnamed_histogram0_avm_writedata => i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg(STALLFIFO,199)
    bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_in <= SE_out_i_syncbuf_local_size_0_sync_buffer2_histogram_V0;
    bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_in <= SE_i_cmp20_guard_histogram_backStall;
    bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_in(0);
    bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_in(0);
    bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_out(0) <= bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_out(0) <= bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_cmp20_histogram(STALLENABLE,142)
    -- Valid signal propagation
    SE_i_cmp20_histogram_V0 <= SE_i_cmp20_histogram_R_v_0;
    -- Stall signal propagation
    SE_i_cmp20_histogram_s_tv_0 <= SE_i_cmp20_guard_histogram_backStall and SE_i_cmp20_histogram_R_v_0;
    -- Backward Enable generation
    SE_i_cmp20_histogram_backEN <= not (SE_i_cmp20_histogram_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp20_histogram_v_s_0 <= SE_i_cmp20_histogram_backEN and SR_SE_i_cmp20_histogram_V;
    -- Backward Stall generation
    SE_i_cmp20_histogram_backStall <= not (SE_i_cmp20_histogram_backEN);
    SE_i_cmp20_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp20_histogram_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp20_histogram_backEN = "0") THEN
                SE_i_cmp20_histogram_R_v_0 <= SE_i_cmp20_histogram_R_v_0 and SE_i_cmp20_histogram_s_tv_0;
            ELSE
                SE_i_cmp20_histogram_R_v_0 <= SE_i_cmp20_histogram_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_cmp20_guard_histogram(STALLENABLE,141)
    -- Valid signal propagation
    SE_i_cmp20_guard_histogram_V0 <= SE_i_cmp20_guard_histogram_wireValid;
    -- Backward Stall generation
    SE_i_cmp20_guard_histogram_backStall <= in_stall_in or not (SE_i_cmp20_guard_histogram_wireValid);
    -- Computing multiple Valid(s)
    SE_i_cmp20_guard_histogram_and0 <= SE_i_cmp20_histogram_V0;
    SE_i_cmp20_guard_histogram_and1 <= bubble_out_i_syncbuf_local_size_0_sync_buffer2_histogram_1_reg_valid_out and SE_i_cmp20_guard_histogram_and0;
    SE_i_cmp20_guard_histogram_and2 <= i_store_unnamed_histogram0_histogram_out_o_valid and SE_i_cmp20_guard_histogram_and1;
    SE_i_cmp20_guard_histogram_wireValid <= SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_V0 and SE_i_cmp20_guard_histogram_and2;

    -- redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_0(REG,110)
    redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_1(REG,111)
    redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_1_q <= STD_LOGIC_VECTOR(redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_histogram_B1_merge_reg_aunroll_x_out_data_out_4_2_0(REG,109)
    redist8_histogram_B1_merge_reg_aunroll_x_out_data_out_4_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_histogram_B1_merge_reg_aunroll_x_out_data_out_4_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist8_histogram_B1_merge_reg_aunroll_x_out_data_out_4_2_0_q <= STD_LOGIC_VECTOR(redist7_histogram_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0(REG,99)
    redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_q <= STD_LOGIC_VECTOR(i_l_grpid_0_addr_zext_histogram_vt_join_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_histogram_B1_merge_reg_aunroll_x_out_data_out_2_2_0(REG,105)
    redist5_histogram_B1_merge_reg_aunroll_x_out_data_out_2_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_histogram_B1_merge_reg_aunroll_x_out_data_out_2_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist5_histogram_B1_merge_reg_aunroll_x_out_data_out_2_2_0_q <= STD_LOGIC_VECTOR(redist4_histogram_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_0(REG,102)
    redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_1(REG,103)
    redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_1_q <= STD_LOGIC_VECTOR(redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_0(REG,106)
    redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_1(REG,107)
    redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_1_q <= STD_LOGIC_VECTOR(redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_cmp15_neg_rm_histogram_c_1_0(REG,100)
    redist1_i_cmp15_neg_rm_histogram_c_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_cmp15_neg_rm_histogram_c_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist1_i_cmp15_neg_rm_histogram_c_1_0_q <= STD_LOGIC_VECTOR(i_cmp15_neg_rm_histogram_c);
            END IF;
        END IF;
    END PROCESS;

    -- i_cmp20_histogram(COMPARE,38)@2 + 1
    i_cmp20_histogram_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_255_q(31)) & c_i32_255_q));
    i_cmp20_histogram_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp20_histogram_D0(31)) & SR_SE_i_cmp20_histogram_D0));
    i_cmp20_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp20_histogram_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp20_histogram_backEN = "1") THEN
                i_cmp20_histogram_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp20_histogram_a) - SIGNED(i_cmp20_histogram_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp20_histogram_c(0) <= i_cmp20_histogram_o(33);

    -- i_cmp20_guard_histogram(LOGICAL,37)@3
    i_cmp20_guard_histogram_q <= i_cmp20_histogram_c or redist1_i_cmp15_neg_rm_histogram_c_1_0_q;

    -- redist12_bgTrunc_i_add_histogram_sel_x_b_2_0(REG,115)
    redist12_bgTrunc_i_add_histogram_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_bgTrunc_i_add_histogram_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp20_histogram_backEN = "1") THEN
                redist12_bgTrunc_i_add_histogram_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(SR_SE_i_cmp20_histogram_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_0(REG,112)
    redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_histogram_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B1_merge_reg_aunroll_x_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_1(REG,113)
    redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_backEN = "1") THEN
                redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q <= STD_LOGIC_VECTOR(redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,7)@3
    out_acl_hw_wg_id29 <= redist10_histogram_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q;
    out_add <= redist12_bgTrunc_i_add_histogram_sel_x_b_2_0_q;
    out_cmp20_GUARD <= i_cmp20_guard_histogram_q;
    out_global_id_014 <= redist6_histogram_B1_merge_reg_aunroll_x_out_data_out_3_2_1_q;
    out_l_grpid_06 <= redist3_histogram_B1_merge_reg_aunroll_x_out_data_out_1_2_1_q;
    out_l_grpid_0_addr7 <= redist5_histogram_B1_merge_reg_aunroll_x_out_data_out_2_2_0_q;
    out_l_grpid_0_addr_zext <= redist0_i_l_grpid_0_addr_zext_histogram_vt_join_q_1_0_q;
    out_local_id_019 <= redist8_histogram_B1_merge_reg_aunroll_x_out_data_out_4_2_0_q;
    out_local_linear_id23 <= redist9_histogram_B1_merge_reg_aunroll_x_out_data_out_5_2_1_q;
    out_valid_out <= SE_i_cmp20_guard_histogram_V0;

    -- ext_sig_sync_out(GPOUT,31)
    out_unnamed_histogram0_avm_address <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_address;
    out_unnamed_histogram0_avm_enable <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_enable;
    out_unnamed_histogram0_avm_read <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_read;
    out_unnamed_histogram0_avm_write <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_write;
    out_unnamed_histogram0_avm_writedata <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_writedata;
    out_unnamed_histogram0_avm_byteenable <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_byteenable;
    out_unnamed_histogram0_avm_burstcount <= i_store_unnamed_histogram0_histogram_out_unnamed_histogram0_avm_burstcount;

    -- sync_out(GPOUT,59)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
