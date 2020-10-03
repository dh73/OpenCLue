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

-- VHDL created from histogram_B1_branch
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

entity histogram_B1_branch is
    port (
        in_acl_hw_wg_id29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_add : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp20_GUARD : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_014 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_019 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_019 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_B1_branch;

architecture normal of histogram_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id29_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal add_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cmp20_GUARD_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_014_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal histogram_B1_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B1_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_06_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr7_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr_zext_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal local_id_019_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal local_linear_id23_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,26)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- cmp20_GUARD_cmp(LOGICAL,4)
    cmp20_GUARD_cmp_q <= not (in_cmp20_GUARD);

    -- valid_out_1_and(LOGICAL,45)
    valid_out_1_and_q <= in_valid_in and cmp20_GUARD_cmp_q;

    -- valid_1_reg(REG,43)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,28)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,30)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,25)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,44)
    valid_out_0_and_q <= in_valid_in and in_cmp20_GUARD;

    -- valid_0_reg(REG,42)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,27)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,29)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- histogram_B1_branch_enable(LOGICAL,6)
    histogram_B1_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- acl_hw_wg_id29_reg(REG,2)
    acl_hw_wg_id29_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_hw_wg_id29_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                acl_hw_wg_id29_reg_q <= in_acl_hw_wg_id29;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_hw_wg_id29(GPOUT,31)
    out_acl_hw_wg_id29 <= acl_hw_wg_id29_reg_q;

    -- add_reg(REG,3)
    add_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            add_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                add_reg_q <= in_add;
            END IF;
        END IF;
    END PROCESS;

    -- out_add(GPOUT,32)
    out_add <= add_reg_q;

    -- global_id_014_reg(REG,5)
    global_id_014_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_014_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                global_id_014_reg_q <= in_global_id_014;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_014(GPOUT,33)
    out_global_id_014 <= global_id_014_reg_q;

    -- l_grpid_06_reg(REG,20)
    l_grpid_06_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_06_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                l_grpid_06_reg_q <= in_l_grpid_06;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_06(GPOUT,34)
    out_l_grpid_06 <= l_grpid_06_reg_q;

    -- l_grpid_0_addr7_reg(REG,21)
    l_grpid_0_addr7_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr7_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                l_grpid_0_addr7_reg_q <= in_l_grpid_0_addr7;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr7(GPOUT,35)
    out_l_grpid_0_addr7 <= l_grpid_0_addr7_reg_q;

    -- l_grpid_0_addr_zext_reg(REG,22)
    l_grpid_0_addr_zext_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr_zext_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                l_grpid_0_addr_zext_reg_q <= in_l_grpid_0_addr_zext;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr_zext(GPOUT,36)
    out_l_grpid_0_addr_zext <= l_grpid_0_addr_zext_reg_q;

    -- local_id_019_reg(REG,23)
    local_id_019_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            local_id_019_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                local_id_019_reg_q <= in_local_id_019;
            END IF;
        END IF;
    END PROCESS;

    -- out_local_id_019(GPOUT,37)
    out_local_id_019 <= local_id_019_reg_q;

    -- local_linear_id23_reg(REG,24)
    local_linear_id23_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            local_linear_id23_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B1_branch_enable_q = "1") THEN
                local_linear_id23_reg_q <= in_local_linear_id23;
            END IF;
        END IF;
    END PROCESS;

    -- out_local_linear_id23(GPOUT,38)
    out_local_linear_id23 <= local_linear_id23_reg_q;

    -- histogram_B1_branch_enable_not(LOGICAL,7)
    histogram_B1_branch_enable_not_q <= not (histogram_B1_branch_enable_q);

    -- out_stall_out(GPOUT,39)
    out_stall_out <= histogram_B1_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,40)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,41)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
