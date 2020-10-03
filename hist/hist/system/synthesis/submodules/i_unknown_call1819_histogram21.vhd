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

-- VHDL created from i_unknown_call1819_histogram21
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

entity i_unknown_call1819_histogram21 is
    port (
        in_call1819_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_address : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        out_o_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_call1819_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        in_call1819_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call1819_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        in_call1819_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        out_call1819_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_unknown_call1819_histogram21;

architecture normal of i_unknown_call1819_histogram21 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component lsu_top is
        generic (
            ABITS_PER_LMEM_BANK : INTEGER;
            ADDRSPACE : INTEGER := 5;
            ALIGNMENT_BYTES : INTEGER := 4;
            ATOMIC : INTEGER := 1;
            ATOMIC_WIDTH : INTEGER := 3;
            AWIDTH : INTEGER := 32;
            BURSTCOUNT_WIDTH : INTEGER := 1;
            ENABLE_BANKED_MEMORY : INTEGER := 0;
            FORCE_NOP_SUPPORT : INTEGER := 0;
            HIGH_FMAX : INTEGER := 1;
            INPUTFIFO_USEDW_MAXBITS : INTEGER := 5;
            KERNEL_SIDE_MEM_LATENCY : INTEGER := 6;
            LMEM_ADDR_PERMUTATION_STYLE : INTEGER := 0;
            MEMORY_SIDE_MEM_LATENCY : INTEGER := 0;
            MWIDTH : INTEGER := 32;
            MWIDTH_BYTES : INTEGER := 4;
            NUMBER_BANKS : INTEGER := 1;
            PROFILE_ADDR_TOGGLE : INTEGER := 0;
            READ : INTEGER := 1;
            STALLFREE : INTEGER := 0;
            STYLE : STRING := "ATOMIC-PIPELINED";
            SYNCHRONIZE_RESET : INTEGER := 1;
            USECACHING : INTEGER := 0;
            USEINPUTFIFO : INTEGER := 0;
            USEOUTPUTFIFO : INTEGER := 1;
            USE_BYTE_EN : INTEGER := 0;
            USE_WRITE_ACK : INTEGER := 0;
            WIDTH : INTEGER := 32;
            WIDTH_BYTES : INTEGER := 4;
            WRITEDATAWIDTH_BYTES : INTEGER := 16
        );
        port (
            avm_readdata : in std_logic_vector(127 downto 0);
            avm_readdatavalid : in std_logic;
            avm_waitrequest : in std_logic;
            avm_writeack : in std_logic;
            clock2x : in std_logic;
            flush : in std_logic;
            i_address : in std_logic_vector(31 downto 0);
            i_atomic_op : in std_logic_vector(2 downto 0);
            i_bitwiseor : in std_logic_vector(31 downto 0);
            i_byteenable : in std_logic_vector(3 downto 0);
            i_cmpdata : in std_logic_vector(31 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            i_writedata : in std_logic_vector(31 downto 0);
            stream_base_addr : in std_logic_vector(31 downto 0);
            stream_reset : in std_logic;
            stream_size : in std_logic_vector(31 downto 0);
            avm_address : out std_logic_vector(31 downto 0);
            avm_burstcount : out std_logic;
            avm_byteenable : out std_logic_vector(15 downto 0);
            avm_enable : out std_logic;
            avm_read : out std_logic;
            avm_write : out std_logic;
            avm_writedata : out std_logic_vector(127 downto 0);
            o_input_fifo_depth : out std_logic_vector(4 downto 0);
            o_readdata : out std_logic_vector(31 downto 0);
            o_stall : out std_logic;
            o_valid : out std_logic;
            o_writeack : out std_logic;
            profile_avm_burstcount_total_incr : out std_logic_vector(31 downto 0);
            profile_bw_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component readdata_reg_call1819_histogram1 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal addr_trunc_in : STD_LOGIC_VECTOR (31 downto 0);
    signal addr_trunc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bitwise_or_trunc_in : STD_LOGIC_VECTOR (31 downto 0);
    signal bitwise_or_trunc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_0gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i4_0gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unknown_call1819_histogram22_avm_readdata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unknown_call1819_histogram22_avm_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_readdatavalid_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_avm_waitrequest : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_waitrequest_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_avm_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_writeack_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_clock2x_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_flush : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_flush_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_i_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_i_atomic_op : STD_LOGIC_VECTOR (2 downto 0);
    signal i_unknown_call1819_histogram22_i_bitwiseor : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_i_byteenable : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unknown_call1819_histogram22_i_cmpdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_i_predicate_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_i_stall_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_i_valid_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_i_writedata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_stream_base_addr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_stream_reset : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_stream_reset_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_stream_size : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_burstcount_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_unknown_call1819_histogram22_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_enable_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_read_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_avm_write_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unknown_call1819_histogram22_o_input_fifo_depth : STD_LOGIC_VECTOR (4 downto 0);
    signal i_unknown_call1819_histogram22_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_o_stall_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_o_valid_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call1819_histogram22_o_writeack_bitsignaltemp : std_logic;
    signal i_unknown_call1819_histogram22_profile_avm_burstcount_total_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call1819_histogram22_profile_bw_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_call1819_histogram1_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_call1819_histogram1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal readdata_reg_call1819_histogram1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ip_dsdk_adapt_cast(BITSELECT,23)
    ip_dsdk_adapt_cast_b <= i_unknown_call1819_histogram22_o_readdata(31 downto 0);

    -- readdata_reg_call1819_histogram1(BLACKBOX,24)@20000000
    -- out out_data_out@20000001
    -- out out_valid_out@20000001
    thereaddata_reg_call1819_histogram1 : readdata_reg_call1819_histogram1
    PORT MAP (
        in_data_in => ip_dsdk_adapt_cast_b,
        in_stall_in => in_i_stall,
        in_valid_in => i_unknown_call1819_histogram22_o_valid,
        out_data_out => readdata_reg_call1819_histogram1_out_data_out,
        out_stall_out => readdata_reg_call1819_histogram1_out_stall_out,
        out_valid_out => readdata_reg_call1819_histogram1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,2)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- c_i4_0gr(CONSTANT,21)
    c_i4_0gr_q <= "0000";

    -- bitwise_or_trunc(ROUND,17)
    bitwise_or_trunc_in <= in_i_bitwiseor(31 downto 0);
    bitwise_or_trunc_q <= bitwise_or_trunc_in(31 downto 0);

    -- c_i3_0gr(CONSTANT,20)
    c_i3_0gr_q <= "000";

    -- addr_trunc(ROUND,16)
    addr_trunc_in <= in_i_address(31 downto 0);
    addr_trunc_q <= addr_trunc_in(31 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_unknown_call1819_histogram22(EXTIFACE,22)
    i_unknown_call1819_histogram22_avm_readdata <= in_call1819_avm_readdata;
    i_unknown_call1819_histogram22_avm_readdatavalid <= in_call1819_avm_readdatavalid;
    i_unknown_call1819_histogram22_avm_waitrequest <= in_call1819_avm_waitrequest;
    i_unknown_call1819_histogram22_avm_writeack <= in_call1819_avm_writeack;
    i_unknown_call1819_histogram22_clock2x <= GND_q;
    i_unknown_call1819_histogram22_flush <= in_flush;
    i_unknown_call1819_histogram22_i_address <= addr_trunc_q;
    i_unknown_call1819_histogram22_i_atomic_op <= c_i3_0gr_q;
    i_unknown_call1819_histogram22_i_bitwiseor <= bitwise_or_trunc_q;
    i_unknown_call1819_histogram22_i_byteenable <= c_i4_0gr_q;
    i_unknown_call1819_histogram22_i_cmpdata <= dupName_0_c_i32_0gr_x_q;
    i_unknown_call1819_histogram22_i_predicate <= in_i_predicate;
    i_unknown_call1819_histogram22_i_stall <= readdata_reg_call1819_histogram1_out_stall_out;
    i_unknown_call1819_histogram22_i_valid <= in_i_valid;
    i_unknown_call1819_histogram22_i_writedata <= in_i_writedata;
    i_unknown_call1819_histogram22_stream_base_addr <= dupName_0_c_i32_0gr_x_q;
    i_unknown_call1819_histogram22_stream_reset <= GND_q;
    i_unknown_call1819_histogram22_stream_size <= dupName_0_c_i32_0gr_x_q;
    i_unknown_call1819_histogram22_avm_readdatavalid_bitsignaltemp <= i_unknown_call1819_histogram22_avm_readdatavalid(0);
    i_unknown_call1819_histogram22_avm_waitrequest_bitsignaltemp <= i_unknown_call1819_histogram22_avm_waitrequest(0);
    i_unknown_call1819_histogram22_avm_writeack_bitsignaltemp <= i_unknown_call1819_histogram22_avm_writeack(0);
    i_unknown_call1819_histogram22_clock2x_bitsignaltemp <= i_unknown_call1819_histogram22_clock2x(0);
    i_unknown_call1819_histogram22_flush_bitsignaltemp <= i_unknown_call1819_histogram22_flush(0);
    i_unknown_call1819_histogram22_i_predicate_bitsignaltemp <= i_unknown_call1819_histogram22_i_predicate(0);
    i_unknown_call1819_histogram22_i_stall_bitsignaltemp <= i_unknown_call1819_histogram22_i_stall(0);
    i_unknown_call1819_histogram22_i_valid_bitsignaltemp <= i_unknown_call1819_histogram22_i_valid(0);
    i_unknown_call1819_histogram22_stream_reset_bitsignaltemp <= i_unknown_call1819_histogram22_stream_reset(0);
    i_unknown_call1819_histogram22_avm_burstcount(0) <= i_unknown_call1819_histogram22_avm_burstcount_bitsignaltemp;
    i_unknown_call1819_histogram22_avm_enable(0) <= i_unknown_call1819_histogram22_avm_enable_bitsignaltemp;
    i_unknown_call1819_histogram22_avm_read(0) <= i_unknown_call1819_histogram22_avm_read_bitsignaltemp;
    i_unknown_call1819_histogram22_avm_write(0) <= i_unknown_call1819_histogram22_avm_write_bitsignaltemp;
    i_unknown_call1819_histogram22_o_stall(0) <= i_unknown_call1819_histogram22_o_stall_bitsignaltemp;
    i_unknown_call1819_histogram22_o_valid(0) <= i_unknown_call1819_histogram22_o_valid_bitsignaltemp;
    i_unknown_call1819_histogram22_o_writeack(0) <= i_unknown_call1819_histogram22_o_writeack_bitsignaltemp;
    thei_unknown_call1819_histogram22 : lsu_top
    GENERIC MAP (
        ABITS_PER_LMEM_BANK => 13,
        ADDRSPACE => 5,
        ALIGNMENT_BYTES => 4,
        ATOMIC => 1,
        ATOMIC_WIDTH => 3,
        AWIDTH => 32,
        BURSTCOUNT_WIDTH => 1,
        ENABLE_BANKED_MEMORY => 0,
        FORCE_NOP_SUPPORT => 0,
        HIGH_FMAX => 1,
        INPUTFIFO_USEDW_MAXBITS => 5,
        KERNEL_SIDE_MEM_LATENCY => 6,
        LMEM_ADDR_PERMUTATION_STYLE => 0,
        MEMORY_SIDE_MEM_LATENCY => 0,
        MWIDTH => 32,
        MWIDTH_BYTES => 4,
        NUMBER_BANKS => 1,
        PROFILE_ADDR_TOGGLE => 0,
        READ => 1,
        STALLFREE => 0,
        STYLE => "ATOMIC-PIPELINED",
        SYNCHRONIZE_RESET => 1,
        USECACHING => 0,
        USEINPUTFIFO => 0,
        USEOUTPUTFIFO => 1,
        USE_BYTE_EN => 0,
        USE_WRITE_ACK => 0,
        WIDTH => 32,
        WIDTH_BYTES => 4,
        WRITEDATAWIDTH_BYTES => 16
    )
    PORT MAP (
        avm_readdata => in_call1819_avm_readdata,
        avm_readdatavalid => i_unknown_call1819_histogram22_avm_readdatavalid_bitsignaltemp,
        avm_waitrequest => i_unknown_call1819_histogram22_avm_waitrequest_bitsignaltemp,
        avm_writeack => i_unknown_call1819_histogram22_avm_writeack_bitsignaltemp,
        clock2x => i_unknown_call1819_histogram22_clock2x_bitsignaltemp,
        flush => i_unknown_call1819_histogram22_flush_bitsignaltemp,
        i_address => addr_trunc_q,
        i_atomic_op => c_i3_0gr_q,
        i_bitwiseor => bitwise_or_trunc_q,
        i_byteenable => c_i4_0gr_q,
        i_cmpdata => dupName_0_c_i32_0gr_x_q,
        i_predicate => i_unknown_call1819_histogram22_i_predicate_bitsignaltemp,
        i_stall => i_unknown_call1819_histogram22_i_stall_bitsignaltemp,
        i_valid => i_unknown_call1819_histogram22_i_valid_bitsignaltemp,
        i_writedata => in_i_writedata,
        stream_base_addr => dupName_0_c_i32_0gr_x_q,
        stream_reset => i_unknown_call1819_histogram22_stream_reset_bitsignaltemp,
        stream_size => dupName_0_c_i32_0gr_x_q,
        avm_address => i_unknown_call1819_histogram22_avm_address,
        avm_burstcount => i_unknown_call1819_histogram22_avm_burstcount_bitsignaltemp,
        avm_byteenable => i_unknown_call1819_histogram22_avm_byteenable,
        avm_enable => i_unknown_call1819_histogram22_avm_enable_bitsignaltemp,
        avm_read => i_unknown_call1819_histogram22_avm_read_bitsignaltemp,
        avm_write => i_unknown_call1819_histogram22_avm_write_bitsignaltemp,
        avm_writedata => i_unknown_call1819_histogram22_avm_writedata,
        o_readdata => i_unknown_call1819_histogram22_o_readdata,
        o_stall => i_unknown_call1819_histogram22_o_stall_bitsignaltemp,
        o_valid => i_unknown_call1819_histogram22_o_valid_bitsignaltemp,
        o_writeack => i_unknown_call1819_histogram22_o_writeack_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,4)
    out_call1819_avm_burstcount <= i_unknown_call1819_histogram22_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,6)@127
    out_o_readdata <= readdata_reg_call1819_histogram1_out_data_out;
    out_o_valid <= readdata_reg_call1819_histogram1_out_valid_out;

    -- dupName_1_regfree_osync_x(GPOUT,9)
    out_call1819_avm_byteenable <= i_unknown_call1819_histogram22_avm_byteenable;

    -- dupName_2_regfree_osync_x(GPOUT,11)
    out_call1819_avm_enable <= i_unknown_call1819_histogram22_avm_enable;

    -- dupName_3_regfree_osync_x(GPOUT,13)
    out_call1819_avm_read <= i_unknown_call1819_histogram22_avm_read;

    -- dupName_4_regfree_osync_x(GPOUT,14)
    out_call1819_avm_write <= i_unknown_call1819_histogram22_avm_write;

    -- dupName_5_regfree_osync_x(GPOUT,15)
    out_call1819_avm_writedata <= i_unknown_call1819_histogram22_avm_writedata;

    -- regfree_osync(GPOUT,26)
    out_call1819_avm_address <= i_unknown_call1819_histogram22_avm_address;

    -- sync_out(GPOUT,28)@20000000
    out_o_stall <= i_unknown_call1819_histogram22_o_stall;

END normal;
