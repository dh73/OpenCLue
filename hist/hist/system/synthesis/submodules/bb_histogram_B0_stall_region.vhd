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

-- VHDL created from bb_histogram_B0_stall_region
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

entity bb_histogram_B0_stall_region is
    port (
        in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B0_stall_region;

architecture normal of bb_histogram_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component histogram_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_wg_limiter_enter_l_grpid_0_histogram0 is
        port (
            in_i_data : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B0_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B0_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B0_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_data : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram_out_wgl_0_enter_exit_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_histogram_out_wgl_0_enter_exit_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_l_grpid_0_addr_histogram_vt_const_9_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_l_grpid_0_addr_histogram_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_l_grpid_0_addr_histogram_vt_select_31_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage0Idx1Pad8_uid31_i_l_grpid_0_addr_histogram_histogram2_shift_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid33_i_l_grpid_0_addr_histogram_histogram2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Pad2_uid36_i_l_grpid_0_addr_histogram_histogram2_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1_uid38_i_l_grpid_0_addr_histogram_histogram2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_histogram_B0_merge_reg_aunroll_x_out_data_out_1_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_histogram_B0_merge_reg_aunroll_x_out_data_out_2_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_histogram_B0_merge_reg_aunroll_x_out_data_out_3_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_histogram_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_histogram_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B0_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B0_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_histogram_B0_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_acl_wg_limiter_enter_l_grpid_0_histogram_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_histogram_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,66)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= histogram_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,57)
    bubble_join_stall_entry_q <= in_local_linear_id & in_local_id_0 & in_global_id_0 & in_acl_hw_wg_id;

    -- bubble_select_stall_entry(BITSELECT,58)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));

    -- histogram_B0_merge_reg_aunroll_x(BLACKBOX,7)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thehistogram_B0_merge_reg_aunroll_x : histogram_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_d,
        in_data_in_2 => bubble_select_stall_entry_e,
        in_data_in_3 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_histogram_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => histogram_B0_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => histogram_B0_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => histogram_B0_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => histogram_B0_merge_reg_aunroll_x_out_data_out_3,
        out_stall_out => histogram_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => histogram_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_histogram_B0_merge_reg_aunroll_x(STALLENABLE,61)
    SE_out_histogram_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_histogram_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_histogram_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_histogram_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_histogram_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_histogram_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_histogram_B0_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_histogram_B0_merge_reg_aunroll_x_consumed0 <= (not (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backStall) and SE_out_histogram_B0_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_histogram_B0_merge_reg_aunroll_x_consumed1 <= (not (i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_stall) and SE_out_histogram_B0_merge_reg_aunroll_x_wireValid) or SE_out_histogram_B0_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_histogram_B0_merge_reg_aunroll_x_StallValid <= SE_out_histogram_B0_merge_reg_aunroll_x_backStall and SE_out_histogram_B0_merge_reg_aunroll_x_wireValid;
    SE_out_histogram_B0_merge_reg_aunroll_x_toReg0 <= SE_out_histogram_B0_merge_reg_aunroll_x_StallValid and SE_out_histogram_B0_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B0_merge_reg_aunroll_x_toReg1 <= SE_out_histogram_B0_merge_reg_aunroll_x_StallValid and SE_out_histogram_B0_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_histogram_B0_merge_reg_aunroll_x_or0 <= SE_out_histogram_B0_merge_reg_aunroll_x_consumed0;
    SE_out_histogram_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_histogram_B0_merge_reg_aunroll_x_consumed1 and SE_out_histogram_B0_merge_reg_aunroll_x_or0);
    SE_out_histogram_B0_merge_reg_aunroll_x_backStall <= SE_out_histogram_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_histogram_B0_merge_reg_aunroll_x_V0 <= SE_out_histogram_B0_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_histogram_B0_merge_reg_aunroll_x_V1 <= SE_out_histogram_B0_merge_reg_aunroll_x_wireValid and not (SE_out_histogram_B0_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_histogram_B0_merge_reg_aunroll_x_wireValid <= histogram_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0(STALLENABLE,74)
    -- Valid signal propagation
    SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_V0 <= SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0 <= SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_backStall and SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN <= not (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0 <= SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN and SE_out_histogram_B0_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backStall <= not (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0);
    SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "0") THEN
                SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 and SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0;
            ELSE
                SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_histogram_B0_merge_reg_aunroll_x(BITJOIN,50)
    bubble_join_histogram_B0_merge_reg_aunroll_x_q <= histogram_B0_merge_reg_aunroll_x_out_data_out_3 & histogram_B0_merge_reg_aunroll_x_out_data_out_2 & histogram_B0_merge_reg_aunroll_x_out_data_out_1 & histogram_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_histogram_B0_merge_reg_aunroll_x(BITSELECT,51)
    bubble_select_histogram_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_histogram_B0_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_histogram_B0_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_histogram_B0_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_histogram_B0_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_histogram_B0_merge_reg_aunroll_x_q(95 downto 64));
    bubble_select_histogram_B0_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_histogram_B0_merge_reg_aunroll_x_q(127 downto 96));

    -- i_acl_wg_limiter_enter_l_grpid_0_histogram(BLACKBOX,17)@1
    -- in in_i_stall@20000000
    -- out out_o_data@2
    -- out out_o_stall@20000000
    -- out out_o_valid@2
    -- out out_wgl_0_enter_exit_stall_out@20000000
    -- out out_wgl_0_enter_exit_valid_out@20000000
    thei_acl_wg_limiter_enter_l_grpid_0_histogram : i_acl_wg_limiter_enter_l_grpid_0_histogram0
    PORT MAP (
        in_i_data => bubble_select_histogram_B0_merge_reg_aunroll_x_e,
        in_i_stall => SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_backStall,
        in_i_valid => SE_out_histogram_B0_merge_reg_aunroll_x_V1,
        in_wgl_0_enter_exit_stall_in => in_wgl_0_enter_exit_stall_in,
        in_wgl_0_enter_exit_valid_in => in_wgl_0_enter_exit_valid_in,
        in_wgl_0_wgs_wg_size => in_wgl_0_wgs_wg_size,
        out_o_data => i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_data,
        out_o_stall => i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_stall,
        out_o_valid => i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_valid,
        out_wgl_0_enter_exit_stall_out => i_acl_wg_limiter_enter_l_grpid_0_histogram_out_wgl_0_enter_exit_stall_out,
        out_wgl_0_enter_exit_valid_out => i_acl_wg_limiter_enter_l_grpid_0_histogram_out_wgl_0_enter_exit_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram(STALLENABLE,63)
    -- Valid signal propagation
    SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_V0 <= SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_backStall <= in_stall_in or not (SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_and0 <= i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_valid;
    SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_wireValid <= SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_V0 and SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_and0;

    -- redist2_histogram_B0_merge_reg_aunroll_x_out_data_out_2_1_0(REG,47)
    redist2_histogram_B0_merge_reg_aunroll_x_out_data_out_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_histogram_B0_merge_reg_aunroll_x_out_data_out_2_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist2_histogram_B0_merge_reg_aunroll_x_out_data_out_2_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B0_merge_reg_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_histogram_B0_merge_reg_aunroll_x_out_data_out_1_1_0(REG,46)
    redist1_histogram_B0_merge_reg_aunroll_x_out_data_out_1_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_histogram_B0_merge_reg_aunroll_x_out_data_out_1_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist1_histogram_B0_merge_reg_aunroll_x_out_data_out_1_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B0_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x(BITSELECT,36)@2
    leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x_in <= leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q(29 downto 0);
    leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x_b <= leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x_in(29 downto 0);

    -- leftShiftStage1Idx1Pad2_uid36_i_l_grpid_0_addr_histogram_histogram2_shift_x(CONSTANT,35)
    leftShiftStage1Idx1Pad2_uid36_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= "00";

    -- leftShiftStage1Idx1_uid38_i_l_grpid_0_addr_histogram_histogram2_shift_x(BITJOIN,37)@2
    leftShiftStage1Idx1_uid38_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= leftShiftStage1Idx1Rng2_uid37_i_l_grpid_0_addr_histogram_histogram2_shift_x_b & leftShiftStage1Idx1Pad2_uid36_i_l_grpid_0_addr_histogram_histogram2_shift_x_q;

    -- leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x(BITSELECT,31)@2
    leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x_in <= bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram_b(23 downto 0);
    leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x_b <= leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x_in(23 downto 0);

    -- leftShiftStage0Idx1Pad8_uid31_i_l_grpid_0_addr_histogram_histogram2_shift_x(CONSTANT,30)
    leftShiftStage0Idx1Pad8_uid31_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= "00000000";

    -- leftShiftStage0Idx1_uid33_i_l_grpid_0_addr_histogram_histogram2_shift_x(BITJOIN,32)@2
    leftShiftStage0Idx1_uid33_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= leftShiftStage0Idx1Rng8_uid32_i_l_grpid_0_addr_histogram_histogram2_shift_x_b & leftShiftStage0Idx1Pad8_uid31_i_l_grpid_0_addr_histogram_histogram2_shift_x_q;

    -- leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x(MUX,34)@2
    leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_s <= VCC_q;
    leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_combproc: PROCESS (leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_s, bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram_b, leftShiftStage0Idx1_uid33_i_l_grpid_0_addr_histogram_histogram2_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram_b;
            WHEN "1" => leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= leftShiftStage0Idx1_uid33_i_l_grpid_0_addr_histogram_histogram2_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x(MUX,39)@2
    leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_s <= VCC_q;
    leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_combproc: PROCESS (leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_s, leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q, leftShiftStage1Idx1_uid38_i_l_grpid_0_addr_histogram_histogram2_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= leftShiftStage0_uid35_i_l_grpid_0_addr_histogram_histogram2_shift_x_q;
            WHEN "1" => leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= leftShiftStage1Idx1_uid38_i_l_grpid_0_addr_histogram_histogram2_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_l_grpid_0_addr_histogram_vt_select_31(BITSELECT,20)@2
    i_l_grpid_0_addr_histogram_vt_select_31_b <= leftShiftStage1_uid40_i_l_grpid_0_addr_histogram_histogram2_shift_x_q(31 downto 10);

    -- i_l_grpid_0_addr_histogram_vt_const_9(CONSTANT,18)
    i_l_grpid_0_addr_histogram_vt_const_9_q <= "0000000000";

    -- i_l_grpid_0_addr_histogram_vt_join(BITJOIN,19)@2
    i_l_grpid_0_addr_histogram_vt_join_q <= i_l_grpid_0_addr_histogram_vt_select_31_b & i_l_grpid_0_addr_histogram_vt_const_9_q;

    -- bubble_join_i_acl_wg_limiter_enter_l_grpid_0_histogram(BITJOIN,53)
    bubble_join_i_acl_wg_limiter_enter_l_grpid_0_histogram_q <= i_acl_wg_limiter_enter_l_grpid_0_histogram_out_o_data;

    -- bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram(BITSELECT,54)
    bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_wg_limiter_enter_l_grpid_0_histogram_q(31 downto 0));

    -- redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0(REG,45)
    redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B0_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_histogram_B0_merge_reg_aunroll_x_out_data_out_3_1_0(REG,48)
    redist3_histogram_B0_merge_reg_aunroll_x_out_data_out_3_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_histogram_B0_merge_reg_aunroll_x_out_data_out_3_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist3_histogram_B0_merge_reg_aunroll_x_out_data_out_3_1_0_q <= STD_LOGIC_VECTOR(bubble_select_histogram_B0_merge_reg_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,6)@2
    out_acl_hw_wg_id <= redist3_histogram_B0_merge_reg_aunroll_x_out_data_out_3_1_0_q;
    out_global_id_0 <= redist0_histogram_B0_merge_reg_aunroll_x_out_data_out_0_1_0_q;
    out_l_grpid_0 <= bubble_select_i_acl_wg_limiter_enter_l_grpid_0_histogram_b;
    out_l_grpid_0_addr <= i_l_grpid_0_addr_histogram_vt_join_q;
    out_local_id_0 <= redist1_histogram_B0_merge_reg_aunroll_x_out_data_out_1_1_0_q;
    out_local_linear_id <= redist2_histogram_B0_merge_reg_aunroll_x_out_data_out_2_1_0_q;
    out_valid_out <= SE_out_i_acl_wg_limiter_enter_l_grpid_0_histogram_V0;

    -- ext_sig_sync_out(GPOUT,16)
    out_wgl_0_enter_exit_valid_out <= i_acl_wg_limiter_enter_l_grpid_0_histogram_out_wgl_0_enter_exit_valid_out;
    out_wgl_0_enter_exit_stall_out <= i_acl_wg_limiter_enter_l_grpid_0_histogram_out_wgl_0_enter_exit_stall_out;

    -- sync_out(GPOUT,26)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
