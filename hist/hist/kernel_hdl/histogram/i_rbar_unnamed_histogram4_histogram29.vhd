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

-- VHDL created from i_rbar_unnamed_histogram4_histogram29
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

entity i_rbar_unnamed_histogram4_histogram29 is
    port (
        in_data_entry_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_entry_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_entry_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_entry_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_entry_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_entry : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_exit_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_exit_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_exit_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_exit_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_exit : out std_logic_vector(0 downto 0);  -- ufix1
        in_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_exit : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_entry : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_rbar_unnamed_histogram4_histogram29;

architecture normal of i_rbar_unnamed_histogram4_histogram29 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_barrier is
        generic (
            MAX_SIMULTANEOUS_WORKGROUPS : INTEGER;
            DATA_WIDTH : INTEGER := 192;
            DEPTH : INTEGER := 256;
            WORKGROUP_SIZE_BITS : INTEGER := 9
        );
        port (
            data_entry : in std_logic_vector(191 downto 0);
            stall_exit : in std_logic;
            valid_entry : in std_logic;
            workgroup_size : in std_logic_vector(8 downto 0);
            data_exit : out std_logic_vector(191 downto 0);
            stall_entry : out std_logic;
            valid_exit : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (191 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_data_entry : STD_LOGIC_VECTOR (191 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_stall_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_stall_exit_bitsignaltemp : std_logic;
    signal i_rbar_unnamed_histogram4_histogram30_valid_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_valid_entry_bitsignaltemp : std_logic;
    signal i_rbar_unnamed_histogram4_histogram30_workgroup_size : STD_LOGIC_VECTOR (8 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_data_exit : STD_LOGIC_VECTOR (191 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_stall_entry_bitsignaltemp : std_logic;
    signal i_rbar_unnamed_histogram4_histogram30_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_rbar_unnamed_histogram4_histogram30_valid_exit_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);
    signal wgs_trunc_in : STD_LOGIC_VECTOR (8 downto 0);
    signal wgs_trunc_q : STD_LOGIC_VECTOR (8 downto 0);

begin


    -- wgs_trunc(ROUND,19)
    wgs_trunc_in <= in_workgroup_size(8 downto 0);
    wgs_trunc_q <= wgs_trunc_in(8 downto 0);

    -- dsdk_ip_adapt_bitjoin(BITJOIN,12)
    dsdk_ip_adapt_bitjoin_q <= in_data_entry_4 & in_data_entry_3 & in_data_entry_2 & in_data_entry_1 & in_data_entry_0;

    -- i_rbar_unnamed_histogram4_histogram30(EXTIFACE,13)
    i_rbar_unnamed_histogram4_histogram30_data_entry <= dsdk_ip_adapt_bitjoin_q;
    i_rbar_unnamed_histogram4_histogram30_stall_exit <= in_stall_exit;
    i_rbar_unnamed_histogram4_histogram30_valid_entry <= in_valid_entry;
    i_rbar_unnamed_histogram4_histogram30_workgroup_size <= wgs_trunc_q;
    i_rbar_unnamed_histogram4_histogram30_stall_exit_bitsignaltemp <= i_rbar_unnamed_histogram4_histogram30_stall_exit(0);
    i_rbar_unnamed_histogram4_histogram30_valid_entry_bitsignaltemp <= i_rbar_unnamed_histogram4_histogram30_valid_entry(0);
    i_rbar_unnamed_histogram4_histogram30_stall_entry(0) <= i_rbar_unnamed_histogram4_histogram30_stall_entry_bitsignaltemp;
    i_rbar_unnamed_histogram4_histogram30_valid_exit(0) <= i_rbar_unnamed_histogram4_histogram30_valid_exit_bitsignaltemp;
    thei_rbar_unnamed_histogram4_histogram30 : acl_barrier
    GENERIC MAP (
        MAX_SIMULTANEOUS_WORKGROUPS => 8,
        DATA_WIDTH => 192,
        DEPTH => 256,
        WORKGROUP_SIZE_BITS => 9
    )
    PORT MAP (
        data_entry => dsdk_ip_adapt_bitjoin_q,
        stall_exit => i_rbar_unnamed_histogram4_histogram30_stall_exit_bitsignaltemp,
        valid_entry => i_rbar_unnamed_histogram4_histogram30_valid_entry_bitsignaltemp,
        workgroup_size => wgs_trunc_q,
        data_exit => i_rbar_unnamed_histogram4_histogram30_data_exit,
        stall_entry => i_rbar_unnamed_histogram4_histogram30_stall_entry_bitsignaltemp,
        valid_exit => i_rbar_unnamed_histogram4_histogram30_valid_exit_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,10)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_rbar_unnamed_histogram4_histogram30_data_exit(191 downto 160);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,11)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,8)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_rbar_unnamed_histogram4_histogram30_data_exit(159 downto 96);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,6)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_rbar_unnamed_histogram4_histogram30_data_exit(95 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,4)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_rbar_unnamed_histogram4_histogram30_data_exit(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,14)
    ip_dsdk_adapt_bitselect_b <= i_rbar_unnamed_histogram4_histogram30_data_exit(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,15)
    ip_dsdk_adapt_cast_b <= ip_dsdk_adapt_bitselect_b(31 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@2
    out_data_exit_0 <= ip_dsdk_adapt_cast_b;
    out_data_exit_1 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_exit_2 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_exit_3 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_exit_4 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_valid_exit <= i_rbar_unnamed_histogram4_histogram30_valid_exit;

    -- sync_out(GPOUT,18)@20000000
    out_stall_entry <= i_rbar_unnamed_histogram4_histogram30_stall_entry;

END normal;
