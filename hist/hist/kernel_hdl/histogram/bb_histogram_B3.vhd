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

-- VHDL created from bb_histogram_B3
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

entity bb_histogram_B3 is
    port (
        in_acl_hw_wg_id27_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id27_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_data : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_012_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_012_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_i9_014_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i9_014_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_04_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext10_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_0_addr_zext10_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_017_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_017_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id21_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id21_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_numData : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_global_id_012 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext10 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_017 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B3;

architecture normal of bb_histogram_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B3_stall_region is
        port (
            in_acl_hw_wg_id27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_012 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i9_014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext10 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_017 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_numData : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_global_id_012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_017 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B3_branch is
        port (
            in_acl_hw_wg_id27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_add22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_012 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext10 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_017 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_017 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B3_merge is
        port (
            in_acl_hw_wg_id27_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id27_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_012_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_012_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i9_014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i9_014_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_04_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext10_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext10_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_017_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_id_017_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id21_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id21_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i9_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_017 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B3_stall_region_out_acl_hw_wg_id27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_add22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_call1819_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_histogram_B3_stall_region_out_global_id_012 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_l_grpid_0_addr_zext10 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B3_stall_region_out_local_id_017 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_local_linear_id21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_histogram_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_branch_out_acl_hw_wg_id27 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_branch_out_add22 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_branch_out_global_id_012 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_branch_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_branch_out_l_grpid_0_addr_zext10 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B3_branch_out_local_id_017 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_branch_out_local_linear_id21 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_merge_out_acl_hw_wg_id27 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_out_global_id_012 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_out_i9_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_out_l_grpid_0_addr_zext10 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B3_merge_out_local_id_017 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_out_local_linear_id21 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- histogram_B3_merge(BLACKBOX,4)
    thehistogram_B3_merge : histogram_B3_merge
    PORT MAP (
        in_acl_hw_wg_id27_0 => in_acl_hw_wg_id27_0,
        in_acl_hw_wg_id27_1 => in_acl_hw_wg_id27_1,
        in_global_id_012_0 => in_global_id_012_0,
        in_global_id_012_1 => in_global_id_012_1,
        in_i9_014_0 => in_i9_014_0,
        in_i9_014_1 => in_i9_014_1,
        in_l_grpid_04_0 => in_l_grpid_04_0,
        in_l_grpid_04_1 => in_l_grpid_04_1,
        in_l_grpid_0_addr_zext10_0 => in_l_grpid_0_addr_zext10_0,
        in_l_grpid_0_addr_zext10_1 => in_l_grpid_0_addr_zext10_1,
        in_local_id_017_0 => in_local_id_017_0,
        in_local_id_017_1 => in_local_id_017_1,
        in_local_linear_id21_0 => in_local_linear_id21_0,
        in_local_linear_id21_1 => in_local_linear_id21_1,
        in_stall_in => bb_histogram_B3_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_acl_hw_wg_id27 => histogram_B3_merge_out_acl_hw_wg_id27,
        out_global_id_012 => histogram_B3_merge_out_global_id_012,
        out_i9_014 => histogram_B3_merge_out_i9_014,
        out_l_grpid_04 => histogram_B3_merge_out_l_grpid_04,
        out_l_grpid_0_addr_zext10 => histogram_B3_merge_out_l_grpid_0_addr_zext10,
        out_local_id_017 => histogram_B3_merge_out_local_id_017,
        out_local_linear_id21 => histogram_B3_merge_out_local_linear_id21,
        out_stall_out_0 => histogram_B3_merge_out_stall_out_0,
        out_stall_out_1 => histogram_B3_merge_out_stall_out_1,
        out_valid_out => histogram_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B3_stall_region(BLACKBOX,2)
    thebb_histogram_B3_stall_region : bb_histogram_B3_stall_region
    PORT MAP (
        in_acl_hw_wg_id27 => histogram_B3_merge_out_acl_hw_wg_id27,
        in_call1819_avm_readdata => in_call1819_avm_readdata,
        in_call1819_avm_readdatavalid => in_call1819_avm_readdatavalid,
        in_call1819_avm_waitrequest => in_call1819_avm_waitrequest,
        in_call1819_avm_writeack => in_call1819_avm_writeack,
        in_data => in_data,
        in_flush => in_flush,
        in_global_id_012 => histogram_B3_merge_out_global_id_012,
        in_global_size_0 => in_global_size_0,
        in_i9_014 => histogram_B3_merge_out_i9_014,
        in_l_grpid_04 => histogram_B3_merge_out_l_grpid_04,
        in_l_grpid_0_addr_zext10 => histogram_B3_merge_out_l_grpid_0_addr_zext10,
        in_local_id_017 => histogram_B3_merge_out_local_id_017,
        in_local_linear_id21 => histogram_B3_merge_out_local_linear_id21,
        in_numData => in_numData,
        in_stall_in => histogram_B3_branch_out_stall_out,
        in_unnamed_histogram3_avm_readdata => in_unnamed_histogram3_avm_readdata,
        in_unnamed_histogram3_avm_readdatavalid => in_unnamed_histogram3_avm_readdatavalid,
        in_unnamed_histogram3_avm_waitrequest => in_unnamed_histogram3_avm_waitrequest,
        in_unnamed_histogram3_avm_writeack => in_unnamed_histogram3_avm_writeack,
        in_valid_in => histogram_B3_merge_out_valid_out,
        out_acl_hw_wg_id27 => bb_histogram_B3_stall_region_out_acl_hw_wg_id27,
        out_add22 => bb_histogram_B3_stall_region_out_add22,
        out_call1819_avm_address => bb_histogram_B3_stall_region_out_call1819_avm_address,
        out_call1819_avm_burstcount => bb_histogram_B3_stall_region_out_call1819_avm_burstcount,
        out_call1819_avm_byteenable => bb_histogram_B3_stall_region_out_call1819_avm_byteenable,
        out_call1819_avm_enable => bb_histogram_B3_stall_region_out_call1819_avm_enable,
        out_call1819_avm_read => bb_histogram_B3_stall_region_out_call1819_avm_read,
        out_call1819_avm_write => bb_histogram_B3_stall_region_out_call1819_avm_write,
        out_call1819_avm_writedata => bb_histogram_B3_stall_region_out_call1819_avm_writedata,
        out_global_id_012 => bb_histogram_B3_stall_region_out_global_id_012,
        out_l_grpid_04 => bb_histogram_B3_stall_region_out_l_grpid_04,
        out_l_grpid_0_addr_zext10 => bb_histogram_B3_stall_region_out_l_grpid_0_addr_zext10,
        out_local_id_017 => bb_histogram_B3_stall_region_out_local_id_017,
        out_local_linear_id21 => bb_histogram_B3_stall_region_out_local_linear_id21,
        out_stall_out => bb_histogram_B3_stall_region_out_stall_out,
        out_unnamed_histogram2 => bb_histogram_B3_stall_region_out_unnamed_histogram2,
        out_unnamed_histogram3_avm_address => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_address,
        out_unnamed_histogram3_avm_burstcount => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_burstcount,
        out_unnamed_histogram3_avm_byteenable => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_byteenable,
        out_unnamed_histogram3_avm_enable => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_enable,
        out_unnamed_histogram3_avm_read => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_read,
        out_unnamed_histogram3_avm_write => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_write,
        out_unnamed_histogram3_avm_writedata => bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_writedata,
        out_valid_out => bb_histogram_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- histogram_B3_branch(BLACKBOX,3)
    thehistogram_B3_branch : histogram_B3_branch
    PORT MAP (
        in_acl_hw_wg_id27 => bb_histogram_B3_stall_region_out_acl_hw_wg_id27,
        in_add22 => bb_histogram_B3_stall_region_out_add22,
        in_global_id_012 => bb_histogram_B3_stall_region_out_global_id_012,
        in_l_grpid_04 => bb_histogram_B3_stall_region_out_l_grpid_04,
        in_l_grpid_0_addr_zext10 => bb_histogram_B3_stall_region_out_l_grpid_0_addr_zext10,
        in_local_id_017 => bb_histogram_B3_stall_region_out_local_id_017,
        in_local_linear_id21 => bb_histogram_B3_stall_region_out_local_linear_id21,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_histogram2 => bb_histogram_B3_stall_region_out_unnamed_histogram2,
        in_valid_in => bb_histogram_B3_stall_region_out_valid_out,
        out_acl_hw_wg_id27 => histogram_B3_branch_out_acl_hw_wg_id27,
        out_add22 => histogram_B3_branch_out_add22,
        out_global_id_012 => histogram_B3_branch_out_global_id_012,
        out_l_grpid_04 => histogram_B3_branch_out_l_grpid_04,
        out_l_grpid_0_addr_zext10 => histogram_B3_branch_out_l_grpid_0_addr_zext10,
        out_local_id_017 => histogram_B3_branch_out_local_id_017,
        out_local_linear_id21 => histogram_B3_branch_out_local_linear_id21,
        out_stall_out => histogram_B3_branch_out_stall_out,
        out_valid_out_0 => histogram_B3_branch_out_valid_out_0,
        out_valid_out_1 => histogram_B3_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id27(GPOUT,37)
    out_acl_hw_wg_id27 <= histogram_B3_branch_out_acl_hw_wg_id27;

    -- out_add22(GPOUT,38)
    out_add22 <= histogram_B3_branch_out_add22;

    -- out_call1819_avm_address(GPOUT,39)
    out_call1819_avm_address <= bb_histogram_B3_stall_region_out_call1819_avm_address;

    -- out_call1819_avm_burstcount(GPOUT,40)
    out_call1819_avm_burstcount <= bb_histogram_B3_stall_region_out_call1819_avm_burstcount;

    -- out_call1819_avm_byteenable(GPOUT,41)
    out_call1819_avm_byteenable <= bb_histogram_B3_stall_region_out_call1819_avm_byteenable;

    -- out_call1819_avm_enable(GPOUT,42)
    out_call1819_avm_enable <= bb_histogram_B3_stall_region_out_call1819_avm_enable;

    -- out_call1819_avm_read(GPOUT,43)
    out_call1819_avm_read <= bb_histogram_B3_stall_region_out_call1819_avm_read;

    -- out_call1819_avm_write(GPOUT,44)
    out_call1819_avm_write <= bb_histogram_B3_stall_region_out_call1819_avm_write;

    -- out_call1819_avm_writedata(GPOUT,45)
    out_call1819_avm_writedata <= bb_histogram_B3_stall_region_out_call1819_avm_writedata;

    -- out_global_id_012(GPOUT,46)
    out_global_id_012 <= histogram_B3_branch_out_global_id_012;

    -- out_l_grpid_04(GPOUT,47)
    out_l_grpid_04 <= histogram_B3_branch_out_l_grpid_04;

    -- out_l_grpid_0_addr_zext10(GPOUT,48)
    out_l_grpid_0_addr_zext10 <= histogram_B3_branch_out_l_grpid_0_addr_zext10;

    -- out_local_id_017(GPOUT,49)
    out_local_id_017 <= histogram_B3_branch_out_local_id_017;

    -- out_local_linear_id21(GPOUT,50)
    out_local_linear_id21 <= histogram_B3_branch_out_local_linear_id21;

    -- out_stall_out_0(GPOUT,51)
    out_stall_out_0 <= histogram_B3_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,52)
    out_stall_out_1 <= histogram_B3_merge_out_stall_out_1;

    -- out_unnamed_histogram3_avm_address(GPOUT,53)
    out_unnamed_histogram3_avm_address <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_address;

    -- out_unnamed_histogram3_avm_burstcount(GPOUT,54)
    out_unnamed_histogram3_avm_burstcount <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_burstcount;

    -- out_unnamed_histogram3_avm_byteenable(GPOUT,55)
    out_unnamed_histogram3_avm_byteenable <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_byteenable;

    -- out_unnamed_histogram3_avm_enable(GPOUT,56)
    out_unnamed_histogram3_avm_enable <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_enable;

    -- out_unnamed_histogram3_avm_read(GPOUT,57)
    out_unnamed_histogram3_avm_read <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_read;

    -- out_unnamed_histogram3_avm_write(GPOUT,58)
    out_unnamed_histogram3_avm_write <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_write;

    -- out_unnamed_histogram3_avm_writedata(GPOUT,59)
    out_unnamed_histogram3_avm_writedata <= bb_histogram_B3_stall_region_out_unnamed_histogram3_avm_writedata;

    -- out_valid_out_0(GPOUT,60)
    out_valid_out_0 <= histogram_B3_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,61)
    out_valid_out_1 <= histogram_B3_branch_out_valid_out_1;

END normal;
