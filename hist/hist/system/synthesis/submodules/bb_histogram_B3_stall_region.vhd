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

-- VHDL created from bb_histogram_B3_stall_region
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

entity bb_histogram_B3_stall_region is
    port (
        in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_acl_hw_wg_id27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_012 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i9_014 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext10 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_017 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_012 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext10 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_017 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_numData : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_data : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B3_stall_region;

architecture normal of bb_histogram_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component histogram_B3_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_histogram3_histogram18 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_histogram3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_histogram3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_data_sync_buffer_histogram12 is
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


    component i_syncbuf_global_size_0_sync_buffer_histogram23 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_numdata_sync_buffer1_histogram25 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_numdata_sync_buffer_histogram15 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_unknown_call1819_histogram21 is
        port (
            in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
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










    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;




    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add22_histogram_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B3_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx15_histogram_histogram14_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx15_histogram_histogram14_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx15_histogram_histogram14_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx15_histogram_histogram14_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx15_histogram_histogram14_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx15_histogram_histogram14_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx17_histogram_histogram20_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom14_histogram_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom16_histogram_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add22_histogram_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add22_histogram_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add22_histogram_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add22_histogram_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_arrayidx17_histogram_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_arrayidx17_histogram_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx17_histogram_vt_select_63_b : STD_LOGIC_VECTOR (61 downto 0);
    signal i_cmp1113_phi_decision21_xor_rm_histogram_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1113_rm_histogram_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1113_rm_histogram_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1113_rm_histogram_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1113_rm_histogram_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp11_histogram_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp11_histogram_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp11_histogram_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp11_histogram_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_data_sync_buffer_histogram_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_data_sync_buffer_histogram_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_data_sync_buffer_histogram_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_global_size_0_sync_buffer_histogram_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_global_size_0_sync_buffer_histogram_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_global_size_0_sync_buffer_histogram_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_numdata_sync_buffer1_histogram_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_numdata_sync_buffer1_histogram_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_numdata_sync_buffer1_histogram_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_numdata_sync_buffer_histogram_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_numdata_sync_buffer_histogram_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_numdata_sync_buffer_histogram_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram_out_call1819_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unknown_call1819_histogram_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_histogram28_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp1113_rm_histogram_c_125_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_histogram_B3_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B3_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_histogram3_histogram_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_histogram3_histogram_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_data_sync_buffer_histogram_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_data_sync_buffer_histogram_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_global_size_0_sync_buffer_histogram_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_global_size_0_sync_buffer_histogram_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_numdata_sync_buffer1_histogram_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_numdata_sync_buffer1_histogram_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_numdata_sync_buffer_histogram_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_numdata_sync_buffer_histogram_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_cmp1113_rm_histogram_c_125_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_cmp1113_rm_histogram_c_125_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B3_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp11_histogram_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp11_histogram_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp11_histogram_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp11_histogram_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp11_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp11_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_data_sync_buffer_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_data_sync_buffer_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_data_sync_buffer_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer1_histogram_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_numdata_sync_buffer_histogram_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp11_histogram_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp11_histogram_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp11_histogram_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp11_histogram_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp11_histogram_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp11_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp11_histogram_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp11_histogram_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp11_histogram_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_i_syncbuf_data_sync_buffer_histogram_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- c_i32_1gr(CONSTANT,50)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0(REG,154)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_q <= STD_LOGIC_VECTOR(SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1(REG,155)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_q <= STD_LOGIC_VECTOR(redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2(REG,156)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_q <= STD_LOGIC_VECTOR(SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3(REG,157)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_q <= STD_LOGIC_VECTOR(redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4(REG,158)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_q <= STD_LOGIC_VECTOR(SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5(REG,159)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_q <= STD_LOGIC_VECTOR(redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6(STALLENABLE,296)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_s_tv_0 <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backEN and SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_V;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backEN);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6(STALLREG,402)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid <= (others => '0');
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backStall and (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid or SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_i_valid);

            IF (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_data0 <= STD_LOGIC_VECTOR(redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_i_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_V0;
    -- Stall signal propagation
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backStall <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid or not (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_i_valid);

    -- Valid
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_V <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid = "1" ELSE SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_i_valid;

    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_D0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_data0 WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_r_valid = "1" ELSE redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_q;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5(STALLENABLE,295)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_s_tv_0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backEN and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_V0;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_v_s_0);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4(STALLENABLE,294)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_s_tv_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_5_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backEN and SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_V;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backEN);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4(STALLREG,401)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid <= (others => '0');
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backStall and (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid or SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_i_valid);

            IF (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_data0 <= STD_LOGIC_VECTOR(redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_i_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_V0;
    -- Stall signal propagation
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backStall <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid or not (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_i_valid);

    -- Valid
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_V <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid = "1" ELSE SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_i_valid;

    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_D0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_data0 WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_r_valid = "1" ELSE redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_q;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3(STALLENABLE,293)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_s_tv_0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_4_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backEN and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_V0;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_v_s_0);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2(STALLENABLE,292)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_s_tv_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_3_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backEN and SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_V;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backEN);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2(STALLREG,400)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid <= (others => '0');
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backStall and (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid or SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_i_valid);

            IF (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_data0 <= STD_LOGIC_VECTOR(redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_i_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_V0;
    -- Stall signal propagation
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backStall <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid or not (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_i_valid);

    -- Valid
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_V <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid = "1" ELSE SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_i_valid;

    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_D0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_data0 WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_r_valid = "1" ELSE redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_q;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1(STALLENABLE,291)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_s_tv_0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_2_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backEN and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_V0;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_v_s_0);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0(STALLENABLE,290)
    -- Valid signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_V0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0;
    -- Stall signal propagation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_s_tv_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_1_backStall and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0;
    -- Backward Enable generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backEN <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_v_s_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backEN and SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_V;
    -- Backward Stall generation
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backStall <= not (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backEN);
    SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backEN = "0") THEN
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0 and SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_s_tv_0;
            ELSE
                SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_R_v_0 <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0(STALLREG,399)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid <= (others => '0');
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backStall and (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid or SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_i_valid);

            IF (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_i_valid <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backStall <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid or not (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_i_valid);

    -- Valid
    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_V <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid = "1" ELSE SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_i_valid;

    SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_D0 <= SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_data0 WHEN SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_r_valid = "1" ELSE bubble_select_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_b;

    -- SE_stall_entry(STALLENABLE,255)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= histogram_B3_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,194)
    bubble_join_stall_entry_q <= in_local_linear_id21 & in_local_id_017 & in_l_grpid_0_addr_zext10 & in_l_grpid_04 & in_i9_014 & in_global_id_012 & in_acl_hw_wg_id27;

    -- bubble_select_stall_entry(BITSELECT,195)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 192));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 224));

    -- histogram_B3_merge_reg_aunroll_x(BLACKBOX,23)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thehistogram_B3_merge_reg_aunroll_x : histogram_B3_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_d,
        in_data_in_1 => bubble_select_stall_entry_e,
        in_data_in_2 => bubble_select_stall_entry_f,
        in_data_in_3 => bubble_select_stall_entry_c,
        in_data_in_4 => bubble_select_stall_entry_g,
        in_data_in_5 => bubble_select_stall_entry_h,
        in_data_in_6 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_histogram_B3_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => histogram_B3_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => histogram_B3_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => histogram_B3_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => histogram_B3_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => histogram_B3_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => histogram_B3_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => histogram_B3_merge_reg_aunroll_x_out_data_out_6,
        out_stall_out => histogram_B3_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => histogram_B3_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_histogram_B3_merge_reg_aunroll_x(BITJOIN,169)
    bubble_join_histogram_B3_merge_reg_aunroll_x_q <= histogram_B3_merge_reg_aunroll_x_out_data_out_6 & histogram_B3_merge_reg_aunroll_x_out_data_out_5 & histogram_B3_merge_reg_aunroll_x_out_data_out_4 & histogram_B3_merge_reg_aunroll_x_out_data_out_3 & histogram_B3_merge_reg_aunroll_x_out_data_out_2 & histogram_B3_merge_reg_aunroll_x_out_data_out_1 & histogram_B3_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_histogram_B3_merge_reg_aunroll_x(BITSELECT,170)
    bubble_select_histogram_B3_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_histogram_B3_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_histogram_B3_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_histogram_B3_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(159 downto 128));
    bubble_select_histogram_B3_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(191 downto 160));
    bubble_select_histogram_B3_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(223 downto 192));
    bubble_select_histogram_B3_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_histogram_B3_merge_reg_aunroll_x_q(255 downto 224));

    -- i_arrayidx15_histogram_histogram14_mult_multconst_x(CONSTANT,28)
    i_arrayidx15_histogram_histogram14_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_idxprom14_histogram_sel_x(BITSELECT,44)@1
    i_idxprom14_histogram_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_histogram_B3_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select(BITSELECT,132)@1
    i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_b <= i_idxprom14_histogram_sel_x_b(17 downto 0);
    i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_c <= i_idxprom14_histogram_sel_x_b(63 downto 54);
    i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_d <= i_idxprom14_histogram_sel_x_b(35 downto 18);
    i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_e <= i_idxprom14_histogram_sel_x_b(53 downto 36);

    -- i_arrayidx15_histogram_histogram14_mult_x_im3_shift0(BITSHIFT,125)@1
    i_arrayidx15_histogram_histogram14_mult_x_im3_shift0_qint <= i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx15_histogram_histogram14_mult_x_im3_shift0_q <= i_arrayidx15_histogram_histogram14_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_align_15(BITSHIFT,100)@1
    i_arrayidx15_histogram_histogram14_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx15_histogram_histogram14_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx15_histogram_histogram14_mult_x_align_15_q <= i_arrayidx15_histogram_histogram14_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_im6_shift0(BITSHIFT,126)@1
    i_arrayidx15_histogram_histogram14_mult_x_im6_shift0_qint <= i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx15_histogram_histogram14_mult_x_im6_shift0_q <= i_arrayidx15_histogram_histogram14_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_align_14(BITSHIFT,99)@1
    i_arrayidx15_histogram_histogram14_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx15_histogram_histogram14_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx15_histogram_histogram14_mult_x_align_14_q <= i_arrayidx15_histogram_histogram14_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_join_16(BITJOIN,101)@1
    i_arrayidx15_histogram_histogram14_mult_x_join_16_q <= i_arrayidx15_histogram_histogram14_mult_x_align_15_q & i_arrayidx15_histogram_histogram14_mult_x_align_14_q;

    -- i_arrayidx15_histogram_histogram14_mult_x_im9_shift0(BITSHIFT,127)@1
    i_arrayidx15_histogram_histogram14_mult_x_im9_shift0_qint <= i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx15_histogram_histogram14_mult_x_im9_shift0_q <= i_arrayidx15_histogram_histogram14_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_align_12(BITSHIFT,97)@1
    i_arrayidx15_histogram_histogram14_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx15_histogram_histogram14_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx15_histogram_histogram14_mult_x_align_12_q <= i_arrayidx15_histogram_histogram14_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_im0_shift0(BITSHIFT,124)@1
    i_arrayidx15_histogram_histogram14_mult_x_im0_shift0_qint <= i_arrayidx15_histogram_histogram14_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx15_histogram_histogram14_mult_x_im0_shift0_q <= i_arrayidx15_histogram_histogram14_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_x_join_13(BITJOIN,98)@1
    i_arrayidx15_histogram_histogram14_mult_x_join_13_q <= i_arrayidx15_histogram_histogram14_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx15_histogram_histogram14_mult_x_im0_shift0_q);

    -- i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0(ADD,102)@1
    i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx15_histogram_histogram14_mult_x_join_13_q);
    i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx15_histogram_histogram14_mult_x_join_16_q);
    i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_b));
    i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_q <= i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx15_histogram_histogram14_mult_extender_x(BITJOIN,27)@1
    i_arrayidx15_histogram_histogram14_mult_extender_x_q <= i_arrayidx15_histogram_histogram14_mult_multconst_x_q & i_arrayidx15_histogram_histogram14_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx15_histogram_histogram14_trunc_sel_x(BITSELECT,29)@1
    i_arrayidx15_histogram_histogram14_trunc_sel_x_b <= i_arrayidx15_histogram_histogram14_mult_extender_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_numdata_sync_buffer_histogram(BLACKBOX,70)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_numdata_sync_buffer_histogram : i_syncbuf_numdata_sync_buffer_histogram15
    PORT MAP (
        in_buffer_in => in_numData,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_numdata_sync_buffer_histogram_backStall,
        in_valid_in => SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V4,
        out_buffer_out => i_syncbuf_numdata_sync_buffer_histogram_out_buffer_out,
        out_stall_out => i_syncbuf_numdata_sync_buffer_histogram_out_stall_out,
        out_valid_out => i_syncbuf_numdata_sync_buffer_histogram_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_data_sync_buffer_histogram(BLACKBOX,67)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_data_sync_buffer_histogram : i_syncbuf_data_sync_buffer_histogram12
    PORT MAP (
        in_buffer_in => in_data,
        in_i_dependence => GND_q,
        in_stall_in => SR_SE_out_i_syncbuf_data_sync_buffer_histogram_backStall,
        in_valid_in => SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V3,
        out_buffer_out => i_syncbuf_data_sync_buffer_histogram_out_buffer_out,
        out_stall_out => i_syncbuf_data_sync_buffer_histogram_out_stall_out,
        out_valid_out => i_syncbuf_data_sync_buffer_histogram_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0(REG,161)
    redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo(STALLFIFO,162)
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_in <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V2;
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_data_in <= redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q;
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_in_bitsignaltemp <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_in(0);
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_in_bitsignaltemp <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_in(0);
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_out(0) <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_out_bitsignaltemp;
    redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_out(0) <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_out_bitsignaltemp;
    theredist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 126,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_in_bitsignaltemp,
        data_in => redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q,
        valid_out => redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_out_bitsignaltemp,
        data_out => redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_numdata_sync_buffer_histogram(BITJOIN,190)
    bubble_join_i_syncbuf_numdata_sync_buffer_histogram_q <= i_syncbuf_numdata_sync_buffer_histogram_out_buffer_out;

    -- bubble_select_i_syncbuf_numdata_sync_buffer_histogram(BITSELECT,191)
    bubble_select_i_syncbuf_numdata_sync_buffer_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_numdata_sync_buffer_histogram_q(31 downto 0));

    -- i_cmp1113_rm_histogram(COMPARE,60)@2
    i_cmp1113_rm_histogram_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q(31)) & redist7_histogram_B3_merge_reg_aunroll_x_out_data_out_3_1_0_q));
    i_cmp1113_rm_histogram_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_numdata_sync_buffer_histogram_b(31)) & bubble_select_i_syncbuf_numdata_sync_buffer_histogram_b));
    i_cmp1113_rm_histogram_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp1113_rm_histogram_a) - SIGNED(i_cmp1113_rm_histogram_b));
    i_cmp1113_rm_histogram_c(0) <= i_cmp1113_rm_histogram_o(33);

    -- redist0_i_cmp1113_rm_histogram_c_125_fifo(STALLFIFO,148)
    redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_in <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_V1;
    redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    redist0_i_cmp1113_rm_histogram_c_125_fifo_data_in <= i_cmp1113_rm_histogram_c;
    redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_in_bitsignaltemp <= redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_in(0);
    redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_in_bitsignaltemp <= redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_in(0);
    redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_out(0) <= redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_out_bitsignaltemp;
    redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_out(0) <= redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_out_bitsignaltemp;
    theredist0_i_cmp1113_rm_histogram_c_125_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 126,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp1113_rm_histogram_c,
        valid_out => redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_cmp1113_rm_histogram_c_125_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_numdata_sync_buffer_histogram(STALLENABLE,251)
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg1 <= (others => '0');
            SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg0 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg1 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg1;
            -- Succesor 2
            SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg2 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed0 <= (not (SR_SE_out_i_syncbuf_data_sync_buffer_histogram_backStall) and SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid) or SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg0;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed1 <= (not (redist0_i_cmp1113_rm_histogram_c_125_fifo_stall_out) and SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid) or SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg1;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed2 <= (not (redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_out) and SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid) or SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg2;
    -- Consuming
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_StallValid <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_backStall and SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg0 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_StallValid and SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed0;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg1 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_StallValid and SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed1;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_toReg2 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_StallValid and SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed2;
    -- Backward Stall generation
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_or0 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed0;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_or1 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed1 and SE_out_i_syncbuf_numdata_sync_buffer_histogram_or0;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireStall <= not (SE_out_i_syncbuf_numdata_sync_buffer_histogram_consumed2 and SE_out_i_syncbuf_numdata_sync_buffer_histogram_or1);
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_backStall <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_V0 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid and not (SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg0);
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_V1 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid and not (SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg1);
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_V2 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid and not (SE_out_i_syncbuf_numdata_sync_buffer_histogram_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_and0 <= i_syncbuf_numdata_sync_buffer_histogram_out_valid_out;
    SE_out_i_syncbuf_numdata_sync_buffer_histogram_wireValid <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V1 and SE_out_i_syncbuf_numdata_sync_buffer_histogram_and0;

    -- i_cmp1113_phi_decision21_xor_rm_histogram(LOGICAL,59)@2
    i_cmp1113_phi_decision21_xor_rm_histogram_q <= i_cmp1113_rm_histogram_c xor VCC_q;

    -- redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0(REG,150)
    redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_data_sync_buffer_histogram(BITJOIN,179)
    bubble_join_i_syncbuf_data_sync_buffer_histogram_q <= i_syncbuf_data_sync_buffer_histogram_out_buffer_out;

    -- bubble_select_i_syncbuf_data_sync_buffer_histogram(BITSELECT,180)
    bubble_select_i_syncbuf_data_sync_buffer_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_data_sync_buffer_histogram_q(63 downto 0));

    -- i_arrayidx15_histogram_histogram14_add_x(ADD,30)@2
    i_arrayidx15_histogram_histogram14_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_data_sync_buffer_histogram_b);
    i_arrayidx15_histogram_histogram14_add_x_b <= STD_LOGIC_VECTOR("0" & redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_q);
    i_arrayidx15_histogram_histogram14_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx15_histogram_histogram14_add_x_a) + UNSIGNED(i_arrayidx15_histogram_histogram14_add_x_b));
    i_arrayidx15_histogram_histogram14_add_x_q <= i_arrayidx15_histogram_histogram14_add_x_o(64 downto 0);

    -- i_arrayidx15_histogram_histogram14_dupName_0_trunc_sel_x(BITSELECT,24)@2
    i_arrayidx15_histogram_histogram14_dupName_0_trunc_sel_x_b <= i_arrayidx15_histogram_histogram14_add_x_q(63 downto 0);

    -- SE_out_i_syncbuf_data_sync_buffer_histogram(STALLENABLE,245)
    -- Valid signal propagation
    SE_out_i_syncbuf_data_sync_buffer_histogram_V0 <= SE_out_i_syncbuf_data_sync_buffer_histogram_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_data_sync_buffer_histogram_backStall <= i_load_unnamed_histogram3_histogram_out_o_stall or not (SE_out_i_syncbuf_data_sync_buffer_histogram_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_data_sync_buffer_histogram_wireValid <= SR_SE_out_i_syncbuf_data_sync_buffer_histogram_V;

    -- SR_SE_out_i_syncbuf_data_sync_buffer_histogram(STALLREG,398)
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid <= (others => '0');
            SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data0 <= (others => '-');
            SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid <= SE_out_i_syncbuf_data_sync_buffer_histogram_backStall and (SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid or SR_SE_out_i_syncbuf_data_sync_buffer_histogram_i_valid);

            IF (SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data0 <= i_arrayidx15_histogram_histogram14_dupName_0_trunc_sel_x_b;
                SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data1 <= i_cmp1113_phi_decision21_xor_rm_histogram_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_and0 <= i_syncbuf_data_sync_buffer_histogram_out_valid_out;
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_and1 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V0 and SR_SE_out_i_syncbuf_data_sync_buffer_histogram_and0;
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_i_valid <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_V0 and SR_SE_out_i_syncbuf_data_sync_buffer_histogram_and1;
    -- Stall signal propagation
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_backStall <= SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid or not (SR_SE_out_i_syncbuf_data_sync_buffer_histogram_i_valid);

    -- Valid
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_V <= SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid WHEN SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid = "1" ELSE SR_SE_out_i_syncbuf_data_sync_buffer_histogram_i_valid;

    -- Data0
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_D0 <= SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data0 WHEN SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid = "1" ELSE i_arrayidx15_histogram_histogram14_dupName_0_trunc_sel_x_b;
    -- Data1
    SR_SE_out_i_syncbuf_data_sync_buffer_histogram_D1 <= SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_data1 WHEN SR_SE_out_i_syncbuf_data_sync_buffer_histogram_r_valid = "1" ELSE i_cmp1113_phi_decision21_xor_rm_histogram_q;

    -- SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0(STALLENABLE,283)
    -- Valid signal propagation
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V0 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V1 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V2 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V3 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V4 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4;
    -- Stall signal propagation
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_0 <= SR_SE_out_i_syncbuf_data_sync_buffer_histogram_backStall and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_1 <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_backStall and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_2 <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_stall_out and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_3 <= i_syncbuf_data_sync_buffer_histogram_out_stall_out and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_4 <= i_syncbuf_numdata_sync_buffer_histogram_out_stall_out and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4;
    -- Backward Enable generation
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or0 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or1 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_1 or SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or0;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or2 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_2 or SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or1;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or3 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_3 or SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or2;
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN <= not (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_4 or SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_or3);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN and SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backStall <= not (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN);
    SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
            SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2 <= (others => '0');
            SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3 <= (others => '0');
            SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0 and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_0 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1 and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_1 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2 and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_2;
            ELSE
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_2 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3 and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_3;
            ELSE
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_3 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4 and SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_s_tv_4;
            ELSE
                SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_R_v_4 <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0(STALLREG,395)
    SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
            SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid <= SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backStall and (SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid or SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx15_histogram_histogram14_trunc_sel_x_b);
                SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data1 <= STD_LOGIC_VECTOR(bubble_select_histogram_B3_merge_reg_aunroll_x_e);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_i_valid <= SE_out_histogram_B3_merge_reg_aunroll_x_V8;
    -- Stall signal propagation
    SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backStall <= SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_V <= SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_i_valid;

    -- Data0
    SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_D0 <= SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx15_histogram_histogram14_trunc_sel_x_b;
    -- Data1
    SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_D1 <= SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_data1 WHEN SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_r_valid = "1" ELSE bubble_select_histogram_B3_merge_reg_aunroll_x_e;

    -- redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo(STALLFIFO,165)
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V7;
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_data_in <= bubble_select_histogram_B3_merge_reg_aunroll_x_h;
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_in_bitsignaltemp <= redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_in(0);
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_in_bitsignaltemp <= redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_in(0);
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_out(0) <= redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_out_bitsignaltemp;
    redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_out(0) <= redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_out_bitsignaltemp;
    theredist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B3_merge_reg_aunroll_x_h,
        valid_out => redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_out_bitsignaltemp,
        data_out => redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo(STALLFIFO,164)
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V6;
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_data_in <= bubble_select_histogram_B3_merge_reg_aunroll_x_g;
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_in_bitsignaltemp <= redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_in(0);
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_in_bitsignaltemp <= redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_in(0);
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_out(0) <= redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_out_bitsignaltemp;
    redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_out(0) <= redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_out_bitsignaltemp;
    theredist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B3_merge_reg_aunroll_x_g,
        valid_out => redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_out_bitsignaltemp,
        data_out => redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo(STALLFIFO,163)
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V5;
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_data_in <= bubble_select_histogram_B3_merge_reg_aunroll_x_f;
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_in_bitsignaltemp <= redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_in(0);
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_in_bitsignaltemp <= redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_in(0);
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_out(0) <= redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_out_bitsignaltemp;
    redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_out(0) <= redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_out_bitsignaltemp;
    theredist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B3_merge_reg_aunroll_x_f,
        valid_out => redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_out_bitsignaltemp,
        data_out => redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo(STALLFIFO,152)
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V3;
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_data_in <= bubble_select_histogram_B3_merge_reg_aunroll_x_c;
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_in_bitsignaltemp <= redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_in(0);
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_in_bitsignaltemp <= redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_in(0);
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_out(0) <= redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_out_bitsignaltemp;
    redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_out(0) <= redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_out_bitsignaltemp;
    theredist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B3_merge_reg_aunroll_x_c,
        valid_out => redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_out_bitsignaltemp,
        data_out => redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3(STALLENABLE,317)
    -- Valid signal propagation
    SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_V0 <= SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_backStall <= i_syncbuf_global_size_0_sync_buffer_histogram_out_stall_out or not (SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_wireValid <= bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_out;

    -- i_syncbuf_global_size_0_sync_buffer_histogram(BLACKBOX,68)@125
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_global_size_0_sync_buffer_histogram : i_syncbuf_global_size_0_sync_buffer_histogram23
    PORT MAP (
        in_buffer_in => in_global_size_0,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_backStall,
        in_valid_in => SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_V0,
        out_buffer_out => i_syncbuf_global_size_0_sync_buffer_histogram_out_buffer_out,
        out_stall_out => i_syncbuf_global_size_0_sync_buffer_histogram_out_stall_out,
        out_valid_out => i_syncbuf_global_size_0_sync_buffer_histogram_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_global_size_0_sync_buffer_histogram(BITJOIN,182)
    bubble_join_i_syncbuf_global_size_0_sync_buffer_histogram_q <= i_syncbuf_global_size_0_sync_buffer_histogram_out_buffer_out;

    -- bubble_select_i_syncbuf_global_size_0_sync_buffer_histogram(BITSELECT,183)
    bubble_select_i_syncbuf_global_size_0_sync_buffer_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_global_size_0_sync_buffer_histogram_q(31 downto 0));

    -- bubble_join_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo(BITJOIN,204)
    bubble_join_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_q <= redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_data_out;

    -- bubble_select_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo(BITSELECT,205)
    bubble_select_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_q(31 downto 0));

    -- i_add22_histogram(ADD,55)@125
    i_add22_histogram_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_b);
    i_add22_histogram_b <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_global_size_0_sync_buffer_histogram_b);
    i_add22_histogram_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add22_histogram_a) + UNSIGNED(i_add22_histogram_b));
    i_add22_histogram_q <= i_add22_histogram_o(32 downto 0);

    -- bgTrunc_i_add22_histogram_sel_x(BITSELECT,2)@125
    bgTrunc_i_add22_histogram_sel_x_b <= i_add22_histogram_q(31 downto 0);

    -- SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0(STALLENABLE,307)
    -- Valid signal propagation
    SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_V0 <= SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall and SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backEN <= not (SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_v_s_0 <= SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backEN and SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V1;
    -- Backward Stall generation
    SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backStall <= not (SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_v_s_0);
    SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backEN = "0") THEN
                SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0 <= SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0 and SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_s_tv_0;
            ELSE
                SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_R_v_0 <= SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4(STALLENABLE,319)
    -- Valid signal propagation
    SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_V0 <= SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_backStall <= i_syncbuf_numdata_sync_buffer1_histogram_out_stall_out or not (SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_wireValid <= bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_out;

    -- i_syncbuf_numdata_sync_buffer1_histogram(BLACKBOX,69)@126
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_numdata_sync_buffer1_histogram : i_syncbuf_numdata_sync_buffer1_histogram25
    PORT MAP (
        in_buffer_in => in_numData,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_numdata_sync_buffer1_histogram_backStall,
        in_valid_in => SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_V0,
        out_buffer_out => i_syncbuf_numdata_sync_buffer1_histogram_out_buffer_out,
        out_stall_out => i_syncbuf_numdata_sync_buffer1_histogram_out_stall_out,
        out_valid_out => i_syncbuf_numdata_sync_buffer1_histogram_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_numdata_sync_buffer1_histogram(BITJOIN,186)
    bubble_join_i_syncbuf_numdata_sync_buffer1_histogram_q <= i_syncbuf_numdata_sync_buffer1_histogram_out_buffer_out;

    -- bubble_select_i_syncbuf_numdata_sync_buffer1_histogram(BITSELECT,187)
    bubble_select_i_syncbuf_numdata_sync_buffer1_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_numdata_sync_buffer1_histogram_q(31 downto 0));

    -- redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0(REG,166)
    redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN = "1") THEN
                redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg(STALLENABLE,393)
    -- Valid signal propagation
    bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_V0 <= bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall and bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backEN <= not (bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_v_s_0 <= bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backEN and SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backStall <= not (bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backEN);
    bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0 <= bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0 and bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_R_v_0 <= bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg(STALLREG,394)
    SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid <= bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backStall and (SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid or SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_i_valid <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backStall <= SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_V <= SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_i_valid;


    -- SE_out_i_syncbuf_numdata_sync_buffer1_histogram(STALLENABLE,249)
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg0 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg1 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed0 <= (not (SR_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_backStall) and SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid) or SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg0;
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed1 <= (not (SR_SE_i_cmp11_histogram_backStall) and SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid) or SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_StallValid <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_backStall and SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid;
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_toReg0 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_StallValid and SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed0;
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_toReg1 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_StallValid and SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_or0 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed0;
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireStall <= not (SE_out_i_syncbuf_numdata_sync_buffer1_histogram_consumed1 and SE_out_i_syncbuf_numdata_sync_buffer1_histogram_or0);
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_backStall <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_V0 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid and not (SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg0);
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_V1 <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid and not (SE_out_i_syncbuf_numdata_sync_buffer1_histogram_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_numdata_sync_buffer1_histogram_wireValid <= i_syncbuf_numdata_sync_buffer1_histogram_out_valid_out;

    -- SE_i_cmp11_histogram(STALLENABLE,241)
    -- Valid signal propagation
    SE_i_cmp11_histogram_V0 <= SE_i_cmp11_histogram_R_v_0;
    -- Stall signal propagation
    SE_i_cmp11_histogram_s_tv_0 <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall and SE_i_cmp11_histogram_R_v_0;
    -- Backward Enable generation
    SE_i_cmp11_histogram_backEN <= not (SE_i_cmp11_histogram_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp11_histogram_v_s_0 <= SE_i_cmp11_histogram_backEN and SR_SE_i_cmp11_histogram_V;
    -- Backward Stall generation
    SE_i_cmp11_histogram_backStall <= not (SE_i_cmp11_histogram_backEN);
    SE_i_cmp11_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp11_histogram_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp11_histogram_backEN = "0") THEN
                SE_i_cmp11_histogram_R_v_0 <= SE_i_cmp11_histogram_R_v_0 and SE_i_cmp11_histogram_s_tv_0;
            ELSE
                SE_i_cmp11_histogram_R_v_0 <= SE_i_cmp11_histogram_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_cmp11_histogram(STALLREG,397)
    SR_SE_i_cmp11_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp11_histogram_r_valid <= (others => '0');
            SR_SE_i_cmp11_histogram_r_data0 <= (others => '-');
            SR_SE_i_cmp11_histogram_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp11_histogram_r_valid <= SE_i_cmp11_histogram_backStall and (SR_SE_i_cmp11_histogram_r_valid or SR_SE_i_cmp11_histogram_i_valid);

            IF (SR_SE_i_cmp11_histogram_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp11_histogram_r_data0 <= STD_LOGIC_VECTOR(redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_q);
                SR_SE_i_cmp11_histogram_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_numdata_sync_buffer1_histogram_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp11_histogram_and0 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V0;
    SR_SE_i_cmp11_histogram_i_valid <= SE_out_i_syncbuf_numdata_sync_buffer1_histogram_V1 and SR_SE_i_cmp11_histogram_and0;
    -- Stall signal propagation
    SR_SE_i_cmp11_histogram_backStall <= SR_SE_i_cmp11_histogram_r_valid or not (SR_SE_i_cmp11_histogram_i_valid);

    -- Valid
    SR_SE_i_cmp11_histogram_V <= SR_SE_i_cmp11_histogram_r_valid WHEN SR_SE_i_cmp11_histogram_r_valid = "1" ELSE SR_SE_i_cmp11_histogram_i_valid;

    -- Data0
    SR_SE_i_cmp11_histogram_D0 <= SR_SE_i_cmp11_histogram_r_data0 WHEN SR_SE_i_cmp11_histogram_r_valid = "1" ELSE redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_cmp11_histogram_D1 <= SR_SE_i_cmp11_histogram_r_data1 WHEN SR_SE_i_cmp11_histogram_r_valid = "1" ELSE bubble_select_i_syncbuf_numdata_sync_buffer1_histogram_b;

    -- SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0(STALLENABLE,306)
    -- Valid signal propagation
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V0 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0;
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V1 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_0 <= SR_SE_i_cmp11_histogram_backStall and SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0;
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_1 <= SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backStall and SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_or0 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_0;
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN <= not (SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_1 or SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_v_s_0 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN and SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backStall <= not (SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN);
    SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN = "0") THEN
                SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0 and SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_0 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backEN = "0") THEN
                SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1 and SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_R_v_1 <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0(STALLREG,396)
    SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid <= SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backStall and (SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid or SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_add22_histogram_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_i_valid <= SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backStall <= SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid or not (SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_V <= SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid WHEN SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_i_valid;

    SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_D0 <= SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_data0 WHEN SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_add22_histogram_sel_x_b;

    -- bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg(STALLFIFO,392)
    bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_in <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_V0;
    bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall;
    bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_in(0);
    bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_in(0);
    bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_out(0) <= bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_out(0) <= bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_global_size_0_sync_buffer_histogram(STALLENABLE,247)
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg0 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg1 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed0 <= (not (bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_stall_out) and SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid) or SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg0;
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed1 <= (not (SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_backStall) and SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid) or SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_StallValid <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_backStall and SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid;
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_toReg0 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_StallValid and SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed0;
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_toReg1 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_StallValid and SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_or0 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed0;
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireStall <= not (SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_consumed1 and SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_or0);
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_backStall <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_V0 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid and not (SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg0);
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_V1 <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid and not (SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_wireValid <= i_syncbuf_global_size_0_sync_buffer_histogram_out_valid_out;

    -- SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo(STALLENABLE,285)
    -- Valid signal propagation
    SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_V0 <= SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_backStall <= SR_SE_redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_backStall or not (SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_and0 <= redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_out;
    SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_wireValid <= SE_out_i_syncbuf_global_size_0_sync_buffer_histogram_V1 and SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_and0;

    -- redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo(STALLFIFO,151)
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V2;
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_in <= SE_out_redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_backStall;
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_data_in <= bubble_select_histogram_B3_merge_reg_aunroll_x_b;
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_in_bitsignaltemp <= redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_in(0);
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_in_bitsignaltemp <= redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_in(0);
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_out(0) <= redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_out_bitsignaltemp;
    redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_out(0) <= redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_out_bitsignaltemp;
    theredist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 125,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B3_merge_reg_aunroll_x_b,
        valid_out => redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_out_bitsignaltemp,
        data_out => redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg(STALLFIFO,391)
    bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V1;
    bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_in <= SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_4_backStall;
    bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp <= bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_in(0);
    bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp <= bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_in(0);
    bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_out(0) <= bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp;
    bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_out(0) <= bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp;
    thebubble_out_histogram_B3_merge_reg_aunroll_x_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 126,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg(STALLFIFO,390)
    bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V0;
    bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_in <= SE_out_bubble_out_histogram_B3_merge_reg_aunroll_x_3_backStall;
    bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp <= bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_in(0);
    bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp <= bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_in(0);
    bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_out(0) <= bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp;
    bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_out(0) <= bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp;
    thebubble_out_histogram_B3_merge_reg_aunroll_x_3_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 125,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_histogram_B3_merge_reg_aunroll_x(STALLENABLE,226)
    SE_out_histogram_B3_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg8 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg0 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg1 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg2 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg3 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg4 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg5 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg6 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg7 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_histogram_B3_merge_reg_aunroll_x_fromReg8 <= SE_out_histogram_B3_merge_reg_aunroll_x_toReg8;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_histogram_B3_merge_reg_aunroll_x_3_reg_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg0;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_histogram_B3_merge_reg_aunroll_x_4_reg_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg1;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed2 <= (not (redist3_histogram_B3_merge_reg_aunroll_x_out_data_out_0_124_fifo_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg2;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed3 <= (not (redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg3;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed4 <= (not (redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg4;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed5 <= (not (redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg5;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed6 <= (not (redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg6;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed7 <= (not (redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_stall_out) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg7;
    SE_out_histogram_B3_merge_reg_aunroll_x_consumed8 <= (not (SR_SE_redist2_i_arrayidx15_histogram_histogram14_trunc_sel_x_b_1_0_backStall) and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B3_merge_reg_aunroll_x_fromReg8;
    -- Consuming
    SE_out_histogram_B3_merge_reg_aunroll_x_StallValid <= SE_out_histogram_B3_merge_reg_aunroll_x_backStall and SE_out_histogram_B3_merge_reg_aunroll_x_wireValid;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg0 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg1 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed1;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg2 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed2;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg3 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed3;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg4 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed4;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg5 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed5;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg6 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed6;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg7 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed7;
    SE_out_histogram_B3_merge_reg_aunroll_x_toReg8 <= SE_out_histogram_B3_merge_reg_aunroll_x_StallValid and SE_out_histogram_B3_merge_reg_aunroll_x_consumed8;
    -- Backward Stall generation
    SE_out_histogram_B3_merge_reg_aunroll_x_or0 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B3_merge_reg_aunroll_x_or1 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed1 and SE_out_histogram_B3_merge_reg_aunroll_x_or0;
    SE_out_histogram_B3_merge_reg_aunroll_x_or2 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed2 and SE_out_histogram_B3_merge_reg_aunroll_x_or1;
    SE_out_histogram_B3_merge_reg_aunroll_x_or3 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed3 and SE_out_histogram_B3_merge_reg_aunroll_x_or2;
    SE_out_histogram_B3_merge_reg_aunroll_x_or4 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed4 and SE_out_histogram_B3_merge_reg_aunroll_x_or3;
    SE_out_histogram_B3_merge_reg_aunroll_x_or5 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed5 and SE_out_histogram_B3_merge_reg_aunroll_x_or4;
    SE_out_histogram_B3_merge_reg_aunroll_x_or6 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed6 and SE_out_histogram_B3_merge_reg_aunroll_x_or5;
    SE_out_histogram_B3_merge_reg_aunroll_x_or7 <= SE_out_histogram_B3_merge_reg_aunroll_x_consumed7 and SE_out_histogram_B3_merge_reg_aunroll_x_or6;
    SE_out_histogram_B3_merge_reg_aunroll_x_wireStall <= not (SE_out_histogram_B3_merge_reg_aunroll_x_consumed8 and SE_out_histogram_B3_merge_reg_aunroll_x_or7);
    SE_out_histogram_B3_merge_reg_aunroll_x_backStall <= SE_out_histogram_B3_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_histogram_B3_merge_reg_aunroll_x_V0 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg0);
    SE_out_histogram_B3_merge_reg_aunroll_x_V1 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg1);
    SE_out_histogram_B3_merge_reg_aunroll_x_V2 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg2);
    SE_out_histogram_B3_merge_reg_aunroll_x_V3 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg3);
    SE_out_histogram_B3_merge_reg_aunroll_x_V4 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg4);
    SE_out_histogram_B3_merge_reg_aunroll_x_V5 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg5);
    SE_out_histogram_B3_merge_reg_aunroll_x_V6 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg6);
    SE_out_histogram_B3_merge_reg_aunroll_x_V7 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg7);
    SE_out_histogram_B3_merge_reg_aunroll_x_V8 <= SE_out_histogram_B3_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B3_merge_reg_aunroll_x_fromReg8);
    -- Computing multiple Valid(s)
    SE_out_histogram_B3_merge_reg_aunroll_x_wireValid <= histogram_B3_merge_reg_aunroll_x_out_valid_out;

    -- redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo(STALLFIFO,153)
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_in <= SE_out_histogram_B3_merge_reg_aunroll_x_V4;
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_in <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_backStall;
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_data_in <= bubble_select_histogram_B3_merge_reg_aunroll_x_d;
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_in_bitsignaltemp <= redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_in(0);
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_in_bitsignaltemp <= redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_in(0);
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_out(0) <= redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_out_bitsignaltemp;
    redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_out(0) <= redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_out_bitsignaltemp;
    theredist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 120,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_histogram_B3_merge_reg_aunroll_x_d,
        valid_out => redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_stall_out_bitsignaltemp,
        data_out => redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo(STALLENABLE,289)
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg0 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg1 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed0 <= (not (SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_backStall) and SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid) or SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg0;
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed1 <= (not (SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_0_backStall) and SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid) or SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg1;
    -- Consuming
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_StallValid <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_backStall and SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid;
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_toReg0 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_StallValid and SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed0;
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_toReg1 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_StallValid and SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_or0 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed0;
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireStall <= not (SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_consumed1 and SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_or0);
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_backStall <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_V0 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid and not (SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg0);
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_V1 <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid and not (SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_wireValid <= redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_valid_out;

    -- i_load_unnamed_histogram3_histogram(BLACKBOX,66)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata@120
    -- out out_o_stall@20000000
    -- out out_o_valid@120
    -- out out_unnamed_histogram3_avm_address@20000000
    -- out out_unnamed_histogram3_avm_burstcount@20000000
    -- out out_unnamed_histogram3_avm_byteenable@20000000
    -- out out_unnamed_histogram3_avm_enable@20000000
    -- out out_unnamed_histogram3_avm_read@20000000
    -- out out_unnamed_histogram3_avm_write@20000000
    -- out out_unnamed_histogram3_avm_writedata@20000000
    thei_load_unnamed_histogram3_histogram : i_load_unnamed_histogram3_histogram18
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_i_syncbuf_data_sync_buffer_histogram_D0,
        in_i_predicate => SR_SE_out_i_syncbuf_data_sync_buffer_histogram_D1,
        in_i_stall => SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_data_sync_buffer_histogram_V0,
        in_unnamed_histogram3_avm_readdata => in_unnamed_histogram3_avm_readdata,
        in_unnamed_histogram3_avm_readdatavalid => in_unnamed_histogram3_avm_readdatavalid,
        in_unnamed_histogram3_avm_waitrequest => in_unnamed_histogram3_avm_waitrequest,
        in_unnamed_histogram3_avm_writeack => in_unnamed_histogram3_avm_writeack,
        out_o_readdata => i_load_unnamed_histogram3_histogram_out_o_readdata,
        out_o_stall => i_load_unnamed_histogram3_histogram_out_o_stall,
        out_o_valid => i_load_unnamed_histogram3_histogram_out_o_valid,
        out_unnamed_histogram3_avm_address => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_address,
        out_unnamed_histogram3_avm_burstcount => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_burstcount,
        out_unnamed_histogram3_avm_byteenable => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_byteenable,
        out_unnamed_histogram3_avm_enable => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_enable,
        out_unnamed_histogram3_avm_read => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_read,
        out_unnamed_histogram3_avm_write => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_write,
        out_unnamed_histogram3_avm_writedata => i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo(STALLFIFO,149)
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_in <= SE_out_i_syncbuf_numdata_sync_buffer_histogram_V2;
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_in <= SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_backStall;
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_data_in <= i_cmp1113_phi_decision21_xor_rm_histogram_q;
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_in_bitsignaltemp <= redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_in(0);
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_in_bitsignaltemp <= redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_in(0);
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_out(0) <= redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_out_bitsignaltemp;
    redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_out(0) <= redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_out_bitsignaltemp;
    theredist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 119,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp1113_phi_decision21_xor_rm_histogram_q,
        valid_out => redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo(STALLENABLE,282)
    -- Valid signal propagation
    SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_V0 <= SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_backStall <= i_unknown_call1819_histogram_out_o_stall or not (SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_and0 <= redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_valid_out;
    SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_and1 <= i_load_unnamed_histogram3_histogram_out_o_valid and SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_and0;
    SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_wireValid <= SE_out_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_V0 and SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_and1;

    -- SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1(STALLENABLE,339)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_V0 <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and0 <= bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_reg_V0;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and1 <= redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and0;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and2 <= redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and1;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and3 <= redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and2;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and4 <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and3;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and5 <= redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and4;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and6 <= redist0_i_cmp1113_rm_histogram_c_125_fifo_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and5;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and7 <= SE_i_cmp11_histogram_V0 and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and6;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and8 <= bubble_out_i_syncbuf_global_size_0_sync_buffer_histogram_1_reg_valid_out and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and7;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and9 <= i_unknown_call1819_histogram_out_o_valid and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and8;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and10 <= SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_V0 and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and9;
    SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_wireValid <= SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_V0 and SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_and10;

    -- bubble_join_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo(BITJOIN,201)
    bubble_join_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_q <= redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_data_out;

    -- bubble_select_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo(BITSELECT,202)
    bubble_select_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_q(0 downto 0));

    -- bubble_join_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo(BITJOIN,210)
    bubble_join_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_q <= redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_data_out;

    -- bubble_select_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo(BITSELECT,211)
    bubble_select_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_q(63 downto 0));

    -- bubble_join_i_load_unnamed_histogram3_histogram(BITJOIN,176)
    bubble_join_i_load_unnamed_histogram3_histogram_q <= i_load_unnamed_histogram3_histogram_out_o_readdata;

    -- bubble_select_i_load_unnamed_histogram3_histogram(BITSELECT,177)
    bubble_select_i_load_unnamed_histogram3_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_histogram3_histogram_q(31 downto 0));

    -- i_idxprom16_histogram_sel_x(BITSELECT,45)@120
    i_idxprom16_histogram_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_i_load_unnamed_histogram3_histogram_b(31 downto 0)), 64)));

    -- i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select(BITSELECT,133)@120
    i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_b <= i_idxprom16_histogram_sel_x_b(17 downto 0);
    i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_c <= i_idxprom16_histogram_sel_x_b(63 downto 54);
    i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_d <= i_idxprom16_histogram_sel_x_b(35 downto 18);
    i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_e <= i_idxprom16_histogram_sel_x_b(53 downto 36);

    -- i_arrayidx17_histogram_histogram20_mult_x_im3_shift0(BITSHIFT,129)@120
    i_arrayidx17_histogram_histogram20_mult_x_im3_shift0_qint <= i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx17_histogram_histogram20_mult_x_im3_shift0_q <= i_arrayidx17_histogram_histogram20_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_align_15(BITSHIFT,118)@120
    i_arrayidx17_histogram_histogram20_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx17_histogram_histogram20_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx17_histogram_histogram20_mult_x_align_15_q <= i_arrayidx17_histogram_histogram20_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_im6_shift0(BITSHIFT,130)@120
    i_arrayidx17_histogram_histogram20_mult_x_im6_shift0_qint <= i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx17_histogram_histogram20_mult_x_im6_shift0_q <= i_arrayidx17_histogram_histogram20_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_align_14(BITSHIFT,117)@120
    i_arrayidx17_histogram_histogram20_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx17_histogram_histogram20_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx17_histogram_histogram20_mult_x_align_14_q <= i_arrayidx17_histogram_histogram20_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_join_16(BITJOIN,119)@120
    i_arrayidx17_histogram_histogram20_mult_x_join_16_q <= i_arrayidx17_histogram_histogram20_mult_x_align_15_q & i_arrayidx17_histogram_histogram20_mult_x_align_14_q;

    -- i_arrayidx17_histogram_histogram20_mult_x_im9_shift0(BITSHIFT,131)@120
    i_arrayidx17_histogram_histogram20_mult_x_im9_shift0_qint <= i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx17_histogram_histogram20_mult_x_im9_shift0_q <= i_arrayidx17_histogram_histogram20_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_align_12(BITSHIFT,115)@120
    i_arrayidx17_histogram_histogram20_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx17_histogram_histogram20_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx17_histogram_histogram20_mult_x_align_12_q <= i_arrayidx17_histogram_histogram20_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_im0_shift0(BITSHIFT,128)@120
    i_arrayidx17_histogram_histogram20_mult_x_im0_shift0_qint <= i_arrayidx17_histogram_histogram20_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx17_histogram_histogram20_mult_x_im0_shift0_q <= i_arrayidx17_histogram_histogram20_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_x_join_13(BITJOIN,116)@120
    i_arrayidx17_histogram_histogram20_mult_x_join_13_q <= i_arrayidx17_histogram_histogram20_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx17_histogram_histogram20_mult_x_im0_shift0_q);

    -- i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0(ADD,120)@120
    i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx17_histogram_histogram20_mult_x_join_13_q);
    i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx17_histogram_histogram20_mult_x_join_16_q);
    i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_b));
    i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_q <= i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx17_histogram_histogram20_mult_extender_x(BITJOIN,37)@120
    i_arrayidx17_histogram_histogram20_mult_extender_x_q <= i_arrayidx15_histogram_histogram14_mult_multconst_x_q & i_arrayidx17_histogram_histogram20_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx17_histogram_histogram20_trunc_sel_x(BITSELECT,39)@120
    i_arrayidx17_histogram_histogram20_trunc_sel_x_b <= i_arrayidx17_histogram_histogram20_mult_extender_x_q(63 downto 0);

    -- i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x(BITSELECT,34)@120
    i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx17_histogram_histogram20_trunc_sel_x_b);
    i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x_b <= i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx17_histogram_vt_select_63(BITSELECT,58)@120
    i_arrayidx17_histogram_vt_select_63_b <= i_arrayidx17_histogram_histogram20_dupName_0_trunc_sel_x_b(63 downto 2);

    -- i_arrayidx17_histogram_vt_const_1(CONSTANT,56)
    i_arrayidx17_histogram_vt_const_1_q <= "00";

    -- i_arrayidx17_histogram_vt_join(BITJOIN,57)@120
    i_arrayidx17_histogram_vt_join_q <= i_arrayidx17_histogram_vt_select_63_b & i_arrayidx17_histogram_vt_const_1_q;

    -- i_unknown_call1819_histogram(BLACKBOX,71)@120
    -- in in_i_stall@20000000
    -- out out_call1819_avm_address@20000000
    -- out out_call1819_avm_burstcount@20000000
    -- out out_call1819_avm_byteenable@20000000
    -- out out_call1819_avm_enable@20000000
    -- out out_call1819_avm_read@20000000
    -- out out_call1819_avm_write@20000000
    -- out out_call1819_avm_writedata@20000000
    -- out out_o_readdata@127
    -- out out_o_stall@20000000
    -- out out_o_valid@127
    thei_unknown_call1819_histogram : i_unknown_call1819_histogram21
    PORT MAP (
        in_call1819_avm_readdata => in_call1819_avm_readdata,
        in_call1819_avm_readdatavalid => in_call1819_avm_readdatavalid,
        in_call1819_avm_waitrequest => in_call1819_avm_waitrequest,
        in_call1819_avm_writeack => in_call1819_avm_writeack,
        in_flush => in_flush,
        in_i_address => i_arrayidx17_histogram_vt_join_q,
        in_i_bitwiseor => bubble_select_redist5_histogram_B3_merge_reg_aunroll_x_out_data_out_2_119_fifo_b,
        in_i_predicate => bubble_select_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_b,
        in_i_stall => SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_backStall,
        in_i_valid => SE_out_redist1_i_cmp1113_phi_decision21_xor_rm_histogram_q_118_fifo_V0,
        in_i_writedata => c_i32_1gr_q,
        out_call1819_avm_address => i_unknown_call1819_histogram_out_call1819_avm_address,
        out_call1819_avm_burstcount => i_unknown_call1819_histogram_out_call1819_avm_burstcount,
        out_call1819_avm_byteenable => i_unknown_call1819_histogram_out_call1819_avm_byteenable,
        out_call1819_avm_enable => i_unknown_call1819_histogram_out_call1819_avm_enable,
        out_call1819_avm_read => i_unknown_call1819_histogram_out_call1819_avm_read,
        out_call1819_avm_write => i_unknown_call1819_histogram_out_call1819_avm_write,
        out_call1819_avm_writedata => i_unknown_call1819_histogram_out_call1819_avm_writedata,
        out_o_stall => i_unknown_call1819_histogram_out_o_stall,
        out_o_valid => i_unknown_call1819_histogram_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_call1819_avm_address <= i_unknown_call1819_histogram_out_call1819_avm_address;
    out_call1819_avm_enable <= i_unknown_call1819_histogram_out_call1819_avm_enable;
    out_call1819_avm_read <= i_unknown_call1819_histogram_out_call1819_avm_read;
    out_call1819_avm_write <= i_unknown_call1819_histogram_out_call1819_avm_write;
    out_call1819_avm_writedata <= i_unknown_call1819_histogram_out_call1819_avm_writedata;
    out_call1819_avm_byteenable <= i_unknown_call1819_histogram_out_call1819_avm_byteenable;
    out_call1819_avm_burstcount <= i_unknown_call1819_histogram_out_call1819_avm_burstcount;

    -- i_cmp11_histogram(COMPARE,61)@126 + 1
    i_cmp11_histogram_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp11_histogram_D0(31)) & SR_SE_i_cmp11_histogram_D0));
    i_cmp11_histogram_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp11_histogram_D1(31)) & SR_SE_i_cmp11_histogram_D1));
    i_cmp11_histogram_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp11_histogram_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp11_histogram_backEN = "1") THEN
                i_cmp11_histogram_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp11_histogram_a) - SIGNED(i_cmp11_histogram_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp11_histogram_c(0) <= i_cmp11_histogram_o(33);

    -- bubble_join_redist0_i_cmp1113_rm_histogram_c_125_fifo(BITJOIN,198)
    bubble_join_redist0_i_cmp1113_rm_histogram_c_125_fifo_q <= redist0_i_cmp1113_rm_histogram_c_125_fifo_data_out;

    -- bubble_select_redist0_i_cmp1113_rm_histogram_c_125_fifo(BITSELECT,199)
    bubble_select_redist0_i_cmp1113_rm_histogram_c_125_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_cmp1113_rm_histogram_c_125_fifo_q(0 downto 0));

    -- i_unnamed_histogram28(LOGICAL,72)@127
    i_unnamed_histogram28_q <= bubble_select_redist0_i_cmp1113_rm_histogram_c_125_fifo_b and i_cmp11_histogram_c;

    -- bubble_join_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo(BITJOIN,219)
    bubble_join_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_q <= redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_data_out;

    -- bubble_select_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo(BITSELECT,220)
    bubble_select_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_q(31 downto 0));

    -- bubble_join_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo(BITJOIN,216)
    bubble_join_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_q <= redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_data_out;

    -- bubble_select_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo(BITSELECT,217)
    bubble_select_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_q(31 downto 0));

    -- redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6(REG,160)
    redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_backEN = "1") THEN
                redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_q <= STD_LOGIC_VECTOR(SR_SE_redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo(BITJOIN,207)
    bubble_join_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_q <= redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_data_out;

    -- bubble_select_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo(BITSELECT,208)
    bubble_select_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_q(31 downto 0));

    -- bubble_join_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo(BITJOIN,213)
    bubble_join_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_q <= redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_data_out;

    -- bubble_select_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo(BITSELECT,214)
    bubble_select_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_q(31 downto 0));

    -- redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0(REG,167)
    redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_backEN = "1") THEN
                redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(redist12_bgTrunc_i_add22_histogram_sel_x_b_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo(BITJOIN,222)
    bubble_join_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_q <= redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_data_out;

    -- bubble_select_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo(BITSELECT,223)
    bubble_select_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_q(31 downto 0));

    -- dupName_0_sync_out_x(GPOUT,10)@127
    out_acl_hw_wg_id27 <= bubble_select_redist11_histogram_B3_merge_reg_aunroll_x_out_data_out_6_126_fifo_b;
    out_add22 <= redist13_bgTrunc_i_add22_histogram_sel_x_b_2_0_q;
    out_global_id_012 <= bubble_select_redist8_histogram_B3_merge_reg_aunroll_x_out_data_out_3_126_fifo_b;
    out_l_grpid_04 <= bubble_select_redist4_histogram_B3_merge_reg_aunroll_x_out_data_out_1_126_fifo_b;
    out_l_grpid_0_addr_zext10 <= redist6_histogram_B3_merge_reg_aunroll_x_out_data_out_2_126_6_q;
    out_local_id_017 <= bubble_select_redist9_histogram_B3_merge_reg_aunroll_x_out_data_out_4_126_fifo_b;
    out_local_linear_id21 <= bubble_select_redist10_histogram_B3_merge_reg_aunroll_x_out_data_out_5_126_fifo_b;
    out_unnamed_histogram2 <= i_unnamed_histogram28_q;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_numdata_sync_buffer1_histogram_1_V0;

    -- ext_sig_sync_out(GPOUT,54)
    out_unnamed_histogram3_avm_address <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_address;
    out_unnamed_histogram3_avm_enable <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_enable;
    out_unnamed_histogram3_avm_read <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_read;
    out_unnamed_histogram3_avm_write <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_write;
    out_unnamed_histogram3_avm_writedata <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_writedata;
    out_unnamed_histogram3_avm_byteenable <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_byteenable;
    out_unnamed_histogram3_avm_burstcount <= i_load_unnamed_histogram3_histogram_out_unnamed_histogram3_avm_burstcount;

    -- sync_out(GPOUT,84)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
