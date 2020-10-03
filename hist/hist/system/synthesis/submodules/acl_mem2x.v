// (C) 1992-2012 Altera Corporation. All rights reserved.                         
// Your use of Altera Corporation's design tools, logic functions and other       
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Altera MegaCore Function License Agreement, or other applicable     
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Altera and sold by   
// Altera or its authorized distributors.  Please refer to the applicable         
// agreement for further details.                                                 
    
// NOTE: We don't properly handle the interaction of loads and stores on
// different 2x cycles but the same 1x cycle.  As such to ensure the proper
// read during write behaviour you must follow these constraints:
// In "NEW_DATA" mode stores should be to ports 2 and 4.
// In "OLD_DATA" mode stores should be to ports 1 and 3.
// Currently this is enforced in PortAssignments.cpp

module acl_mem2x
#(
  parameter DEPTH_WORDS=1,
  parameter WIDTH=32,
  parameter RDW_MODE="DONT_CARE",
  parameter RAM_OPERATION_MODE = "BIDIR_DUAL_PORT",     // altsyncram's OPERATION_MODE parameter
  parameter RAM_BLOCK_TYPE = "AUTO",                    // altsyncram's RAM_BLOCK_TYPE parameter
  parameter INTENDED_DEVICE_FAMILY = "Stratix IV",      // altsyncram's INTENDED_DEVICE_FAMILY parameter
  parameter ENABLED = 0, //use enable inputs
  parameter PREFERRED_WIDTH = 160,
  /*MAXIMUM_DEPTH gets passed straight to the altsyncram maximum_depth parameter which controls the maximum physical depth of the M20K being instantiated. This helps override the quartus heuristic that decides whether to width-stich or depth-stich M20Ks to create a large memory. The default value is 0 which puts no restriction on the M20K depth.*/
  parameter MAXIMUM_DEPTH = 0,
  parameter MIF_FILE_PREFIX = "NONE"
)
(
    input clk,
    input clk2x,
    input resetn,
    input avs_port1_enable,
    input avs_port2_enable,
    input avs_port3_enable,
    input avs_port4_enable,
    input [WIDTH-1:0] avs_port1_writedata,
    input [WIDTH-1:0] avs_port2_writedata,
    input [WIDTH-1:0] avs_port3_writedata,
    input [WIDTH-1:0] avs_port4_writedata,
    input [WIDTH/8-1:0] avs_port1_byteenable,
    input [WIDTH/8-1:0] avs_port2_byteenable,
    input [WIDTH/8-1:0] avs_port3_byteenable,
    input [WIDTH/8-1:0] avs_port4_byteenable,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port1_address,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port2_address,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port3_address,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port4_address,
    input avs_port1_read,
    input avs_port2_read,
    input avs_port3_read,
    input avs_port4_read,
    input avs_port1_write,
    input avs_port2_write,
    input avs_port3_write,
    input avs_port4_write,
    output reg [WIDTH-1:0] avs_port1_readdata,
    output reg [WIDTH-1:0] avs_port2_readdata,
    output reg [WIDTH-1:0] avs_port3_readdata,
    output reg [WIDTH-1:0] avs_port4_readdata,
    output avs_port1_readdatavalid,
    output avs_port2_readdatavalid,
    output avs_port3_readdatavalid,
    output avs_port4_readdatavalid,
    output avs_port1_waitrequest,
    output avs_port2_waitrequest,
    output avs_port3_waitrequest,
    output avs_port4_waitrequest
    );

  localparam LOG2DEPTH = $clog2( DEPTH_WORDS );
  localparam RAM_RDW_MODE = (RDW_MODE == "OLD_DATA") ? "OLD_DATA" : "DONT_CARE";

  assign avs_port1_waitrequest=1'b0;
  assign avs_port2_waitrequest=1'b0;
  assign avs_port3_waitrequest=1'b0;
  assign avs_port4_waitrequest=1'b0;

  wire port1_enable;
  wire port2_enable;
  wire port3_enable;
  wire port4_enable;

  logic stall_port_a;
  logic stall_port_b;

generate
if (ENABLED) begin
    assign port1_enable = avs_port1_enable;
    assign port2_enable = avs_port2_enable;
    assign port3_enable = avs_port3_enable;
    assign port4_enable = avs_port4_enable;
end else begin
    assign port1_enable = 1'b1;
    assign port2_enable = 1'b1;
    assign port3_enable = 1'b1;
    assign port4_enable = 1'b1;
end
endgenerate


  wire [WIDTH-1:0] data_out_a_mem;
  wire [WIDTH-1:0] data_out_b_mem;
  wire [WIDTH-1:0] data_out_a_unreg;
  wire [WIDTH-1:0] data_out_b_unreg;
  reg  [WIDTH-1:0] data_out_a_reg;
  reg  [WIDTH-1:0] data_out_b_reg;
  reg  [WIDTH-1:0] data_out_a_reg2;
  reg  [WIDTH-1:0] data_out_b_reg2;

  _acl_mem2x_shiftreg readatavalid_1(.D(avs_port1_read), .clock(clk), .resetn(resetn), .enable(port1_enable), .Q(avs_port1_readdatavalid));
    defparam readatavalid_1.WIDTH = 1;
    defparam readatavalid_1.DEPTH = 4;

  _acl_mem2x_shiftreg readatavalid_2(.D(avs_port2_read), .clock(clk), .resetn(resetn), .enable(port2_enable), .Q(avs_port2_readdatavalid));
    defparam readatavalid_2.WIDTH = 1;
    defparam readatavalid_2.DEPTH = 4;

  _acl_mem2x_shiftreg readatavalid_3(.D(avs_port3_read), .clock(clk), .resetn(resetn), .enable(port3_enable), .Q(avs_port3_readdatavalid));
    defparam readatavalid_3.WIDTH = 1;
    defparam readatavalid_3.DEPTH = 4;

  _acl_mem2x_shiftreg readatavalid_4(.D(avs_port4_read), .clock(clk), .resetn(resetn), .enable(port4_enable), .Q(avs_port4_readdatavalid));
    defparam readatavalid_4.WIDTH = 1;
    defparam readatavalid_4.DEPTH = 4;


localparam NUM_RAMS=((WIDTH+PREFERRED_WIDTH-1)/PREFERRED_WIDTH);
localparam reg[31:0] INT2CHAR[127:0] = '{"127", "126", "125", "124", "123", "122", "121", "120", "119", "118", "117", "116", "115", "114", "113", "112", "111", "110", "109", "108", "107", "106", "105", "104", "103", "102", "101", "100", "99", "98", "97", "96", "95", "94", "93", "92", "91", "90", "89", "88", "87", "86", "85", "84", "83", "82", "81", "80", "79", "78", "77", "76", "75", "74", "73", "72", "71", "70", "69", "68", "67", "66", "65", "64", "63", "62", "61", "60", "59", "58", "57", "56", "55", "54", "53", "52", "51", "50", "49", "48", "47", "46", "45", "44", "43", "42", "41", "40", "39", "38", "37", "36", "35", "34", "33", "32", "31", "30", "29", "28", "27", "26", "25", "24", "23", "22", "21", "20", "19", "18", "17", "16", "15", "14", "13", "12", "11", "10", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0"};

assign stall_port_a = ENABLED && (~port1_enable & ~port2_enable); //ports 1 and 2 must share the same enable source
assign stall_port_b = ENABLED && (~port3_enable & ~port4_enable); //ports 3 and 4 must share the same enable source

genvar n;
genvar b;
generate
   for(n=0; n<NUM_RAMS; n++)
   begin : block_n
   
   localparam MY_WIDTH=( (n==NUM_RAMS-1) ? (WIDTH-(NUM_RAMS-1)*PREFERRED_WIDTH) : PREFERRED_WIDTH );
   localparam MY_WIDTH_BYTES = MY_WIDTH / 8;
   localparam reg[1023:0] TEMP_NAME = {INT2CHAR[n], ".mif"};
   localparam MIF_FILE = ( (MIF_FILE_PREFIX == "NONE") ? "UNUSED" : { MIF_FILE_PREFIX , TEMP_NAME} );

   reg [LOG2DEPTH-1:0] addr_1_reg2x /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_2_reg2x /* synthesis dont_merge */;
   reg write_1_reg2x /* synthesis dont_merge */;
   reg write_2_reg2x /* synthesis dont_merge */;
   
   reg [LOG2DEPTH-1:0] addr_1_reg /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_2_reg /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_3_reg /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_4_reg /* synthesis dont_merge */;
   reg write_1_reg, write_2_reg /* synthesis dont_merge */;
   reg write_3_reg, write_4_reg /* synthesis dont_merge */;

   reg [MY_WIDTH-1:0] data_1_reg2x /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_2_reg2x /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_1_reg2x /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_2_reg2x /* synthesis dont_merge */;

   reg [MY_WIDTH-1:0] data_1_reg /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_2_reg /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_3_reg /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_4_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_1_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_2_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_3_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_4_reg /* synthesis dont_merge */;

   // Bypass signals (all in 2x domain)
   wire [MY_WIDTH-1:0]  port1_bypass;
   wire [MY_WIDTH-1:0]  port2_bypass;
   wire                 port1_bypass_valid_lookahead;
   wire                 port2_bypass_valid_lookahead;
   wire                 port1_bypass_valid;
   wire                 port2_bypass_valid;
   wire [MY_WIDTH-1:0]  port1_readdata_new;
   wire [MY_WIDTH-1:0]  port2_readdata_new;
   wire [MY_WIDTH/8-1:0] port1_byteenable_late;
   wire [MY_WIDTH/8-1:0] port2_byteenable_late; 

   reg clk_1x_toggle             /* synthesis dont_merge */;      // toggles on every rising edge of clk
   reg clk_1x_toggle_clk2x       /* synthesis dont_merge */;      // clk_1x_toggle clocked onto the clk2x clock
   reg clk_1x_toggle_clk2x_dly   /* synthesis dont_merge */;      // clk_1x_toggle_clk2x delyaed by one clk2x clock cycle
   reg sel2x                     /* sytnthesis maxfan=32 */;      // sel2x = ~clk, output synchronous with clk2x

   always @(posedge clk or negedge resetn) begin
      if (!resetn) begin                     // reset only necessary for simulation, in real HW phase of this signal is not relevant
         clk_1x_toggle <= 1'b0;
      end else begin
         clk_1x_toggle <= ~clk_1x_toggle;    // toggle on every cycle of clk
      end
   end
   
   always @(posedge clk2x) begin
      clk_1x_toggle_clk2x <= clk_1x_toggle;                    // bring clk_1x_toggle into the clk2x clock domain
      clk_1x_toggle_clk2x_dly <= clk_1x_toggle_clk2x;          // delay by one clk2x clock cycle
      if (clk_1x_toggle_clk2x == clk_1x_toggle_clk2x_dly ) begin
         sel2x <= 1'b1;
      end else begin
         sel2x <= 1'b0;
      end
   end

   always@(posedge clk2x)
   begin
    if (!resetn & ENABLED) begin
       addr_1_reg2x <= {LOG2DEPTH{1'b0}};
       addr_2_reg2x <= {LOG2DEPTH{1'b0}};
       write_1_reg2x <= 1'b0;
       write_2_reg2x <= 1'b0;
    end else begin
       if(!ENABLED | (port1_enable | port2_enable)) begin
          addr_1_reg2x <= (!sel2x) ? addr_2_reg : addr_1_reg;
          write_1_reg2x <= (!sel2x) ? write_2_reg : write_1_reg;
       end

       if(!ENABLED | (port3_enable | port4_enable)) begin
          addr_2_reg2x <= (!sel2x) ? addr_4_reg : addr_3_reg;
          write_2_reg2x <= (!sel2x) ? write_4_reg : write_3_reg;
       end
    end
   end

   always@(posedge clk)
   begin
    if (!resetn & ENABLED) begin
       addr_1_reg <= {LOG2DEPTH{1'b0}};
       addr_2_reg <= {LOG2DEPTH{1'b0}};
       addr_3_reg <= {LOG2DEPTH{1'b0}};
       addr_4_reg <= {LOG2DEPTH{1'b0}};
       write_1_reg <= 1'b0;
       write_2_reg <= 1'b0;
       write_3_reg <= 1'b0;
       write_4_reg <= 1'b0;
    end else begin
       if(!ENABLED | port1_enable) begin
          addr_1_reg <= avs_port1_address;
          write_1_reg <= avs_port1_write;
       end

       if(!ENABLED | port2_enable) begin
          addr_2_reg <= avs_port2_address;
          write_2_reg <= avs_port2_write;
       end

       if(!ENABLED | port3_enable) begin
          addr_3_reg <= avs_port3_address;
          write_3_reg <= avs_port3_write;
       end

       if(!ENABLED | port4_enable) begin
          addr_4_reg <= avs_port4_address;
          write_4_reg <= avs_port4_write;
       end
    end
   end


   //Register before double pumping
   always@(posedge clk)
   begin
    if (!resetn & ENABLED) begin
       data_1_reg <= {MY_WIDTH{1'b0}};
       data_2_reg <= {MY_WIDTH{1'b0}};
       data_3_reg <= {MY_WIDTH{1'b0}};
       data_4_reg <= {MY_WIDTH{1'b0}};
       byteen_1_reg <= {(MY_WIDTH/8){1'b1}};
       byteen_2_reg <= {(MY_WIDTH/8){1'b1}};
       byteen_3_reg <= {(MY_WIDTH/8){1'b1}};
       byteen_4_reg <= {(MY_WIDTH/8){1'b1}};
    end else begin
       if(!ENABLED | port1_enable) begin
          data_1_reg <= avs_port1_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
          byteen_1_reg <= avs_port1_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
       end

       if(!ENABLED | port2_enable) begin
          data_2_reg <= avs_port2_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
          byteen_2_reg <= avs_port2_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
       end

       if(!ENABLED | port3_enable) begin
          data_3_reg <= avs_port3_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
          byteen_3_reg <= avs_port3_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
       end

       if(!ENABLED | port4_enable) begin
          data_4_reg <= avs_port4_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
          byteen_4_reg <= avs_port4_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
       end
    end
   end

   // Consider making only one port r/w and the rest read only
   always@(posedge clk2x)
   begin
    if (!resetn & ENABLED) begin
       data_1_reg2x <= {MY_WIDTH{1'b0}};
       data_2_reg2x <= {MY_WIDTH{1'b0}};
       byteen_1_reg2x <= {(MY_WIDTH/8){1'b1}};
       byteen_2_reg2x <= {(MY_WIDTH/8){1'b1}};
    end else begin
       if(!ENABLED | (port1_enable | port2_enable)) begin
          data_1_reg2x <= (!sel2x) ? data_2_reg : data_1_reg;
          byteen_1_reg2x <= (!sel2x) ? byteen_2_reg : byteen_1_reg;
       end

       if(!ENABLED | (port3_enable | port4_enable)) begin
          data_2_reg2x <= (!sel2x) ? data_4_reg : data_3_reg;
          byteen_2_reg2x <= (!sel2x) ? byteen_4_reg : byteen_3_reg;
       end
    end
   end

  if (RDW_MODE == "NEW_DATA")
  begin
    // Implement a bypass to emulate READ_DURING_WRITE_MODE == "NEW_DATA" for
    // alsyncram in Stratix 10, which only supports "DONT_CARE"
    // This is not used for any families older than Stratix 10 as they all
    // support OLD_DATA and we only need one or the other to break mem deps
    _acl_mem2x_shiftreg bypass_1(.D(data_2_reg2x), .clock(clk2x), .resetn(resetn), .enable(port1_enable | port2_enable), .Q(port1_bypass));
      defparam bypass_1.WIDTH = MY_WIDTH;
      defparam bypass_1.DEPTH = 2;
    _acl_mem2x_shiftreg bypass_2(.D(data_1_reg2x), .clock(clk2x), .resetn(resetn), .enable(port3_enable | port4_enable), .Q(port2_bypass));
      defparam bypass_2.WIDTH = MY_WIDTH;
      defparam bypass_2.DEPTH = 2;

    assign port1_bypass_valid_lookahead = (addr_1_reg2x == addr_2_reg2x) & write_2_reg2x & (port3_enable | port4_enable);
    assign port2_bypass_valid_lookahead = (addr_1_reg2x == addr_2_reg2x) & write_1_reg2x & (port1_enable | port2_enable);
    _acl_mem2x_shiftreg bypass_valid_1(.D(port1_bypass_valid_lookahead), .clock(clk2x), .resetn(resetn), .enable(port1_enable | port2_enable), .Q(port1_bypass_valid));
      defparam bypass_valid_1.WIDTH = 1;
      defparam bypass_valid_1.DEPTH = 2;
    _acl_mem2x_shiftreg bypass_valid_2(.D(port2_bypass_valid_lookahead), .clock(clk2x), .resetn(resetn), .enable(port3_enable | port4_enable), .Q(port2_bypass_valid));
      defparam bypass_valid_2.WIDTH = 1;
      defparam bypass_valid_2.DEPTH = 2;

    _acl_mem2x_shiftreg byteenable_1(.D(byteen_1_reg2x), .clock(clk2x), .resetn(resetn), .enable(port3_enable | port4_enable), .Q(port1_byteenable_late));
      defparam byteenable_1.WIDTH = MY_WIDTH/8;
      defparam byteenable_1.DEPTH = 2;
    _acl_mem2x_shiftreg byteenable_2(.D(byteen_2_reg2x), .clock(clk2x), .resetn(resetn), .enable(port1_enable | port2_enable), .Q(port2_byteenable_late));
      defparam byteenable_2.WIDTH = MY_WIDTH/8;
      defparam byteenable_2.DEPTH = 2;

    // Using byte enable, compose the return value from the value read
    // from memory and the bypass value
    for(b=0; b<MY_WIDTH/8; b++)
    begin : byte_b
      assign port1_readdata_new[b*8+:8] = (port1_bypass_valid & port2_byteenable_late[b]) ? port1_bypass[b*8+:8] : data_out_a_mem[n*PREFERRED_WIDTH + b*8+:8];
      assign port2_readdata_new[b*8+:8] = (port2_bypass_valid & port1_byteenable_late[b]) ? port2_bypass[b*8+:8] : data_out_b_mem[n*PREFERRED_WIDTH + b*8+:8];
    end
  end
  else
  begin
    assign port1_readdata_new = data_out_a_mem[n*PREFERRED_WIDTH +: MY_WIDTH];
    assign port2_readdata_new = data_out_b_mem[n*PREFERRED_WIDTH +: MY_WIDTH];
  end

   altsyncram altsyncram_component (
    .clock0 (clk2x),
    .wren_a (write_1_reg2x && !stall_port_a),
    .wren_b (write_2_reg2x && !stall_port_b),
    .address_a (addr_1_reg2x),
    .address_b (addr_2_reg2x),
    .data_a (data_1_reg2x),
    .data_b (data_2_reg2x),
    .q_a (data_out_a_mem[n*PREFERRED_WIDTH +: MY_WIDTH]),
    .q_b (data_out_b_mem[n*PREFERRED_WIDTH +: MY_WIDTH]),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (stall_port_a), 
    .addressstall_b (stall_port_b), 
    .byteena_a (byteen_1_reg2x),
    .byteena_b (byteen_2_reg2x),
    .clock1 (1'b1),
    .clocken0 (1'b1),
    .clocken1 (1'b1),
    .clocken2 (1'b1),
    .clocken3 (1'b1),
    .eccstatus (),
    .rden_a (1'b1),
    .rden_b (1'b1));
  defparam
  altsyncram_component.address_reg_b = "CLOCK0",
  altsyncram_component.maximum_depth = MAXIMUM_DEPTH,
    altsyncram_component.clock_enable_input_a = "BYPASS",
    altsyncram_component.clock_enable_input_b = "BYPASS",
    altsyncram_component.clock_enable_output_a = "BYPASS",
    altsyncram_component.clock_enable_output_b = "BYPASS",
    altsyncram_component.address_reg_b = "CLOCK0",
    altsyncram_component.rdcontrol_reg_b = "CLOCK0",
    altsyncram_component.byteena_reg_b = "CLOCK0",
    altsyncram_component.indata_reg_b = "CLOCK0",
    altsyncram_component.intended_device_family = INTENDED_DEVICE_FAMILY,
    altsyncram_component.lpm_type = "altsyncram",
    altsyncram_component.numwords_a = DEPTH_WORDS,
    altsyncram_component.numwords_b = DEPTH_WORDS,
    altsyncram_component.operation_mode = RAM_OPERATION_MODE,
    altsyncram_component.outdata_aclr_a = "NONE",
    altsyncram_component.outdata_aclr_b = "NONE",
    altsyncram_component.outdata_reg_a = "CLOCK0",
    altsyncram_component.outdata_reg_b = "CLOCK0",
    altsyncram_component.power_up_uninitialized = "FALSE",
    altsyncram_component.read_during_write_mode_mixed_ports = RAM_RDW_MODE,
    altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
    altsyncram_component.read_during_write_mode_port_b = "DONT_CARE",
    altsyncram_component.widthad_a = LOG2DEPTH,
    altsyncram_component.widthad_b = LOG2DEPTH,
    altsyncram_component.width_a = MY_WIDTH,
    altsyncram_component.width_b = MY_WIDTH,
    altsyncram_component.width_byteena_a = MY_WIDTH_BYTES,
    altsyncram_component.width_byteena_b = MY_WIDTH_BYTES,
    altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0",
    altsyncram_component.ram_block_type = RAM_BLOCK_TYPE,
    altsyncram_component.init_file = MIF_FILE;


if (ENABLED) begin
    // catch read output data if disabled
    // this should be synthesized away if enable is tied to 1
    acl_mem_staging_reg #(
       .WIDTH(MY_WIDTH)
    ) data_a_acl_mem_staging_reg (
       .clk (clk2x),
       .resetn (resetn),
       .enable (port1_enable | port2_enable),
       .rdata_in (port1_readdata_new),
       .rdata_out(data_out_a_unreg[n*PREFERRED_WIDTH +: MY_WIDTH])
    );

    acl_mem_staging_reg #(
       .WIDTH(MY_WIDTH)
    ) data_b_acl_mem_staging_reg (
       .clk (clk2x),
       .resetn (resetn),
       .enable (port3_enable | port4_enable),
       .rdata_in (port2_readdata_new),
       .rdata_out(data_out_b_unreg[n*PREFERRED_WIDTH +: MY_WIDTH])
    );
end else begin
    assign data_out_a_unreg[n*PREFERRED_WIDTH +: MY_WIDTH] = port1_readdata_new;
    assign data_out_b_unreg[n*PREFERRED_WIDTH +: MY_WIDTH] = port2_readdata_new;
end

  end
endgenerate

  always@(posedge clk2x)
  begin
    if (!ENABLED | (port1_enable | port2_enable)) begin
       data_out_a_reg<=data_out_a_unreg;
       data_out_a_reg2<=data_out_a_reg;
    end

    if (!ENABLED | (port3_enable | port4_enable)) begin
       data_out_b_reg<=data_out_b_unreg;
       data_out_b_reg2<=data_out_b_reg;
    end
  end

  always@(posedge clk)
  begin
    if (!ENABLED | port1_enable) begin
       avs_port1_readdata <= data_out_a_reg;
    end
    if (!ENABLED | port2_enable) begin
       avs_port2_readdata <= data_out_a_reg2;
    end
    if (!ENABLED | port3_enable) begin
       avs_port3_readdata <= data_out_b_reg;
    end
    if (!ENABLED | port4_enable) begin
       avs_port4_readdata <= data_out_b_reg2;
    end
  end

endmodule


/*********************************************************************************
 * Support components
 *********************************************************************************/

module _acl_mem2x_shiftreg(D, clock, resetn, enable, Q);
  parameter WIDTH = 32;
  parameter DEPTH = 1;
  input [WIDTH-1:0] D;
  input clock, resetn, enable;
  output [WIDTH-1:0] Q;
  
  reg [DEPTH-1:0][WIDTH-1:0] local_ffs /* synthesis preserve */;

  always @(posedge clock or negedge resetn)
    if (!resetn)
      local_ffs <= '0;
    else if (enable)
      local_ffs <= {local_ffs[DEPTH-2:0], D};
  assign Q = local_ffs[DEPTH-1];
endmodule

// vim:set filetype=verilog:

