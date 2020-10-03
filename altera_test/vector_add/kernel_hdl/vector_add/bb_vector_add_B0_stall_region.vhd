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

-- VHDL created from bb_vector_add_B0_stall_region
-- VHDL created on Tue Sep 15 23:17:36 2020


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

entity bb_vector_add_B0_stall_region is
    port (
        in_lsu_unnamed_vector_add0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_vector_add1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_vector_add1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_vector_add1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_b : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_vector_add0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add2_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_vector_add2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_vector_add2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_vector_add2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_c : in std_logic_vector(63 downto 0);  -- ufix64
        in_lsu_unnamed_vector_add1_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_vector_add2_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_vector_add1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_vector_add1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_vector_add2_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_vector_add2_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_vector_add2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_vector_add2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_vector_add0_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_vector_add0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_vector_add0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_vector_add0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_vector_add0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_vector_add0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_a : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_vector_add_B0_stall_region;

architecture normal of bb_vector_add_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component vector_add_B0_merge_reg is
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


    component i_load_unnamed_vector_add0_vector_add3 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_vector_add0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_vector_add0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_vector_add0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_vector_add0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_vector_add0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_vector_add0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_vector_add1_vector_add8 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_vector_add1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_vector_add1_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_vector_add1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_vector_add1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_vector_add1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_vector_add1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_vector_add2_vector_add13 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_vector_add2_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_vector_add2_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_vector_add2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_vector_add2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_vector_add2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_vector_add2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_vector_add2_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_vector_add2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_a_sync_buffer_vector_add0 is
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


    component i_syncbuf_b_sync_buffer_vector_add5 is
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


    component i_syncbuf_c_sync_buffer_vector_add10 is
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_vector_add_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_vector_add_vector_add2_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_vector_add_vector_add2_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_vector_add_vector_add2_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_vector_add_vector_add2_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_vector_add_vector_add2_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_vector_add_vector_add2_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_vector_add_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal vector_add_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal vector_add_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal vector_add_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_vector_add_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_vector_add_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_vector_add_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_vector_add_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_lsu_unnamed_vector_add2_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_a_sync_buffer_vector_add_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_a_sync_buffer_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_a_sync_buffer_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_b_sync_buffer_vector_add_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_b_sync_buffer_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_b_sync_buffer_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_c_sync_buffer_vector_add_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_c_sync_buffer_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_c_sync_buffer_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_vector_add_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_vector_add_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_vector_add0_vector_add_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_vector_add0_vector_add_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_vector_add1_vector_add_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_vector_add1_vector_add_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_a_sync_buffer_vector_add_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_a_sync_buffer_vector_add_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_b_sync_buffer_vector_add_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_b_sync_buffer_vector_add_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_c_sync_buffer_vector_add_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_c_sync_buffer_vector_add_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_vector_add_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_vector_add1_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_vector_add1_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_vector_add1_vector_add_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_vector_add1_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_vector_add1_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_vector_add2_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_vector_add2_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_vector_add2_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- i_syncbuf_c_sync_buffer_vector_add(BLACKBOX,77)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_c_sync_buffer_vector_add : i_syncbuf_c_sync_buffer_vector_add10
    PORT MAP (
        in_buffer_in => in_c,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall,
        in_valid_in => SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V5,
        out_buffer_out => i_syncbuf_c_sync_buffer_vector_add_out_buffer_out,
        out_stall_out => i_syncbuf_c_sync_buffer_vector_add_out_stall_out,
        out_valid_out => i_syncbuf_c_sync_buffer_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_a_sync_buffer_vector_add(BLACKBOX,75)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_a_sync_buffer_vector_add : i_syncbuf_a_sync_buffer_vector_add0
    PORT MAP (
        in_buffer_in => in_a,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall,
        in_valid_in => SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V3,
        out_buffer_out => i_syncbuf_a_sync_buffer_vector_add_out_buffer_out,
        out_stall_out => i_syncbuf_a_sync_buffer_vector_add_out_stall_out,
        out_valid_out => i_syncbuf_a_sync_buffer_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx2_vector_add_vector_add7_mult_multconst_x(CONSTANT,35)
    i_arrayidx2_vector_add_vector_add7_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SE_stall_entry(STALLENABLE,219)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= vector_add_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,187)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,188)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- vector_add_B0_merge_reg_aunroll_x(BLACKBOX,62)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thevector_add_B0_merge_reg_aunroll_x : vector_add_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_vector_add_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => vector_add_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => vector_add_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => vector_add_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_vector_add_B0_merge_reg_aunroll_x(BITJOIN,165)
    bubble_join_vector_add_B0_merge_reg_aunroll_x_q <= vector_add_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_vector_add_B0_merge_reg_aunroll_x(BITSELECT,166)
    bubble_select_vector_add_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_vector_add_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- i_idxprom_vector_add_sel_x(BITSELECT,61)@1
    i_idxprom_vector_add_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_vector_add_B0_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select(BITSELECT,154)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_b <= i_idxprom_vector_add_sel_x_b(17 downto 0);
    i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_c <= i_idxprom_vector_add_sel_x_b(63 downto 54);
    i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_d <= i_idxprom_vector_add_sel_x_b(35 downto 18);
    i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_e <= i_idxprom_vector_add_sel_x_b(53 downto 36);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0(BITSHIFT,147)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0_q <= i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_align_15(BITSHIFT,119)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx4_vector_add_vector_add12_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx4_vector_add_vector_add12_mult_x_align_15_q <= i_arrayidx4_vector_add_vector_add12_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0(BITSHIFT,148)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0_q <= i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_align_14(BITSHIFT,118)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx4_vector_add_vector_add12_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx4_vector_add_vector_add12_mult_x_align_14_q <= i_arrayidx4_vector_add_vector_add12_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_join_16(BITJOIN,120)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_join_16_q <= i_arrayidx4_vector_add_vector_add12_mult_x_align_15_q & i_arrayidx4_vector_add_vector_add12_mult_x_align_14_q;

    -- i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0(BITSHIFT,149)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0_q <= i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_align_12(BITSHIFT,116)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx4_vector_add_vector_add12_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx4_vector_add_vector_add12_mult_x_align_12_q <= i_arrayidx4_vector_add_vector_add12_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0(BITSHIFT,146)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0_q <= i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_join_13(BITJOIN,117)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_join_13_q <= i_arrayidx4_vector_add_vector_add12_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx4_vector_add_vector_add12_mult_x_im0_shift0_q);

    -- i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0(ADD,121)@1
    i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx4_vector_add_vector_add12_mult_x_join_13_q);
    i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx4_vector_add_vector_add12_mult_x_join_16_q);
    i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_b));
    i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_q <= i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_mult_extender_x(BITJOIN,44)@1
    i_arrayidx4_vector_add_vector_add12_mult_extender_x_q <= i_arrayidx2_vector_add_vector_add7_mult_multconst_x_q & i_arrayidx4_vector_add_vector_add12_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_trunc_sel_x(BITSELECT,46)@1
    i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b <= i_arrayidx4_vector_add_vector_add12_mult_extender_x_q(63 downto 0);

    -- redist1_i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b_1_0(REG,160)
    redist1_i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_c_sync_buffer_vector_add(BITJOIN,184)
    bubble_join_i_syncbuf_c_sync_buffer_vector_add_q <= i_syncbuf_c_sync_buffer_vector_add_out_buffer_out;

    -- bubble_select_i_syncbuf_c_sync_buffer_vector_add(BITSELECT,185)
    bubble_select_i_syncbuf_c_sync_buffer_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_c_sync_buffer_vector_add_q(63 downto 0));

    -- i_arrayidx4_vector_add_vector_add12_add_x(ADD,47)@2
    i_arrayidx4_vector_add_vector_add12_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_c_sync_buffer_vector_add_b);
    i_arrayidx4_vector_add_vector_add12_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx4_vector_add_vector_add12_trunc_sel_x_b_1_0_q);
    i_arrayidx4_vector_add_vector_add12_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx4_vector_add_vector_add12_add_x_a) + UNSIGNED(i_arrayidx4_vector_add_vector_add12_add_x_b));
    i_arrayidx4_vector_add_vector_add12_add_x_q <= i_arrayidx4_vector_add_vector_add12_add_x_o(64 downto 0);

    -- i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x(BITSELECT,41)@2
    i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b <= i_arrayidx4_vector_add_vector_add12_add_x_q(63 downto 0);

    -- redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0(REG,161)
    redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backEN = "1") THEN
                redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1(STALLENABLE,255)
    -- Valid signal propagation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_V0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_s_tv_0 <= SE_out_i_load_unnamed_vector_add1_vector_add_backStall and SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backEN <= not (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_v_s_0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backEN and SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_V;
    -- Backward Stall generation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backStall <= not (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backEN);
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backEN = "0") THEN
                SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0 and SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_R_v_0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1(STALLREG,298)
    SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid <= (others => '0');
            SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backStall and (SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid or SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_i_valid);

            IF (SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_data0 <= STD_LOGIC_VECTOR(redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_i_valid <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backStall <= SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid or not (SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_i_valid);

    -- Valid
    SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_V <= SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid WHEN SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid = "1" ELSE SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_i_valid;

    SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_D0 <= SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_data0 WHEN SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_r_valid = "1" ELSE redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_q;

    -- SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0(STALLENABLE,254)
    -- Valid signal propagation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_V0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_s_tv_0 <= SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backStall and SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backEN <= not (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_v_s_0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backEN and SE_out_i_syncbuf_c_sync_buffer_vector_add_V0;
    -- Backward Stall generation
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backStall <= not (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_v_s_0);
    SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backEN = "0") THEN
                SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0 and SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_R_v_0 <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_c_sync_buffer_vector_add(STALLENABLE,218)
    -- Valid signal propagation
    SE_out_i_syncbuf_c_sync_buffer_vector_add_V0 <= SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_0_backStall or not (SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_c_sync_buffer_vector_add_and0 <= i_syncbuf_c_sync_buffer_vector_add_out_valid_out;
    SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V1 and SE_out_i_syncbuf_c_sync_buffer_vector_add_and0;

    -- i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0(BITSHIFT,151)@1
    i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0_q <= i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_align_15(BITSHIFT,137)@1
    i_arrayidx_vector_add_vector_add2_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_vector_add_vector_add2_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx_vector_add_vector_add2_mult_x_align_15_q <= i_arrayidx_vector_add_vector_add2_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0(BITSHIFT,152)@1
    i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0_q <= i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_align_14(BITSHIFT,136)@1
    i_arrayidx_vector_add_vector_add2_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_vector_add_vector_add2_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_vector_add_vector_add2_mult_x_align_14_q <= i_arrayidx_vector_add_vector_add2_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_join_16(BITJOIN,138)@1
    i_arrayidx_vector_add_vector_add2_mult_x_join_16_q <= i_arrayidx_vector_add_vector_add2_mult_x_align_15_q & i_arrayidx_vector_add_vector_add2_mult_x_align_14_q;

    -- i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0(BITSHIFT,153)@1
    i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0_q <= i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_align_12(BITSHIFT,134)@1
    i_arrayidx_vector_add_vector_add2_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_vector_add_vector_add2_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx_vector_add_vector_add2_mult_x_align_12_q <= i_arrayidx_vector_add_vector_add2_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0(BITSHIFT,150)@1
    i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0_q <= i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_x_join_13(BITJOIN,135)@1
    i_arrayidx_vector_add_vector_add2_mult_x_join_13_q <= i_arrayidx_vector_add_vector_add2_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_vector_add_vector_add2_mult_x_im0_shift0_q);

    -- i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0(ADD,139)@1
    i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_vector_add_vector_add2_mult_x_join_13_q);
    i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_vector_add_vector_add2_mult_x_join_16_q);
    i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_b));
    i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_q <= i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_vector_add_vector_add2_mult_extender_x(BITJOIN,54)@1
    i_arrayidx_vector_add_vector_add2_mult_extender_x_q <= i_arrayidx2_vector_add_vector_add7_mult_multconst_x_q & i_arrayidx_vector_add_vector_add2_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_vector_add_vector_add2_trunc_sel_x(BITSELECT,56)@1
    i_arrayidx_vector_add_vector_add2_trunc_sel_x_b <= i_arrayidx_vector_add_vector_add2_mult_extender_x_q(63 downto 0);

    -- redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0(REG,159)
    redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx_vector_add_vector_add2_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_a_sync_buffer_vector_add(BITJOIN,178)
    bubble_join_i_syncbuf_a_sync_buffer_vector_add_q <= i_syncbuf_a_sync_buffer_vector_add_out_buffer_out;

    -- bubble_select_i_syncbuf_a_sync_buffer_vector_add(BITSELECT,179)
    bubble_select_i_syncbuf_a_sync_buffer_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_a_sync_buffer_vector_add_q(63 downto 0));

    -- i_arrayidx_vector_add_vector_add2_add_x(ADD,57)@2
    i_arrayidx_vector_add_vector_add2_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_a_sync_buffer_vector_add_b);
    i_arrayidx_vector_add_vector_add2_add_x_b <= STD_LOGIC_VECTOR("0" & redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_q);
    i_arrayidx_vector_add_vector_add2_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_vector_add_vector_add2_add_x_a) + UNSIGNED(i_arrayidx_vector_add_vector_add2_add_x_b));
    i_arrayidx_vector_add_vector_add2_add_x_q <= i_arrayidx_vector_add_vector_add2_add_x_o(64 downto 0);

    -- i_arrayidx_vector_add_vector_add2_dupName_0_trunc_sel_x(BITSELECT,51)@2
    i_arrayidx_vector_add_vector_add2_dupName_0_trunc_sel_x_b <= i_arrayidx_vector_add_vector_add2_add_x_q(63 downto 0);

    -- i_load_unnamed_vector_add0_vector_add(BLACKBOX,72)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata@4
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_unnamed_vector_add0_avm_address@20000000
    -- out out_unnamed_vector_add0_avm_burstcount@20000000
    -- out out_unnamed_vector_add0_avm_byteenable@20000000
    -- out out_unnamed_vector_add0_avm_enable@20000000
    -- out out_unnamed_vector_add0_avm_read@20000000
    -- out out_unnamed_vector_add0_avm_write@20000000
    -- out out_unnamed_vector_add0_avm_writedata@20000000
    thei_load_unnamed_vector_add0_vector_add : i_load_unnamed_vector_add0_vector_add3
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_vector_add_vector_add2_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_vector_add1_vector_add_backStall,
        in_i_valid => SE_out_i_syncbuf_a_sync_buffer_vector_add_V0,
        in_lsu_unnamed_vector_add0_streset_stream_reset => in_lsu_unnamed_vector_add0_streset_stream_reset,
        in_lsu_unnamed_vector_add0_sts_stream_size => in_lsu_unnamed_vector_add0_sts_stream_size,
        in_stream_base_addr => i_arrayidx_vector_add_vector_add2_dupName_0_trunc_sel_x_b,
        in_unnamed_vector_add0_avm_readdata => in_unnamed_vector_add0_avm_readdata,
        in_unnamed_vector_add0_avm_readdatavalid => in_unnamed_vector_add0_avm_readdatavalid,
        in_unnamed_vector_add0_avm_waitrequest => in_unnamed_vector_add0_avm_waitrequest,
        in_unnamed_vector_add0_avm_writeack => in_unnamed_vector_add0_avm_writeack,
        out_o_readdata => i_load_unnamed_vector_add0_vector_add_out_o_readdata,
        out_o_stall => i_load_unnamed_vector_add0_vector_add_out_o_stall,
        out_o_valid => i_load_unnamed_vector_add0_vector_add_out_o_valid,
        out_unnamed_vector_add0_avm_address => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_address,
        out_unnamed_vector_add0_avm_burstcount => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_burstcount,
        out_unnamed_vector_add0_avm_byteenable => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_byteenable,
        out_unnamed_vector_add0_avm_enable => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_enable,
        out_unnamed_vector_add0_avm_read => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_read,
        out_unnamed_vector_add0_avm_write => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_write,
        out_unnamed_vector_add0_avm_writedata => i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_a_sync_buffer_vector_add(STALLENABLE,214)
    -- Valid signal propagation
    SE_out_i_syncbuf_a_sync_buffer_vector_add_V0 <= SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall <= i_load_unnamed_vector_add0_vector_add_out_o_stall or not (SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_a_sync_buffer_vector_add_and0 <= i_syncbuf_a_sync_buffer_vector_add_out_valid_out;
    SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_a_sync_buffer_vector_add_and0;

    -- SE_out_vector_add_B0_merge_reg_aunroll_x(STALLENABLE,205)
    -- Valid signal propagation
    SE_out_vector_add_B0_merge_reg_aunroll_x_V0 <= SE_out_vector_add_B0_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_vector_add_B0_merge_reg_aunroll_x_backStall <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backStall or not (SE_out_vector_add_B0_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_vector_add_B0_merge_reg_aunroll_x_wireValid <= vector_add_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0(STALLENABLE,252)
    -- Valid signal propagation
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V0 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V1 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V2 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V3 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V4 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V5 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5;
    -- Stall signal propagation
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_1 <= SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_2 <= SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_3 <= i_syncbuf_a_sync_buffer_vector_add_out_stall_out and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_4 <= i_syncbuf_b_sync_buffer_vector_add_out_stall_out and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_5 <= i_syncbuf_c_sync_buffer_vector_add_out_stall_out and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5;
    -- Backward Enable generation
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or0 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or1 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_1 or SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or0;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or2 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_2 or SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or1;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or3 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_3 or SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or2;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or4 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_4 or SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or3;
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN <= not (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_5 or SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_or4);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN and SE_out_vector_add_B0_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backStall <= not (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0);
    SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
            SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2 <= (others => '0');
            SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3 <= (others => '0');
            SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4 <= (others => '0');
            SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0 and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1 and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2 and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_2;
            ELSE
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_2 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3 and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_3;
            ELSE
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_3 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4 and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_4;
            ELSE
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_4 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5 and SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_s_tv_5;
            ELSE
                SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_R_v_5 <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_b_sync_buffer_vector_add(BLACKBOX,76)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_b_sync_buffer_vector_add : i_syncbuf_b_sync_buffer_vector_add5
    PORT MAP (
        in_buffer_in => in_b,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall,
        in_valid_in => SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V4,
        out_buffer_out => i_syncbuf_b_sync_buffer_vector_add_out_buffer_out,
        out_stall_out => i_syncbuf_b_sync_buffer_vector_add_out_stall_out,
        out_valid_out => i_syncbuf_b_sync_buffer_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_b_sync_buffer_vector_add(STALLENABLE,216)
    -- Valid signal propagation
    SE_out_i_syncbuf_b_sync_buffer_vector_add_V0 <= SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall <= i_load_unnamed_vector_add1_vector_add_out_o_stall or not (SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_b_sync_buffer_vector_add_and0 <= i_syncbuf_b_sync_buffer_vector_add_out_valid_out;
    SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid <= SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_V2 and SE_out_i_syncbuf_b_sync_buffer_vector_add_and0;

    -- bubble_join_i_load_unnamed_vector_add0_vector_add(BITJOIN,171)
    bubble_join_i_load_unnamed_vector_add0_vector_add_q <= i_load_unnamed_vector_add0_vector_add_out_o_readdata;

    -- bubble_select_i_load_unnamed_vector_add0_vector_add(BITSELECT,172)
    bubble_select_i_load_unnamed_vector_add0_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_vector_add0_vector_add_q(31 downto 0));

    -- bubble_join_i_load_unnamed_vector_add1_vector_add(BITJOIN,174)
    bubble_join_i_load_unnamed_vector_add1_vector_add_q <= i_load_unnamed_vector_add1_vector_add_out_o_readdata;

    -- bubble_select_i_load_unnamed_vector_add1_vector_add(BITSELECT,175)
    bubble_select_i_load_unnamed_vector_add1_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_vector_add1_vector_add_q(31 downto 0));

    -- i_add_vector_add(ADD,69)@4
    i_add_vector_add_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_load_unnamed_vector_add1_vector_add_b);
    i_add_vector_add_b <= STD_LOGIC_VECTOR("0" & bubble_select_i_load_unnamed_vector_add0_vector_add_b);
    i_add_vector_add_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_vector_add_a) + UNSIGNED(i_add_vector_add_b));
    i_add_vector_add_q <= i_add_vector_add_o(32 downto 0);

    -- bgTrunc_i_add_vector_add_sel_x(BITSELECT,2)@4
    bgTrunc_i_add_vector_add_sel_x_b <= i_add_vector_add_q(31 downto 0);

    -- SE_out_i_store_unnamed_vector_add2_vector_add(STALLENABLE,212)
    -- Valid signal propagation
    SE_out_i_store_unnamed_vector_add2_vector_add_V0 <= SE_out_i_store_unnamed_vector_add2_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_vector_add2_vector_add_backStall <= in_stall_in or not (SE_out_i_store_unnamed_vector_add2_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_vector_add2_vector_add_wireValid <= i_store_unnamed_vector_add2_vector_add_out_o_valid;

    -- redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1(REG,162)
    redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_backEN = "1") THEN
                redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_unnamed_vector_add2_vector_add(BLACKBOX,74)@4
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_vector_add2_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@5
    -- out out_unnamed_vector_add2_avm_address@20000000
    -- out out_unnamed_vector_add2_avm_burstcount@20000000
    -- out out_unnamed_vector_add2_avm_byteenable@20000000
    -- out out_unnamed_vector_add2_avm_enable@20000000
    -- out out_unnamed_vector_add2_avm_read@20000000
    -- out out_unnamed_vector_add2_avm_write@20000000
    -- out out_unnamed_vector_add2_avm_writedata@20000000
    thei_store_unnamed_vector_add2_vector_add : i_store_unnamed_vector_add2_vector_add13
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_q,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_unnamed_vector_add2_vector_add_backStall,
        in_i_valid => SE_out_i_load_unnamed_vector_add1_vector_add_V0,
        in_i_writedata => bgTrunc_i_add_vector_add_sel_x_b,
        in_lsu_unnamed_vector_add2_streset_stream_reset => in_lsu_unnamed_vector_add2_streset_stream_reset,
        in_lsu_unnamed_vector_add2_sts_stream_size => in_lsu_unnamed_vector_add2_sts_stream_size,
        in_stream_base_addr => redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_q,
        in_unnamed_vector_add2_avm_readdata => in_unnamed_vector_add2_avm_readdata,
        in_unnamed_vector_add2_avm_readdatavalid => in_unnamed_vector_add2_avm_readdatavalid,
        in_unnamed_vector_add2_avm_waitrequest => in_unnamed_vector_add2_avm_waitrequest,
        in_unnamed_vector_add2_avm_writeack => in_unnamed_vector_add2_avm_writeack,
        out_lsu_unnamed_vector_add2_o_active => i_store_unnamed_vector_add2_vector_add_out_lsu_unnamed_vector_add2_o_active,
        out_o_stall => i_store_unnamed_vector_add2_vector_add_out_o_stall,
        out_o_valid => i_store_unnamed_vector_add2_vector_add_out_o_valid,
        out_unnamed_vector_add2_avm_address => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_address,
        out_unnamed_vector_add2_avm_burstcount => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_burstcount,
        out_unnamed_vector_add2_avm_byteenable => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_byteenable,
        out_unnamed_vector_add2_avm_enable => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_enable,
        out_unnamed_vector_add2_avm_read => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_read,
        out_unnamed_vector_add2_avm_write => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_write,
        out_unnamed_vector_add2_avm_writedata => i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_unnamed_vector_add1_vector_add(STALLENABLE,210)
    -- Valid signal propagation
    SE_out_i_load_unnamed_vector_add1_vector_add_V0 <= SE_out_i_load_unnamed_vector_add1_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_load_unnamed_vector_add1_vector_add_backStall <= i_store_unnamed_vector_add2_vector_add_out_o_stall or not (SE_out_i_load_unnamed_vector_add1_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_vector_add1_vector_add_and0 <= i_load_unnamed_vector_add1_vector_add_out_o_valid;
    SE_out_i_load_unnamed_vector_add1_vector_add_and1 <= i_load_unnamed_vector_add0_vector_add_out_o_valid and SE_out_i_load_unnamed_vector_add1_vector_add_and0;
    SE_out_i_load_unnamed_vector_add1_vector_add_wireValid <= SE_redist2_i_arrayidx4_vector_add_vector_add12_dupName_0_trunc_sel_x_b_2_1_V0 and SE_out_i_load_unnamed_vector_add1_vector_add_and1;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0(BITSHIFT,143)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0_q <= i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_align_15(BITSHIFT,101)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx2_vector_add_vector_add7_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx2_vector_add_vector_add7_mult_x_align_15_q <= i_arrayidx2_vector_add_vector_add7_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0(BITSHIFT,144)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0_q <= i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_align_14(BITSHIFT,100)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx2_vector_add_vector_add7_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx2_vector_add_vector_add7_mult_x_align_14_q <= i_arrayidx2_vector_add_vector_add7_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_join_16(BITJOIN,102)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_join_16_q <= i_arrayidx2_vector_add_vector_add7_mult_x_align_15_q & i_arrayidx2_vector_add_vector_add7_mult_x_align_14_q;

    -- i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0(BITSHIFT,145)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0_q <= i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_align_12(BITSHIFT,98)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx2_vector_add_vector_add7_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx2_vector_add_vector_add7_mult_x_align_12_q <= i_arrayidx2_vector_add_vector_add7_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0(BITSHIFT,142)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0_qint <= i_arrayidx2_vector_add_vector_add7_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0_q <= i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_join_13(BITJOIN,99)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_join_13_q <= i_arrayidx2_vector_add_vector_add7_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx2_vector_add_vector_add7_mult_x_im0_shift0_q);

    -- i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0(ADD,103)@1
    i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx2_vector_add_vector_add7_mult_x_join_13_q);
    i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx2_vector_add_vector_add7_mult_x_join_16_q);
    i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_b));
    i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_q <= i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_mult_extender_x(BITJOIN,34)@1
    i_arrayidx2_vector_add_vector_add7_mult_extender_x_q <= i_arrayidx2_vector_add_vector_add7_mult_multconst_x_q & i_arrayidx2_vector_add_vector_add7_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_trunc_sel_x(BITSELECT,36)@1
    i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b <= i_arrayidx2_vector_add_vector_add7_mult_extender_x_q(63 downto 0);

    -- redist3_i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b_1_0(REG,163)
    redist3_i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_vector_add_vector_add2_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist3_i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_b_sync_buffer_vector_add(BITJOIN,181)
    bubble_join_i_syncbuf_b_sync_buffer_vector_add_q <= i_syncbuf_b_sync_buffer_vector_add_out_buffer_out;

    -- bubble_select_i_syncbuf_b_sync_buffer_vector_add(BITSELECT,182)
    bubble_select_i_syncbuf_b_sync_buffer_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_b_sync_buffer_vector_add_q(63 downto 0));

    -- i_arrayidx2_vector_add_vector_add7_add_x(ADD,37)@2
    i_arrayidx2_vector_add_vector_add7_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_b_sync_buffer_vector_add_b);
    i_arrayidx2_vector_add_vector_add7_add_x_b <= STD_LOGIC_VECTOR("0" & redist3_i_arrayidx2_vector_add_vector_add7_trunc_sel_x_b_1_0_q);
    i_arrayidx2_vector_add_vector_add7_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx2_vector_add_vector_add7_add_x_a) + UNSIGNED(i_arrayidx2_vector_add_vector_add7_add_x_b));
    i_arrayidx2_vector_add_vector_add7_add_x_q <= i_arrayidx2_vector_add_vector_add7_add_x_o(64 downto 0);

    -- i_arrayidx2_vector_add_vector_add7_dupName_0_trunc_sel_x(BITSELECT,31)@2
    i_arrayidx2_vector_add_vector_add7_dupName_0_trunc_sel_x_b <= i_arrayidx2_vector_add_vector_add7_add_x_q(63 downto 0);

    -- i_load_unnamed_vector_add1_vector_add(BLACKBOX,73)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata@4
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_unnamed_vector_add1_avm_address@20000000
    -- out out_unnamed_vector_add1_avm_burstcount@20000000
    -- out out_unnamed_vector_add1_avm_byteenable@20000000
    -- out out_unnamed_vector_add1_avm_enable@20000000
    -- out out_unnamed_vector_add1_avm_read@20000000
    -- out out_unnamed_vector_add1_avm_write@20000000
    -- out out_unnamed_vector_add1_avm_writedata@20000000
    thei_load_unnamed_vector_add1_vector_add : i_load_unnamed_vector_add1_vector_add8
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx2_vector_add_vector_add7_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_vector_add1_vector_add_backStall,
        in_i_valid => SE_out_i_syncbuf_b_sync_buffer_vector_add_V0,
        in_lsu_unnamed_vector_add1_streset_stream_reset => in_lsu_unnamed_vector_add1_streset_stream_reset,
        in_lsu_unnamed_vector_add1_sts_stream_size => in_lsu_unnamed_vector_add1_sts_stream_size,
        in_stream_base_addr => i_arrayidx2_vector_add_vector_add7_dupName_0_trunc_sel_x_b,
        in_unnamed_vector_add1_avm_readdata => in_unnamed_vector_add1_avm_readdata,
        in_unnamed_vector_add1_avm_readdatavalid => in_unnamed_vector_add1_avm_readdatavalid,
        in_unnamed_vector_add1_avm_waitrequest => in_unnamed_vector_add1_avm_waitrequest,
        in_unnamed_vector_add1_avm_writeack => in_unnamed_vector_add1_avm_writeack,
        out_o_readdata => i_load_unnamed_vector_add1_vector_add_out_o_readdata,
        out_o_stall => i_load_unnamed_vector_add1_vector_add_out_o_stall,
        out_o_valid => i_load_unnamed_vector_add1_vector_add_out_o_valid,
        out_unnamed_vector_add1_avm_address => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_address,
        out_unnamed_vector_add1_avm_burstcount => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_burstcount,
        out_unnamed_vector_add1_avm_byteenable => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_byteenable,
        out_unnamed_vector_add1_avm_enable => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_enable,
        out_unnamed_vector_add1_avm_read => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_read,
        out_unnamed_vector_add1_avm_write => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_write,
        out_unnamed_vector_add1_avm_writedata => i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_unnamed_vector_add1_avm_address <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_address;
    out_unnamed_vector_add1_avm_enable <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_enable;
    out_unnamed_vector_add1_avm_read <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_read;
    out_unnamed_vector_add1_avm_write <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_write;
    out_unnamed_vector_add1_avm_writedata <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_writedata;
    out_unnamed_vector_add1_avm_byteenable <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_byteenable;
    out_unnamed_vector_add1_avm_burstcount <= i_load_unnamed_vector_add1_vector_add_out_unnamed_vector_add1_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,9)@5
    out_valid_out <= SE_out_i_store_unnamed_vector_add2_vector_add_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,11)
    out_unnamed_vector_add2_avm_address <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_address;
    out_unnamed_vector_add2_avm_enable <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_enable;
    out_unnamed_vector_add2_avm_read <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_read;
    out_unnamed_vector_add2_avm_write <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_write;
    out_unnamed_vector_add2_avm_writedata <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_writedata;
    out_unnamed_vector_add2_avm_byteenable <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_byteenable;
    out_unnamed_vector_add2_avm_burstcount <= i_store_unnamed_vector_add2_vector_add_out_unnamed_vector_add2_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,16)
    out_lsu_unnamed_vector_add2_o_active <= i_store_unnamed_vector_add2_vector_add_out_lsu_unnamed_vector_add2_o_active;

    -- ext_sig_sync_out(GPOUT,68)
    out_unnamed_vector_add0_avm_address <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_address;
    out_unnamed_vector_add0_avm_enable <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_enable;
    out_unnamed_vector_add0_avm_read <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_read;
    out_unnamed_vector_add0_avm_write <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_write;
    out_unnamed_vector_add0_avm_writedata <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_writedata;
    out_unnamed_vector_add0_avm_byteenable <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_byteenable;
    out_unnamed_vector_add0_avm_burstcount <= i_load_unnamed_vector_add0_vector_add_out_unnamed_vector_add0_avm_burstcount;

    -- sync_out(GPOUT,85)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
