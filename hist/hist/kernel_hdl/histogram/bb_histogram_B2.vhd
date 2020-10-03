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

-- VHDL created from bb_histogram_B2
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

entity bb_histogram_B2 is
    port (
        in_acl_hw_wg_id28_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_barrier_unnamed_histogram1_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_data : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_013_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_05_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_018_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id22_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_numData : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id28_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_013_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_05_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext11_extract : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_018_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id22_extract : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B2;

architecture normal of bb_histogram_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B2_stall_region is
        port (
            in_acl_hw_wg_id28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_histogram1_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_013 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_05 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_018 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id28_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_013_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_05_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext11_extract : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_018_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id22_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B2_branch is
        port (
            in_acl_hw_wg_id28_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_013_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_05_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext11_extract : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_018_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id22_extract : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id28_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_013_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_05_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext11_extract : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_018_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id22_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B2_merge is
        port (
            in_acl_hw_wg_id28_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_013_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_05_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_018_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id22_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_013 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_018 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B2_stall_region_out_acl_hw_wg_id28_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_stall_region_out_global_id_013_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_stall_region_out_l_grpid_05_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_stall_region_out_l_grpid_0_addr_zext11_extract : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B2_stall_region_out_local_id_018_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_stall_region_out_local_linear_id22_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B2_branch_out_acl_hw_wg_id28_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_branch_out_global_id_013_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_branch_out_l_grpid_05_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_branch_out_l_grpid_0_addr_zext11_extract : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B2_branch_out_local_id_018_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_branch_out_local_linear_id22_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B2_merge_out_acl_hw_wg_id28 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_merge_out_global_id_013 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_merge_out_l_grpid_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_merge_out_l_grpid_0_addr_zext11 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B2_merge_out_local_id_018 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_merge_out_local_linear_id22 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- histogram_B2_merge(BLACKBOX,4)
    thehistogram_B2_merge : histogram_B2_merge
    PORT MAP (
        in_acl_hw_wg_id28_0 => in_acl_hw_wg_id28_0,
        in_global_id_013_0 => in_global_id_013_0,
        in_l_grpid_05_0 => in_l_grpid_05_0,
        in_l_grpid_0_addr_zext11_0 => in_l_grpid_0_addr_zext11_0,
        in_local_id_018_0 => in_local_id_018_0,
        in_local_linear_id22_0 => in_local_linear_id22_0,
        in_stall_in => bb_histogram_B2_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_acl_hw_wg_id28 => histogram_B2_merge_out_acl_hw_wg_id28,
        out_global_id_013 => histogram_B2_merge_out_global_id_013,
        out_l_grpid_05 => histogram_B2_merge_out_l_grpid_05,
        out_l_grpid_0_addr_zext11 => histogram_B2_merge_out_l_grpid_0_addr_zext11,
        out_local_id_018 => histogram_B2_merge_out_local_id_018,
        out_local_linear_id22 => histogram_B2_merge_out_local_linear_id22,
        out_stall_out_0 => histogram_B2_merge_out_stall_out_0,
        out_valid_out => histogram_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B2_stall_region(BLACKBOX,2)
    thebb_histogram_B2_stall_region : bb_histogram_B2_stall_region
    PORT MAP (
        in_acl_hw_wg_id28 => histogram_B2_merge_out_acl_hw_wg_id28,
        in_barrier_unnamed_histogram1_wgs_workgroup_size => in_barrier_unnamed_histogram1_wgs_workgroup_size,
        in_global_id_013 => histogram_B2_merge_out_global_id_013,
        in_l_grpid_05 => histogram_B2_merge_out_l_grpid_05,
        in_l_grpid_0_addr_zext11 => histogram_B2_merge_out_l_grpid_0_addr_zext11,
        in_local_id_018 => histogram_B2_merge_out_local_id_018,
        in_local_linear_id22 => histogram_B2_merge_out_local_linear_id22,
        in_stall_in => histogram_B2_branch_out_stall_out,
        in_valid_in => histogram_B2_merge_out_valid_out,
        out_acl_hw_wg_id28_extract => bb_histogram_B2_stall_region_out_acl_hw_wg_id28_extract,
        out_global_id_013_extract => bb_histogram_B2_stall_region_out_global_id_013_extract,
        out_l_grpid_05_extract => bb_histogram_B2_stall_region_out_l_grpid_05_extract,
        out_l_grpid_0_addr_zext11_extract => bb_histogram_B2_stall_region_out_l_grpid_0_addr_zext11_extract,
        out_local_id_018_extract => bb_histogram_B2_stall_region_out_local_id_018_extract,
        out_local_linear_id22_extract => bb_histogram_B2_stall_region_out_local_linear_id22_extract,
        out_stall_out => bb_histogram_B2_stall_region_out_stall_out,
        out_valid_out => bb_histogram_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- histogram_B2_branch(BLACKBOX,3)
    thehistogram_B2_branch : histogram_B2_branch
    PORT MAP (
        in_acl_hw_wg_id28_extract => bb_histogram_B2_stall_region_out_acl_hw_wg_id28_extract,
        in_global_id_013_extract => bb_histogram_B2_stall_region_out_global_id_013_extract,
        in_l_grpid_05_extract => bb_histogram_B2_stall_region_out_l_grpid_05_extract,
        in_l_grpid_0_addr_zext11_extract => bb_histogram_B2_stall_region_out_l_grpid_0_addr_zext11_extract,
        in_local_id_018_extract => bb_histogram_B2_stall_region_out_local_id_018_extract,
        in_local_linear_id22_extract => bb_histogram_B2_stall_region_out_local_linear_id22_extract,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_histogram_B2_stall_region_out_valid_out,
        out_acl_hw_wg_id28_extract => histogram_B2_branch_out_acl_hw_wg_id28_extract,
        out_global_id_013_extract => histogram_B2_branch_out_global_id_013_extract,
        out_l_grpid_05_extract => histogram_B2_branch_out_l_grpid_05_extract,
        out_l_grpid_0_addr_zext11_extract => histogram_B2_branch_out_l_grpid_0_addr_zext11_extract,
        out_local_id_018_extract => histogram_B2_branch_out_local_id_018_extract,
        out_local_linear_id22_extract => histogram_B2_branch_out_local_linear_id22_extract,
        out_stall_out => histogram_B2_branch_out_stall_out,
        out_valid_out_0 => histogram_B2_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id28_extract(GPOUT,19)
    out_acl_hw_wg_id28_extract <= histogram_B2_branch_out_acl_hw_wg_id28_extract;

    -- out_global_id_013_extract(GPOUT,20)
    out_global_id_013_extract <= histogram_B2_branch_out_global_id_013_extract;

    -- out_l_grpid_05_extract(GPOUT,21)
    out_l_grpid_05_extract <= histogram_B2_branch_out_l_grpid_05_extract;

    -- out_l_grpid_0_addr_zext11_extract(GPOUT,22)
    out_l_grpid_0_addr_zext11_extract <= histogram_B2_branch_out_l_grpid_0_addr_zext11_extract;

    -- out_local_id_018_extract(GPOUT,23)
    out_local_id_018_extract <= histogram_B2_branch_out_local_id_018_extract;

    -- out_local_linear_id22_extract(GPOUT,24)
    out_local_linear_id22_extract <= histogram_B2_branch_out_local_linear_id22_extract;

    -- out_stall_out_0(GPOUT,25)
    out_stall_out_0 <= histogram_B2_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,26)
    out_valid_out_0 <= histogram_B2_branch_out_valid_out_0;

END normal;
