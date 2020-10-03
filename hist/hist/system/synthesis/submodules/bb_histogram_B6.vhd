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

-- VHDL created from bb_histogram_B6
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

entity bb_histogram_B6 is
    port (
        in_acl_hw_wg_id24_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B6;

architecture normal of bb_histogram_B6 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B6_stall_region is
        port (
            in_acl_hw_wg_id24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_01 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B6_branch is
        port (
            in_acl_hw_wg_id24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B6_merge is
        port (
            in_acl_hw_wg_id24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_01 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B6_stall_region_out_acl_hw_wg_id24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B6_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_stall_region_out_wgl_0_exit_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_stall_region_out_wgl_0_exit_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B6_branch_out_acl_hw_wg_id24 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B6_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B6_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B6_merge_out_acl_hw_wg_id24 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B6_merge_out_l_grpid_01 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B6_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B6_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- histogram_B6_merge(BLACKBOX,4)
    thehistogram_B6_merge : histogram_B6_merge
    PORT MAP (
        in_acl_hw_wg_id24_0 => in_acl_hw_wg_id24_0,
        in_l_grpid_01_0 => in_l_grpid_01_0,
        in_stall_in => bb_histogram_B6_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_acl_hw_wg_id24 => histogram_B6_merge_out_acl_hw_wg_id24,
        out_l_grpid_01 => histogram_B6_merge_out_l_grpid_01,
        out_stall_out_0 => histogram_B6_merge_out_stall_out_0,
        out_valid_out => histogram_B6_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B6_stall_region(BLACKBOX,2)
    thebb_histogram_B6_stall_region : bb_histogram_B6_stall_region
    PORT MAP (
        in_acl_hw_wg_id24 => histogram_B6_merge_out_acl_hw_wg_id24,
        in_l_grpid_01 => histogram_B6_merge_out_l_grpid_01,
        in_stall_in => histogram_B6_branch_out_stall_out,
        in_valid_in => histogram_B6_merge_out_valid_out,
        in_wgl_0_exit_exit_stall_out => in_wgl_0_exit_exit_stall_out,
        in_wgl_0_exit_exit_valid_out => in_wgl_0_exit_exit_valid_out,
        out_acl_hw_wg_id24 => bb_histogram_B6_stall_region_out_acl_hw_wg_id24,
        out_stall_out => bb_histogram_B6_stall_region_out_stall_out,
        out_valid_out => bb_histogram_B6_stall_region_out_valid_out,
        out_wgl_0_exit_exit_stall_in => bb_histogram_B6_stall_region_out_wgl_0_exit_exit_stall_in,
        out_wgl_0_exit_exit_valid_in => bb_histogram_B6_stall_region_out_wgl_0_exit_exit_valid_in,
        clock => clock,
        resetn => resetn
    );

    -- histogram_B6_branch(BLACKBOX,3)
    thehistogram_B6_branch : histogram_B6_branch
    PORT MAP (
        in_acl_hw_wg_id24 => bb_histogram_B6_stall_region_out_acl_hw_wg_id24,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_histogram_B6_stall_region_out_valid_out,
        out_acl_hw_wg_id24 => histogram_B6_branch_out_acl_hw_wg_id24,
        out_stall_out => histogram_B6_branch_out_stall_out,
        out_valid_out_0 => histogram_B6_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id24(GPOUT,11)
    out_acl_hw_wg_id24 <= histogram_B6_branch_out_acl_hw_wg_id24;

    -- out_stall_out_0(GPOUT,12)
    out_stall_out_0 <= histogram_B6_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,13)
    out_valid_out_0 <= histogram_B6_branch_out_valid_out_0;

    -- out_wgl_0_exit_exit_stall_in(GPOUT,14)
    out_wgl_0_exit_exit_stall_in <= bb_histogram_B6_stall_region_out_wgl_0_exit_exit_stall_in;

    -- out_wgl_0_exit_exit_valid_in(GPOUT,15)
    out_wgl_0_exit_exit_valid_in <= bb_histogram_B6_stall_region_out_wgl_0_exit_exit_valid_in;

END normal;
