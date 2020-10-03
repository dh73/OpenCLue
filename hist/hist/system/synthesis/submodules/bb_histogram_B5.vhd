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

-- VHDL created from bb_histogram_B5
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

entity bb_histogram_B5 is
    port (
        in_acl_hw_wg_id25_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id25_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_i27_012_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i27_012_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext8_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_0_addr_zext8_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_015_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_015_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_call36_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_call36_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_call36_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_call36_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_015 : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_call36_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram5_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_histogram5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B5;

architecture normal of bb_histogram_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B5_stall_region is
        port (
            in_acl_hw_wg_id25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i27_012 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext8 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_015 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_call36_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call36_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call36_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_call36_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B5_branch is
        port (
            in_acl_hw_wg_id25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext8 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_015 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_B5_merge is
        port (
            in_acl_hw_wg_id25_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id25_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i27_012_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i27_012_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext8_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext8_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_015_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_id_015_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i27_012 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B5_stall_region_out_acl_hw_wg_id25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_stall_region_out_c0_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_stall_region_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_call36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_histogram_B5_stall_region_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_stall_region_out_l_grpid_0_addr_zext8 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B5_stall_region_out_local_id_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_stall_region_out_lsu_call36_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_histogram_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_branch_out_acl_hw_wg_id25 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_branch_out_c0_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_branch_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_branch_out_l_grpid_0_addr_zext8 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B5_branch_out_local_id_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_merge_out_acl_hw_wg_id25 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_out_i27_012 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_out_l_grpid_0_addr_zext8 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B5_merge_out_local_id_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B5_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- histogram_B5_merge(BLACKBOX,4)
    thehistogram_B5_merge : histogram_B5_merge
    PORT MAP (
        in_acl_hw_wg_id25_0 => in_acl_hw_wg_id25_0,
        in_acl_hw_wg_id25_1 => in_acl_hw_wg_id25_1,
        in_i27_012_0 => in_i27_012_0,
        in_i27_012_1 => in_i27_012_1,
        in_l_grpid_02_0 => in_l_grpid_02_0,
        in_l_grpid_02_1 => in_l_grpid_02_1,
        in_l_grpid_0_addr_zext8_0 => in_l_grpid_0_addr_zext8_0,
        in_l_grpid_0_addr_zext8_1 => in_l_grpid_0_addr_zext8_1,
        in_local_id_015_0 => in_local_id_015_0,
        in_local_id_015_1 => in_local_id_015_1,
        in_stall_in => bb_histogram_B5_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_acl_hw_wg_id25 => histogram_B5_merge_out_acl_hw_wg_id25,
        out_i27_012 => histogram_B5_merge_out_i27_012,
        out_l_grpid_02 => histogram_B5_merge_out_l_grpid_02,
        out_l_grpid_0_addr_zext8 => histogram_B5_merge_out_l_grpid_0_addr_zext8,
        out_local_id_015 => histogram_B5_merge_out_local_id_015,
        out_stall_out_0 => histogram_B5_merge_out_stall_out_0,
        out_stall_out_1 => histogram_B5_merge_out_stall_out_1,
        out_valid_out => histogram_B5_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B5_stall_region(BLACKBOX,2)
    thebb_histogram_B5_stall_region : bb_histogram_B5_stall_region
    PORT MAP (
        in_acl_hw_wg_id25 => histogram_B5_merge_out_acl_hw_wg_id25,
        in_call36_avm_readdata => in_call36_avm_readdata,
        in_call36_avm_readdatavalid => in_call36_avm_readdatavalid,
        in_call36_avm_waitrequest => in_call36_avm_waitrequest,
        in_call36_avm_writeack => in_call36_avm_writeack,
        in_flush => in_flush,
        in_histogram => in_histogram,
        in_i27_012 => histogram_B5_merge_out_i27_012,
        in_l_grpid_02 => histogram_B5_merge_out_l_grpid_02,
        in_l_grpid_0_addr_zext8 => histogram_B5_merge_out_l_grpid_0_addr_zext8,
        in_local_id_015 => histogram_B5_merge_out_local_id_015,
        in_local_size_0 => in_local_size_0,
        in_stall_in => histogram_B5_branch_out_stall_out,
        in_unnamed_histogram5_avm_readdata => in_unnamed_histogram5_avm_readdata,
        in_unnamed_histogram5_avm_readdatavalid => in_unnamed_histogram5_avm_readdatavalid,
        in_unnamed_histogram5_avm_waitrequest => in_unnamed_histogram5_avm_waitrequest,
        in_unnamed_histogram5_avm_writeack => in_unnamed_histogram5_avm_writeack,
        in_valid_in => histogram_B5_merge_out_valid_out,
        out_acl_hw_wg_id25 => bb_histogram_B5_stall_region_out_acl_hw_wg_id25,
        out_c0_exe4 => bb_histogram_B5_stall_region_out_c0_exe4,
        out_c0_exe5 => bb_histogram_B5_stall_region_out_c0_exe5,
        out_call36_avm_address => bb_histogram_B5_stall_region_out_call36_avm_address,
        out_call36_avm_burstcount => bb_histogram_B5_stall_region_out_call36_avm_burstcount,
        out_call36_avm_byteenable => bb_histogram_B5_stall_region_out_call36_avm_byteenable,
        out_call36_avm_enable => bb_histogram_B5_stall_region_out_call36_avm_enable,
        out_call36_avm_read => bb_histogram_B5_stall_region_out_call36_avm_read,
        out_call36_avm_write => bb_histogram_B5_stall_region_out_call36_avm_write,
        out_call36_avm_writedata => bb_histogram_B5_stall_region_out_call36_avm_writedata,
        out_l_grpid_02 => bb_histogram_B5_stall_region_out_l_grpid_02,
        out_l_grpid_0_addr_zext8 => bb_histogram_B5_stall_region_out_l_grpid_0_addr_zext8,
        out_local_id_015 => bb_histogram_B5_stall_region_out_local_id_015,
        out_lsu_call36_o_active => bb_histogram_B5_stall_region_out_lsu_call36_o_active,
        out_stall_out => bb_histogram_B5_stall_region_out_stall_out,
        out_unnamed_histogram5_avm_address => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_address,
        out_unnamed_histogram5_avm_burstcount => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_burstcount,
        out_unnamed_histogram5_avm_byteenable => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_byteenable,
        out_unnamed_histogram5_avm_enable => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_enable,
        out_unnamed_histogram5_avm_read => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_read,
        out_unnamed_histogram5_avm_write => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_write,
        out_unnamed_histogram5_avm_writedata => bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_writedata,
        out_valid_out => bb_histogram_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- histogram_B5_branch(BLACKBOX,3)
    thehistogram_B5_branch : histogram_B5_branch
    PORT MAP (
        in_acl_hw_wg_id25 => bb_histogram_B5_stall_region_out_acl_hw_wg_id25,
        in_c0_exe4 => bb_histogram_B5_stall_region_out_c0_exe4,
        in_c0_exe5 => bb_histogram_B5_stall_region_out_c0_exe5,
        in_l_grpid_02 => bb_histogram_B5_stall_region_out_l_grpid_02,
        in_l_grpid_0_addr_zext8 => bb_histogram_B5_stall_region_out_l_grpid_0_addr_zext8,
        in_local_id_015 => bb_histogram_B5_stall_region_out_local_id_015,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_histogram_B5_stall_region_out_valid_out,
        out_acl_hw_wg_id25 => histogram_B5_branch_out_acl_hw_wg_id25,
        out_c0_exe4 => histogram_B5_branch_out_c0_exe4,
        out_l_grpid_02 => histogram_B5_branch_out_l_grpid_02,
        out_l_grpid_0_addr_zext8 => histogram_B5_branch_out_l_grpid_0_addr_zext8,
        out_local_id_015 => histogram_B5_branch_out_local_id_015,
        out_stall_out => histogram_B5_branch_out_stall_out,
        out_valid_out_0 => histogram_B5_branch_out_valid_out_0,
        out_valid_out_1 => histogram_B5_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id25(GPOUT,30)
    out_acl_hw_wg_id25 <= histogram_B5_branch_out_acl_hw_wg_id25;

    -- out_c0_exe4(GPOUT,31)
    out_c0_exe4 <= histogram_B5_branch_out_c0_exe4;

    -- out_call36_avm_address(GPOUT,32)
    out_call36_avm_address <= bb_histogram_B5_stall_region_out_call36_avm_address;

    -- out_call36_avm_burstcount(GPOUT,33)
    out_call36_avm_burstcount <= bb_histogram_B5_stall_region_out_call36_avm_burstcount;

    -- out_call36_avm_byteenable(GPOUT,34)
    out_call36_avm_byteenable <= bb_histogram_B5_stall_region_out_call36_avm_byteenable;

    -- out_call36_avm_enable(GPOUT,35)
    out_call36_avm_enable <= bb_histogram_B5_stall_region_out_call36_avm_enable;

    -- out_call36_avm_read(GPOUT,36)
    out_call36_avm_read <= bb_histogram_B5_stall_region_out_call36_avm_read;

    -- out_call36_avm_write(GPOUT,37)
    out_call36_avm_write <= bb_histogram_B5_stall_region_out_call36_avm_write;

    -- out_call36_avm_writedata(GPOUT,38)
    out_call36_avm_writedata <= bb_histogram_B5_stall_region_out_call36_avm_writedata;

    -- out_l_grpid_02(GPOUT,39)
    out_l_grpid_02 <= histogram_B5_branch_out_l_grpid_02;

    -- out_l_grpid_0_addr_zext8(GPOUT,40)
    out_l_grpid_0_addr_zext8 <= histogram_B5_branch_out_l_grpid_0_addr_zext8;

    -- out_local_id_015(GPOUT,41)
    out_local_id_015 <= histogram_B5_branch_out_local_id_015;

    -- out_lsu_call36_o_active(GPOUT,42)
    out_lsu_call36_o_active <= bb_histogram_B5_stall_region_out_lsu_call36_o_active;

    -- out_stall_out_0(GPOUT,43)
    out_stall_out_0 <= histogram_B5_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,44)
    out_stall_out_1 <= histogram_B5_merge_out_stall_out_1;

    -- out_unnamed_histogram5_avm_address(GPOUT,45)
    out_unnamed_histogram5_avm_address <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_address;

    -- out_unnamed_histogram5_avm_burstcount(GPOUT,46)
    out_unnamed_histogram5_avm_burstcount <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_burstcount;

    -- out_unnamed_histogram5_avm_byteenable(GPOUT,47)
    out_unnamed_histogram5_avm_byteenable <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_byteenable;

    -- out_unnamed_histogram5_avm_enable(GPOUT,48)
    out_unnamed_histogram5_avm_enable <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_enable;

    -- out_unnamed_histogram5_avm_read(GPOUT,49)
    out_unnamed_histogram5_avm_read <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_read;

    -- out_unnamed_histogram5_avm_write(GPOUT,50)
    out_unnamed_histogram5_avm_write <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_write;

    -- out_unnamed_histogram5_avm_writedata(GPOUT,51)
    out_unnamed_histogram5_avm_writedata <= bb_histogram_B5_stall_region_out_unnamed_histogram5_avm_writedata;

    -- out_valid_out_0(GPOUT,52)
    out_valid_out_0 <= histogram_B5_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,53)
    out_valid_out_1 <= histogram_B5_branch_out_valid_out_1;

END normal;
