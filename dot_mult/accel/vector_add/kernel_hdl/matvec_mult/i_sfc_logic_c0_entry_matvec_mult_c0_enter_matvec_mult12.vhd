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

-- VHDL created from i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12
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

entity i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12 is
    port (
        in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni2_0_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_1_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_2_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_3_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_0_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_1_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_2_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_3_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi1_0_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi1_1_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi1_2_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi1_3_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12;

architecture normal of i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_addBlock_A0Zcp36cd0oq3cd06oq3cz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    component floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_multBlockA0Z16oe0cp36cd0oq3cdj6z is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;





    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add3_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add5_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul1_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul2_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul4_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_i_matvec_mult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul_i_matvec_mult_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_mul1_i_matvec_mult_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add_i_matvec_mult_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_add3_i_matvec_mult_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_vunroll_x_in_i_valid_52_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_reset0 : std_logic;
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i : signal is true;
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_eq : std_logic;
    attribute preserve of redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_eq : signal is true;
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_q : signal is true;
    signal redist1_i_mul4_i_matvec_mult_out_primWireOut_31_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_reset0 : std_logic;
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i : signal is true;
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_eq : std_logic;
    attribute preserve of redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_eq : signal is true;
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_q : signal is true;
    signal redist2_i_mul2_i_matvec_mult_out_primWireOut_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist6_sync_in_aunroll_vunroll_x_in_i_valid_52(DELAY,18)
    redist6_sync_in_aunroll_vunroll_x_in_i_valid_52 : dspba_delay
    GENERIC MAP ( width => 1, depth => 52, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist6_sync_in_aunroll_vunroll_x_in_i_valid_52_q, clk => clock, aclr => resetn );

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_notEnable(LOGICAL,27)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_nor(LOGICAL,28)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_nor_q <= not (redist1_i_mul4_i_matvec_mult_out_primWireOut_31_notEnable_q or redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_q);

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_last(CONSTANT,24)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_last_q <= "011010";

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp(LOGICAL,25)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp_b <= STD_LOGIC_VECTOR("0" & redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_q);
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp_q <= "1" WHEN redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_last_q = redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp_b ELSE "0";

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmpReg(REG,26)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmpReg_q <= STD_LOGIC_VECTOR(redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmp_q);
        END IF;
    END PROCESS;

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena(REG,29)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_mul4_i_matvec_mult_out_primWireOut_31_nor_q = "1") THEN
                redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_i_mul4_i_matvec_mult_out_primWireOut_31_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_enaAnd(LOGICAL,30)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_enaAnd_q <= redist1_i_mul4_i_matvec_mult_out_primWireOut_31_sticky_ena_q and VCC_q;

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt(COUNTER,22)
    -- low=0, high=27, step=1, init=0
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_eq <= '1';
            ELSE
                redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_eq <= '0';
            END IF;
            IF (redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_eq = '1') THEN
                redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i <= redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i + 5;
            ELSE
                redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i <= redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_i, 5)));

    -- i_mul4_i_matvec_mult(BLACKBOX,10)@4
    -- out out_primWireOut@11
    thei_mul4_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_multBlockA0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c0_eni2_3_1,
        in_1 => in_c0_eni2_3_2,
        out_primWireOut => i_mul4_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_inputreg(DELAY,19)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul4_i_matvec_mult_out_primWireOut, xout => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_inputreg_q, clk => clock, aclr => resetn );

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_wraddr(REG,23)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_mul4_i_matvec_mult_out_primWireOut_31_wraddr_q <= STD_LOGIC_VECTOR(redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem(DUALMEM,21)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_ia <= STD_LOGIC_VECTOR(redist1_i_mul4_i_matvec_mult_out_primWireOut_31_inputreg_q);
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_aa <= redist1_i_mul4_i_matvec_mult_out_primWireOut_31_wraddr_q;
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_ab <= redist1_i_mul4_i_matvec_mult_out_primWireOut_31_rdcnt_q;
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_reset0 <= not (resetn);
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 28,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_reset0,
        clock1 => clock,
        address_a => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_aa,
        data_a => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_ab,
        q_b => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_iq
    );
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_q <= redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_iq(31 downto 0);

    -- redist1_i_mul4_i_matvec_mult_out_primWireOut_31_outputreg(DELAY,20)
    redist1_i_mul4_i_matvec_mult_out_primWireOut_31_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_mem_q, xout => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_outputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_notEnable(LOGICAL,39)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_nor(LOGICAL,40)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_nor_q <= not (redist2_i_mul2_i_matvec_mult_out_primWireOut_16_notEnable_q or redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_q);

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_last(CONSTANT,36)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_last_q <= "01011";

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp(LOGICAL,37)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_q);
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp_q <= "1" WHEN redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_last_q = redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp_b ELSE "0";

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmpReg(REG,38)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmpReg_q <= STD_LOGIC_VECTOR(redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena(REG,41)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_mul2_i_matvec_mult_out_primWireOut_16_nor_q = "1") THEN
                redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_i_mul2_i_matvec_mult_out_primWireOut_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_enaAnd(LOGICAL,42)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_enaAnd_q <= redist2_i_mul2_i_matvec_mult_out_primWireOut_16_sticky_ena_q and VCC_q;

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt(COUNTER,34)
    -- low=0, high=12, step=1, init=0
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_eq <= '1';
            ELSE
                redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_eq <= '0';
            END IF;
            IF (redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_eq = '1') THEN
                redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i <= redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i + 4;
            ELSE
                redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i <= redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_i, 4)));

    -- i_mul2_i_matvec_mult(BLACKBOX,9)@4
    -- out out_primWireOut@11
    thei_mul2_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_multBlockA0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c0_eni2_2_1,
        in_1 => in_c0_eni2_2_2,
        out_primWireOut => i_mul2_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_inputreg(DELAY,31)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul2_i_matvec_mult_out_primWireOut, xout => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_inputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_wraddr(REG,35)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_wraddr_q <= "1100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_mul2_i_matvec_mult_out_primWireOut_16_wraddr_q <= STD_LOGIC_VECTOR(redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem(DUALMEM,33)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_ia <= STD_LOGIC_VECTOR(redist2_i_mul2_i_matvec_mult_out_primWireOut_16_inputreg_q);
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_aa <= redist2_i_mul2_i_matvec_mult_out_primWireOut_16_wraddr_q;
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_ab <= redist2_i_mul2_i_matvec_mult_out_primWireOut_16_rdcnt_q;
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_reset0 <= not (resetn);
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 13,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_reset0,
        clock1 => clock,
        address_a => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_aa,
        data_a => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_ab,
        q_b => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_iq
    );
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_q <= redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_iq(31 downto 0);

    -- redist2_i_mul2_i_matvec_mult_out_primWireOut_16_outputreg(DELAY,32)
    redist2_i_mul2_i_matvec_mult_out_primWireOut_16_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_mem_q, xout => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul1_i_matvec_mult(BLACKBOX,8)@4
    -- out out_primWireOut@11
    thei_mul1_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_multBlockA0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c0_eni2_1_1,
        in_1 => in_c0_eni2_1_2,
        out_primWireOut => i_mul1_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_mul1_i_matvec_mult_out_primWireOut_1(DELAY,15)
    redist3_i_mul1_i_matvec_mult_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul1_i_matvec_mult_out_primWireOut, xout => redist3_i_mul1_i_matvec_mult_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_mul_i_matvec_mult(BLACKBOX,11)@4
    -- out out_primWireOut@11
    thei_mul_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_multBlockA0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c0_eni2_0_1,
        in_1 => in_c0_eni2_0_2,
        out_primWireOut => i_mul_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_mul_i_matvec_mult_out_primWireOut_1(DELAY,12)
    redist0_i_mul_i_matvec_mult_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_i_matvec_mult_out_primWireOut, xout => redist0_i_mul_i_matvec_mult_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add_i_matvec_mult(BLACKBOX,7)@12
    -- out out_primWireOut@26
    thei_add_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_addBlock_A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist0_i_mul_i_matvec_mult_out_primWireOut_1_q,
        in_1 => redist3_i_mul1_i_matvec_mult_out_primWireOut_1_q,
        out_primWireOut => i_add_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_add_i_matvec_mult_out_primWireOut_1(DELAY,16)
    redist4_i_add_i_matvec_mult_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add_i_matvec_mult_out_primWireOut, xout => redist4_i_add_i_matvec_mult_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add3_i_matvec_mult(BLACKBOX,5)@27
    -- out out_primWireOut@41
    thei_add3_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_addBlock_A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist4_i_add_i_matvec_mult_out_primWireOut_1_q,
        in_1 => redist2_i_mul2_i_matvec_mult_out_primWireOut_16_outputreg_q,
        out_primWireOut => i_add3_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_add3_i_matvec_mult_out_primWireOut_1(DELAY,17)
    redist5_i_add3_i_matvec_mult_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add3_i_matvec_mult_out_primWireOut, xout => redist5_i_add3_i_matvec_mult_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add5_i_matvec_mult(BLACKBOX,6)@42
    -- out out_primWireOut@56
    thei_add5_i_matvec_mult : floatComponent_i_sfc_logic_c0_entry_matvec_mult_c0_enter_matvec_mult12_addBlock_A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist5_i_add3_i_matvec_mult_out_primWireOut_1_q,
        in_1 => redist1_i_mul4_i_matvec_mult_out_primWireOut_31_outputreg_q,
        out_primWireOut => i_add5_i_matvec_mult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_vunroll_x(GPOUT,3)@56
    out_c0_exi1_0 <= GND_q;
    out_c0_exi1_0_1 <= i_add5_i_matvec_mult_out_primWireOut;
    out_c0_exi1_1_1 <= i_add5_i_matvec_mult_out_primWireOut;
    out_c0_exi1_2_1 <= i_add5_i_matvec_mult_out_primWireOut;
    out_c0_exi1_3_1 <= i_add5_i_matvec_mult_out_primWireOut;
    out_o_valid <= redist6_sync_in_aunroll_vunroll_x_in_i_valid_52_q;

END normal;
