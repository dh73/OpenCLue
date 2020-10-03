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

-- VHDL created from matvec_mult_function_wrapper
-- VHDL created on Wed Sep 16 13:09:16 2020


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

entity matvec_mult_function_wrapper is
    port (
        avm_unnamed_matvec_mult0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_matvec_mult0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult1_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_matvec_mult1_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult1_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult1_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult2_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_matvec_mult2_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult2_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult2_writeack : in std_logic_vector(0 downto 0);  -- ufix1
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
        kernel_arguments : in std_logic_vector(191 downto 0);  -- ufix192
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
        avm_unnamed_matvec_mult0_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_matvec_mult0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_matvec_mult0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_matvec_mult0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_matvec_mult1_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_matvec_mult1_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_matvec_mult1_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_matvec_mult1_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult1_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult1_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult1_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_matvec_mult2_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_matvec_mult2_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_matvec_mult2_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_matvec_mult2_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult2_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult2_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_matvec_mult2_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end matvec_mult_function_wrapper;

architecture normal of matvec_mult_function_wrapper is

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


    component matvec_mult_function is
        port (
            in_arg_dot : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_m : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_result : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_matvec_mult2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_dot_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_m_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_result_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);
    signal matvec_mult_function_out_o_active_unnamed_matvec_mult2 : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_function_out_unnamed_matvec_mult2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal matvec_mult_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_result_select(BITSELECT,7)
    arg_result_select_b <= kernel_arguments(191 downto 128);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_result_select_b(63 downto 0);

    -- arg_m_select(BITSELECT,6)
    arg_m_select_b <= kernel_arguments(63 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,52)
    ip_dsdk_adapt_cast_b <= arg_m_select_b(63 downto 0);

    -- arg_dot_select(BITSELECT,5)
    arg_dot_select_b <= kernel_arguments(127 downto 64);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_dot_select_b(63 downto 0);

    -- matvec_mult_function(BLACKBOX,53)
    thematvec_mult_function : matvec_mult_function
    PORT MAP (
        in_arg_dot => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_m => ip_dsdk_adapt_cast_b,
        in_arg_result => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_matvec_mult0_avm_readdata => avm_unnamed_matvec_mult0_readdata,
        in_unnamed_matvec_mult0_avm_readdatavalid => avm_unnamed_matvec_mult0_readdatavalid,
        in_unnamed_matvec_mult0_avm_waitrequest => avm_unnamed_matvec_mult0_waitrequest,
        in_unnamed_matvec_mult0_avm_writeack => avm_unnamed_matvec_mult0_writeack,
        in_unnamed_matvec_mult1_avm_readdata => avm_unnamed_matvec_mult1_readdata,
        in_unnamed_matvec_mult1_avm_readdatavalid => avm_unnamed_matvec_mult1_readdatavalid,
        in_unnamed_matvec_mult1_avm_waitrequest => avm_unnamed_matvec_mult1_waitrequest,
        in_unnamed_matvec_mult1_avm_writeack => avm_unnamed_matvec_mult1_writeack,
        in_unnamed_matvec_mult2_avm_readdata => avm_unnamed_matvec_mult2_readdata,
        in_unnamed_matvec_mult2_avm_readdatavalid => avm_unnamed_matvec_mult2_readdatavalid,
        in_unnamed_matvec_mult2_avm_waitrequest => avm_unnamed_matvec_mult2_waitrequest,
        in_unnamed_matvec_mult2_avm_writeack => avm_unnamed_matvec_mult2_writeack,
        in_valid_in => kernel_valid_in,
        out_o_active_unnamed_matvec_mult2 => matvec_mult_function_out_o_active_unnamed_matvec_mult2,
        out_stall_out => matvec_mult_function_out_stall_out,
        out_unnamed_matvec_mult0_avm_address => matvec_mult_function_out_unnamed_matvec_mult0_avm_address,
        out_unnamed_matvec_mult0_avm_burstcount => matvec_mult_function_out_unnamed_matvec_mult0_avm_burstcount,
        out_unnamed_matvec_mult0_avm_byteenable => matvec_mult_function_out_unnamed_matvec_mult0_avm_byteenable,
        out_unnamed_matvec_mult0_avm_enable => matvec_mult_function_out_unnamed_matvec_mult0_avm_enable,
        out_unnamed_matvec_mult0_avm_read => matvec_mult_function_out_unnamed_matvec_mult0_avm_read,
        out_unnamed_matvec_mult0_avm_write => matvec_mult_function_out_unnamed_matvec_mult0_avm_write,
        out_unnamed_matvec_mult0_avm_writedata => matvec_mult_function_out_unnamed_matvec_mult0_avm_writedata,
        out_unnamed_matvec_mult1_avm_address => matvec_mult_function_out_unnamed_matvec_mult1_avm_address,
        out_unnamed_matvec_mult1_avm_burstcount => matvec_mult_function_out_unnamed_matvec_mult1_avm_burstcount,
        out_unnamed_matvec_mult1_avm_byteenable => matvec_mult_function_out_unnamed_matvec_mult1_avm_byteenable,
        out_unnamed_matvec_mult1_avm_enable => matvec_mult_function_out_unnamed_matvec_mult1_avm_enable,
        out_unnamed_matvec_mult1_avm_read => matvec_mult_function_out_unnamed_matvec_mult1_avm_read,
        out_unnamed_matvec_mult1_avm_write => matvec_mult_function_out_unnamed_matvec_mult1_avm_write,
        out_unnamed_matvec_mult1_avm_writedata => matvec_mult_function_out_unnamed_matvec_mult1_avm_writedata,
        out_unnamed_matvec_mult2_avm_address => matvec_mult_function_out_unnamed_matvec_mult2_avm_address,
        out_unnamed_matvec_mult2_avm_burstcount => matvec_mult_function_out_unnamed_matvec_mult2_avm_burstcount,
        out_unnamed_matvec_mult2_avm_byteenable => matvec_mult_function_out_unnamed_matvec_mult2_avm_byteenable,
        out_unnamed_matvec_mult2_avm_enable => matvec_mult_function_out_unnamed_matvec_mult2_avm_enable,
        out_unnamed_matvec_mult2_avm_read => matvec_mult_function_out_unnamed_matvec_mult2_avm_read,
        out_unnamed_matvec_mult2_avm_write => matvec_mult_function_out_unnamed_matvec_mult2_avm_write,
        out_unnamed_matvec_mult2_avm_writedata => matvec_mult_function_out_unnamed_matvec_mult2_avm_writedata,
        out_valid_out => matvec_mult_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_unnamed_matvec_mult0_address(GPOUT,54)
    avm_unnamed_matvec_mult0_address <= matvec_mult_function_out_unnamed_matvec_mult0_avm_address;

    -- avm_unnamed_matvec_mult0_burstcount(GPOUT,55)
    avm_unnamed_matvec_mult0_burstcount <= matvec_mult_function_out_unnamed_matvec_mult0_avm_burstcount;

    -- avm_unnamed_matvec_mult0_byteenable(GPOUT,56)
    avm_unnamed_matvec_mult0_byteenable <= matvec_mult_function_out_unnamed_matvec_mult0_avm_byteenable;

    -- avm_unnamed_matvec_mult0_enable(GPOUT,57)
    avm_unnamed_matvec_mult0_enable <= matvec_mult_function_out_unnamed_matvec_mult0_avm_enable;

    -- avm_unnamed_matvec_mult0_read(GPOUT,58)
    avm_unnamed_matvec_mult0_read <= matvec_mult_function_out_unnamed_matvec_mult0_avm_read;

    -- avm_unnamed_matvec_mult0_write(GPOUT,59)
    avm_unnamed_matvec_mult0_write <= matvec_mult_function_out_unnamed_matvec_mult0_avm_write;

    -- avm_unnamed_matvec_mult0_writedata(GPOUT,60)
    avm_unnamed_matvec_mult0_writedata <= matvec_mult_function_out_unnamed_matvec_mult0_avm_writedata;

    -- avm_unnamed_matvec_mult1_address(GPOUT,61)
    avm_unnamed_matvec_mult1_address <= matvec_mult_function_out_unnamed_matvec_mult1_avm_address;

    -- avm_unnamed_matvec_mult1_burstcount(GPOUT,62)
    avm_unnamed_matvec_mult1_burstcount <= matvec_mult_function_out_unnamed_matvec_mult1_avm_burstcount;

    -- avm_unnamed_matvec_mult1_byteenable(GPOUT,63)
    avm_unnamed_matvec_mult1_byteenable <= matvec_mult_function_out_unnamed_matvec_mult1_avm_byteenable;

    -- avm_unnamed_matvec_mult1_enable(GPOUT,64)
    avm_unnamed_matvec_mult1_enable <= matvec_mult_function_out_unnamed_matvec_mult1_avm_enable;

    -- avm_unnamed_matvec_mult1_read(GPOUT,65)
    avm_unnamed_matvec_mult1_read <= matvec_mult_function_out_unnamed_matvec_mult1_avm_read;

    -- avm_unnamed_matvec_mult1_write(GPOUT,66)
    avm_unnamed_matvec_mult1_write <= matvec_mult_function_out_unnamed_matvec_mult1_avm_write;

    -- avm_unnamed_matvec_mult1_writedata(GPOUT,67)
    avm_unnamed_matvec_mult1_writedata <= matvec_mult_function_out_unnamed_matvec_mult1_avm_writedata;

    -- avm_unnamed_matvec_mult2_address(GPOUT,68)
    avm_unnamed_matvec_mult2_address <= matvec_mult_function_out_unnamed_matvec_mult2_avm_address;

    -- avm_unnamed_matvec_mult2_burstcount(GPOUT,69)
    avm_unnamed_matvec_mult2_burstcount <= matvec_mult_function_out_unnamed_matvec_mult2_avm_burstcount;

    -- avm_unnamed_matvec_mult2_byteenable(GPOUT,70)
    avm_unnamed_matvec_mult2_byteenable <= matvec_mult_function_out_unnamed_matvec_mult2_avm_byteenable;

    -- avm_unnamed_matvec_mult2_enable(GPOUT,71)
    avm_unnamed_matvec_mult2_enable <= matvec_mult_function_out_unnamed_matvec_mult2_avm_enable;

    -- avm_unnamed_matvec_mult2_read(GPOUT,72)
    avm_unnamed_matvec_mult2_read <= matvec_mult_function_out_unnamed_matvec_mult2_avm_read;

    -- avm_unnamed_matvec_mult2_write(GPOUT,73)
    avm_unnamed_matvec_mult2_write <= matvec_mult_function_out_unnamed_matvec_mult2_avm_write;

    -- avm_unnamed_matvec_mult2_writedata(GPOUT,74)
    avm_unnamed_matvec_mult2_writedata <= matvec_mult_function_out_unnamed_matvec_mult2_avm_writedata;

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

    -- clock2x_output(GPOUT,75)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,76)
    has_a_lsu_active <= matvec_mult_function_out_o_active_unnamed_matvec_mult2;

    -- has_a_write_pending(GPOUT,77)
    has_a_write_pending <= matvec_mult_function_out_o_active_unnamed_matvec_mult2;

    -- kernel_stall_out(GPOUT,78)
    kernel_stall_out <= matvec_mult_function_out_stall_out;

    -- kernel_valid_out(GPOUT,79)
    kernel_valid_out <= matvec_mult_function_out_valid_out;

END normal;
