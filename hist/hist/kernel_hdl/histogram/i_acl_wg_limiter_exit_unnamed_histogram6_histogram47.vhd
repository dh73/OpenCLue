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

-- VHDL created from i_acl_wg_limiter_exit_unnamed_histogram6_histogram47
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

entity i_acl_wg_limiter_exit_unnamed_histogram6_histogram47 is
    port (
        in_data_in : in std_logic_vector(31 downto 0);  -- ufix32
        in_exit_stall_out : in std_logic_vector(0 downto 0);  -- ufix1
        in_exit_valid_out : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out : out std_logic_vector(31 downto 0);  -- ufix32
        out_exit_stall_in : out std_logic_vector(0 downto 0);  -- ufix1
        out_exit_valid_in : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_wg_limiter_exit_unnamed_histogram6_histogram47;

architecture normal of i_acl_wg_limiter_exit_unnamed_histogram6_histogram47 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component wgl_exit_storage is
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


    signal wgl_exit_storage_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal wgl_exit_storage_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal wgl_exit_storage_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- wgl_exit_storage(BLACKBOX,6)@20000000
    -- out out_data_out@20000001
    -- out out_valid_out@20000001
    thewgl_exit_storage : wgl_exit_storage
    PORT MAP (
        in_data_in => in_data_in,
        in_stall_in => in_stall_in,
        in_valid_in => in_exit_valid_out,
        out_data_out => wgl_exit_storage_out_data_out,
        out_stall_out => wgl_exit_storage_out_stall_out,
        out_valid_out => wgl_exit_storage_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_x(GPOUT,3)@1
    out_data_out <= wgl_exit_storage_out_data_out;
    out_exit_stall_in <= wgl_exit_storage_out_stall_out;
    out_exit_valid_in <= in_valid_in;
    out_valid_out <= wgl_exit_storage_out_valid_out;

    -- sync_out(GPOUT,5)@20000000
    out_stall_out <= in_exit_stall_out;

END normal;
