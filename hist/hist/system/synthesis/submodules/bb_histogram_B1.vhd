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

-- VHDL created from bb_histogram_B1
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

entity bb_histogram_B1 is
    port (
        in_acl_hw_wg_id29_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id29_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_014_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_014_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_016_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_016_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr7_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr7_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_019_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_019_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id23_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id23_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_numData : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_019 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B1;

architecture normal of bb_histogram_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B1_stall_region is
        port (
            in_acl_hw_wg_id29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_016 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_id_019 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_cmp20_GUARD : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B1_branch is
        port (
            in_acl_hw_wg_id29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_add : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp20_GUARD : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_019 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B1_merge is
        port (
            in_acl_hw_wg_id29_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id29_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_014_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_016_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_016_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr7_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr7_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_id_019_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_id_019_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id23_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id23_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i_016 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_id_019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B1_stall_region_out_acl_hw_wg_id29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_add : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_cmp20_GUARD : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_stall_region_out_global_id_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_l_grpid_0_addr7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_l_grpid_0_addr_zext : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B1_stall_region_out_local_id_019 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_local_linear_id23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_histogram_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_branch_out_acl_hw_wg_id29 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_add : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_global_id_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_l_grpid_0_addr7 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_l_grpid_0_addr_zext : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B1_branch_out_local_id_019 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_local_linear_id23 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_merge_out_acl_hw_wg_id29 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_global_id_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_i_016 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_l_grpid_0_addr7 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_local_id_019 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_local_linear_id23 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- histogram_B1_merge(BLACKBOX,4)
    thehistogram_B1_merge : histogram_B1_merge
    PORT MAP (
        in_acl_hw_wg_id29_0 => in_acl_hw_wg_id29_0,
        in_acl_hw_wg_id29_1 => in_acl_hw_wg_id29_1,
        in_global_id_014_0 => in_global_id_014_0,
        in_global_id_014_1 => in_global_id_014_1,
        in_i_016_0 => in_i_016_0,
        in_i_016_1 => in_i_016_1,
        in_l_grpid_06_0 => in_l_grpid_06_0,
        in_l_grpid_06_1 => in_l_grpid_06_1,
        in_l_grpid_0_addr7_0 => in_l_grpid_0_addr7_0,
        in_l_grpid_0_addr7_1 => in_l_grpid_0_addr7_1,
        in_local_id_019_0 => in_local_id_019_0,
        in_local_id_019_1 => in_local_id_019_1,
        in_local_linear_id23_0 => in_local_linear_id23_0,
        in_local_linear_id23_1 => in_local_linear_id23_1,
        in_stall_in => bb_histogram_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_acl_hw_wg_id29 => histogram_B1_merge_out_acl_hw_wg_id29,
        out_global_id_014 => histogram_B1_merge_out_global_id_014,
        out_i_016 => histogram_B1_merge_out_i_016,
        out_l_grpid_06 => histogram_B1_merge_out_l_grpid_06,
        out_l_grpid_0_addr7 => histogram_B1_merge_out_l_grpid_0_addr7,
        out_local_id_019 => histogram_B1_merge_out_local_id_019,
        out_local_linear_id23 => histogram_B1_merge_out_local_linear_id23,
        out_stall_out_0 => histogram_B1_merge_out_stall_out_0,
        out_stall_out_1 => histogram_B1_merge_out_stall_out_1,
        out_valid_out => histogram_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B1_stall_region(BLACKBOX,2)
    thebb_histogram_B1_stall_region : bb_histogram_B1_stall_region
    PORT MAP (
        in_acl_hw_wg_id29 => histogram_B1_merge_out_acl_hw_wg_id29,
        in_flush => in_flush,
        in_global_id_014 => histogram_B1_merge_out_global_id_014,
        in_i_016 => histogram_B1_merge_out_i_016,
        in_l_grpid_06 => histogram_B1_merge_out_l_grpid_06,
        in_l_grpid_0_addr7 => histogram_B1_merge_out_l_grpid_0_addr7,
        in_local_id_019 => histogram_B1_merge_out_local_id_019,
        in_local_linear_id23 => histogram_B1_merge_out_local_linear_id23,
        in_local_size_0 => in_local_size_0,
        in_stall_in => histogram_B1_branch_out_stall_out,
        in_unnamed_histogram0_avm_readdata => in_unnamed_histogram0_avm_readdata,
        in_unnamed_histogram0_avm_readdatavalid => in_unnamed_histogram0_avm_readdatavalid,
        in_unnamed_histogram0_avm_waitrequest => in_unnamed_histogram0_avm_waitrequest,
        in_unnamed_histogram0_avm_writeack => in_unnamed_histogram0_avm_writeack,
        in_valid_in => histogram_B1_merge_out_valid_out,
        out_acl_hw_wg_id29 => bb_histogram_B1_stall_region_out_acl_hw_wg_id29,
        out_add => bb_histogram_B1_stall_region_out_add,
        out_cmp20_GUARD => bb_histogram_B1_stall_region_out_cmp20_GUARD,
        out_global_id_014 => bb_histogram_B1_stall_region_out_global_id_014,
        out_l_grpid_06 => bb_histogram_B1_stall_region_out_l_grpid_06,
        out_l_grpid_0_addr7 => bb_histogram_B1_stall_region_out_l_grpid_0_addr7,
        out_l_grpid_0_addr_zext => bb_histogram_B1_stall_region_out_l_grpid_0_addr_zext,
        out_local_id_019 => bb_histogram_B1_stall_region_out_local_id_019,
        out_local_linear_id23 => bb_histogram_B1_stall_region_out_local_linear_id23,
        out_stall_out => bb_histogram_B1_stall_region_out_stall_out,
        out_unnamed_histogram0_avm_address => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_address,
        out_unnamed_histogram0_avm_burstcount => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_burstcount,
        out_unnamed_histogram0_avm_byteenable => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_byteenable,
        out_unnamed_histogram0_avm_enable => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_enable,
        out_unnamed_histogram0_avm_read => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_read,
        out_unnamed_histogram0_avm_write => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_write,
        out_unnamed_histogram0_avm_writedata => bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_writedata,
        out_valid_out => bb_histogram_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- histogram_B1_branch(BLACKBOX,3)
    thehistogram_B1_branch : histogram_B1_branch
    PORT MAP (
        in_acl_hw_wg_id29 => bb_histogram_B1_stall_region_out_acl_hw_wg_id29,
        in_add => bb_histogram_B1_stall_region_out_add,
        in_cmp20_GUARD => bb_histogram_B1_stall_region_out_cmp20_GUARD,
        in_global_id_014 => bb_histogram_B1_stall_region_out_global_id_014,
        in_l_grpid_06 => bb_histogram_B1_stall_region_out_l_grpid_06,
        in_l_grpid_0_addr7 => bb_histogram_B1_stall_region_out_l_grpid_0_addr7,
        in_l_grpid_0_addr_zext => bb_histogram_B1_stall_region_out_l_grpid_0_addr_zext,
        in_local_id_019 => bb_histogram_B1_stall_region_out_local_id_019,
        in_local_linear_id23 => bb_histogram_B1_stall_region_out_local_linear_id23,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_histogram_B1_stall_region_out_valid_out,
        out_acl_hw_wg_id29 => histogram_B1_branch_out_acl_hw_wg_id29,
        out_add => histogram_B1_branch_out_add,
        out_global_id_014 => histogram_B1_branch_out_global_id_014,
        out_l_grpid_06 => histogram_B1_branch_out_l_grpid_06,
        out_l_grpid_0_addr7 => histogram_B1_branch_out_l_grpid_0_addr7,
        out_l_grpid_0_addr_zext => histogram_B1_branch_out_l_grpid_0_addr_zext,
        out_local_id_019 => histogram_B1_branch_out_local_id_019,
        out_local_linear_id23 => histogram_B1_branch_out_local_linear_id23,
        out_stall_out => histogram_B1_branch_out_stall_out,
        out_valid_out_0 => histogram_B1_branch_out_valid_out_0,
        out_valid_out_1 => histogram_B1_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id29(GPOUT,33)
    out_acl_hw_wg_id29 <= histogram_B1_branch_out_acl_hw_wg_id29;

    -- out_add(GPOUT,34)
    out_add <= histogram_B1_branch_out_add;

    -- out_global_id_014(GPOUT,35)
    out_global_id_014 <= histogram_B1_branch_out_global_id_014;

    -- out_l_grpid_06(GPOUT,36)
    out_l_grpid_06 <= histogram_B1_branch_out_l_grpid_06;

    -- out_l_grpid_0_addr7(GPOUT,37)
    out_l_grpid_0_addr7 <= histogram_B1_branch_out_l_grpid_0_addr7;

    -- out_l_grpid_0_addr_zext(GPOUT,38)
    out_l_grpid_0_addr_zext <= histogram_B1_branch_out_l_grpid_0_addr_zext;

    -- out_local_id_019(GPOUT,39)
    out_local_id_019 <= histogram_B1_branch_out_local_id_019;

    -- out_local_linear_id23(GPOUT,40)
    out_local_linear_id23 <= histogram_B1_branch_out_local_linear_id23;

    -- out_stall_out_0(GPOUT,41)
    out_stall_out_0 <= histogram_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,42)
    out_stall_out_1 <= histogram_B1_merge_out_stall_out_1;

    -- out_unnamed_histogram0_avm_address(GPOUT,43)
    out_unnamed_histogram0_avm_address <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_address;

    -- out_unnamed_histogram0_avm_burstcount(GPOUT,44)
    out_unnamed_histogram0_avm_burstcount <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_burstcount;

    -- out_unnamed_histogram0_avm_byteenable(GPOUT,45)
    out_unnamed_histogram0_avm_byteenable <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_byteenable;

    -- out_unnamed_histogram0_avm_enable(GPOUT,46)
    out_unnamed_histogram0_avm_enable <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_enable;

    -- out_unnamed_histogram0_avm_read(GPOUT,47)
    out_unnamed_histogram0_avm_read <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_read;

    -- out_unnamed_histogram0_avm_write(GPOUT,48)
    out_unnamed_histogram0_avm_write <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_write;

    -- out_unnamed_histogram0_avm_writedata(GPOUT,49)
    out_unnamed_histogram0_avm_writedata <= bb_histogram_B1_stall_region_out_unnamed_histogram0_avm_writedata;

    -- out_valid_out_0(GPOUT,50)
    out_valid_out_0 <= histogram_B1_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,51)
    out_valid_out_1 <= histogram_B1_branch_out_valid_out_1;

END normal;
