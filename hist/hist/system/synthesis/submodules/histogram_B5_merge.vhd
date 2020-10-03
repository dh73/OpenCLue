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

-- VHDL created from histogram_B5_merge
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

entity histogram_B5_merge is
    port (
        in_acl_hw_wg_id25_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id25_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i27_012_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i27_012_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext8_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_0_addr_zext8_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_015_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_id_015_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i27_012 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_015 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_B5_merge;

architecture normal of histogram_B5_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id25_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id25_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i27_012_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i27_012_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_02_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_02_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr_zext8_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_0_addr_zext8_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal local_id_015_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal local_id_015_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- acl_hw_wg_id25_mux(MUX,2)
    acl_hw_wg_id25_mux_s <= in_valid_in_0;
    acl_hw_wg_id25_mux_combproc: PROCESS (acl_hw_wg_id25_mux_s, in_acl_hw_wg_id25_1, in_acl_hw_wg_id25_0)
    BEGIN
        CASE (acl_hw_wg_id25_mux_s) IS
            WHEN "0" => acl_hw_wg_id25_mux_q <= in_acl_hw_wg_id25_1;
            WHEN "1" => acl_hw_wg_id25_mux_q <= in_acl_hw_wg_id25_0;
            WHEN OTHERS => acl_hw_wg_id25_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_acl_hw_wg_id25(GPOUT,20)
    out_acl_hw_wg_id25 <= acl_hw_wg_id25_mux_q;

    -- i27_012_mux(MUX,3)
    i27_012_mux_s <= in_valid_in_0;
    i27_012_mux_combproc: PROCESS (i27_012_mux_s, in_i27_012_1, in_i27_012_0)
    BEGIN
        CASE (i27_012_mux_s) IS
            WHEN "0" => i27_012_mux_q <= in_i27_012_1;
            WHEN "1" => i27_012_mux_q <= in_i27_012_0;
            WHEN OTHERS => i27_012_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i27_012(GPOUT,21)
    out_i27_012 <= i27_012_mux_q;

    -- l_grpid_02_mux(MUX,17)
    l_grpid_02_mux_s <= in_valid_in_0;
    l_grpid_02_mux_combproc: PROCESS (l_grpid_02_mux_s, in_l_grpid_02_1, in_l_grpid_02_0)
    BEGIN
        CASE (l_grpid_02_mux_s) IS
            WHEN "0" => l_grpid_02_mux_q <= in_l_grpid_02_1;
            WHEN "1" => l_grpid_02_mux_q <= in_l_grpid_02_0;
            WHEN OTHERS => l_grpid_02_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_02(GPOUT,22)
    out_l_grpid_02 <= l_grpid_02_mux_q;

    -- l_grpid_0_addr_zext8_mux(MUX,18)
    l_grpid_0_addr_zext8_mux_s <= in_valid_in_0;
    l_grpid_0_addr_zext8_mux_combproc: PROCESS (l_grpid_0_addr_zext8_mux_s, in_l_grpid_0_addr_zext8_1, in_l_grpid_0_addr_zext8_0)
    BEGIN
        CASE (l_grpid_0_addr_zext8_mux_s) IS
            WHEN "0" => l_grpid_0_addr_zext8_mux_q <= in_l_grpid_0_addr_zext8_1;
            WHEN "1" => l_grpid_0_addr_zext8_mux_q <= in_l_grpid_0_addr_zext8_0;
            WHEN OTHERS => l_grpid_0_addr_zext8_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_0_addr_zext8(GPOUT,23)
    out_l_grpid_0_addr_zext8 <= l_grpid_0_addr_zext8_mux_q;

    -- local_id_015_mux(MUX,19)
    local_id_015_mux_s <= in_valid_in_0;
    local_id_015_mux_combproc: PROCESS (local_id_015_mux_s, in_local_id_015_1, in_local_id_015_0)
    BEGIN
        CASE (local_id_015_mux_s) IS
            WHEN "0" => local_id_015_mux_q <= in_local_id_015_1;
            WHEN "1" => local_id_015_mux_q <= in_local_id_015_0;
            WHEN OTHERS => local_id_015_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_local_id_015(GPOUT,24)
    out_local_id_015 <= local_id_015_mux_q;

    -- valid_or(LOGICAL,30)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,28)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,25)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,29)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,26)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,27)
    out_valid_out <= valid_or_q;

END normal;
