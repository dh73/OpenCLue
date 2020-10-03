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

-- VHDL created from bb_matvec_mult_B0
-- VHDL created on Wed Sep 16 13:09:16 2020


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

entity bb_matvec_mult_B0 is
    port (
        in_dot : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_matvec_mult1_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_matvec_mult2_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_m : in std_logic_vector(63 downto 0);  -- ufix64
        in_result : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_matvec_mult0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_matvec_mult1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_matvec_mult2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_matvec_mult2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_matvec_mult2_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_matvec_mult0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_matvec_mult0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_matvec_mult1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_matvec_mult1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_matvec_mult1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_matvec_mult2_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_matvec_mult2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_matvec_mult2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_matvec_mult2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_matvec_mult2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_matvec_mult_B0;

architecture normal of bb_matvec_mult_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_matvec_mult_B0_stall_region is
        port (
            in_dot : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult1_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult2_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_matvec_mult2_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_m : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_result : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_matvec_mult2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_matvec_mult2_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_matvec_mult2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component matvec_mult_B0_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component matvec_mult_B0_merge is
        port (
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_matvec_mult_B0_stall_region_out_lsu_unnamed_matvec_mult2_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_matvec_mult_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal matvec_mult_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal matvec_mult_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- matvec_mult_B0_branch(BLACKBOX,25)
    thematvec_mult_B0_branch : matvec_mult_B0_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_matvec_mult_B0_stall_region_out_valid_out,
        out_stall_out => matvec_mult_B0_branch_out_stall_out,
        out_valid_out_0 => matvec_mult_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- matvec_mult_B0_merge(BLACKBOX,26)
    thematvec_mult_B0_merge : matvec_mult_B0_merge
    PORT MAP (
        in_global_id_0_0 => in_global_id_0_0,
        in_stall_in => bb_matvec_mult_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_global_id_0 => matvec_mult_B0_merge_out_global_id_0,
        out_stall_out_0 => matvec_mult_B0_merge_out_stall_out_0,
        out_valid_out => matvec_mult_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_matvec_mult_B0_stall_region(BLACKBOX,2)
    thebb_matvec_mult_B0_stall_region : bb_matvec_mult_B0_stall_region
    PORT MAP (
        in_dot => in_dot,
        in_flush => in_flush,
        in_global_id_0 => matvec_mult_B0_merge_out_global_id_0,
        in_lsu_unnamed_matvec_mult1_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_matvec_mult1_sts_stream_size => in_lsu_unnamed_matvec_mult1_sts_stream_size,
        in_lsu_unnamed_matvec_mult2_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_matvec_mult2_sts_stream_size => in_lsu_unnamed_matvec_mult2_sts_stream_size,
        in_m => in_m,
        in_result => in_result,
        in_stall_in => matvec_mult_B0_branch_out_stall_out,
        in_unnamed_matvec_mult0_avm_readdata => in_unnamed_matvec_mult0_avm_readdata,
        in_unnamed_matvec_mult0_avm_readdatavalid => in_unnamed_matvec_mult0_avm_readdatavalid,
        in_unnamed_matvec_mult0_avm_waitrequest => in_unnamed_matvec_mult0_avm_waitrequest,
        in_unnamed_matvec_mult0_avm_writeack => in_unnamed_matvec_mult0_avm_writeack,
        in_unnamed_matvec_mult1_avm_readdata => in_unnamed_matvec_mult1_avm_readdata,
        in_unnamed_matvec_mult1_avm_readdatavalid => in_unnamed_matvec_mult1_avm_readdatavalid,
        in_unnamed_matvec_mult1_avm_waitrequest => in_unnamed_matvec_mult1_avm_waitrequest,
        in_unnamed_matvec_mult1_avm_writeack => in_unnamed_matvec_mult1_avm_writeack,
        in_unnamed_matvec_mult2_avm_readdata => in_unnamed_matvec_mult2_avm_readdata,
        in_unnamed_matvec_mult2_avm_readdatavalid => in_unnamed_matvec_mult2_avm_readdatavalid,
        in_unnamed_matvec_mult2_avm_waitrequest => in_unnamed_matvec_mult2_avm_waitrequest,
        in_unnamed_matvec_mult2_avm_writeack => in_unnamed_matvec_mult2_avm_writeack,
        in_valid_in => matvec_mult_B0_merge_out_valid_out,
        out_lsu_unnamed_matvec_mult2_o_active => bb_matvec_mult_B0_stall_region_out_lsu_unnamed_matvec_mult2_o_active,
        out_stall_out => bb_matvec_mult_B0_stall_region_out_stall_out,
        out_unnamed_matvec_mult0_avm_address => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_address,
        out_unnamed_matvec_mult0_avm_burstcount => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_burstcount,
        out_unnamed_matvec_mult0_avm_byteenable => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_byteenable,
        out_unnamed_matvec_mult0_avm_enable => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_enable,
        out_unnamed_matvec_mult0_avm_read => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_read,
        out_unnamed_matvec_mult0_avm_write => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_write,
        out_unnamed_matvec_mult0_avm_writedata => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_writedata,
        out_unnamed_matvec_mult1_avm_address => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_address,
        out_unnamed_matvec_mult1_avm_burstcount => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_burstcount,
        out_unnamed_matvec_mult1_avm_byteenable => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_byteenable,
        out_unnamed_matvec_mult1_avm_enable => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_enable,
        out_unnamed_matvec_mult1_avm_read => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_read,
        out_unnamed_matvec_mult1_avm_write => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_write,
        out_unnamed_matvec_mult1_avm_writedata => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_writedata,
        out_unnamed_matvec_mult2_avm_address => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_address,
        out_unnamed_matvec_mult2_avm_burstcount => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_burstcount,
        out_unnamed_matvec_mult2_avm_byteenable => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_byteenable,
        out_unnamed_matvec_mult2_avm_enable => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_enable,
        out_unnamed_matvec_mult2_avm_read => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_read,
        out_unnamed_matvec_mult2_avm_write => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_write,
        out_unnamed_matvec_mult2_avm_writedata => bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_writedata,
        out_valid_out => bb_matvec_mult_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_lsu_unnamed_matvec_mult2_o_active(GPOUT,27)
    out_lsu_unnamed_matvec_mult2_o_active <= bb_matvec_mult_B0_stall_region_out_lsu_unnamed_matvec_mult2_o_active;

    -- out_stall_out_0(GPOUT,28)
    out_stall_out_0 <= matvec_mult_B0_merge_out_stall_out_0;

    -- out_unnamed_matvec_mult0_avm_address(GPOUT,29)
    out_unnamed_matvec_mult0_avm_address <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_address;

    -- out_unnamed_matvec_mult0_avm_burstcount(GPOUT,30)
    out_unnamed_matvec_mult0_avm_burstcount <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_burstcount;

    -- out_unnamed_matvec_mult0_avm_byteenable(GPOUT,31)
    out_unnamed_matvec_mult0_avm_byteenable <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_byteenable;

    -- out_unnamed_matvec_mult0_avm_enable(GPOUT,32)
    out_unnamed_matvec_mult0_avm_enable <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_enable;

    -- out_unnamed_matvec_mult0_avm_read(GPOUT,33)
    out_unnamed_matvec_mult0_avm_read <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_read;

    -- out_unnamed_matvec_mult0_avm_write(GPOUT,34)
    out_unnamed_matvec_mult0_avm_write <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_write;

    -- out_unnamed_matvec_mult0_avm_writedata(GPOUT,35)
    out_unnamed_matvec_mult0_avm_writedata <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult0_avm_writedata;

    -- out_unnamed_matvec_mult1_avm_address(GPOUT,36)
    out_unnamed_matvec_mult1_avm_address <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_address;

    -- out_unnamed_matvec_mult1_avm_burstcount(GPOUT,37)
    out_unnamed_matvec_mult1_avm_burstcount <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_burstcount;

    -- out_unnamed_matvec_mult1_avm_byteenable(GPOUT,38)
    out_unnamed_matvec_mult1_avm_byteenable <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_byteenable;

    -- out_unnamed_matvec_mult1_avm_enable(GPOUT,39)
    out_unnamed_matvec_mult1_avm_enable <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_enable;

    -- out_unnamed_matvec_mult1_avm_read(GPOUT,40)
    out_unnamed_matvec_mult1_avm_read <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_read;

    -- out_unnamed_matvec_mult1_avm_write(GPOUT,41)
    out_unnamed_matvec_mult1_avm_write <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_write;

    -- out_unnamed_matvec_mult1_avm_writedata(GPOUT,42)
    out_unnamed_matvec_mult1_avm_writedata <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult1_avm_writedata;

    -- out_unnamed_matvec_mult2_avm_address(GPOUT,43)
    out_unnamed_matvec_mult2_avm_address <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_address;

    -- out_unnamed_matvec_mult2_avm_burstcount(GPOUT,44)
    out_unnamed_matvec_mult2_avm_burstcount <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_burstcount;

    -- out_unnamed_matvec_mult2_avm_byteenable(GPOUT,45)
    out_unnamed_matvec_mult2_avm_byteenable <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_byteenable;

    -- out_unnamed_matvec_mult2_avm_enable(GPOUT,46)
    out_unnamed_matvec_mult2_avm_enable <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_enable;

    -- out_unnamed_matvec_mult2_avm_read(GPOUT,47)
    out_unnamed_matvec_mult2_avm_read <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_read;

    -- out_unnamed_matvec_mult2_avm_write(GPOUT,48)
    out_unnamed_matvec_mult2_avm_write <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_write;

    -- out_unnamed_matvec_mult2_avm_writedata(GPOUT,49)
    out_unnamed_matvec_mult2_avm_writedata <= bb_matvec_mult_B0_stall_region_out_unnamed_matvec_mult2_avm_writedata;

    -- out_valid_out_0(GPOUT,50)
    out_valid_out_0 <= matvec_mult_B0_branch_out_valid_out_0;

END normal;
