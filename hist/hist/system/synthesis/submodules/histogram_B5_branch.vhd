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

-- VHDL created from histogram_B5_branch
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

entity histogram_B5_branch is
    port (
        in_acl_hw_wg_id25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext8 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_015 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_015 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_B5_branch;

architecture normal of histogram_B5_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id25_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe4_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal histogram_B5_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_02_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr_zext8_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal local_id_015_reg_q : STD_LOGIC_VECTOR (31 downto 0);
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

    -- not_stall_in_1(LOGICAL,20)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe5_cmp(LOGICAL,4)
    c0_exe5_cmp_q <= not (in_c0_exe5);

    -- valid_out_1_and(LOGICAL,36)
    valid_out_1_and_q <= in_valid_in and c0_exe5_cmp_q;

    -- valid_1_reg(REG,34)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,22)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,24)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,19)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,35)
    valid_out_0_and_q <= in_valid_in and in_c0_exe5;

    -- valid_0_reg(REG,33)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,21)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,23)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- histogram_B5_branch_enable(LOGICAL,5)
    histogram_B5_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- acl_hw_wg_id25_reg(REG,2)
    acl_hw_wg_id25_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_hw_wg_id25_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                acl_hw_wg_id25_reg_q <= in_acl_hw_wg_id25;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_hw_wg_id25(GPOUT,25)
    out_acl_hw_wg_id25 <= acl_hw_wg_id25_reg_q;

    -- c0_exe4_reg(REG,3)
    c0_exe4_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe4_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                c0_exe4_reg_q <= in_c0_exe4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe4(GPOUT,26)
    out_c0_exe4 <= c0_exe4_reg_q;

    -- l_grpid_02_reg(REG,16)
    l_grpid_02_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_02_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                l_grpid_02_reg_q <= in_l_grpid_02;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_02(GPOUT,27)
    out_l_grpid_02 <= l_grpid_02_reg_q;

    -- l_grpid_0_addr_zext8_reg(REG,17)
    l_grpid_0_addr_zext8_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr_zext8_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                l_grpid_0_addr_zext8_reg_q <= in_l_grpid_0_addr_zext8;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr_zext8(GPOUT,28)
    out_l_grpid_0_addr_zext8 <= l_grpid_0_addr_zext8_reg_q;

    -- local_id_015_reg(REG,18)
    local_id_015_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            local_id_015_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (histogram_B5_branch_enable_q = "1") THEN
                local_id_015_reg_q <= in_local_id_015;
            END IF;
        END IF;
    END PROCESS;

    -- out_local_id_015(GPOUT,29)
    out_local_id_015 <= local_id_015_reg_q;

    -- histogram_B5_branch_enable_not(LOGICAL,6)
    histogram_B5_branch_enable_not_q <= not (histogram_B5_branch_enable_q);

    -- out_stall_out(GPOUT,30)
    out_stall_out <= histogram_B5_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,31)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,32)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
