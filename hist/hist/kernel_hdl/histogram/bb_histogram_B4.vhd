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

-- VHDL created from bb_histogram_B4
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

entity bb_histogram_B4 is
    port (
        in_acl_hw_wg_id26_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_barrier_unnamed_histogram4_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_03_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext9_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_016_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id20_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id26_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_03_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext9_extract : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_016_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B4;

architecture normal of bb_histogram_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B4_stall_region is
        port (
            in_acl_hw_wg_id26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_histogram4_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_03 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_016 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id26_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_03_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext9_extract : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_016_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B4_branch is
        port (
            in_acl_hw_wg_id26_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_03_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext9_extract : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_016_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id26_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_03_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext9_extract : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_016_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B4_merge is
        port (
            in_acl_hw_wg_id26_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_03_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext9_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_016_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id20_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_03 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_016 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B4_stall_region_out_acl_hw_wg_id26_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_stall_region_out_l_grpid_03_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_stall_region_out_l_grpid_0_addr_zext9_extract : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B4_stall_region_out_local_id_016_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B4_branch_out_acl_hw_wg_id26_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_branch_out_l_grpid_03_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_branch_out_l_grpid_0_addr_zext9_extract : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B4_branch_out_local_id_016_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B4_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B4_merge_out_acl_hw_wg_id26 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_merge_out_l_grpid_03 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_merge_out_l_grpid_0_addr_zext9 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B4_merge_out_local_id_016 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_merge_out_local_linear_id20 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B4_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B4_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- histogram_B4_merge(BLACKBOX,4)
    thehistogram_B4_merge : histogram_B4_merge
    PORT MAP (
        in_acl_hw_wg_id26_0 => in_acl_hw_wg_id26_0,
        in_l_grpid_03_0 => in_l_grpid_03_0,
        in_l_grpid_0_addr_zext9_0 => in_l_grpid_0_addr_zext9_0,
        in_local_id_016_0 => in_local_id_016_0,
        in_local_linear_id20_0 => in_local_linear_id20_0,
        in_stall_in => bb_histogram_B4_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_acl_hw_wg_id26 => histogram_B4_merge_out_acl_hw_wg_id26,
        out_l_grpid_03 => histogram_B4_merge_out_l_grpid_03,
        out_l_grpid_0_addr_zext9 => histogram_B4_merge_out_l_grpid_0_addr_zext9,
        out_local_id_016 => histogram_B4_merge_out_local_id_016,
        out_local_linear_id20 => histogram_B4_merge_out_local_linear_id20,
        out_stall_out_0 => histogram_B4_merge_out_stall_out_0,
        out_valid_out => histogram_B4_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B4_stall_region(BLACKBOX,2)
    thebb_histogram_B4_stall_region : bb_histogram_B4_stall_region
    PORT MAP (
        in_acl_hw_wg_id26 => histogram_B4_merge_out_acl_hw_wg_id26,
        in_barrier_unnamed_histogram4_wgs_workgroup_size => in_barrier_unnamed_histogram4_wgs_workgroup_size,
        in_l_grpid_03 => histogram_B4_merge_out_l_grpid_03,
        in_l_grpid_0_addr_zext9 => histogram_B4_merge_out_l_grpid_0_addr_zext9,
        in_local_id_016 => histogram_B4_merge_out_local_id_016,
        in_local_linear_id20 => histogram_B4_merge_out_local_linear_id20,
        in_stall_in => histogram_B4_branch_out_stall_out,
        in_valid_in => histogram_B4_merge_out_valid_out,
        out_acl_hw_wg_id26_extract => bb_histogram_B4_stall_region_out_acl_hw_wg_id26_extract,
        out_l_grpid_03_extract => bb_histogram_B4_stall_region_out_l_grpid_03_extract,
        out_l_grpid_0_addr_zext9_extract => bb_histogram_B4_stall_region_out_l_grpid_0_addr_zext9_extract,
        out_local_id_016_extract => bb_histogram_B4_stall_region_out_local_id_016_extract,
        out_stall_out => bb_histogram_B4_stall_region_out_stall_out,
        out_valid_out => bb_histogram_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- histogram_B4_branch(BLACKBOX,3)
    thehistogram_B4_branch : histogram_B4_branch
    PORT MAP (
        in_acl_hw_wg_id26_extract => bb_histogram_B4_stall_region_out_acl_hw_wg_id26_extract,
        in_l_grpid_03_extract => bb_histogram_B4_stall_region_out_l_grpid_03_extract,
        in_l_grpid_0_addr_zext9_extract => bb_histogram_B4_stall_region_out_l_grpid_0_addr_zext9_extract,
        in_local_id_016_extract => bb_histogram_B4_stall_region_out_local_id_016_extract,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_histogram_B4_stall_region_out_valid_out,
        out_acl_hw_wg_id26_extract => histogram_B4_branch_out_acl_hw_wg_id26_extract,
        out_l_grpid_03_extract => histogram_B4_branch_out_l_grpid_03_extract,
        out_l_grpid_0_addr_zext9_extract => histogram_B4_branch_out_l_grpid_0_addr_zext9_extract,
        out_local_id_016_extract => histogram_B4_branch_out_local_id_016_extract,
        out_stall_out => histogram_B4_branch_out_stall_out,
        out_valid_out_0 => histogram_B4_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id26_extract(GPOUT,15)
    out_acl_hw_wg_id26_extract <= histogram_B4_branch_out_acl_hw_wg_id26_extract;

    -- out_l_grpid_03_extract(GPOUT,16)
    out_l_grpid_03_extract <= histogram_B4_branch_out_l_grpid_03_extract;

    -- out_l_grpid_0_addr_zext9_extract(GPOUT,17)
    out_l_grpid_0_addr_zext9_extract <= histogram_B4_branch_out_l_grpid_0_addr_zext9_extract;

    -- out_local_id_016_extract(GPOUT,18)
    out_local_id_016_extract <= histogram_B4_branch_out_local_id_016_extract;

    -- out_stall_out_0(GPOUT,19)
    out_stall_out_0 <= histogram_B4_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,20)
    out_valid_out_0 <= histogram_B4_branch_out_valid_out_0;

END normal;
