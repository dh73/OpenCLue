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

-- VHDL created from bb_histogram_B6_stall_region
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

entity bb_histogram_B6_stall_region is
    port (
        in_acl_hw_wg_id24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_01 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B6_stall_region;

architecture normal of bb_histogram_B6_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_wg_limiter_exit_unnamed_histogram6_histogram47 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_exit_stall_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_exit_valid_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_exit_stall_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exit_valid_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_acl_wg_limiter_exit_unnamed_histogram6_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_exit_unnamed_histogram6_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_out_i_acl_wg_limiter_exit_unnamed_histogram6_histogram(STALLENABLE,20)
    -- Backward Stall generation
    SE_out_i_acl_wg_limiter_exit_unnamed_histogram6_histogram_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_wg_limiter_exit_unnamed_histogram6_histogram_wireValid <= i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_valid_out;

    -- i_acl_wg_limiter_exit_unnamed_histogram6_histogram(BLACKBOX,8)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_exit_stall_in@1
    -- out out_exit_valid_in@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_wg_limiter_exit_unnamed_histogram6_histogram : i_acl_wg_limiter_exit_unnamed_histogram6_histogram47
    PORT MAP (
        in_data_in => bubble_select_stall_entry_c,
        in_exit_stall_out => in_wgl_0_exit_exit_stall_out,
        in_exit_valid_out => in_wgl_0_exit_exit_valid_out,
        in_stall_in => SE_out_i_acl_wg_limiter_exit_unnamed_histogram6_histogram_backStall,
        in_valid_in => SE_stall_entry_V1,
        out_exit_stall_in => i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_exit_stall_in,
        out_exit_valid_in => i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_exit_valid_in,
        out_stall_out => i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_stall_out,
        out_valid_out => i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,21)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (in_stall_in) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed1 and SE_stall_entry_or0);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,16)
    bubble_join_stall_entry_q <= in_l_grpid_01 & in_acl_hw_wg_id24;

    -- bubble_select_stall_entry(BITSELECT,17)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_acl_hw_wg_id24 <= bubble_select_stall_entry_b;
    out_valid_out <= SE_stall_entry_V0;

    -- ext_sig_sync_out(GPOUT,7)
    out_wgl_0_exit_exit_valid_in <= i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_exit_valid_in;
    out_wgl_0_exit_exit_stall_in <= i_acl_wg_limiter_exit_unnamed_histogram6_histogram_out_exit_stall_in;

    -- sync_out(GPOUT,14)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
