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

-- VHDL created from bb_histogram_B3_sr_1
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

entity bb_histogram_B3_sr_1 is
    port (
        in_i_data_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_data_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_data_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_histogram_B3_sr_1;

architecture normal of bb_histogram_B3_sr_1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_2_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal data_mux_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_4_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_5_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_5_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_6_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_2_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal sr_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_5_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal combined_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_sr_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_and_valid_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- not_sr_valid(LOGICAL,35)
    not_sr_valid_q <= not (sr_valid_q);

    -- sr_0_x(REG,27)
    sr_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_0_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_0_x_q <= in_i_data_0;
            END IF;
        END IF;
    END PROCESS;

    -- combined_valid(LOGICAL,34)
    combined_valid_q <= in_i_valid or sr_valid_q;

    -- stall_and_valid(LOGICAL,37)
    stall_and_valid_q <= in_i_stall and combined_valid_q;

    -- sr_valid(REG,36)
    sr_valid_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_valid_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            sr_valid_q <= stall_and_valid_q;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- data_mux_0_x(MUX,2)
    data_mux_0_x_s <= sr_valid_q;
    data_mux_0_x_combproc: PROCESS (data_mux_0_x_s, in_i_data_0, sr_0_x_q)
    BEGIN
        CASE (data_mux_0_x_s) IS
            WHEN "0" => data_mux_0_x_q <= in_i_data_0;
            WHEN "1" => data_mux_0_x_q <= sr_0_x_q;
            WHEN OTHERS => data_mux_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_0(GPOUT,18)
    out_o_data_0 <= data_mux_0_x_q;

    -- sr_1_x(REG,28)
    sr_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_1_x_q <= in_i_data_1;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_1_x(MUX,3)
    data_mux_1_x_s <= sr_valid_q;
    data_mux_1_x_combproc: PROCESS (data_mux_1_x_s, in_i_data_1, sr_1_x_q)
    BEGIN
        CASE (data_mux_1_x_s) IS
            WHEN "0" => data_mux_1_x_q <= in_i_data_1;
            WHEN "1" => data_mux_1_x_q <= sr_1_x_q;
            WHEN OTHERS => data_mux_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_1(GPOUT,19)
    out_o_data_1 <= data_mux_1_x_q;

    -- sr_2_x(REG,29)
    sr_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_2_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_2_x_q <= in_i_data_2;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_2_x(MUX,4)
    data_mux_2_x_s <= sr_valid_q;
    data_mux_2_x_combproc: PROCESS (data_mux_2_x_s, in_i_data_2, sr_2_x_q)
    BEGIN
        CASE (data_mux_2_x_s) IS
            WHEN "0" => data_mux_2_x_q <= in_i_data_2;
            WHEN "1" => data_mux_2_x_q <= sr_2_x_q;
            WHEN OTHERS => data_mux_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_2(GPOUT,20)
    out_o_data_2 <= data_mux_2_x_q;

    -- sr_3_x(REG,30)
    sr_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_3_x_q <= in_i_data_3;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_3_x(MUX,5)
    data_mux_3_x_s <= sr_valid_q;
    data_mux_3_x_combproc: PROCESS (data_mux_3_x_s, in_i_data_3, sr_3_x_q)
    BEGIN
        CASE (data_mux_3_x_s) IS
            WHEN "0" => data_mux_3_x_q <= in_i_data_3;
            WHEN "1" => data_mux_3_x_q <= sr_3_x_q;
            WHEN OTHERS => data_mux_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_3(GPOUT,21)
    out_o_data_3 <= data_mux_3_x_q;

    -- sr_4_x(REG,31)
    sr_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_4_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_4_x_q <= in_i_data_4;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_4_x(MUX,6)
    data_mux_4_x_s <= sr_valid_q;
    data_mux_4_x_combproc: PROCESS (data_mux_4_x_s, in_i_data_4, sr_4_x_q)
    BEGIN
        CASE (data_mux_4_x_s) IS
            WHEN "0" => data_mux_4_x_q <= in_i_data_4;
            WHEN "1" => data_mux_4_x_q <= sr_4_x_q;
            WHEN OTHERS => data_mux_4_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_4(GPOUT,22)
    out_o_data_4 <= data_mux_4_x_q;

    -- sr_5_x(REG,32)
    sr_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_5_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_5_x_q <= in_i_data_5;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_5_x(MUX,7)
    data_mux_5_x_s <= sr_valid_q;
    data_mux_5_x_combproc: PROCESS (data_mux_5_x_s, in_i_data_5, sr_5_x_q)
    BEGIN
        CASE (data_mux_5_x_s) IS
            WHEN "0" => data_mux_5_x_q <= in_i_data_5;
            WHEN "1" => data_mux_5_x_q <= sr_5_x_q;
            WHEN OTHERS => data_mux_5_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_5(GPOUT,23)
    out_o_data_5 <= data_mux_5_x_q;

    -- sr_6_x(REG,33)
    sr_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_6_x_q <= in_i_data_6;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_6_x(MUX,8)
    data_mux_6_x_s <= sr_valid_q;
    data_mux_6_x_combproc: PROCESS (data_mux_6_x_s, in_i_data_6, sr_6_x_q)
    BEGIN
        CASE (data_mux_6_x_s) IS
            WHEN "0" => data_mux_6_x_q <= in_i_data_6;
            WHEN "1" => data_mux_6_x_q <= sr_6_x_q;
            WHEN OTHERS => data_mux_6_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_6(GPOUT,24)
    out_o_data_6 <= data_mux_6_x_q;

    -- out_o_stall(GPOUT,25)
    out_o_stall <= sr_valid_q;

    -- out_o_valid(GPOUT,26)
    out_o_valid <= combined_valid_q;

END normal;
