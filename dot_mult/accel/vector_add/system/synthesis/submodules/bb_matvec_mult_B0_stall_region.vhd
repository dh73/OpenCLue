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

-- VHDL created from bb_matvec_mult_B0_stall_region
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

entity bb_matvec_mult_B0_stall_region is
    port (
        in_lsu_unnamed_matvec_mult1_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_matvec_mult1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_matvec_mult1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_matvec_mult1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_matvec_mult2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_matvec_mult2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_m : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_matvec_mult1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_matvec_mult1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_matvec_mult2_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_result : in std_logic_vector(63 downto 0);  -- ufix64
        in_lsu_unnamed_matvec_mult2_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_matvec_mult2_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_matvec_mult2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_matvec_mult0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_matvec_mult0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_matvec_mult0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_dot : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_matvec_mult_B0_stall_region;

architecture normal of bb_matvec_mult_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult is
        port (
            in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni2_0_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_0_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_1_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_1_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_2_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_2_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_3_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_3_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_1_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_2_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_3_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_matvec_mult0_matvec_mult7 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_matvec_mult1_matvec_mult10 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult1_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_matvec_mult2_matvec_mult15 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult2_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult2_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_matvec_mult2_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component matvec_mult_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_dot_sync_buffer_matvec_mult2 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_m_sync_buffer_matvec_mult0 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_result_sync_buffer_matvec_mult4 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_0_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_1_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_2_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_3_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_multconst_x_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_matvec_mult_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_lsu_unnamed_matvec_mult2_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal matvec_mult_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal matvec_mult_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_dot_sync_buffer_matvec_mult_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_dot_sync_buffer_matvec_mult_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_dot_sync_buffer_matvec_mult_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_m_sync_buffer_matvec_mult_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_m_sync_buffer_matvec_mult_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_m_sync_buffer_matvec_mult_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_result_sync_buffer_matvec_mult_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_result_sync_buffer_matvec_mult_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_result_sync_buffer_matvec_mult_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_matvec_mult_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_matvec_mult_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_dot_sync_buffer_matvec_mult_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_dot_sync_buffer_matvec_mult_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_m_sync_buffer_matvec_mult_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_m_sync_buffer_matvec_mult_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_result_sync_buffer_matvec_mult_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_result_sync_buffer_matvec_mult_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_matvec_mult_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer_matvec_mult_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer_matvec_mult_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer_matvec_mult_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer_matvec_mult_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_result_sync_buffer_matvec_mult_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_result_sync_buffer_matvec_mult_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_result_sync_buffer_matvec_mult_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_result_sync_buffer_matvec_mult_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_syncbuf_result_sync_buffer_matvec_mult(BLACKBOX,65)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_result_sync_buffer_matvec_mult : i_syncbuf_result_sync_buffer_matvec_mult4
    PORT MAP (
        in_buffer_in => in_result,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_result_sync_buffer_matvec_mult_backStall,
        in_valid_in => SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V3,
        out_buffer_out => i_syncbuf_result_sync_buffer_matvec_mult_out_buffer_out,
        out_stall_out => i_syncbuf_result_sync_buffer_matvec_mult_out_stall_out,
        out_valid_out => i_syncbuf_result_sync_buffer_matvec_mult_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_multconst_x(CONSTANT,35)
    i_arrayidx4_matvec_mult_matvec_mult9_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SE_stall_entry(STALLENABLE,183)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= matvec_mult_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,152)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,153)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- matvec_mult_B0_merge_reg_aunroll_x(BLACKBOX,55)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thematvec_mult_B0_merge_reg_aunroll_x : matvec_mult_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_matvec_mult_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => matvec_mult_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => matvec_mult_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => matvec_mult_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_matvec_mult_B0_merge_reg_aunroll_x(BITJOIN,137)
    bubble_join_matvec_mult_B0_merge_reg_aunroll_x_q <= matvec_mult_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_matvec_mult_B0_merge_reg_aunroll_x(BITSELECT,138)
    bubble_select_matvec_mult_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_matvec_mult_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- i_idxprom_matvec_mult_sel_x(BITSELECT,51)@1
    i_idxprom_matvec_mult_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_matvec_mult_B0_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select(BITSELECT,119)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_b <= i_idxprom_matvec_mult_sel_x_b(17 downto 0);
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_c <= i_idxprom_matvec_mult_sel_x_b(63 downto 54);
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_d <= i_idxprom_matvec_mult_sel_x_b(35 downto 18);
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_e <= i_idxprom_matvec_mult_sel_x_b(53 downto 36);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0(BITSHIFT,112)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_c & "0000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0_qint(13 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15(BITSHIFT,89)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im3_shift0_q) & "0000000000000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0(BITSHIFT,113)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_d & "0000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0_qint(21 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14(BITSHIFT,88)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14_qint(40 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_16(BITJOIN,90)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_16_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_15_q & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_14_q;

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0(BITSHIFT,114)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_e & "0000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0_qint(21 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12(BITSHIFT,86)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0(BITSHIFT,111)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_b & "0000";
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0_qint(21 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_13(BITJOIN,87)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_13_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_im0_shift0_q);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0(ADD,91)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_13_q);
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_join_16_q);
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_b));
    i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_o(69 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_mult_extender_x(BITJOIN,34)@1
    i_arrayidx4_matvec_mult_matvec_mult9_mult_extender_x_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_multconst_x_q & i_arrayidx4_matvec_mult_matvec_mult9_mult_x_result_add_0_0_q(68 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x(BITSELECT,36)@1
    i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b <= i_arrayidx4_matvec_mult_matvec_mult9_mult_extender_x_q(63 downto 0);

    -- redist1_i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b_1_0(REG,124)
    redist1_i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_result_sync_buffer_matvec_mult(BITJOIN,149)
    bubble_join_i_syncbuf_result_sync_buffer_matvec_mult_q <= i_syncbuf_result_sync_buffer_matvec_mult_out_buffer_out;

    -- bubble_select_i_syncbuf_result_sync_buffer_matvec_mult(BITSELECT,150)
    bubble_select_i_syncbuf_result_sync_buffer_matvec_mult_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_result_sync_buffer_matvec_mult_q(63 downto 0));

    -- i_arrayidx4_matvec_mult_matvec_mult9_add_x(ADD,37)@2
    i_arrayidx4_matvec_mult_matvec_mult9_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_result_sync_buffer_matvec_mult_b);
    i_arrayidx4_matvec_mult_matvec_mult9_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx4_matvec_mult_matvec_mult9_trunc_sel_x_b_1_0_q);
    i_arrayidx4_matvec_mult_matvec_mult9_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx4_matvec_mult_matvec_mult9_add_x_a) + UNSIGNED(i_arrayidx4_matvec_mult_matvec_mult9_add_x_b));
    i_arrayidx4_matvec_mult_matvec_mult9_add_x_q <= i_arrayidx4_matvec_mult_matvec_mult9_add_x_o(64 downto 0);

    -- i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x(BITSELECT,31)@2
    i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b <= i_arrayidx4_matvec_mult_matvec_mult9_add_x_q(63 downto 0);

    -- SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x(STALLENABLE,174)
    -- Valid signal propagation
    SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_V0 <= SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_backStall <= in_stall_in or not (SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_wireValid <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_o_valid;

    -- bubble_join_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo(BITJOIN,156)
    bubble_join_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_q <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_data_out;

    -- bubble_select_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo(BITSELECT,157)
    bubble_select_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_q(63 downto 0));

    -- bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x(BITJOIN,127)
    bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_q <= i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_3_1 & i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_2_1 & i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_1_1 & i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_0_1;

    -- bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x(BITSELECT,128)
    bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_q(63 downto 32));
    bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_q(95 downto 64));
    bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_q(127 downto 96));

    -- i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x(BLACKBOX,54)@59
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_matvec_mult2_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@60
    -- out out_unnamed_matvec_mult2_avm_address@20000000
    -- out out_unnamed_matvec_mult2_avm_burstcount@20000000
    -- out out_unnamed_matvec_mult2_avm_byteenable@20000000
    -- out out_unnamed_matvec_mult2_avm_enable@20000000
    -- out out_unnamed_matvec_mult2_avm_read@20000000
    -- out out_unnamed_matvec_mult2_avm_write@20000000
    -- out out_unnamed_matvec_mult2_avm_writedata@20000000
    thei_store_unnamed_matvec_mult2_matvec_mult_vunroll_x : i_store_unnamed_matvec_mult2_matvec_mult15
    PORT MAP (
        in_i_writedata_0 => bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_b,
        in_i_writedata_1 => bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_c,
        in_i_writedata_2 => bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_d,
        in_i_writedata_3 => bubble_select_i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_e,
        in_flush => in_flush,
        in_i_address => bubble_select_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_backStall,
        in_i_valid => SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_V0,
        in_lsu_unnamed_matvec_mult2_streset_stream_reset => in_lsu_unnamed_matvec_mult2_streset_stream_reset,
        in_lsu_unnamed_matvec_mult2_sts_stream_size => in_lsu_unnamed_matvec_mult2_sts_stream_size,
        in_stream_base_addr => bubble_select_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_b,
        in_unnamed_matvec_mult2_avm_readdata => in_unnamed_matvec_mult2_avm_readdata,
        in_unnamed_matvec_mult2_avm_readdatavalid => in_unnamed_matvec_mult2_avm_readdatavalid,
        in_unnamed_matvec_mult2_avm_waitrequest => in_unnamed_matvec_mult2_avm_waitrequest,
        in_unnamed_matvec_mult2_avm_writeack => in_unnamed_matvec_mult2_avm_writeack,
        out_lsu_unnamed_matvec_mult2_o_active => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_lsu_unnamed_matvec_mult2_o_active,
        out_o_stall => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_o_stall,
        out_o_valid => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_o_valid,
        out_unnamed_matvec_mult2_avm_address => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_address,
        out_unnamed_matvec_mult2_avm_burstcount => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_burstcount,
        out_unnamed_matvec_mult2_avm_byteenable => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_byteenable,
        out_unnamed_matvec_mult2_avm_enable => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_enable,
        out_unnamed_matvec_mult2_avm_read => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_read,
        out_unnamed_matvec_mult2_avm_write => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_write,
        out_unnamed_matvec_mult2_avm_writedata => i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_dot_sync_buffer_matvec_mult(BLACKBOX,63)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_dot_sync_buffer_matvec_mult : i_syncbuf_dot_sync_buffer_matvec_mult2
    PORT MAP (
        in_buffer_in => in_dot,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_backStall,
        in_valid_in => SE_out_matvec_mult_B0_merge_reg_aunroll_x_V0,
        out_buffer_out => i_syncbuf_dot_sync_buffer_matvec_mult_out_buffer_out,
        out_stall_out => i_syncbuf_dot_sync_buffer_matvec_mult_out_stall_out,
        out_valid_out => i_syncbuf_dot_sync_buffer_matvec_mult_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_dot_sync_buffer_matvec_mult(STALLENABLE,178)
    -- Valid signal propagation
    SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_V0 <= SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_backStall <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_stall or not (SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_wireValid <= i_syncbuf_dot_sync_buffer_matvec_mult_out_valid_out;

    -- bubble_join_i_syncbuf_dot_sync_buffer_matvec_mult(BITJOIN,143)
    bubble_join_i_syncbuf_dot_sync_buffer_matvec_mult_q <= i_syncbuf_dot_sync_buffer_matvec_mult_out_buffer_out;

    -- bubble_select_i_syncbuf_dot_sync_buffer_matvec_mult(BITSELECT,144)
    bubble_select_i_syncbuf_dot_sync_buffer_matvec_mult_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_dot_sync_buffer_matvec_mult_q(63 downto 0));

    -- i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x(BLACKBOX,52)@1
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@4
    -- out out_o_readdata_1@4
    -- out out_o_readdata_2@4
    -- out out_o_readdata_3@4
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_unnamed_matvec_mult0_avm_address@20000000
    -- out out_unnamed_matvec_mult0_avm_burstcount@20000000
    -- out out_unnamed_matvec_mult0_avm_byteenable@20000000
    -- out out_unnamed_matvec_mult0_avm_enable@20000000
    -- out out_unnamed_matvec_mult0_avm_read@20000000
    -- out out_unnamed_matvec_mult0_avm_write@20000000
    -- out out_unnamed_matvec_mult0_avm_writedata@20000000
    thei_load_unnamed_matvec_mult0_matvec_mult_vunroll_x : i_load_unnamed_matvec_mult0_matvec_mult7
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_dot_sync_buffer_matvec_mult_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_dot_sync_buffer_matvec_mult_V0,
        in_unnamed_matvec_mult0_avm_readdata => in_unnamed_matvec_mult0_avm_readdata,
        in_unnamed_matvec_mult0_avm_readdatavalid => in_unnamed_matvec_mult0_avm_readdatavalid,
        in_unnamed_matvec_mult0_avm_waitrequest => in_unnamed_matvec_mult0_avm_waitrequest,
        in_unnamed_matvec_mult0_avm_writeack => in_unnamed_matvec_mult0_avm_writeack,
        out_o_readdata_0 => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_3,
        out_o_stall => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_stall,
        out_o_valid => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_valid,
        out_unnamed_matvec_mult0_avm_address => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_address,
        out_unnamed_matvec_mult0_avm_burstcount => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_burstcount,
        out_unnamed_matvec_mult0_avm_byteenable => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_byteenable,
        out_unnamed_matvec_mult0_avm_enable => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_enable,
        out_unnamed_matvec_mult0_avm_read => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_read,
        out_unnamed_matvec_mult0_avm_write => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_write,
        out_unnamed_matvec_mult0_avm_writedata => i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x(BITJOIN,130)
    bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_q <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_3 & i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_2 & i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_1 & i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x(BITSELECT,131)
    bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_q(31 downto 0));
    bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_q(63 downto 32));
    bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_q(95 downto 64));
    bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_q(127 downto 96));

    -- bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x(BITJOIN,133)
    bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_q <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_3 & i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_2 & i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_1 & i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x(BITSELECT,134)
    bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_q(31 downto 0));
    bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_q(63 downto 32));
    bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_q(95 downto 64));
    bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_q(127 downto 96));

    -- i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x(BLACKBOX,2)@4
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@59
    -- out out_c0_exit_0_1@59
    -- out out_c0_exit_1_1@59
    -- out out_c0_exit_2_1@59
    -- out out_c0_exit_3_1@59
    -- out out_o_stall@20000000
    -- out out_o_valid@59
    thei_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x : i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult
    PORT MAP (
        in_c0_eni2_0 => GND_q,
        in_c0_eni2_0_1 => bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_b,
        in_c0_eni2_0_2 => bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_b,
        in_c0_eni2_1_1 => bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_c,
        in_c0_eni2_1_2 => bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_c,
        in_c0_eni2_2_1 => bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_d,
        in_c0_eni2_2_2 => bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_d,
        in_c0_eni2_3_1 => bubble_select_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_e,
        in_c0_eni2_3_2 => bubble_select_i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_e,
        in_i_stall => SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_backStall,
        in_i_valid => SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_V0,
        out_c0_exit_0_1 => i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_0_1,
        out_c0_exit_1_1 => i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_1_1,
        out_c0_exit_2_1 => i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_2_1,
        out_c0_exit_3_1 => i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_c0_exit_3_1,
        out_o_stall => i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo(STALLENABLE,209)
    -- Valid signal propagation
    SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_V0 <= SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_backStall <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_o_stall or not (SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_and0 <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_out;
    SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_wireValid <= i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_o_valid and SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_and0;

    -- redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo(STALLFIFO,125)
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_in <= SE_out_i_syncbuf_result_sync_buffer_matvec_mult_V0;
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_in <= SE_out_redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_backStall;
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_data_in <= i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b;
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_in_bitsignaltemp <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_in(0);
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_in_bitsignaltemp <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_in(0);
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_out(0) <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_out_bitsignaltemp;
    redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_out(0) <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_out_bitsignaltemp;
    theredist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 58,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_in_bitsignaltemp,
        data_in => i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b,
        valid_out => redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_result_sync_buffer_matvec_mult(STALLENABLE,182)
    -- Valid signal propagation
    SE_out_i_syncbuf_result_sync_buffer_matvec_mult_V0 <= SE_out_i_syncbuf_result_sync_buffer_matvec_mult_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_result_sync_buffer_matvec_mult_backStall <= redist2_i_arrayidx4_matvec_mult_matvec_mult9_dupName_0_trunc_sel_x_b_57_fifo_stall_out or not (SE_out_i_syncbuf_result_sync_buffer_matvec_mult_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_result_sync_buffer_matvec_mult_and0 <= i_syncbuf_result_sync_buffer_matvec_mult_out_valid_out;
    SE_out_i_syncbuf_result_sync_buffer_matvec_mult_wireValid <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V1 and SE_out_i_syncbuf_result_sync_buffer_matvec_mult_and0;

    -- SE_out_matvec_mult_B0_merge_reg_aunroll_x(STALLENABLE,176)
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed0 <= (not (i_syncbuf_dot_sync_buffer_matvec_mult_out_stall_out) and SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid) or SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed1 <= (not (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backStall) and SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid) or SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_StallValid <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_backStall and SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid;
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_toReg0 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_StallValid and SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed0;
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_toReg1 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_StallValid and SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_or0 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed0;
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_matvec_mult_B0_merge_reg_aunroll_x_consumed1 and SE_out_matvec_mult_B0_merge_reg_aunroll_x_or0);
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_backStall <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_V0 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid and not (SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_V1 <= SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid and not (SE_out_matvec_mult_B0_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_matvec_mult_B0_merge_reg_aunroll_x_wireValid <= matvec_mult_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0(STALLENABLE,206)
    -- Valid signal propagation
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V0 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V1 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V2 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V3 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3;
    -- Stall signal propagation
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_m_sync_buffer_matvec_mult_backStall and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_1 <= SE_out_i_syncbuf_result_sync_buffer_matvec_mult_backStall and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_2 <= i_syncbuf_m_sync_buffer_matvec_mult_out_stall_out and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_3 <= i_syncbuf_result_sync_buffer_matvec_mult_out_stall_out and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3;
    -- Backward Enable generation
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or0 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or1 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_1 or SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or0;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or2 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_2 or SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or1;
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN <= not (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_3 or SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_or2);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN and SE_out_matvec_mult_B0_merge_reg_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backStall <= not (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0);
    SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
            SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2 <= (others => '0');
            SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0 and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1 and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2 and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_2;
            ELSE
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_2 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3 and SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_s_tv_3;
            ELSE
                SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_R_v_3 <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_m_sync_buffer_matvec_mult(BLACKBOX,64)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_m_sync_buffer_matvec_mult : i_syncbuf_m_sync_buffer_matvec_mult0
    PORT MAP (
        in_buffer_in => in_m,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_m_sync_buffer_matvec_mult_backStall,
        in_valid_in => SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V2,
        out_buffer_out => i_syncbuf_m_sync_buffer_matvec_mult_out_buffer_out,
        out_stall_out => i_syncbuf_m_sync_buffer_matvec_mult_out_stall_out,
        out_valid_out => i_syncbuf_m_sync_buffer_matvec_mult_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_m_sync_buffer_matvec_mult(STALLENABLE,180)
    -- Valid signal propagation
    SE_out_i_syncbuf_m_sync_buffer_matvec_mult_V0 <= SE_out_i_syncbuf_m_sync_buffer_matvec_mult_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_m_sync_buffer_matvec_mult_backStall <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_stall or not (SE_out_i_syncbuf_m_sync_buffer_matvec_mult_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_m_sync_buffer_matvec_mult_and0 <= i_syncbuf_m_sync_buffer_matvec_mult_out_valid_out;
    SE_out_i_syncbuf_m_sync_buffer_matvec_mult_wireValid <= SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_m_sync_buffer_matvec_mult_and0;

    -- SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x(STALLENABLE,172)
    -- Valid signal propagation
    SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_V0 <= SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_backStall <= i_sfc_c0_entry_matvec_mult_c0_enter_matvec_mult_aunroll_vunroll_x_out_o_stall or not (SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_and0 <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_valid;
    SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_wireValid <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_o_valid and SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0(BITSHIFT,116)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_c & "0000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0_qint(13 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15(BITSHIFT,107)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_matvec_mult_matvec_mult6_mult_x_im3_shift0_q) & "0000000000000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0(BITSHIFT,117)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_d & "0000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0_qint(21 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14(BITSHIFT,106)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_matvec_mult_matvec_mult6_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14_qint(40 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_16(BITJOIN,108)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_16_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_15_q & i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_14_q;

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0(BITSHIFT,118)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_e & "0000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0_qint(21 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12(BITSHIFT,104)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_matvec_mult_matvec_mult6_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0(BITSHIFT,115)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0_qint <= i_arrayidx4_matvec_mult_matvec_mult9_mult_x_bs1_merged_bit_select_b & "0000";
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0_qint(21 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_13(BITJOIN,105)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_13_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_matvec_mult_matvec_mult6_mult_x_im0_shift0_q);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0(ADD,109)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_13_q);
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_matvec_mult_matvec_mult6_mult_x_join_16_q);
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_b));
    i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_q <= i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_o(69 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_mult_extender_x(BITJOIN,44)@1
    i_arrayidx_matvec_mult_matvec_mult6_mult_extender_x_q <= i_arrayidx4_matvec_mult_matvec_mult9_mult_multconst_x_q & i_arrayidx_matvec_mult_matvec_mult6_mult_x_result_add_0_0_q(68 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x(BITSELECT,46)@1
    i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b <= i_arrayidx_matvec_mult_matvec_mult6_mult_extender_x_q(63 downto 0);

    -- redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0(REG,123)
    redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_m_sync_buffer_matvec_mult(BITJOIN,146)
    bubble_join_i_syncbuf_m_sync_buffer_matvec_mult_q <= i_syncbuf_m_sync_buffer_matvec_mult_out_buffer_out;

    -- bubble_select_i_syncbuf_m_sync_buffer_matvec_mult(BITSELECT,147)
    bubble_select_i_syncbuf_m_sync_buffer_matvec_mult_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_m_sync_buffer_matvec_mult_q(63 downto 0));

    -- i_arrayidx_matvec_mult_matvec_mult6_add_x(ADD,47)@2
    i_arrayidx_matvec_mult_matvec_mult6_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_m_sync_buffer_matvec_mult_b);
    i_arrayidx_matvec_mult_matvec_mult6_add_x_b <= STD_LOGIC_VECTOR("0" & redist0_i_arrayidx_matvec_mult_matvec_mult6_trunc_sel_x_b_1_0_q);
    i_arrayidx_matvec_mult_matvec_mult6_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_matvec_mult_matvec_mult6_add_x_a) + UNSIGNED(i_arrayidx_matvec_mult_matvec_mult6_add_x_b));
    i_arrayidx_matvec_mult_matvec_mult6_add_x_q <= i_arrayidx_matvec_mult_matvec_mult6_add_x_o(64 downto 0);

    -- i_arrayidx_matvec_mult_matvec_mult6_dupName_0_trunc_sel_x(BITSELECT,41)@2
    i_arrayidx_matvec_mult_matvec_mult6_dupName_0_trunc_sel_x_b <= i_arrayidx_matvec_mult_matvec_mult6_add_x_q(63 downto 0);

    -- i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x(BLACKBOX,53)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@4
    -- out out_o_readdata_1@4
    -- out out_o_readdata_2@4
    -- out out_o_readdata_3@4
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_unnamed_matvec_mult1_avm_address@20000000
    -- out out_unnamed_matvec_mult1_avm_burstcount@20000000
    -- out out_unnamed_matvec_mult1_avm_byteenable@20000000
    -- out out_unnamed_matvec_mult1_avm_enable@20000000
    -- out out_unnamed_matvec_mult1_avm_read@20000000
    -- out out_unnamed_matvec_mult1_avm_write@20000000
    -- out out_unnamed_matvec_mult1_avm_writedata@20000000
    thei_load_unnamed_matvec_mult1_matvec_mult_vunroll_x : i_load_unnamed_matvec_mult1_matvec_mult10
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_matvec_mult_matvec_mult6_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_m_sync_buffer_matvec_mult_V0,
        in_lsu_unnamed_matvec_mult1_streset_stream_reset => in_lsu_unnamed_matvec_mult1_streset_stream_reset,
        in_lsu_unnamed_matvec_mult1_sts_stream_size => in_lsu_unnamed_matvec_mult1_sts_stream_size,
        in_stream_base_addr => i_arrayidx_matvec_mult_matvec_mult6_dupName_0_trunc_sel_x_b,
        in_unnamed_matvec_mult1_avm_readdata => in_unnamed_matvec_mult1_avm_readdata,
        in_unnamed_matvec_mult1_avm_readdatavalid => in_unnamed_matvec_mult1_avm_readdatavalid,
        in_unnamed_matvec_mult1_avm_waitrequest => in_unnamed_matvec_mult1_avm_waitrequest,
        in_unnamed_matvec_mult1_avm_writeack => in_unnamed_matvec_mult1_avm_writeack,
        out_o_readdata_0 => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_readdata_3,
        out_o_stall => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_stall,
        out_o_valid => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_o_valid,
        out_unnamed_matvec_mult1_avm_address => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_address,
        out_unnamed_matvec_mult1_avm_burstcount => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_burstcount,
        out_unnamed_matvec_mult1_avm_byteenable => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_byteenable,
        out_unnamed_matvec_mult1_avm_enable => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_enable,
        out_unnamed_matvec_mult1_avm_read => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_read,
        out_unnamed_matvec_mult1_avm_write => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_write,
        out_unnamed_matvec_mult1_avm_writedata => i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_unnamed_matvec_mult1_avm_address <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_address;
    out_unnamed_matvec_mult1_avm_enable <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_enable;
    out_unnamed_matvec_mult1_avm_read <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_read;
    out_unnamed_matvec_mult1_avm_write <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_write;
    out_unnamed_matvec_mult1_avm_writedata <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_writedata;
    out_unnamed_matvec_mult1_avm_byteenable <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_byteenable;
    out_unnamed_matvec_mult1_avm_burstcount <= i_load_unnamed_matvec_mult1_matvec_mult_vunroll_x_out_unnamed_matvec_mult1_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,9)@60
    out_valid_out <= SE_out_i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,11)
    out_unnamed_matvec_mult2_avm_address <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_address;
    out_unnamed_matvec_mult2_avm_enable <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_enable;
    out_unnamed_matvec_mult2_avm_read <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_read;
    out_unnamed_matvec_mult2_avm_write <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_write;
    out_unnamed_matvec_mult2_avm_writedata <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_writedata;
    out_unnamed_matvec_mult2_avm_byteenable <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_byteenable;
    out_unnamed_matvec_mult2_avm_burstcount <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_unnamed_matvec_mult2_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,16)
    out_lsu_unnamed_matvec_mult2_o_active <= i_store_unnamed_matvec_mult2_matvec_mult_vunroll_x_out_lsu_unnamed_matvec_mult2_o_active;

    -- ext_sig_sync_out(GPOUT,60)
    out_unnamed_matvec_mult0_avm_address <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_address;
    out_unnamed_matvec_mult0_avm_enable <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_enable;
    out_unnamed_matvec_mult0_avm_read <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_read;
    out_unnamed_matvec_mult0_avm_write <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_write;
    out_unnamed_matvec_mult0_avm_writedata <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_writedata;
    out_unnamed_matvec_mult0_avm_byteenable <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_byteenable;
    out_unnamed_matvec_mult0_avm_burstcount <= i_load_unnamed_matvec_mult0_matvec_mult_vunroll_x_out_unnamed_matvec_mult0_avm_burstcount;

    -- sync_out(GPOUT,73)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
