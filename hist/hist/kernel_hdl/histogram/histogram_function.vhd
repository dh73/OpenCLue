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

-- VHDL created from histogram_function
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

entity histogram_function is
    port (
        in_arg_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_data : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_histogram : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_linear_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_numData : in std_logic_vector(31 downto 0);  -- ufix32
        in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_call36_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_call36_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_call36_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_call36_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call36_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_o_active_call36 : out std_logic_vector(0 downto 0);  -- ufix1
        out_primWireOut : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_histogram5_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram5_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_histogram5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram5_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_function;

architecture normal of histogram_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_histogram_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B3_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B4_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B5_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B5_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B6_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B0 is
        port (
            in_acl_hw_wg_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_numData : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B1 is
        port (
            in_acl_hw_wg_id29_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id29_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_014_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
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
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_numData : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B2 is
        port (
            in_acl_hw_wg_id28_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_histogram1_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_013_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_05_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_018_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id22_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_numData : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id28_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_013_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_05_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext11_extract : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_018_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_local_linear_id22_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B3 is
        port (
            in_acl_hw_wg_id27_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id27_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_012_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_012_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
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
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_numData : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B4 is
        port (
            in_acl_hw_wg_id26_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_histogram4_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_03_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext9_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_016_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_linear_id20_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id26_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_03_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext9_extract : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_local_id_016_extract : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B5 is
        port (
            in_acl_hw_wg_id25_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id25_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i27_012_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i27_012_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext8_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext8_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_local_id_015_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_id_015_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram5_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_histogram_B6 is
        port (
            in_acl_hw_wg_id24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_histogram0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_histogram1 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_histogram2 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B6_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B6_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B0_out_acl_hw_wg_id : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B0_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B0_out_l_grpid_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B0_out_l_grpid_0_addr : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B0_out_local_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B0_out_local_linear_id : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B0_out_wgl_0_enter_exit_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B0_out_wgl_0_enter_exit_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_acl_hw_wg_id29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_add : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_global_id_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_l_grpid_0_addr7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_l_grpid_0_addr_zext : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B1_out_local_id_019 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_local_linear_id23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_unnamed_histogram0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_histogram_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B1_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B2_out_acl_hw_wg_id28_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_out_global_id_013_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_out_l_grpid_05_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_out_l_grpid_0_addr_zext11_extract : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B2_out_local_id_018_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_out_local_linear_id22_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_acl_hw_wg_id27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_add22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_call1819_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_call1819_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_call1819_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_histogram_B3_out_call1819_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_call1819_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_call1819_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_call1819_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_histogram_B3_out_global_id_012 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_l_grpid_0_addr_zext10 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B3_out_local_id_017 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_local_linear_id21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_unnamed_histogram3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_histogram_B3_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B3_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B4_out_acl_hw_wg_id26_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_out_l_grpid_03_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_out_l_grpid_0_addr_zext9_extract : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B4_out_local_id_016_extract : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_acl_hw_wg_id25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_out_c0_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_out_call36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_histogram_B5_out_call36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_histogram_B5_out_call36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_out_call36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_call36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_call36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_call36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_histogram_B5_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_out_l_grpid_0_addr_zext8 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_histogram_B5_out_local_id_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_out_lsu_call36_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_unnamed_histogram5_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_histogram_B5_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B5_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_out_acl_hw_wg_id24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_histogram_B6_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_out_wgl_0_exit_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_histogram_B6_out_wgl_0_exit_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal const_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal loop_limiter_histogram0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_histogram0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_histogram1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_histogram1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_histogram2_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_histogram2_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bb_histogram_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_histogram_B1_sr_0_aunroll_x : bb_histogram_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_histogram_B1_out_add,
        in_i_data_1 => bb_histogram_B1_out_l_grpid_06,
        in_i_data_2 => bb_histogram_B1_out_l_grpid_0_addr7,
        in_i_data_3 => bb_histogram_B1_out_global_id_014,
        in_i_data_4 => bb_histogram_B1_out_local_id_019,
        in_i_data_5 => bb_histogram_B1_out_local_linear_id23,
        in_i_data_6 => bb_histogram_B1_out_acl_hw_wg_id29,
        in_i_stall => bb_histogram_B1_out_stall_out_0,
        in_i_valid => bb_histogram_B1_out_valid_out_1,
        out_o_data_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_6,
        out_o_stall => bb_histogram_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B1(BLACKBOX,12)
    thebb_histogram_B1 : bb_histogram_B1
    PORT MAP (
        in_acl_hw_wg_id29_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_6,
        in_acl_hw_wg_id29_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_6,
        in_data => in_arg_data,
        in_flush => in_start,
        in_global_id_014_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_3,
        in_global_id_014_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_3,
        in_global_size_0 => in_arg_global_size_0,
        in_histogram => in_arg_histogram,
        in_i_016_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_0,
        in_i_016_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_0,
        in_l_grpid_06_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_1,
        in_l_grpid_06_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_1,
        in_l_grpid_0_addr7_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_2,
        in_l_grpid_0_addr7_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_2,
        in_local_id_019_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_4,
        in_local_id_019_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_4,
        in_local_linear_id23_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_data_5,
        in_local_linear_id23_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_5,
        in_local_size_0 => in_arg_local_size_0,
        in_numData => in_arg_numData,
        in_stall_in_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_histogram_B1_sr_0_aunroll_x_out_o_stall,
        in_unnamed_histogram0_avm_readdata => in_unnamed_histogram0_avm_readdata,
        in_unnamed_histogram0_avm_readdatavalid => in_unnamed_histogram0_avm_readdatavalid,
        in_unnamed_histogram0_avm_waitrequest => in_unnamed_histogram0_avm_waitrequest,
        in_unnamed_histogram0_avm_writeack => in_unnamed_histogram0_avm_writeack,
        in_valid_in_0 => bb_histogram_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_valid,
        out_acl_hw_wg_id29 => bb_histogram_B1_out_acl_hw_wg_id29,
        out_add => bb_histogram_B1_out_add,
        out_global_id_014 => bb_histogram_B1_out_global_id_014,
        out_l_grpid_06 => bb_histogram_B1_out_l_grpid_06,
        out_l_grpid_0_addr7 => bb_histogram_B1_out_l_grpid_0_addr7,
        out_l_grpid_0_addr_zext => bb_histogram_B1_out_l_grpid_0_addr_zext,
        out_local_id_019 => bb_histogram_B1_out_local_id_019,
        out_local_linear_id23 => bb_histogram_B1_out_local_linear_id23,
        out_stall_out_0 => bb_histogram_B1_out_stall_out_0,
        out_stall_out_1 => bb_histogram_B1_out_stall_out_1,
        out_unnamed_histogram0_avm_address => bb_histogram_B1_out_unnamed_histogram0_avm_address,
        out_unnamed_histogram0_avm_burstcount => bb_histogram_B1_out_unnamed_histogram0_avm_burstcount,
        out_unnamed_histogram0_avm_byteenable => bb_histogram_B1_out_unnamed_histogram0_avm_byteenable,
        out_unnamed_histogram0_avm_enable => bb_histogram_B1_out_unnamed_histogram0_avm_enable,
        out_unnamed_histogram0_avm_read => bb_histogram_B1_out_unnamed_histogram0_avm_read,
        out_unnamed_histogram0_avm_write => bb_histogram_B1_out_unnamed_histogram0_avm_write,
        out_unnamed_histogram0_avm_writedata => bb_histogram_B1_out_unnamed_histogram0_avm_writedata,
        out_valid_out_0 => bb_histogram_B1_out_valid_out_0,
        out_valid_out_1 => bb_histogram_B1_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B3_sr_0_aunroll_x(BLACKBOX,5)
    thebb_histogram_B3_sr_0_aunroll_x : bb_histogram_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_histogram_B3_out_add22,
        in_i_data_1 => bb_histogram_B3_out_l_grpid_04,
        in_i_data_2 => bb_histogram_B3_out_l_grpid_0_addr_zext10,
        in_i_data_3 => bb_histogram_B3_out_global_id_012,
        in_i_data_4 => bb_histogram_B3_out_local_id_017,
        in_i_data_5 => bb_histogram_B3_out_local_linear_id21,
        in_i_data_6 => bb_histogram_B3_out_acl_hw_wg_id27,
        in_i_stall => bb_histogram_B3_out_stall_out_0,
        in_i_valid => bb_histogram_B3_out_valid_out_0,
        out_o_data_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_stall => bb_histogram_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B3(BLACKBOX,14)
    thebb_histogram_B3 : bb_histogram_B3
    PORT MAP (
        in_acl_hw_wg_id27_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_6,
        in_acl_hw_wg_id27_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_6,
        in_call1819_avm_readdata => in_call1819_avm_readdata,
        in_call1819_avm_readdatavalid => in_call1819_avm_readdatavalid,
        in_call1819_avm_waitrequest => in_call1819_avm_waitrequest,
        in_call1819_avm_writeack => in_call1819_avm_writeack,
        in_data => in_arg_data,
        in_flush => in_start,
        in_global_id_012_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_3,
        in_global_id_012_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_3,
        in_global_size_0 => in_arg_global_size_0,
        in_histogram => in_arg_histogram,
        in_i9_014_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_0,
        in_i9_014_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_0,
        in_l_grpid_04_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_1,
        in_l_grpid_04_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_1,
        in_l_grpid_0_addr_zext10_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_2,
        in_l_grpid_0_addr_zext10_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_2,
        in_local_id_017_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_4,
        in_local_id_017_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_4,
        in_local_linear_id21_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_data_5,
        in_local_linear_id21_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_5,
        in_local_size_0 => in_arg_local_size_0,
        in_numData => in_arg_numData,
        in_stall_in_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_histogram_B4_sr_0_aunroll_x_out_o_stall,
        in_unnamed_histogram3_avm_readdata => in_unnamed_histogram3_avm_readdata,
        in_unnamed_histogram3_avm_readdatavalid => in_unnamed_histogram3_avm_readdatavalid,
        in_unnamed_histogram3_avm_waitrequest => in_unnamed_histogram3_avm_waitrequest,
        in_unnamed_histogram3_avm_writeack => in_unnamed_histogram3_avm_writeack,
        in_valid_in_0 => bb_histogram_B3_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_valid,
        out_acl_hw_wg_id27 => bb_histogram_B3_out_acl_hw_wg_id27,
        out_add22 => bb_histogram_B3_out_add22,
        out_call1819_avm_address => bb_histogram_B3_out_call1819_avm_address,
        out_call1819_avm_burstcount => bb_histogram_B3_out_call1819_avm_burstcount,
        out_call1819_avm_byteenable => bb_histogram_B3_out_call1819_avm_byteenable,
        out_call1819_avm_enable => bb_histogram_B3_out_call1819_avm_enable,
        out_call1819_avm_read => bb_histogram_B3_out_call1819_avm_read,
        out_call1819_avm_write => bb_histogram_B3_out_call1819_avm_write,
        out_call1819_avm_writedata => bb_histogram_B3_out_call1819_avm_writedata,
        out_global_id_012 => bb_histogram_B3_out_global_id_012,
        out_l_grpid_04 => bb_histogram_B3_out_l_grpid_04,
        out_l_grpid_0_addr_zext10 => bb_histogram_B3_out_l_grpid_0_addr_zext10,
        out_local_id_017 => bb_histogram_B3_out_local_id_017,
        out_local_linear_id21 => bb_histogram_B3_out_local_linear_id21,
        out_stall_out_0 => bb_histogram_B3_out_stall_out_0,
        out_stall_out_1 => bb_histogram_B3_out_stall_out_1,
        out_unnamed_histogram3_avm_address => bb_histogram_B3_out_unnamed_histogram3_avm_address,
        out_unnamed_histogram3_avm_burstcount => bb_histogram_B3_out_unnamed_histogram3_avm_burstcount,
        out_unnamed_histogram3_avm_byteenable => bb_histogram_B3_out_unnamed_histogram3_avm_byteenable,
        out_unnamed_histogram3_avm_enable => bb_histogram_B3_out_unnamed_histogram3_avm_enable,
        out_unnamed_histogram3_avm_read => bb_histogram_B3_out_unnamed_histogram3_avm_read,
        out_unnamed_histogram3_avm_write => bb_histogram_B3_out_unnamed_histogram3_avm_write,
        out_unnamed_histogram3_avm_writedata => bb_histogram_B3_out_unnamed_histogram3_avm_writedata,
        out_valid_out_0 => bb_histogram_B3_out_valid_out_0,
        out_valid_out_1 => bb_histogram_B3_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B5_sr_0_aunroll_x(BLACKBOX,8)
    thebb_histogram_B5_sr_0_aunroll_x : bb_histogram_B5_sr_0
    PORT MAP (
        in_i_data_0 => bb_histogram_B5_out_c0_exe4,
        in_i_data_1 => bb_histogram_B5_out_l_grpid_02,
        in_i_data_2 => bb_histogram_B5_out_l_grpid_0_addr_zext8,
        in_i_data_3 => bb_histogram_B5_out_local_id_015,
        in_i_data_4 => bb_histogram_B5_out_acl_hw_wg_id25,
        in_i_stall => bb_histogram_B5_out_stall_out_0,
        in_i_valid => bb_histogram_B5_out_valid_out_0,
        out_o_data_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_4,
        out_o_stall => bb_histogram_B5_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B5_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B5(BLACKBOX,16)
    thebb_histogram_B5 : bb_histogram_B5
    PORT MAP (
        in_acl_hw_wg_id25_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_4,
        in_acl_hw_wg_id25_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_4,
        in_call36_avm_readdata => in_call36_avm_readdata,
        in_call36_avm_readdatavalid => in_call36_avm_readdatavalid,
        in_call36_avm_waitrequest => in_call36_avm_waitrequest,
        in_call36_avm_writeack => in_call36_avm_writeack,
        in_flush => in_start,
        in_histogram => in_arg_histogram,
        in_i27_012_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_0,
        in_i27_012_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_0,
        in_l_grpid_02_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_1,
        in_l_grpid_02_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_1,
        in_l_grpid_0_addr_zext8_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_2,
        in_l_grpid_0_addr_zext8_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_2,
        in_local_id_015_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_data_3,
        in_local_id_015_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_3,
        in_local_size_0 => in_arg_local_size_0,
        in_stall_in_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_histogram_B6_sr_0_aunroll_x_out_o_stall,
        in_unnamed_histogram5_avm_readdata => in_unnamed_histogram5_avm_readdata,
        in_unnamed_histogram5_avm_readdatavalid => in_unnamed_histogram5_avm_readdatavalid,
        in_unnamed_histogram5_avm_waitrequest => in_unnamed_histogram5_avm_waitrequest,
        in_unnamed_histogram5_avm_writeack => in_unnamed_histogram5_avm_writeack,
        in_valid_in_0 => bb_histogram_B5_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_valid,
        out_acl_hw_wg_id25 => bb_histogram_B5_out_acl_hw_wg_id25,
        out_c0_exe4 => bb_histogram_B5_out_c0_exe4,
        out_call36_avm_address => bb_histogram_B5_out_call36_avm_address,
        out_call36_avm_burstcount => bb_histogram_B5_out_call36_avm_burstcount,
        out_call36_avm_byteenable => bb_histogram_B5_out_call36_avm_byteenable,
        out_call36_avm_enable => bb_histogram_B5_out_call36_avm_enable,
        out_call36_avm_read => bb_histogram_B5_out_call36_avm_read,
        out_call36_avm_write => bb_histogram_B5_out_call36_avm_write,
        out_call36_avm_writedata => bb_histogram_B5_out_call36_avm_writedata,
        out_l_grpid_02 => bb_histogram_B5_out_l_grpid_02,
        out_l_grpid_0_addr_zext8 => bb_histogram_B5_out_l_grpid_0_addr_zext8,
        out_local_id_015 => bb_histogram_B5_out_local_id_015,
        out_lsu_call36_o_active => bb_histogram_B5_out_lsu_call36_o_active,
        out_stall_out_0 => bb_histogram_B5_out_stall_out_0,
        out_stall_out_1 => bb_histogram_B5_out_stall_out_1,
        out_unnamed_histogram5_avm_address => bb_histogram_B5_out_unnamed_histogram5_avm_address,
        out_unnamed_histogram5_avm_burstcount => bb_histogram_B5_out_unnamed_histogram5_avm_burstcount,
        out_unnamed_histogram5_avm_byteenable => bb_histogram_B5_out_unnamed_histogram5_avm_byteenable,
        out_unnamed_histogram5_avm_enable => bb_histogram_B5_out_unnamed_histogram5_avm_enable,
        out_unnamed_histogram5_avm_read => bb_histogram_B5_out_unnamed_histogram5_avm_read,
        out_unnamed_histogram5_avm_write => bb_histogram_B5_out_unnamed_histogram5_avm_write,
        out_unnamed_histogram5_avm_writedata => bb_histogram_B5_out_unnamed_histogram5_avm_writedata,
        out_valid_out_0 => bb_histogram_B5_out_valid_out_0,
        out_valid_out_1 => bb_histogram_B5_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B5_sr_1_aunroll_x(BLACKBOX,9)
    thebb_histogram_B5_sr_1_aunroll_x : bb_histogram_B5_sr_1
    PORT MAP (
        in_i_data_0 => bb_histogram_B4_out_local_id_016_extract,
        in_i_data_1 => bb_histogram_B4_out_l_grpid_03_extract,
        in_i_data_2 => bb_histogram_B4_out_l_grpid_0_addr_zext9_extract,
        in_i_data_3 => bb_histogram_B4_out_local_id_016_extract,
        in_i_data_4 => bb_histogram_B4_out_acl_hw_wg_id26_extract,
        in_i_stall => bb_histogram_B5_out_stall_out_1,
        in_i_valid => loop_limiter_histogram2_out_o_valid,
        out_o_data_0 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B5_sr_1_aunroll_x_out_o_data_4,
        out_o_stall => bb_histogram_B5_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B5_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_histogram2(BLACKBOX,58)
    theloop_limiter_histogram2 : loop_limiter_histogram2
    PORT MAP (
        in_i_stall => bb_histogram_B5_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_histogram_B6_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_histogram_B4_out_valid_out_0,
        in_i_valid_exit => bb_histogram_B5_out_valid_out_1,
        out_o_stall => loop_limiter_histogram2_out_o_stall,
        out_o_valid => loop_limiter_histogram2_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B4(BLACKBOX,15)
    thebb_histogram_B4 : bb_histogram_B4
    PORT MAP (
        in_acl_hw_wg_id26_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_4,
        in_barrier_unnamed_histogram4_wgs_workgroup_size => in_workgroup_size,
        in_histogram => in_arg_histogram,
        in_l_grpid_03_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_0,
        in_l_grpid_0_addr_zext9_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_1,
        in_local_id_016_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_2,
        in_local_linear_id20_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_3,
        in_local_size_0 => in_arg_local_size_0,
        in_stall_in_0 => loop_limiter_histogram2_out_o_stall,
        in_valid_in_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_valid,
        out_acl_hw_wg_id26_extract => bb_histogram_B4_out_acl_hw_wg_id26_extract,
        out_l_grpid_03_extract => bb_histogram_B4_out_l_grpid_03_extract,
        out_l_grpid_0_addr_zext9_extract => bb_histogram_B4_out_l_grpid_0_addr_zext9_extract,
        out_local_id_016_extract => bb_histogram_B4_out_local_id_016_extract,
        out_stall_out_0 => bb_histogram_B4_out_stall_out_0,
        out_valid_out_0 => bb_histogram_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B4_sr_0_aunroll_x(BLACKBOX,7)
    thebb_histogram_B4_sr_0_aunroll_x : bb_histogram_B4_sr_0
    PORT MAP (
        in_i_data_0 => bb_histogram_B3_out_l_grpid_04,
        in_i_data_1 => bb_histogram_B3_out_l_grpid_0_addr_zext10,
        in_i_data_2 => bb_histogram_B3_out_local_id_017,
        in_i_data_3 => bb_histogram_B3_out_local_linear_id21,
        in_i_data_4 => bb_histogram_B3_out_acl_hw_wg_id27,
        in_i_stall => bb_histogram_B4_out_stall_out_0,
        in_i_valid => bb_histogram_B3_out_valid_out_1,
        out_o_data_0 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B4_sr_0_aunroll_x_out_o_data_4,
        out_o_stall => bb_histogram_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B3_sr_1_aunroll_x(BLACKBOX,6)
    thebb_histogram_B3_sr_1_aunroll_x : bb_histogram_B3_sr_1
    PORT MAP (
        in_i_data_0 => bb_histogram_B2_out_global_id_013_extract,
        in_i_data_1 => bb_histogram_B2_out_l_grpid_05_extract,
        in_i_data_2 => bb_histogram_B2_out_l_grpid_0_addr_zext11_extract,
        in_i_data_3 => bb_histogram_B2_out_global_id_013_extract,
        in_i_data_4 => bb_histogram_B2_out_local_id_018_extract,
        in_i_data_5 => bb_histogram_B2_out_local_linear_id22_extract,
        in_i_data_6 => bb_histogram_B2_out_acl_hw_wg_id28_extract,
        in_i_stall => bb_histogram_B3_out_stall_out_1,
        in_i_valid => loop_limiter_histogram1_out_o_valid,
        out_o_data_0 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_histogram_B3_sr_1_aunroll_x_out_o_data_6,
        out_o_stall => bb_histogram_B3_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B3_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_histogram1(BLACKBOX,57)
    theloop_limiter_histogram1 : loop_limiter_histogram1
    PORT MAP (
        in_i_stall => bb_histogram_B3_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_histogram_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_histogram_B2_out_valid_out_0,
        in_i_valid_exit => bb_histogram_B3_out_valid_out_1,
        out_o_stall => loop_limiter_histogram1_out_o_stall,
        out_o_valid => loop_limiter_histogram1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B2(BLACKBOX,13)
    thebb_histogram_B2 : bb_histogram_B2
    PORT MAP (
        in_acl_hw_wg_id28_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_5,
        in_barrier_unnamed_histogram1_wgs_workgroup_size => in_workgroup_size,
        in_data => in_arg_data,
        in_global_id_013_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_2,
        in_global_size_0 => in_arg_global_size_0,
        in_histogram => in_arg_histogram,
        in_l_grpid_05_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_0,
        in_l_grpid_0_addr_zext11_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_1,
        in_local_id_018_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_3,
        in_local_linear_id22_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_4,
        in_local_size_0 => in_arg_local_size_0,
        in_numData => in_arg_numData,
        in_stall_in_0 => loop_limiter_histogram1_out_o_stall,
        in_valid_in_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_valid,
        out_acl_hw_wg_id28_extract => bb_histogram_B2_out_acl_hw_wg_id28_extract,
        out_global_id_013_extract => bb_histogram_B2_out_global_id_013_extract,
        out_l_grpid_05_extract => bb_histogram_B2_out_l_grpid_05_extract,
        out_l_grpid_0_addr_zext11_extract => bb_histogram_B2_out_l_grpid_0_addr_zext11_extract,
        out_local_id_018_extract => bb_histogram_B2_out_local_id_018_extract,
        out_local_linear_id22_extract => bb_histogram_B2_out_local_linear_id22_extract,
        out_stall_out_0 => bb_histogram_B2_out_stall_out_0,
        out_valid_out_0 => bb_histogram_B2_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_histogram_B2_sr_0_aunroll_x : bb_histogram_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_histogram_B1_out_l_grpid_06,
        in_i_data_1 => bb_histogram_B1_out_l_grpid_0_addr_zext,
        in_i_data_2 => bb_histogram_B1_out_global_id_014,
        in_i_data_3 => bb_histogram_B1_out_local_id_019,
        in_i_data_4 => bb_histogram_B1_out_local_linear_id23,
        in_i_data_5 => bb_histogram_B1_out_acl_hw_wg_id29,
        in_i_stall => bb_histogram_B2_out_stall_out_0,
        in_i_valid => bb_histogram_B1_out_valid_out_0,
        out_o_data_0 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_histogram_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_stall => bb_histogram_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_histogram_B1_sr_1_aunroll_x : bb_histogram_B1_sr_1
    PORT MAP (
        in_i_data_0 => bb_histogram_B0_out_local_id_0,
        in_i_data_1 => bb_histogram_B0_out_l_grpid_0,
        in_i_data_2 => bb_histogram_B0_out_l_grpid_0_addr,
        in_i_data_3 => bb_histogram_B0_out_global_id_0,
        in_i_data_4 => bb_histogram_B0_out_local_id_0,
        in_i_data_5 => bb_histogram_B0_out_local_linear_id,
        in_i_data_6 => bb_histogram_B0_out_acl_hw_wg_id,
        in_i_stall => bb_histogram_B1_out_stall_out_1,
        in_i_valid => loop_limiter_histogram0_out_o_valid,
        out_o_data_0 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_histogram_B1_sr_1_aunroll_x_out_o_data_6,
        out_o_stall => bb_histogram_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_histogram0(BLACKBOX,56)
    theloop_limiter_histogram0 : loop_limiter_histogram0
    PORT MAP (
        in_i_stall => bb_histogram_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_histogram_B2_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_histogram_B0_out_valid_out_0,
        in_i_valid_exit => bb_histogram_B1_out_valid_out_0,
        out_o_stall => loop_limiter_histogram0_out_o_stall,
        out_o_valid => loop_limiter_histogram0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B0(BLACKBOX,11)
    thebb_histogram_B0 : bb_histogram_B0
    PORT MAP (
        in_acl_hw_wg_id_0 => in_arg_acl_hw_wg_id,
        in_data => in_arg_data,
        in_global_id_0_0 => in_arg_global_id_0,
        in_global_size_0 => in_arg_global_size_0,
        in_histogram => in_arg_histogram,
        in_local_id_0_0 => in_arg_local_id_0,
        in_local_linear_id_0 => in_arg_local_linear_id,
        in_local_size_0 => in_arg_local_size_0,
        in_numData => in_arg_numData,
        in_stall_in_0 => loop_limiter_histogram0_out_o_stall,
        in_valid_in_0 => in_valid_in,
        in_wgl_0_enter_exit_stall_in => bb_histogram_B6_out_wgl_0_exit_exit_stall_in,
        in_wgl_0_enter_exit_valid_in => bb_histogram_B6_out_wgl_0_exit_exit_valid_in,
        in_wgl_0_wgs_wg_size => in_workgroup_size,
        out_acl_hw_wg_id => bb_histogram_B0_out_acl_hw_wg_id,
        out_global_id_0 => bb_histogram_B0_out_global_id_0,
        out_l_grpid_0 => bb_histogram_B0_out_l_grpid_0,
        out_l_grpid_0_addr => bb_histogram_B0_out_l_grpid_0_addr,
        out_local_id_0 => bb_histogram_B0_out_local_id_0,
        out_local_linear_id => bb_histogram_B0_out_local_linear_id,
        out_stall_out_0 => bb_histogram_B0_out_stall_out_0,
        out_valid_out_0 => bb_histogram_B0_out_valid_out_0,
        out_wgl_0_enter_exit_stall_out => bb_histogram_B0_out_wgl_0_enter_exit_stall_out,
        out_wgl_0_enter_exit_valid_out => bb_histogram_B0_out_wgl_0_enter_exit_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B6_sr_0_aunroll_x(BLACKBOX,10)
    thebb_histogram_B6_sr_0_aunroll_x : bb_histogram_B6_sr_0
    PORT MAP (
        in_i_data_0 => bb_histogram_B5_out_l_grpid_02,
        in_i_data_1 => bb_histogram_B5_out_acl_hw_wg_id25,
        in_i_stall => bb_histogram_B6_out_stall_out_0,
        in_i_valid => bb_histogram_B5_out_valid_out_1,
        out_o_data_0 => bb_histogram_B6_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_histogram_B6_sr_0_aunroll_x_out_o_data_1,
        out_o_stall => bb_histogram_B6_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_histogram_B6_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_histogram_B6(BLACKBOX,17)
    thebb_histogram_B6 : bb_histogram_B6
    PORT MAP (
        in_acl_hw_wg_id24_0 => bb_histogram_B6_sr_0_aunroll_x_out_o_data_1,
        in_l_grpid_01_0 => bb_histogram_B6_sr_0_aunroll_x_out_o_data_0,
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_histogram_B6_sr_0_aunroll_x_out_o_valid,
        in_wgl_0_exit_exit_stall_out => bb_histogram_B0_out_wgl_0_enter_exit_stall_out,
        in_wgl_0_exit_exit_valid_out => bb_histogram_B0_out_wgl_0_enter_exit_valid_out,
        out_acl_hw_wg_id24 => bb_histogram_B6_out_acl_hw_wg_id24,
        out_stall_out_0 => bb_histogram_B6_out_stall_out_0,
        out_valid_out_0 => bb_histogram_B6_out_valid_out_0,
        out_wgl_0_exit_exit_stall_in => bb_histogram_B6_out_wgl_0_exit_exit_stall_in,
        out_wgl_0_exit_exit_valid_in => bb_histogram_B6_out_wgl_0_exit_exit_valid_in,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id24(GPOUT,59)
    out_acl_hw_wg_id24 <= bb_histogram_B6_out_acl_hw_wg_id24;

    -- out_call1819_avm_address(GPOUT,60)
    out_call1819_avm_address <= bb_histogram_B3_out_call1819_avm_address;

    -- out_call1819_avm_burstcount(GPOUT,61)
    out_call1819_avm_burstcount <= bb_histogram_B3_out_call1819_avm_burstcount;

    -- out_call1819_avm_byteenable(GPOUT,62)
    out_call1819_avm_byteenable <= bb_histogram_B3_out_call1819_avm_byteenable;

    -- out_call1819_avm_enable(GPOUT,63)
    out_call1819_avm_enable <= bb_histogram_B3_out_call1819_avm_enable;

    -- out_call1819_avm_read(GPOUT,64)
    out_call1819_avm_read <= bb_histogram_B3_out_call1819_avm_read;

    -- out_call1819_avm_write(GPOUT,65)
    out_call1819_avm_write <= bb_histogram_B3_out_call1819_avm_write;

    -- out_call1819_avm_writedata(GPOUT,66)
    out_call1819_avm_writedata <= bb_histogram_B3_out_call1819_avm_writedata;

    -- out_call36_avm_address(GPOUT,67)
    out_call36_avm_address <= bb_histogram_B5_out_call36_avm_address;

    -- out_call36_avm_burstcount(GPOUT,68)
    out_call36_avm_burstcount <= bb_histogram_B5_out_call36_avm_burstcount;

    -- out_call36_avm_byteenable(GPOUT,69)
    out_call36_avm_byteenable <= bb_histogram_B5_out_call36_avm_byteenable;

    -- out_call36_avm_enable(GPOUT,70)
    out_call36_avm_enable <= bb_histogram_B5_out_call36_avm_enable;

    -- out_call36_avm_read(GPOUT,71)
    out_call36_avm_read <= bb_histogram_B5_out_call36_avm_read;

    -- out_call36_avm_write(GPOUT,72)
    out_call36_avm_write <= bb_histogram_B5_out_call36_avm_write;

    -- out_call36_avm_writedata(GPOUT,73)
    out_call36_avm_writedata <= bb_histogram_B5_out_call36_avm_writedata;

    -- out_o_active_call36(GPOUT,74)
    out_o_active_call36 <= bb_histogram_B5_out_lsu_call36_o_active;

    -- const_0(CONSTANT,18)
    const_0_q <= "00000000000000000000000000000000";

    -- out_primWireOut(GPOUT,75)
    out_primWireOut <= const_0_q;

    -- out_stall_out(GPOUT,76)
    out_stall_out <= bb_histogram_B0_out_stall_out_0;

    -- out_unnamed_histogram0_avm_address(GPOUT,77)
    out_unnamed_histogram0_avm_address <= bb_histogram_B1_out_unnamed_histogram0_avm_address;

    -- out_unnamed_histogram0_avm_burstcount(GPOUT,78)
    out_unnamed_histogram0_avm_burstcount <= bb_histogram_B1_out_unnamed_histogram0_avm_burstcount;

    -- out_unnamed_histogram0_avm_byteenable(GPOUT,79)
    out_unnamed_histogram0_avm_byteenable <= bb_histogram_B1_out_unnamed_histogram0_avm_byteenable;

    -- out_unnamed_histogram0_avm_enable(GPOUT,80)
    out_unnamed_histogram0_avm_enable <= bb_histogram_B1_out_unnamed_histogram0_avm_enable;

    -- out_unnamed_histogram0_avm_read(GPOUT,81)
    out_unnamed_histogram0_avm_read <= bb_histogram_B1_out_unnamed_histogram0_avm_read;

    -- out_unnamed_histogram0_avm_write(GPOUT,82)
    out_unnamed_histogram0_avm_write <= bb_histogram_B1_out_unnamed_histogram0_avm_write;

    -- out_unnamed_histogram0_avm_writedata(GPOUT,83)
    out_unnamed_histogram0_avm_writedata <= bb_histogram_B1_out_unnamed_histogram0_avm_writedata;

    -- out_unnamed_histogram3_avm_address(GPOUT,84)
    out_unnamed_histogram3_avm_address <= bb_histogram_B3_out_unnamed_histogram3_avm_address;

    -- out_unnamed_histogram3_avm_burstcount(GPOUT,85)
    out_unnamed_histogram3_avm_burstcount <= bb_histogram_B3_out_unnamed_histogram3_avm_burstcount;

    -- out_unnamed_histogram3_avm_byteenable(GPOUT,86)
    out_unnamed_histogram3_avm_byteenable <= bb_histogram_B3_out_unnamed_histogram3_avm_byteenable;

    -- out_unnamed_histogram3_avm_enable(GPOUT,87)
    out_unnamed_histogram3_avm_enable <= bb_histogram_B3_out_unnamed_histogram3_avm_enable;

    -- out_unnamed_histogram3_avm_read(GPOUT,88)
    out_unnamed_histogram3_avm_read <= bb_histogram_B3_out_unnamed_histogram3_avm_read;

    -- out_unnamed_histogram3_avm_write(GPOUT,89)
    out_unnamed_histogram3_avm_write <= bb_histogram_B3_out_unnamed_histogram3_avm_write;

    -- out_unnamed_histogram3_avm_writedata(GPOUT,90)
    out_unnamed_histogram3_avm_writedata <= bb_histogram_B3_out_unnamed_histogram3_avm_writedata;

    -- out_unnamed_histogram5_avm_address(GPOUT,91)
    out_unnamed_histogram5_avm_address <= bb_histogram_B5_out_unnamed_histogram5_avm_address;

    -- out_unnamed_histogram5_avm_burstcount(GPOUT,92)
    out_unnamed_histogram5_avm_burstcount <= bb_histogram_B5_out_unnamed_histogram5_avm_burstcount;

    -- out_unnamed_histogram5_avm_byteenable(GPOUT,93)
    out_unnamed_histogram5_avm_byteenable <= bb_histogram_B5_out_unnamed_histogram5_avm_byteenable;

    -- out_unnamed_histogram5_avm_enable(GPOUT,94)
    out_unnamed_histogram5_avm_enable <= bb_histogram_B5_out_unnamed_histogram5_avm_enable;

    -- out_unnamed_histogram5_avm_read(GPOUT,95)
    out_unnamed_histogram5_avm_read <= bb_histogram_B5_out_unnamed_histogram5_avm_read;

    -- out_unnamed_histogram5_avm_write(GPOUT,96)
    out_unnamed_histogram5_avm_write <= bb_histogram_B5_out_unnamed_histogram5_avm_write;

    -- out_unnamed_histogram5_avm_writedata(GPOUT,97)
    out_unnamed_histogram5_avm_writedata <= bb_histogram_B5_out_unnamed_histogram5_avm_writedata;

    -- out_valid_out(GPOUT,98)
    out_valid_out <= bb_histogram_B6_out_valid_out_0;

END normal;
