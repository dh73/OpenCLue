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

-- VHDL created from histogram_B2_merge
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

entity histogram_B2_merge is
    port (
        in_acl_hw_wg_id28_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_013_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_05_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_local_id_018_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_local_linear_id22_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_013 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_local_id_018 : out std_logic_vector(31 downto 0);  -- ufix32
        out_local_linear_id22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end histogram_B2_merge;

architecture normal of histogram_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_acl_hw_wg_id28(GPOUT,10)
    out_acl_hw_wg_id28 <= in_acl_hw_wg_id28_0;

    -- out_global_id_013(GPOUT,11)
    out_global_id_013 <= in_global_id_013_0;

    -- out_l_grpid_05(GPOUT,12)
    out_l_grpid_05 <= in_l_grpid_05_0;

    -- out_l_grpid_0_addr_zext11(GPOUT,13)
    out_l_grpid_0_addr_zext11 <= in_l_grpid_0_addr_zext11_0;

    -- out_local_id_018(GPOUT,14)
    out_local_id_018 <= in_local_id_018_0;

    -- out_local_linear_id22(GPOUT,15)
    out_local_linear_id22 <= in_local_linear_id22_0;

    -- stall_out(LOGICAL,18)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,16)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,17)
    out_valid_out <= in_valid_in_0;

END normal;
