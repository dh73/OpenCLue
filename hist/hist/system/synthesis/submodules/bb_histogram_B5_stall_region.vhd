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

-- VHDL created from bb_histogram_B5_stall_region
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

entity bb_histogram_B5_stall_region is
    port (
        in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_call36_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_call36_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_call36_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_acl_hw_wg_id25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i27_012 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext8 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_015 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_015 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_call36_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B5_stall_region;

architecture normal of bb_histogram_B5_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component histogram_B5_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body31_histogram_c0_enter_histogram is
        port (
            in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_unknown_call36_histogram45 is
        port (
            in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_call36_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_call36_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call36_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call36_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_lsu_call36_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;





    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call36_histogram_out_call36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_unknown_call36_histogram_out_lsu_call36_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call36_histogram_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call36_histogram_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_histogram_B5_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (191 downto 0);
    signal bubble_select_histogram_B5_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B5_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B5_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_histogram_B5_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B5_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q : STD_LOGIC_VECTOR (129 downto 0);
    signal bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (191 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B5_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_D1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_0(REG,41)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1(REG,42)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1_q <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0(REG,34)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1(REG,35)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_q <= STD_LOGIC_VECTOR(redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_2(REG,43)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3(REG,44)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3_q <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2(REG,36)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3(REG,37)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_q <= STD_LOGIC_VECTOR(redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_4(REG,45)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5(REG,46)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5_q <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4(REG,38)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5(REG,39)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_q <= STD_LOGIC_VECTOR(redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6(STALLENABLE,89)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_s_tv_0 <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN and SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_V;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6(STALLREG,139)
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid <= (others => '0');
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data0 <= (others => '-');
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backStall and (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid or SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_i_valid);

            IF (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data0 <= STD_LOGIC_VECTOR(redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_q);
                SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data1 <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_i_valid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backStall <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid or not (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_i_valid);

    -- Valid
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_V <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid = "1" ELSE SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_i_valid;

    -- Data0
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_D0 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data0 WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid = "1" ELSE redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_q;
    -- Data1
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_D1 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_data1 WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_r_valid = "1" ELSE redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_5_q;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5(STALLENABLE,88)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_s_tv_0 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backEN and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_V0;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_v_s_0);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4(STALLENABLE,87)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_s_tv_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_5_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN and SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_V;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4(STALLREG,138)
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid <= (others => '0');
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data0 <= (others => '-');
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backStall and (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid or SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_i_valid);

            IF (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data0 <= STD_LOGIC_VECTOR(redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_q);
                SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data1 <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_i_valid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backStall <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid or not (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_i_valid);

    -- Valid
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_V <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid = "1" ELSE SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_i_valid;

    -- Data0
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_D0 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data0 WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid = "1" ELSE redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_q;
    -- Data1
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_D1 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_data1 WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_r_valid = "1" ELSE redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_3_q;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3(STALLENABLE,86)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_s_tv_0 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_4_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backEN and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_V0;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_v_s_0);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2(STALLENABLE,85)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_s_tv_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_3_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN and SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_V;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2(STALLREG,137)
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid <= (others => '0');
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data0 <= (others => '-');
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backStall and (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid or SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_i_valid);

            IF (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data0 <= STD_LOGIC_VECTOR(redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_q);
                SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data1 <= STD_LOGIC_VECTOR(redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_i_valid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backStall <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid or not (SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_i_valid);

    -- Valid
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_V <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid = "1" ELSE SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_i_valid;

    -- Data0
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_D0 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data0 WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid = "1" ELSE redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_q;
    -- Data1
    SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_D1 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_data1 WHEN SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_r_valid = "1" ELSE redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_1_q;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1(STALLENABLE,84)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_s_tv_0 <= SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_2_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backEN and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_V0;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_v_s_0);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0(STALLENABLE,83)
    -- Valid signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_V0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_s_tv_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_1_backStall and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backEN <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_v_s_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backEN and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backStall <= not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_v_s_0);
    SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backEN = "0") THEN
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0 and SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_s_tv_0;
            ELSE
                SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_R_v_0 <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo(STALLFIFO,51)
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_in <= SE_out_histogram_B5_merge_reg_aunroll_x_V4;
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_in <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall;
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_data_in <= bubble_select_histogram_B5_merge_reg_aunroll_x_f;
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_in_bitsignaltemp <= redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_in(0);
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_in_bitsignaltemp <= redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_in(0);
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_out(0) <= redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_out_bitsignaltemp;
    redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_out(0) <= redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_out_bitsignaltemp;
    theredist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 16,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B5_merge_reg_aunroll_x_f,
        valid_out => redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_out_bitsignaltemp,
        data_out => redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo(STALLFIFO,50)
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_in <= SE_out_histogram_B5_merge_reg_aunroll_x_V3;
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_in <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall;
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_data_in <= bubble_select_histogram_B5_merge_reg_aunroll_x_e;
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_in_bitsignaltemp <= redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_in(0);
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_in_bitsignaltemp <= redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_in(0);
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_out(0) <= redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_out_bitsignaltemp;
    redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_out(0) <= redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_out_bitsignaltemp;
    theredist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 16,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B5_merge_reg_aunroll_x_e,
        valid_out => redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_out_bitsignaltemp,
        data_out => redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo(STALLFIFO,49)
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_in <= SE_out_histogram_B5_merge_reg_aunroll_x_V2;
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_in <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall;
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_data_in <= bubble_select_histogram_B5_merge_reg_aunroll_x_d;
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_in_bitsignaltemp <= redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_in(0);
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_in_bitsignaltemp <= redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_in(0);
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_out(0) <= redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_out_bitsignaltemp;
    redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_out(0) <= redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_out_bitsignaltemp;
    theredist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 16,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B5_merge_reg_aunroll_x_d,
        valid_out => redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_out_bitsignaltemp,
        data_out => redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo(STALLFIFO,48)
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_in <= SE_out_histogram_B5_merge_reg_aunroll_x_V1;
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_in <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall;
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_data_in <= bubble_select_histogram_B5_merge_reg_aunroll_x_c;
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_in_bitsignaltemp <= redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_in(0);
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_in_bitsignaltemp <= redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_in(0);
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_out(0) <= redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_out_bitsignaltemp;
    redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_out(0) <= redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_out_bitsignaltemp;
    theredist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 16,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B5_merge_reg_aunroll_x_c,
        valid_out => redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_out_bitsignaltemp,
        data_out => redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,81)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= histogram_B5_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,60)
    bubble_join_stall_entry_q <= in_local_id_015 & in_l_grpid_0_addr_zext8 & in_l_grpid_02 & in_i27_012 & in_acl_hw_wg_id25;

    -- bubble_select_stall_entry(BITSELECT,61)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 96));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));

    -- histogram_B5_merge_reg_aunroll_x(BLACKBOX,13)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thehistogram_B5_merge_reg_aunroll_x : histogram_B5_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_d,
        in_data_in_2 => bubble_select_stall_entry_e,
        in_data_in_3 => bubble_select_stall_entry_f,
        in_data_in_4 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_histogram_B5_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => histogram_B5_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => histogram_B5_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => histogram_B5_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => histogram_B5_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => histogram_B5_merge_reg_aunroll_x_out_data_out_4,
        out_stall_out => histogram_B5_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => histogram_B5_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_histogram_B5_merge_reg_aunroll_x(STALLENABLE,76)
    SE_out_histogram_B5_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg0 <= SE_out_histogram_B5_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg1 <= SE_out_histogram_B5_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg2 <= SE_out_histogram_B5_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg3 <= SE_out_histogram_B5_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_histogram_B5_merge_reg_aunroll_x_fromReg4 <= SE_out_histogram_B5_merge_reg_aunroll_x_toReg4;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_histogram_B5_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_o_stall) and SE_out_histogram_B5_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B5_merge_reg_aunroll_x_fromReg0;
    SE_out_histogram_B5_merge_reg_aunroll_x_consumed1 <= (not (redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_stall_out) and SE_out_histogram_B5_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B5_merge_reg_aunroll_x_fromReg1;
    SE_out_histogram_B5_merge_reg_aunroll_x_consumed2 <= (not (redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_stall_out) and SE_out_histogram_B5_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B5_merge_reg_aunroll_x_fromReg2;
    SE_out_histogram_B5_merge_reg_aunroll_x_consumed3 <= (not (redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_stall_out) and SE_out_histogram_B5_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B5_merge_reg_aunroll_x_fromReg3;
    SE_out_histogram_B5_merge_reg_aunroll_x_consumed4 <= (not (redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_stall_out) and SE_out_histogram_B5_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B5_merge_reg_aunroll_x_fromReg4;
    -- Consuming
    SE_out_histogram_B5_merge_reg_aunroll_x_StallValid <= SE_out_histogram_B5_merge_reg_aunroll_x_backStall and SE_out_histogram_B5_merge_reg_aunroll_x_wireValid;
    SE_out_histogram_B5_merge_reg_aunroll_x_toReg0 <= SE_out_histogram_B5_merge_reg_aunroll_x_StallValid and SE_out_histogram_B5_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B5_merge_reg_aunroll_x_toReg1 <= SE_out_histogram_B5_merge_reg_aunroll_x_StallValid and SE_out_histogram_B5_merge_reg_aunroll_x_consumed1;
    SE_out_histogram_B5_merge_reg_aunroll_x_toReg2 <= SE_out_histogram_B5_merge_reg_aunroll_x_StallValid and SE_out_histogram_B5_merge_reg_aunroll_x_consumed2;
    SE_out_histogram_B5_merge_reg_aunroll_x_toReg3 <= SE_out_histogram_B5_merge_reg_aunroll_x_StallValid and SE_out_histogram_B5_merge_reg_aunroll_x_consumed3;
    SE_out_histogram_B5_merge_reg_aunroll_x_toReg4 <= SE_out_histogram_B5_merge_reg_aunroll_x_StallValid and SE_out_histogram_B5_merge_reg_aunroll_x_consumed4;
    -- Backward Stall generation
    SE_out_histogram_B5_merge_reg_aunroll_x_or0 <= SE_out_histogram_B5_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B5_merge_reg_aunroll_x_or1 <= SE_out_histogram_B5_merge_reg_aunroll_x_consumed1 and SE_out_histogram_B5_merge_reg_aunroll_x_or0;
    SE_out_histogram_B5_merge_reg_aunroll_x_or2 <= SE_out_histogram_B5_merge_reg_aunroll_x_consumed2 and SE_out_histogram_B5_merge_reg_aunroll_x_or1;
    SE_out_histogram_B5_merge_reg_aunroll_x_or3 <= SE_out_histogram_B5_merge_reg_aunroll_x_consumed3 and SE_out_histogram_B5_merge_reg_aunroll_x_or2;
    SE_out_histogram_B5_merge_reg_aunroll_x_wireStall <= not (SE_out_histogram_B5_merge_reg_aunroll_x_consumed4 and SE_out_histogram_B5_merge_reg_aunroll_x_or3);
    SE_out_histogram_B5_merge_reg_aunroll_x_backStall <= SE_out_histogram_B5_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_histogram_B5_merge_reg_aunroll_x_V0 <= SE_out_histogram_B5_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B5_merge_reg_aunroll_x_fromReg0);
    SE_out_histogram_B5_merge_reg_aunroll_x_V1 <= SE_out_histogram_B5_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B5_merge_reg_aunroll_x_fromReg1);
    SE_out_histogram_B5_merge_reg_aunroll_x_V2 <= SE_out_histogram_B5_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B5_merge_reg_aunroll_x_fromReg2);
    SE_out_histogram_B5_merge_reg_aunroll_x_V3 <= SE_out_histogram_B5_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B5_merge_reg_aunroll_x_fromReg3);
    SE_out_histogram_B5_merge_reg_aunroll_x_V4 <= SE_out_histogram_B5_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B5_merge_reg_aunroll_x_fromReg4);
    -- Computing multiple Valid(s)
    SE_out_histogram_B5_merge_reg_aunroll_x_wireValid <= histogram_B5_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_histogram_B5_merge_reg_aunroll_x(BITJOIN,53)
    bubble_join_histogram_B5_merge_reg_aunroll_x_q <= histogram_B5_merge_reg_aunroll_x_out_data_out_4 & histogram_B5_merge_reg_aunroll_x_out_data_out_3 & histogram_B5_merge_reg_aunroll_x_out_data_out_2 & histogram_B5_merge_reg_aunroll_x_out_data_out_1 & histogram_B5_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_histogram_B5_merge_reg_aunroll_x(BITSELECT,54)
    bubble_select_histogram_B5_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_histogram_B5_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_histogram_B5_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_histogram_B5_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_histogram_B5_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_histogram_B5_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_histogram_B5_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_histogram_B5_merge_reg_aunroll_x_q(159 downto 128));
    bubble_select_histogram_B5_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_histogram_B5_merge_reg_aunroll_x_q(191 downto 160));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x(BLACKBOX,14)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@9
    -- out out_c0_exit_1@9
    -- out out_c0_exit_2@9
    -- out out_c0_exit_3@9
    -- out out_c0_exit_4@9
    -- out out_c0_exit_5@9
    -- out out_o_stall@20000000
    -- out out_o_valid@9
    -- out out_unnamed_histogram5_avm_address@20000000
    -- out out_unnamed_histogram5_avm_burstcount@20000000
    -- out out_unnamed_histogram5_avm_byteenable@20000000
    -- out out_unnamed_histogram5_avm_enable@20000000
    -- out out_unnamed_histogram5_avm_read@20000000
    -- out out_unnamed_histogram5_avm_write@20000000
    -- out out_unnamed_histogram5_avm_writedata@20000000
    thei_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x : i_sfc_c0_for_body31_histogram_c0_enter_histogram
    PORT MAP (
        in_c0_eni3_0 => GND_q,
        in_c0_eni3_1 => bubble_select_histogram_B5_merge_reg_aunroll_x_b,
        in_c0_eni3_2 => bubble_select_histogram_B5_merge_reg_aunroll_x_e,
        in_c0_eni3_3 => bubble_select_histogram_B5_merge_reg_aunroll_x_d,
        in_flush => in_flush,
        in_histogram => in_histogram,
        in_i_stall => SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_backStall,
        in_i_valid => SE_out_histogram_B5_merge_reg_aunroll_x_V0,
        in_local_size_0 => in_local_size_0,
        in_unnamed_histogram5_avm_readdata => in_unnamed_histogram5_avm_readdata,
        in_unnamed_histogram5_avm_readdatavalid => in_unnamed_histogram5_avm_readdatavalid,
        in_unnamed_histogram5_avm_waitrequest => in_unnamed_histogram5_avm_waitrequest,
        in_unnamed_histogram5_avm_writeack => in_unnamed_histogram5_avm_writeack,
        out_c0_exit_1 => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_1,
        out_c0_exit_2 => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_2,
        out_c0_exit_3 => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_3,
        out_c0_exit_4 => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4,
        out_c0_exit_5 => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5,
        out_o_stall => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_o_valid,
        out_unnamed_histogram5_avm_address => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_address,
        out_unnamed_histogram5_avm_burstcount => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_burstcount,
        out_unnamed_histogram5_avm_byteenable => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_byteenable,
        out_unnamed_histogram5_avm_enable => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_enable,
        out_unnamed_histogram5_avm_read => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_read,
        out_unnamed_histogram5_avm_write => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_write,
        out_unnamed_histogram5_avm_writedata => i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x(STALLENABLE,78)
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed0 <= (not (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_0_backStall) and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed1 <= (not (i_unknown_call36_histogram_out_o_stall) and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg1;
    -- Consuming
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_backStall and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_or0 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_or0);
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_backStall <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_V1 <= SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_wireValid <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_o_valid;

    -- SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo(STALLENABLE,104)
    -- Valid signal propagation
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_V0 <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall <= in_stall_in or not (SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and0 <= redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_valid_out;
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and1 <= redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_valid_out and SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and0;
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and2 <= redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_valid_out and SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and1;
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and3 <= redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_valid_out and SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and2;
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and4 <= i_unknown_call36_histogram_out_o_valid and SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and3;
    SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_wireValid <= SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_V0 and SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_and4;

    -- bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x(BITJOIN,56)
    bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5 & i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4 & i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_3 & i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_2 & i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x(BITSELECT,57)
    bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q(63 downto 0));
    bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q(64 downto 64));
    bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q(96 downto 65));
    bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q(128 downto 97));
    bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_q(129 downto 129));

    -- i_unknown_call36_histogram(BLACKBOX,20)@9
    -- in in_i_stall@20000000
    -- out out_call36_avm_address@20000000
    -- out out_call36_avm_burstcount@20000000
    -- out out_call36_avm_byteenable@20000000
    -- out out_call36_avm_enable@20000000
    -- out out_call36_avm_read@20000000
    -- out out_call36_avm_write@20000000
    -- out out_call36_avm_writedata@20000000
    -- out out_lsu_call36_o_active@20000000
    -- out out_o_readdata@16
    -- out out_o_stall@20000000
    -- out out_o_valid@16
    thei_unknown_call36_histogram : i_unknown_call36_histogram45
    PORT MAP (
        in_call36_avm_readdata => in_call36_avm_readdata,
        in_call36_avm_readdatavalid => in_call36_avm_readdatavalid,
        in_call36_avm_waitrequest => in_call36_avm_waitrequest,
        in_call36_avm_writeack => in_call36_avm_writeack,
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_b,
        in_i_predicate => bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_c,
        in_i_stall => SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_V1,
        in_i_writedata => bubble_select_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_d,
        out_call36_avm_address => i_unknown_call36_histogram_out_call36_avm_address,
        out_call36_avm_burstcount => i_unknown_call36_histogram_out_call36_avm_burstcount,
        out_call36_avm_byteenable => i_unknown_call36_histogram_out_call36_avm_byteenable,
        out_call36_avm_enable => i_unknown_call36_histogram_out_call36_avm_enable,
        out_call36_avm_read => i_unknown_call36_histogram_out_call36_avm_read,
        out_call36_avm_write => i_unknown_call36_histogram_out_call36_avm_write,
        out_call36_avm_writedata => i_unknown_call36_histogram_out_call36_avm_writedata,
        out_lsu_call36_o_active => i_unknown_call36_histogram_out_lsu_call36_o_active,
        out_o_stall => i_unknown_call36_histogram_out_o_stall,
        out_o_valid => i_unknown_call36_histogram_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_call36_avm_address <= i_unknown_call36_histogram_out_call36_avm_address;
    out_call36_avm_enable <= i_unknown_call36_histogram_out_call36_avm_enable;
    out_call36_avm_read <= i_unknown_call36_histogram_out_call36_avm_read;
    out_call36_avm_write <= i_unknown_call36_histogram_out_call36_avm_write;
    out_call36_avm_writedata <= i_unknown_call36_histogram_out_call36_avm_writedata;
    out_call36_avm_byteenable <= i_unknown_call36_histogram_out_call36_avm_byteenable;
    out_call36_avm_burstcount <= i_unknown_call36_histogram_out_call36_avm_burstcount;

    -- bubble_join_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo(BITJOIN,70)
    bubble_join_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_q <= redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_data_out;

    -- bubble_select_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo(BITSELECT,71)
    bubble_select_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_q(31 downto 0));

    -- bubble_join_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo(BITJOIN,67)
    bubble_join_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_q <= redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_data_out;

    -- bubble_select_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo(BITSELECT,68)
    bubble_select_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_q(63 downto 0));

    -- bubble_join_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo(BITJOIN,64)
    bubble_join_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_q <= redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_data_out;

    -- bubble_select_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo(BITSELECT,65)
    bubble_select_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_q(31 downto 0));

    -- redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_6(REG,47)
    redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN = "1") THEN
                redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_6_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6(REG,40)
    redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_backEN = "1") THEN
                redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo(BITJOIN,73)
    bubble_join_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_q <= redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_data_out;

    -- bubble_select_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo(BITSELECT,74)
    bubble_select_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_q(31 downto 0));

    -- dupName_0_sync_out_x(GPOUT,8)@16
    out_acl_hw_wg_id25 <= bubble_select_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_b;
    out_c0_exe4 <= redist0_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_4_7_6_q;
    out_c0_exe5 <= redist1_i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_c0_exit_5_7_6_q;
    out_l_grpid_02 <= bubble_select_redist2_histogram_B5_merge_reg_aunroll_x_out_data_out_1_15_fifo_b;
    out_l_grpid_0_addr_zext8 <= bubble_select_redist3_histogram_B5_merge_reg_aunroll_x_out_data_out_2_15_fifo_b;
    out_local_id_015 <= bubble_select_redist4_histogram_B5_merge_reg_aunroll_x_out_data_out_3_15_fifo_b;
    out_valid_out <= SE_out_redist5_histogram_B5_merge_reg_aunroll_x_out_data_out_4_15_fifo_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,9)
    out_lsu_call36_o_active <= i_unknown_call36_histogram_out_lsu_call36_o_active;

    -- ext_sig_sync_out(GPOUT,19)
    out_unnamed_histogram5_avm_address <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_address;
    out_unnamed_histogram5_avm_enable <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_enable;
    out_unnamed_histogram5_avm_read <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_read;
    out_unnamed_histogram5_avm_write <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_write;
    out_unnamed_histogram5_avm_writedata <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_writedata;
    out_unnamed_histogram5_avm_byteenable <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_byteenable;
    out_unnamed_histogram5_avm_burstcount <= i_sfc_c0_for_body31_histogram_c0_enter_histogram_aunroll_x_out_unnamed_histogram5_avm_burstcount;

    -- sync_out(GPOUT,27)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
