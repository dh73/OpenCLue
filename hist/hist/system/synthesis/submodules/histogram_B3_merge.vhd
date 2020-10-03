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

-- VHDL created from histogram_B3_merge
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

entity histogram_B3_merge is
    port (
        in_acl_hw_wg_id27_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id27_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_012_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_012_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i9_014_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i9_014_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_04_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext10_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_0_addr_zext10_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_017_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_017_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id21_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id21_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_012 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i9_014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext10 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_017 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_B3_merge;

architecture normal of histogram_B3_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id27_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id27_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_012_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_012_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i9_014_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i9_014_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_04_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_04_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr_zext10_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_0_addr_zext10_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal local_id_017_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal local_id_017_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal local_linear_id21_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal local_linear_id21_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- acl_hw_wg_id27_mux(MUX,2)
    acl_hw_wg_id27_mux_s <= in_valid_in_0;
    acl_hw_wg_id27_mux_combproc: PROCESS (acl_hw_wg_id27_mux_s, in_acl_hw_wg_id27_1, in_acl_hw_wg_id27_0)
    BEGIN
        CASE (acl_hw_wg_id27_mux_s) IS
            WHEN "0" => acl_hw_wg_id27_mux_q <= in_acl_hw_wg_id27_1;
            WHEN "1" => acl_hw_wg_id27_mux_q <= in_acl_hw_wg_id27_0;
            WHEN OTHERS => acl_hw_wg_id27_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_acl_hw_wg_id27(GPOUT,26)
    out_acl_hw_wg_id27 <= acl_hw_wg_id27_mux_q;

    -- global_id_012_mux(MUX,3)
    global_id_012_mux_s <= in_valid_in_0;
    global_id_012_mux_combproc: PROCESS (global_id_012_mux_s, in_global_id_012_1, in_global_id_012_0)
    BEGIN
        CASE (global_id_012_mux_s) IS
            WHEN "0" => global_id_012_mux_q <= in_global_id_012_1;
            WHEN "1" => global_id_012_mux_q <= in_global_id_012_0;
            WHEN OTHERS => global_id_012_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_012(GPOUT,27)
    out_global_id_012 <= global_id_012_mux_q;

    -- i9_014_mux(MUX,4)
    i9_014_mux_s <= in_valid_in_0;
    i9_014_mux_combproc: PROCESS (i9_014_mux_s, in_i9_014_1, in_i9_014_0)
    BEGIN
        CASE (i9_014_mux_s) IS
            WHEN "0" => i9_014_mux_q <= in_i9_014_1;
            WHEN "1" => i9_014_mux_q <= in_i9_014_0;
            WHEN OTHERS => i9_014_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i9_014(GPOUT,28)
    out_i9_014 <= i9_014_mux_q;

    -- l_grpid_04_mux(MUX,22)
    l_grpid_04_mux_s <= in_valid_in_0;
    l_grpid_04_mux_combproc: PROCESS (l_grpid_04_mux_s, in_l_grpid_04_1, in_l_grpid_04_0)
    BEGIN
        CASE (l_grpid_04_mux_s) IS
            WHEN "0" => l_grpid_04_mux_q <= in_l_grpid_04_1;
            WHEN "1" => l_grpid_04_mux_q <= in_l_grpid_04_0;
            WHEN OTHERS => l_grpid_04_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_04(GPOUT,29)
    out_l_grpid_04 <= l_grpid_04_mux_q;

    -- l_grpid_0_addr_zext10_mux(MUX,23)
    l_grpid_0_addr_zext10_mux_s <= in_valid_in_0;
    l_grpid_0_addr_zext10_mux_combproc: PROCESS (l_grpid_0_addr_zext10_mux_s, in_l_grpid_0_addr_zext10_1, in_l_grpid_0_addr_zext10_0)
    BEGIN
        CASE (l_grpid_0_addr_zext10_mux_s) IS
            WHEN "0" => l_grpid_0_addr_zext10_mux_q <= in_l_grpid_0_addr_zext10_1;
            WHEN "1" => l_grpid_0_addr_zext10_mux_q <= in_l_grpid_0_addr_zext10_0;
            WHEN OTHERS => l_grpid_0_addr_zext10_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_0_addr_zext10(GPOUT,30)
    out_l_grpid_0_addr_zext10 <= l_grpid_0_addr_zext10_mux_q;

    -- local_id_017_mux(MUX,24)
    local_id_017_mux_s <= in_valid_in_0;
    local_id_017_mux_combproc: PROCESS (local_id_017_mux_s, in_local_id_017_1, in_local_id_017_0)
    BEGIN
        CASE (local_id_017_mux_s) IS
            WHEN "0" => local_id_017_mux_q <= in_local_id_017_1;
            WHEN "1" => local_id_017_mux_q <= in_local_id_017_0;
            WHEN OTHERS => local_id_017_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_local_id_017(GPOUT,31)
    out_local_id_017 <= local_id_017_mux_q;

    -- local_linear_id21_mux(MUX,25)
    local_linear_id21_mux_s <= in_valid_in_0;
    local_linear_id21_mux_combproc: PROCESS (local_linear_id21_mux_s, in_local_linear_id21_1, in_local_linear_id21_0)
    BEGIN
        CASE (local_linear_id21_mux_s) IS
            WHEN "0" => local_linear_id21_mux_q <= in_local_linear_id21_1;
            WHEN "1" => local_linear_id21_mux_q <= in_local_linear_id21_0;
            WHEN OTHERS => local_linear_id21_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_local_linear_id21(GPOUT,32)
    out_local_linear_id21 <= local_linear_id21_mux_q;

    -- valid_or(LOGICAL,38)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,36)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,33)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,37)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,34)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,35)
    out_valid_out <= valid_or_q;

END normal;
