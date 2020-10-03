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

-- VHDL created from i_acl_wg_limiter_enter_l_grpid_0_histogram0
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

entity i_acl_wg_limiter_enter_l_grpid_0_histogram0 is
    port (
        in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_data : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_data : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_wg_limiter_enter_l_grpid_0_histogram0;

architecture normal of i_acl_wg_limiter_enter_l_grpid_0_histogram0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_work_group_limiter_dspba is
        generic (
            KERNEL_WG_LIMIT : INTEGER;
            WG_LIMIT : INTEGER;
            MAX_WG_SIZE : INTEGER := 256;
            WG_FIFO_ORDER : INTEGER := 0
        );
        port (
            entry_k_wgid : in std_logic_vector(31 downto 0);
            entry_stall_in : in std_logic;
            entry_valid_in : in std_logic;
            exit_stall_in : in std_logic;
            exit_valid_in : in std_logic;
            wg_size : in std_logic_vector(31 downto 0);
            entry_l_wgid : out std_logic_vector(31 downto 0);
            entry_stall_out : out std_logic;
            entry_valid_out : out std_logic;
            exit_stall_out : out std_logic;
            exit_valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_k_wgid : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_in_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_in_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_in_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_in_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_wg_size : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_l_wgid : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_out_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_out_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_out_bitsignaltemp : std_logic;
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_out_bitsignaltemp : std_logic;

begin


    -- i_acl_wg_limiter_enter_l_grpid_0_histogram1(EXTIFACE,7)
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_k_wgid <= in_i_data;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_in <= in_i_stall;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_in <= in_i_valid;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_in <= in_wgl_0_enter_exit_stall_in;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_in <= in_wgl_0_enter_exit_valid_in;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_wg_size <= in_wgl_0_wgs_wg_size;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_in_bitsignaltemp <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_in(0);
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_in_bitsignaltemp <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_in(0);
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_in_bitsignaltemp <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_in(0);
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_in_bitsignaltemp <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_in(0);
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_out(0) <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_out_bitsignaltemp;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_out(0) <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_out_bitsignaltemp;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_out(0) <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_out_bitsignaltemp;
    i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_out(0) <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_out_bitsignaltemp;
    thei_acl_wg_limiter_enter_l_grpid_0_histogram1 : acl_work_group_limiter_dspba
    GENERIC MAP (
        KERNEL_WG_LIMIT => 8,
        WG_LIMIT => 8,
        MAX_WG_SIZE => 256,
        WG_FIFO_ORDER => 0
    )
    PORT MAP (
        entry_k_wgid => in_i_data,
        entry_stall_in => i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_in_bitsignaltemp,
        entry_valid_in => i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_in_bitsignaltemp,
        exit_stall_in => i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_in_bitsignaltemp,
        exit_valid_in => i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_in_bitsignaltemp,
        wg_size => in_wgl_0_wgs_wg_size,
        entry_l_wgid => i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_l_wgid,
        entry_stall_out => i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_out_bitsignaltemp,
        entry_valid_out => i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_out_bitsignaltemp,
        exit_stall_out => i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_out_bitsignaltemp,
        exit_valid_out => i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,3)
    out_wgl_0_enter_exit_valid_out <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_valid_out;

    -- dupName_0_sync_out_x(GPOUT,5)@2
    out_o_data <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_l_wgid;
    out_o_valid <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_valid_out;

    -- regfree_osync(GPOUT,9)
    out_wgl_0_enter_exit_stall_out <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_exit_stall_out;

    -- sync_out(GPOUT,11)@20000000
    out_o_stall <= i_acl_wg_limiter_enter_l_grpid_0_histogram1_entry_stall_out;

END normal;
