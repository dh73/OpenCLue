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

-- VHDL created from histogram_function_wrapper
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

entity histogram_function_wrapper is
    port (
        avm_call1819_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_call1819_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call1819_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call1819_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call36_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_call36_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call36_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call36_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_histogram0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram3_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_histogram3_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram3_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram3_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_histogram5_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(159 downto 0);  -- ufix160
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_call1819_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_call1819_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call1819_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_call1819_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call1819_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call1819_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call1819_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_call36_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_call36_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_call36_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_call36_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call36_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call36_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call36_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_histogram0_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_histogram0_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_unnamed_histogram0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram0_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_histogram3_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_histogram3_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_histogram3_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_histogram3_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram3_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram3_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram3_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_histogram5_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_histogram5_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_unnamed_histogram5_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_histogram5_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_function_wrapper;

architecture normal of histogram_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_embedded_workgroup_issuer_dspba is
        generic (
            MAX_SIMULTANEOUS_WORKGROUPS : INTEGER := 8;
            MAX_WORKGROUP_SIZE : INTEGER := 256;
            WORKGROUP_EXIT_ORDER : STRING := "unknown"
        );
        port (
            done_hw_wg_id_in : in std_logic_vector(31 downto 0);
            global_id_in_0 : in std_logic_vector(31 downto 0);
            global_id_in_1 : in std_logic_vector(31 downto 0);
            global_id_in_2 : in std_logic_vector(31 downto 0);
            group_id_in_0 : in std_logic_vector(31 downto 0);
            group_id_in_1 : in std_logic_vector(31 downto 0);
            group_id_in_2 : in std_logic_vector(31 downto 0);
            local_id_in_0 : in std_logic_vector(31 downto 0);
            local_id_in_1 : in std_logic_vector(31 downto 0);
            local_id_in_2 : in std_logic_vector(31 downto 0);
            stall_entry : in std_logic;
            stall_exit : in std_logic;
            valid_exit : in std_logic;
            valid_in : in std_logic;
            workgroup_size : in std_logic_vector(31 downto 0);
            global_id_out_0 : out std_logic_vector(31 downto 0);
            hw_wg_id_out : out std_logic_vector(31 downto 0);
            linear_local_id_out : out std_logic_vector(31 downto 0);
            local_id_out_0 : out std_logic_vector(31 downto 0);
            stall_out : out std_logic;
            valid_entry : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component histogram_function is
        port (
            in_arg_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_data : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_histogram : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_local_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_linear_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_numData : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_call36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_call36_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_call36_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call36_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call36_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call36_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_active_call36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_data_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_histogram_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_numData_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_done_hw_wg_id_in : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_group_id_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_group_id_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_group_id_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_stall_entry_bitsignaltemp : std_logic;
    signal embedded_issuer_stall_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_stall_exit_bitsignaltemp : std_logic;
    signal embedded_issuer_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_valid_exit_bitsignaltemp : std_logic;
    signal embedded_issuer_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_valid_in_bitsignaltemp : std_logic;
    signal embedded_issuer_workgroup_size : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_hw_wg_id_out : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_linear_local_id_out : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_stall_out_bitsignaltemp : std_logic;
    signal embedded_issuer_valid_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_valid_entry_bitsignaltemp : std_logic;
    signal histogram_function_out_acl_hw_wg_id24 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_call1819_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_call1819_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call1819_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal histogram_function_out_call1819_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call1819_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call1819_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call1819_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal histogram_function_out_call36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal histogram_function_out_call36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal histogram_function_out_call36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_call36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_call36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal histogram_function_out_o_active_call36 : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_function_out_unnamed_histogram5_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal histogram_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_numData_select(BITSELECT,7)
    arg_numData_select_b <= kernel_arguments(159 downto 128);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_numData_select_b(31 downto 0);

    -- arg_histogram_select(BITSELECT,6)
    arg_histogram_select_b <= kernel_arguments(127 downto 64);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_histogram_select_b(63 downto 0);

    -- arg_data_select(BITSELECT,5)
    arg_data_select_b <= kernel_arguments(63 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,62)
    ip_dsdk_adapt_cast_b <= arg_data_select_b(63 downto 0);

    -- embedded_issuer(EXTIFACE,9)
    embedded_issuer_done_hw_wg_id_in <= histogram_function_out_acl_hw_wg_id24;
    embedded_issuer_global_id_in_0 <= global_id_0;
    embedded_issuer_global_id_in_1 <= histogram_function_out_primWireOut;
    embedded_issuer_global_id_in_2 <= histogram_function_out_primWireOut;
    embedded_issuer_group_id_in_0 <= histogram_function_out_primWireOut;
    embedded_issuer_group_id_in_1 <= histogram_function_out_primWireOut;
    embedded_issuer_group_id_in_2 <= histogram_function_out_primWireOut;
    embedded_issuer_local_id_in_0 <= local_id_0;
    embedded_issuer_local_id_in_1 <= histogram_function_out_primWireOut;
    embedded_issuer_local_id_in_2 <= histogram_function_out_primWireOut;
    embedded_issuer_stall_entry <= histogram_function_out_stall_out;
    embedded_issuer_stall_exit <= GND_q;
    embedded_issuer_valid_exit <= histogram_function_out_valid_out;
    embedded_issuer_valid_in <= kernel_valid_in;
    embedded_issuer_workgroup_size <= workgroup_size;
    embedded_issuer_stall_entry_bitsignaltemp <= embedded_issuer_stall_entry(0);
    embedded_issuer_stall_exit_bitsignaltemp <= embedded_issuer_stall_exit(0);
    embedded_issuer_valid_exit_bitsignaltemp <= embedded_issuer_valid_exit(0);
    embedded_issuer_valid_in_bitsignaltemp <= embedded_issuer_valid_in(0);
    embedded_issuer_stall_out(0) <= embedded_issuer_stall_out_bitsignaltemp;
    embedded_issuer_valid_entry(0) <= embedded_issuer_valid_entry_bitsignaltemp;
    theembedded_issuer : acl_embedded_workgroup_issuer_dspba
    GENERIC MAP (
        MAX_SIMULTANEOUS_WORKGROUPS => 8,
        MAX_WORKGROUP_SIZE => 256,
        WORKGROUP_EXIT_ORDER => "unknown"
    )
    PORT MAP (
        done_hw_wg_id_in => histogram_function_out_acl_hw_wg_id24,
        global_id_in_0 => global_id_0,
        global_id_in_1 => histogram_function_out_primWireOut,
        global_id_in_2 => histogram_function_out_primWireOut,
        group_id_in_0 => histogram_function_out_primWireOut,
        group_id_in_1 => histogram_function_out_primWireOut,
        group_id_in_2 => histogram_function_out_primWireOut,
        local_id_in_0 => local_id_0,
        local_id_in_1 => histogram_function_out_primWireOut,
        local_id_in_2 => histogram_function_out_primWireOut,
        stall_entry => embedded_issuer_stall_entry_bitsignaltemp,
        stall_exit => embedded_issuer_stall_exit_bitsignaltemp,
        valid_exit => embedded_issuer_valid_exit_bitsignaltemp,
        valid_in => embedded_issuer_valid_in_bitsignaltemp,
        workgroup_size => workgroup_size,
        global_id_out_0 => embedded_issuer_global_id_out_0,
        hw_wg_id_out => embedded_issuer_hw_wg_id_out,
        linear_local_id_out => embedded_issuer_linear_local_id_out,
        local_id_out_0 => embedded_issuer_local_id_out_0,
        stall_out => embedded_issuer_stall_out_bitsignaltemp,
        valid_entry => embedded_issuer_valid_entry_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- histogram_function(BLACKBOX,10)
    thehistogram_function : histogram_function
    PORT MAP (
        in_arg_acl_hw_wg_id => embedded_issuer_hw_wg_id_out,
        in_arg_data => ip_dsdk_adapt_cast_b,
        in_arg_global_id_0 => embedded_issuer_global_id_out_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_histogram => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_local_id_0 => embedded_issuer_local_id_out_0,
        in_arg_local_linear_id => embedded_issuer_linear_local_id_out,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_numData => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_call1819_avm_readdata => avm_call1819_readdata,
        in_call1819_avm_readdatavalid => avm_call1819_readdatavalid,
        in_call1819_avm_waitrequest => avm_call1819_waitrequest,
        in_call1819_avm_writeack => avm_call1819_writeack,
        in_call36_avm_readdata => avm_call36_readdata,
        in_call36_avm_readdatavalid => avm_call36_readdatavalid,
        in_call36_avm_waitrequest => avm_call36_waitrequest,
        in_call36_avm_writeack => avm_call36_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_histogram0_avm_readdata => avm_unnamed_histogram0_readdata,
        in_unnamed_histogram0_avm_readdatavalid => avm_unnamed_histogram0_readdatavalid,
        in_unnamed_histogram0_avm_waitrequest => avm_unnamed_histogram0_waitrequest,
        in_unnamed_histogram0_avm_writeack => avm_unnamed_histogram0_writeack,
        in_unnamed_histogram3_avm_readdata => avm_unnamed_histogram3_readdata,
        in_unnamed_histogram3_avm_readdatavalid => avm_unnamed_histogram3_readdatavalid,
        in_unnamed_histogram3_avm_waitrequest => avm_unnamed_histogram3_waitrequest,
        in_unnamed_histogram3_avm_writeack => avm_unnamed_histogram3_writeack,
        in_unnamed_histogram5_avm_readdata => avm_unnamed_histogram5_readdata,
        in_unnamed_histogram5_avm_readdatavalid => avm_unnamed_histogram5_readdatavalid,
        in_unnamed_histogram5_avm_waitrequest => avm_unnamed_histogram5_waitrequest,
        in_unnamed_histogram5_avm_writeack => avm_unnamed_histogram5_writeack,
        in_valid_in => embedded_issuer_valid_entry,
        in_workgroup_size => workgroup_size,
        out_acl_hw_wg_id24 => histogram_function_out_acl_hw_wg_id24,
        out_call1819_avm_address => histogram_function_out_call1819_avm_address,
        out_call1819_avm_burstcount => histogram_function_out_call1819_avm_burstcount,
        out_call1819_avm_byteenable => histogram_function_out_call1819_avm_byteenable,
        out_call1819_avm_enable => histogram_function_out_call1819_avm_enable,
        out_call1819_avm_read => histogram_function_out_call1819_avm_read,
        out_call1819_avm_write => histogram_function_out_call1819_avm_write,
        out_call1819_avm_writedata => histogram_function_out_call1819_avm_writedata,
        out_call36_avm_address => histogram_function_out_call36_avm_address,
        out_call36_avm_burstcount => histogram_function_out_call36_avm_burstcount,
        out_call36_avm_byteenable => histogram_function_out_call36_avm_byteenable,
        out_call36_avm_enable => histogram_function_out_call36_avm_enable,
        out_call36_avm_read => histogram_function_out_call36_avm_read,
        out_call36_avm_write => histogram_function_out_call36_avm_write,
        out_call36_avm_writedata => histogram_function_out_call36_avm_writedata,
        out_o_active_call36 => histogram_function_out_o_active_call36,
        out_primWireOut => histogram_function_out_primWireOut,
        out_stall_out => histogram_function_out_stall_out,
        out_unnamed_histogram0_avm_address => histogram_function_out_unnamed_histogram0_avm_address,
        out_unnamed_histogram0_avm_burstcount => histogram_function_out_unnamed_histogram0_avm_burstcount,
        out_unnamed_histogram0_avm_byteenable => histogram_function_out_unnamed_histogram0_avm_byteenable,
        out_unnamed_histogram0_avm_enable => histogram_function_out_unnamed_histogram0_avm_enable,
        out_unnamed_histogram0_avm_read => histogram_function_out_unnamed_histogram0_avm_read,
        out_unnamed_histogram0_avm_write => histogram_function_out_unnamed_histogram0_avm_write,
        out_unnamed_histogram0_avm_writedata => histogram_function_out_unnamed_histogram0_avm_writedata,
        out_unnamed_histogram3_avm_address => histogram_function_out_unnamed_histogram3_avm_address,
        out_unnamed_histogram3_avm_burstcount => histogram_function_out_unnamed_histogram3_avm_burstcount,
        out_unnamed_histogram3_avm_byteenable => histogram_function_out_unnamed_histogram3_avm_byteenable,
        out_unnamed_histogram3_avm_enable => histogram_function_out_unnamed_histogram3_avm_enable,
        out_unnamed_histogram3_avm_read => histogram_function_out_unnamed_histogram3_avm_read,
        out_unnamed_histogram3_avm_write => histogram_function_out_unnamed_histogram3_avm_write,
        out_unnamed_histogram3_avm_writedata => histogram_function_out_unnamed_histogram3_avm_writedata,
        out_unnamed_histogram5_avm_address => histogram_function_out_unnamed_histogram5_avm_address,
        out_unnamed_histogram5_avm_burstcount => histogram_function_out_unnamed_histogram5_avm_burstcount,
        out_unnamed_histogram5_avm_byteenable => histogram_function_out_unnamed_histogram5_avm_byteenable,
        out_unnamed_histogram5_avm_enable => histogram_function_out_unnamed_histogram5_avm_enable,
        out_unnamed_histogram5_avm_read => histogram_function_out_unnamed_histogram5_avm_read,
        out_unnamed_histogram5_avm_write => histogram_function_out_unnamed_histogram5_avm_write,
        out_unnamed_histogram5_avm_writedata => histogram_function_out_unnamed_histogram5_avm_writedata,
        out_valid_out => histogram_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_call1819_address(GPOUT,63)
    avm_call1819_address <= histogram_function_out_call1819_avm_address;

    -- avm_call1819_burstcount(GPOUT,64)
    avm_call1819_burstcount <= histogram_function_out_call1819_avm_burstcount;

    -- avm_call1819_byteenable(GPOUT,65)
    avm_call1819_byteenable <= histogram_function_out_call1819_avm_byteenable;

    -- avm_call1819_enable(GPOUT,66)
    avm_call1819_enable <= histogram_function_out_call1819_avm_enable;

    -- avm_call1819_read(GPOUT,67)
    avm_call1819_read <= histogram_function_out_call1819_avm_read;

    -- avm_call1819_write(GPOUT,68)
    avm_call1819_write <= histogram_function_out_call1819_avm_write;

    -- avm_call1819_writedata(GPOUT,69)
    avm_call1819_writedata <= histogram_function_out_call1819_avm_writedata;

    -- avm_call36_address(GPOUT,70)
    avm_call36_address <= histogram_function_out_call36_avm_address;

    -- avm_call36_burstcount(GPOUT,71)
    avm_call36_burstcount <= histogram_function_out_call36_avm_burstcount;

    -- avm_call36_byteenable(GPOUT,72)
    avm_call36_byteenable <= histogram_function_out_call36_avm_byteenable;

    -- avm_call36_enable(GPOUT,73)
    avm_call36_enable <= histogram_function_out_call36_avm_enable;

    -- avm_call36_read(GPOUT,74)
    avm_call36_read <= histogram_function_out_call36_avm_read;

    -- avm_call36_write(GPOUT,75)
    avm_call36_write <= histogram_function_out_call36_avm_write;

    -- avm_call36_writedata(GPOUT,76)
    avm_call36_writedata <= histogram_function_out_call36_avm_writedata;

    -- avm_unnamed_histogram0_address(GPOUT,77)
    avm_unnamed_histogram0_address <= histogram_function_out_unnamed_histogram0_avm_address;

    -- avm_unnamed_histogram0_burstcount(GPOUT,78)
    avm_unnamed_histogram0_burstcount <= histogram_function_out_unnamed_histogram0_avm_burstcount;

    -- avm_unnamed_histogram0_byteenable(GPOUT,79)
    avm_unnamed_histogram0_byteenable <= histogram_function_out_unnamed_histogram0_avm_byteenable;

    -- avm_unnamed_histogram0_enable(GPOUT,80)
    avm_unnamed_histogram0_enable <= histogram_function_out_unnamed_histogram0_avm_enable;

    -- avm_unnamed_histogram0_read(GPOUT,81)
    avm_unnamed_histogram0_read <= histogram_function_out_unnamed_histogram0_avm_read;

    -- avm_unnamed_histogram0_write(GPOUT,82)
    avm_unnamed_histogram0_write <= histogram_function_out_unnamed_histogram0_avm_write;

    -- avm_unnamed_histogram0_writedata(GPOUT,83)
    avm_unnamed_histogram0_writedata <= histogram_function_out_unnamed_histogram0_avm_writedata;

    -- avm_unnamed_histogram3_address(GPOUT,84)
    avm_unnamed_histogram3_address <= histogram_function_out_unnamed_histogram3_avm_address;

    -- avm_unnamed_histogram3_burstcount(GPOUT,85)
    avm_unnamed_histogram3_burstcount <= histogram_function_out_unnamed_histogram3_avm_burstcount;

    -- avm_unnamed_histogram3_byteenable(GPOUT,86)
    avm_unnamed_histogram3_byteenable <= histogram_function_out_unnamed_histogram3_avm_byteenable;

    -- avm_unnamed_histogram3_enable(GPOUT,87)
    avm_unnamed_histogram3_enable <= histogram_function_out_unnamed_histogram3_avm_enable;

    -- avm_unnamed_histogram3_read(GPOUT,88)
    avm_unnamed_histogram3_read <= histogram_function_out_unnamed_histogram3_avm_read;

    -- avm_unnamed_histogram3_write(GPOUT,89)
    avm_unnamed_histogram3_write <= histogram_function_out_unnamed_histogram3_avm_write;

    -- avm_unnamed_histogram3_writedata(GPOUT,90)
    avm_unnamed_histogram3_writedata <= histogram_function_out_unnamed_histogram3_avm_writedata;

    -- avm_unnamed_histogram5_address(GPOUT,91)
    avm_unnamed_histogram5_address <= histogram_function_out_unnamed_histogram5_avm_address;

    -- avm_unnamed_histogram5_burstcount(GPOUT,92)
    avm_unnamed_histogram5_burstcount <= histogram_function_out_unnamed_histogram5_avm_burstcount;

    -- avm_unnamed_histogram5_byteenable(GPOUT,93)
    avm_unnamed_histogram5_byteenable <= histogram_function_out_unnamed_histogram5_avm_byteenable;

    -- avm_unnamed_histogram5_enable(GPOUT,94)
    avm_unnamed_histogram5_enable <= histogram_function_out_unnamed_histogram5_avm_enable;

    -- avm_unnamed_histogram5_read(GPOUT,95)
    avm_unnamed_histogram5_read <= histogram_function_out_unnamed_histogram5_avm_read;

    -- avm_unnamed_histogram5_write(GPOUT,96)
    avm_unnamed_histogram5_write <= histogram_function_out_unnamed_histogram5_avm_write;

    -- avm_unnamed_histogram5_writedata(GPOUT,97)
    avm_unnamed_histogram5_writedata <= histogram_function_out_unnamed_histogram5_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,4)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,98)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,99)
    has_a_lsu_active <= histogram_function_out_o_active_call36;

    -- has_a_write_pending(GPOUT,100)
    has_a_write_pending <= histogram_function_out_o_active_call36;

    -- kernel_stall_out(GPOUT,101)
    kernel_stall_out <= embedded_issuer_stall_out;

    -- kernel_valid_out(GPOUT,102)
    kernel_valid_out <= histogram_function_out_valid_out;

END normal;
