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

-- VHDL created from bb_histogram_B4_stall_region
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

entity bb_histogram_B4_stall_region is
    port (
        in_acl_hw_wg_id26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_03 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext9 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_016 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id26_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_03_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext9_extract : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_016_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_barrier_unnamed_histogram4_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B4_stall_region;

architecture normal of bb_histogram_B4_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_rbar_unnamed_histogram4_histogram29 is
        port (
            in_data_entry_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_entry_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_entry_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_entry_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_entry_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_exit_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_rbar_unnamed_histogram4_histogram_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_rbar_unnamed_histogram4_histogram_aunroll_x_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x_q : STD_LOGIC_VECTOR (159 downto 0);
    signal bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (191 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,24)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= i_rbar_unnamed_histogram4_histogram_aunroll_x_out_stall_entry or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,19)
    bubble_join_stall_entry_q <= in_local_linear_id20 & in_local_id_016 & in_l_grpid_0_addr_zext9 & in_l_grpid_03 & in_acl_hw_wg_id26;

    -- bubble_select_stall_entry(BITSELECT,20)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));

    -- i_rbar_unnamed_histogram4_histogram_aunroll_x(BLACKBOX,4)@0
    -- in in_stall_exit@20000000
    -- out out_data_exit_0@2
    -- out out_data_exit_1@2
    -- out out_data_exit_2@2
    -- out out_data_exit_3@2
    -- out out_data_exit_4@2
    -- out out_stall_entry@20000000
    -- out out_valid_exit@2
    thei_rbar_unnamed_histogram4_histogram_aunroll_x : i_rbar_unnamed_histogram4_histogram29
    PORT MAP (
        in_data_entry_0 => bubble_select_stall_entry_b,
        in_data_entry_1 => bubble_select_stall_entry_f,
        in_data_entry_2 => bubble_select_stall_entry_c,
        in_data_entry_3 => bubble_select_stall_entry_d,
        in_data_entry_4 => bubble_select_stall_entry_e,
        in_stall_exit => SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_backStall,
        in_valid_entry => SE_stall_entry_V0,
        in_workgroup_size => in_barrier_unnamed_histogram4_wgs_workgroup_size,
        out_data_exit_0 => i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_0,
        out_data_exit_2 => i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_2,
        out_data_exit_3 => i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_3,
        out_data_exit_4 => i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_4,
        out_stall_entry => i_rbar_unnamed_histogram4_histogram_aunroll_x_out_stall_entry,
        out_valid_exit => i_rbar_unnamed_histogram4_histogram_aunroll_x_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x(STALLENABLE,23)
    -- Valid signal propagation
    SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_V0 <= SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_backStall <= in_stall_in or not (SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_wireValid <= i_rbar_unnamed_histogram4_histogram_aunroll_x_out_valid_exit;

    -- bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x(BITJOIN,15)
    bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x_q <= i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_4 & i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_3 & i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_2 & i_rbar_unnamed_histogram4_histogram_aunroll_x_out_data_exit_0;

    -- bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x(BITSELECT,16)
    bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x_q(31 downto 0));
    bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x_q(63 downto 32));
    bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x_q(127 downto 64));
    bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_rbar_unnamed_histogram4_histogram_aunroll_x_q(159 downto 128));

    -- dupName_0_sync_out_x(GPOUT,3)@2
    out_acl_hw_wg_id26_extract <= bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_b;
    out_l_grpid_03_extract <= bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_c;
    out_l_grpid_0_addr_zext9_extract <= bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_d;
    out_local_id_016_extract <= bubble_select_i_rbar_unnamed_histogram4_histogram_aunroll_x_e;
    out_valid_out <= SE_out_i_rbar_unnamed_histogram4_histogram_aunroll_x_V0;

    -- sync_out(GPOUT,13)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
