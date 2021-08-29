//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2008 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arbitrator (
                                                               // inputs:
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest,
                                                                clk,
                                                                cpu_data_master_address_to_slave,
                                                                cpu_data_master_byteenable,
                                                                cpu_data_master_read,
                                                                cpu_data_master_waitrequest,
                                                                cpu_data_master_write,
                                                                cpu_data_master_writedata,
                                                                reset_n,

                                                               // outputs:
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write,
                                                                NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata,
                                                                cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                                                cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                                                cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                                                cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                                                d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer
                                                             )
;

  output  [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address;
  output  [  1: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa;
  output  [  2: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read;
  output  [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write;
  output  [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata;
  output           cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  output           cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  output           cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  output           cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  output           d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket;
  input   [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest;
  input            clk;
  input   [ 16: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_allgrants;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_allow_new_arb_cycle;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_bursting_master_saved_grant;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_continuerequest;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_counter_enable;
  reg              NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter_next_value;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_set_values;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_beginbursttransfer_internal;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_begins_xfer;
  wire    [  1: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_firsttransfer;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_grant_vector;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_read_cycle;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_write_cycle;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_master_qreq_vector;
  wire    [  2: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_non_bursting_master_requests;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa;
  reg              NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reg_firsttransfer;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n;
  reg              NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable2;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_unreg_firsttransfer;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_read;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_write;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_saved_grant_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  reg              d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_from_cpu_data_master;
  wire             wait_for_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
    end


  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in));
  //assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata;

  assign cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in = ({cpu_data_master_address_to_slave[16 : 5] , 5'b0} == 17'h10840) & (cpu_data_master_read | cpu_data_master_write);
  //assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter set values, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_set_values = 1;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_bursting_master_saved_grant = 0;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter_next_value = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_firsttransfer ? (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_set_values - 1) : |NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter ? (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter - 1) : 0;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_allgrants all slave grants, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_allgrants = |NiosII_stratixII_2s60_RoHS_fast_clock_0_in_grant_vector;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer = ~(NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_read | NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer & (~NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & NiosII_stratixII_2s60_RoHS_fast_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & ~NiosII_stratixII_2s60_RoHS_fast_clock_0_in_non_bursting_master_requests);

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter <= 0;
      else if (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_counter_enable)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter <= NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter_next_value;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|NiosII_stratixII_2s60_RoHS_fast_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in) | (end_xfer_arb_share_counter_term_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & ~NiosII_stratixII_2s60_RoHS_fast_clock_0_in_non_bursting_master_requests))
          NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable <= |NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master NiosII_stratixII_2s60_RoHS_fast_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable2 = |NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master NiosII_stratixII_2s60_RoHS_fast_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in = cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata = cpu_data_master_writedata;

  //assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in = cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;

  //cpu/data_master saved-grant NiosII_stratixII_2s60_RoHS_fast_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_NiosII_stratixII_2s60_RoHS_fast_clock_0_in = cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;

  //allow new arb cycle for NiosII_stratixII_2s60_RoHS_fast_clock_0/in, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_master_qreq_vector = 1;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n = reset_n;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_firsttransfer = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_begins_xfer ? NiosII_stratixII_2s60_RoHS_fast_clock_0_in_unreg_firsttransfer : NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reg_firsttransfer;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_unreg_firsttransfer = ~(NiosII_stratixII_2s60_RoHS_fast_clock_0_in_slavearbiterlockenable & NiosII_stratixII_2s60_RoHS_fast_clock_0_in_any_continuerequest);

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_begins_xfer)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reg_firsttransfer <= NiosII_stratixII_2s60_RoHS_fast_clock_0_in_unreg_firsttransfer;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_beginbursttransfer_internal = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_begins_xfer;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read assignment, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read = cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & cpu_data_master_read;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write assignment, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write = cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & cpu_data_master_write;

  assign shifted_address_to_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address = shifted_address_to_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_from_cpu_data_master >> 2;

  //slaveid NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer <= 1;
      else if (1)
          d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer <= NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_read = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_read_cycle & NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_read_cycle = cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_read_cycle;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waits_for_write = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_write_cycle & NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_write_cycle = cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = NiosII_stratixII_2s60_RoHS_fast_clock_0_in_in_a_write_cycle;

  assign wait_for_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_counter = 0;
  //NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable = (cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //NiosII_stratixII_2s60_RoHS_fast_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module NiosII_stratixII_2s60_RoHS_fast_clock_0_out_arbitrator (
                                                                // inputs:
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata,
                                                                 clk,
                                                                 d1_pll_s1_end_xfer,
                                                                 pll_s1_readdata_from_sa,
                                                                 reset_n,

                                                                // outputs:
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n,
                                                                 NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest
                                                              )
;

  output  [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave;
  output  [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest;
  input   [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write;
  input   [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata;
  input            clk;
  input            d1_pll_s1_end_xfer;
  input   [ 15: 0] pll_s1_readdata_from_sa;
  input            reset_n;

  reg     [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_last_time;
  wire    [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave;
  reg              NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_last_time;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_run;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest;
  reg              NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write_last_time;
  reg     [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1 | ~NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read | (1 & ~d1_pll_s1_end_xfer & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read))) & ((~NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1 | ~NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write | (1 & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0/out readdata mux, which is an e_mux
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata = pll_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest = ~NiosII_stratixII_2s60_RoHS_fast_clock_0_out_run;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n assignment, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_last_time <= 0;
      else if (1)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_last_time <= NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest & (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read | NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write);
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address != NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_last_time))
        begin
          $write("%0d ns: NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_last_time <= 0;
      else if (1)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_last_time <= NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read != NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_last_time))
        begin
          $write("%0d ns: NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write_last_time <= 0;
      else if (1)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write_last_time <= NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write != NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write_last_time))
        begin
          $write("%0d ns: NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata_last_time <= 0;
      else if (1)
          NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata_last_time <= NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata != NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata_last_time) & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write)
        begin
          $write("%0d ns: NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 16: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 16: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg              cpu_jtag_debug_module_arb_share_counter;
  wire             cpu_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 16: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 16: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[16 : 11] , 11'b0} == 17'h10000) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector;

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[16 : 11] , 11'b0} == 17'h10000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //assign lhs ~cpu_jtag_debug_module_reset of type reset_n to cpu_jtag_debug_module_reset_n, which is an e_assign
  assign cpu_jtag_debug_module_reset = ~cpu_jtag_debug_module_reset_n;

  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else if (1)
          d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa,
                                     NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_high_res_timer_s1,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_onchip_ram_s1,
                                     cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_high_res_timer_s1,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_onchip_ram_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_high_res_timer_s1,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_onchip_ram_s1,
                                     cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_high_res_timer_s1,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_onchip_ram_s1,
                                     cpu_data_master_write,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_high_res_timer_s1_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_onchip_ram_s1_end_xfer,
                                     high_res_timer_s1_irq_from_sa,
                                     high_res_timer_s1_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     onchip_ram_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_onchip_ram_s1,
                                     reset_n,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_irq,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 16: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_irq;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input   [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa;
  input            clk;
  input   [ 16: 0] cpu_data_master_address;
  input            cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_high_res_timer_s1;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_onchip_ram_s1;
  input            cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_high_res_timer_s1;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_onchip_ram_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_high_res_timer_s1;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_onchip_ram_s1;
  input            cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_high_res_timer_s1;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_onchip_ram_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_high_res_timer_s1_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            high_res_timer_s1_irq_from_sa;
  input   [ 15: 0] high_res_timer_s1_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  input            reset_n;

  wire    [ 16: 0] cpu_data_master_address_to_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in | ~cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in) & ((~cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_requests_high_res_timer_s1) & ((~cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_onchip_ram_s1 | registered_cpu_data_master_read_data_valid_onchip_ram_s1 | ~cpu_data_master_requests_onchip_ram_s1) & (cpu_data_master_granted_onchip_ram_s1 | ~cpu_data_master_qualified_request_onchip_ram_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_ram_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[16 : 0];

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else if (1)
          registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in}} | NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | jtag_uart_avalon_jtag_slave_readdata_from_sa);

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_high_res_timer_s1}} | high_res_timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else if (1)
          cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    high_res_timer_s1_irq_from_sa};


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_ram_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_ram_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_ram_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_ram_s1_end_xfer,
                                            onchip_ram_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 16: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 16: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_ram_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_ram_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_ram_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_ram_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 16: 0] cpu_instruction_master_address_last_time;
  wire    [ 16: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_requests_onchip_ram_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_instruction_master_granted_onchip_ram_s1 | ~cpu_instruction_master_qualified_request_onchip_ram_s1) & ((~cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_read | (1 & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[16 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else if (1)
          cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_onchip_ram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_onchip_ram_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else if (1)
          cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_instruction_master_requests_onchip_ram_s1}} & 2;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else if (1)
          cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else if (1)
          cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module high_res_timer_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_read,
                                       cpu_data_master_waitrequest,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       high_res_timer_s1_irq,
                                       high_res_timer_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_data_master_granted_high_res_timer_s1,
                                       cpu_data_master_qualified_request_high_res_timer_s1,
                                       cpu_data_master_read_data_valid_high_res_timer_s1,
                                       cpu_data_master_requests_high_res_timer_s1,
                                       d1_high_res_timer_s1_end_xfer,
                                       high_res_timer_s1_address,
                                       high_res_timer_s1_chipselect,
                                       high_res_timer_s1_irq_from_sa,
                                       high_res_timer_s1_readdata_from_sa,
                                       high_res_timer_s1_reset_n,
                                       high_res_timer_s1_write_n,
                                       high_res_timer_s1_writedata
                                    )
;

  output           cpu_data_master_granted_high_res_timer_s1;
  output           cpu_data_master_qualified_request_high_res_timer_s1;
  output           cpu_data_master_read_data_valid_high_res_timer_s1;
  output           cpu_data_master_requests_high_res_timer_s1;
  output           d1_high_res_timer_s1_end_xfer;
  output  [  2: 0] high_res_timer_s1_address;
  output           high_res_timer_s1_chipselect;
  output           high_res_timer_s1_irq_from_sa;
  output  [ 15: 0] high_res_timer_s1_readdata_from_sa;
  output           high_res_timer_s1_reset_n;
  output           high_res_timer_s1_write_n;
  output  [ 15: 0] high_res_timer_s1_writedata;
  input            clk;
  input   [ 16: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            high_res_timer_s1_irq;
  input   [ 15: 0] high_res_timer_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_high_res_timer_s1;
  wire             cpu_data_master_qualified_request_high_res_timer_s1;
  wire             cpu_data_master_read_data_valid_high_res_timer_s1;
  wire             cpu_data_master_requests_high_res_timer_s1;
  wire             cpu_data_master_saved_grant_high_res_timer_s1;
  reg              d1_high_res_timer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_high_res_timer_s1;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_allgrants;
  wire             high_res_timer_s1_allow_new_arb_cycle;
  wire             high_res_timer_s1_any_bursting_master_saved_grant;
  wire             high_res_timer_s1_any_continuerequest;
  wire             high_res_timer_s1_arb_counter_enable;
  reg              high_res_timer_s1_arb_share_counter;
  wire             high_res_timer_s1_arb_share_counter_next_value;
  wire             high_res_timer_s1_arb_share_set_values;
  wire             high_res_timer_s1_beginbursttransfer_internal;
  wire             high_res_timer_s1_begins_xfer;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_end_xfer;
  wire             high_res_timer_s1_firsttransfer;
  wire             high_res_timer_s1_grant_vector;
  wire             high_res_timer_s1_in_a_read_cycle;
  wire             high_res_timer_s1_in_a_write_cycle;
  wire             high_res_timer_s1_irq_from_sa;
  wire             high_res_timer_s1_master_qreq_vector;
  wire             high_res_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  reg              high_res_timer_s1_reg_firsttransfer;
  wire             high_res_timer_s1_reset_n;
  reg              high_res_timer_s1_slavearbiterlockenable;
  wire             high_res_timer_s1_slavearbiterlockenable2;
  wire             high_res_timer_s1_unreg_firsttransfer;
  wire             high_res_timer_s1_waits_for_read;
  wire             high_res_timer_s1_waits_for_write;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 16: 0] shifted_address_to_high_res_timer_s1_from_cpu_data_master;
  wire             wait_for_high_res_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~high_res_timer_s1_end_xfer;
    end


  assign high_res_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_high_res_timer_s1));
  //assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata;

  assign cpu_data_master_requests_high_res_timer_s1 = ({cpu_data_master_address_to_slave[16 : 5] , 5'b0} == 17'h10800) & (cpu_data_master_read | cpu_data_master_write);
  //high_res_timer_s1_arb_share_counter set values, which is an e_mux
  assign high_res_timer_s1_arb_share_set_values = 1;

  //high_res_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign high_res_timer_s1_non_bursting_master_requests = cpu_data_master_requests_high_res_timer_s1;

  //high_res_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign high_res_timer_s1_any_bursting_master_saved_grant = 0;

  //high_res_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign high_res_timer_s1_arb_share_counter_next_value = high_res_timer_s1_firsttransfer ? (high_res_timer_s1_arb_share_set_values - 1) : |high_res_timer_s1_arb_share_counter ? (high_res_timer_s1_arb_share_counter - 1) : 0;

  //high_res_timer_s1_allgrants all slave grants, which is an e_mux
  assign high_res_timer_s1_allgrants = |high_res_timer_s1_grant_vector;

  //high_res_timer_s1_end_xfer assignment, which is an e_assign
  assign high_res_timer_s1_end_xfer = ~(high_res_timer_s1_waits_for_read | high_res_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_high_res_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_high_res_timer_s1 = high_res_timer_s1_end_xfer & (~high_res_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //high_res_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign high_res_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_high_res_timer_s1 & high_res_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_high_res_timer_s1 & ~high_res_timer_s1_non_bursting_master_requests);

  //high_res_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_arb_share_counter <= 0;
      else if (high_res_timer_s1_arb_counter_enable)
          high_res_timer_s1_arb_share_counter <= high_res_timer_s1_arb_share_counter_next_value;
    end


  //high_res_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_slavearbiterlockenable <= 0;
      else if ((|high_res_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_high_res_timer_s1) | (end_xfer_arb_share_counter_term_high_res_timer_s1 & ~high_res_timer_s1_non_bursting_master_requests))
          high_res_timer_s1_slavearbiterlockenable <= |high_res_timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master high_res_timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = high_res_timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //high_res_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign high_res_timer_s1_slavearbiterlockenable2 = |high_res_timer_s1_arb_share_counter_next_value;

  //cpu/data_master high_res_timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = high_res_timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //high_res_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign high_res_timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_high_res_timer_s1 = cpu_data_master_requests_high_res_timer_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //high_res_timer_s1_writedata mux, which is an e_mux
  assign high_res_timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_high_res_timer_s1 = cpu_data_master_qualified_request_high_res_timer_s1;

  //cpu/data_master saved-grant high_res_timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_high_res_timer_s1 = cpu_data_master_requests_high_res_timer_s1;

  //allow new arb cycle for high_res_timer/s1, which is an e_assign
  assign high_res_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign high_res_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign high_res_timer_s1_master_qreq_vector = 1;

  //high_res_timer_s1_reset_n assignment, which is an e_assign
  assign high_res_timer_s1_reset_n = reset_n;

  assign high_res_timer_s1_chipselect = cpu_data_master_granted_high_res_timer_s1;
  //high_res_timer_s1_firsttransfer first transaction, which is an e_assign
  assign high_res_timer_s1_firsttransfer = high_res_timer_s1_begins_xfer ? high_res_timer_s1_unreg_firsttransfer : high_res_timer_s1_reg_firsttransfer;

  //high_res_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign high_res_timer_s1_unreg_firsttransfer = ~(high_res_timer_s1_slavearbiterlockenable & high_res_timer_s1_any_continuerequest);

  //high_res_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_reg_firsttransfer <= 1'b1;
      else if (high_res_timer_s1_begins_xfer)
          high_res_timer_s1_reg_firsttransfer <= high_res_timer_s1_unreg_firsttransfer;
    end


  //high_res_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign high_res_timer_s1_beginbursttransfer_internal = high_res_timer_s1_begins_xfer;

  //~high_res_timer_s1_write_n assignment, which is an e_mux
  assign high_res_timer_s1_write_n = ~(cpu_data_master_granted_high_res_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_high_res_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //high_res_timer_s1_address mux, which is an e_mux
  assign high_res_timer_s1_address = shifted_address_to_high_res_timer_s1_from_cpu_data_master >> 2;

  //d1_high_res_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_high_res_timer_s1_end_xfer <= 1;
      else if (1)
          d1_high_res_timer_s1_end_xfer <= high_res_timer_s1_end_xfer;
    end


  //high_res_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign high_res_timer_s1_waits_for_read = high_res_timer_s1_in_a_read_cycle & high_res_timer_s1_begins_xfer;

  //high_res_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign high_res_timer_s1_in_a_read_cycle = cpu_data_master_granted_high_res_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = high_res_timer_s1_in_a_read_cycle;

  //high_res_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign high_res_timer_s1_waits_for_write = high_res_timer_s1_in_a_write_cycle & 0;

  //high_res_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign high_res_timer_s1_in_a_write_cycle = cpu_data_master_granted_high_res_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = high_res_timer_s1_in_a_write_cycle;

  assign wait_for_high_res_timer_s1_counter = 0;
  //assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //high_res_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_read,
                                                 cpu_data_master_waitrequest,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 16: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 16: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[16 : 3] , 3'b0} == 17'h10820) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else if (1)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_ram_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_latency_counter,
                                   cpu_instruction_master_read,
                                   onchip_ram_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_ram_s1,
                                   cpu_data_master_qualified_request_onchip_ram_s1,
                                   cpu_data_master_read_data_valid_onchip_ram_s1,
                                   cpu_data_master_requests_onchip_ram_s1,
                                   cpu_instruction_master_granted_onchip_ram_s1,
                                   cpu_instruction_master_qualified_request_onchip_ram_s1,
                                   cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                   cpu_instruction_master_requests_onchip_ram_s1,
                                   d1_onchip_ram_s1_end_xfer,
                                   onchip_ram_s1_address,
                                   onchip_ram_s1_byteenable,
                                   onchip_ram_s1_chipselect,
                                   onchip_ram_s1_clken,
                                   onchip_ram_s1_readdata_from_sa,
                                   onchip_ram_s1_reset_n,
                                   onchip_ram_s1_write,
                                   onchip_ram_s1_writedata,
                                   registered_cpu_data_master_read_data_valid_onchip_ram_s1
                                )
;

  output           cpu_data_master_granted_onchip_ram_s1;
  output           cpu_data_master_qualified_request_onchip_ram_s1;
  output           cpu_data_master_read_data_valid_onchip_ram_s1;
  output           cpu_data_master_requests_onchip_ram_s1;
  output           cpu_instruction_master_granted_onchip_ram_s1;
  output           cpu_instruction_master_qualified_request_onchip_ram_s1;
  output           cpu_instruction_master_read_data_valid_onchip_ram_s1;
  output           cpu_instruction_master_requests_onchip_ram_s1;
  output           d1_onchip_ram_s1_end_xfer;
  output  [ 13: 0] onchip_ram_s1_address;
  output  [  3: 0] onchip_ram_s1_byteenable;
  output           onchip_ram_s1_chipselect;
  output           onchip_ram_s1_clken;
  output  [ 31: 0] onchip_ram_s1_readdata_from_sa;
  output           onchip_ram_s1_reset_n;
  output           onchip_ram_s1_write;
  output  [ 31: 0] onchip_ram_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  input            clk;
  input   [ 16: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 16: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] onchip_ram_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_saved_grant_onchip_ram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_saved_grant_onchip_ram_s1;
  reg              d1_onchip_ram_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_ram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
  wire    [ 13: 0] onchip_ram_s1_address;
  wire             onchip_ram_s1_allgrants;
  wire             onchip_ram_s1_allow_new_arb_cycle;
  wire             onchip_ram_s1_any_bursting_master_saved_grant;
  wire             onchip_ram_s1_any_continuerequest;
  reg     [  1: 0] onchip_ram_s1_arb_addend;
  wire             onchip_ram_s1_arb_counter_enable;
  reg              onchip_ram_s1_arb_share_counter;
  wire             onchip_ram_s1_arb_share_counter_next_value;
  wire             onchip_ram_s1_arb_share_set_values;
  wire    [  1: 0] onchip_ram_s1_arb_winner;
  wire             onchip_ram_s1_arbitration_holdoff_internal;
  wire             onchip_ram_s1_beginbursttransfer_internal;
  wire             onchip_ram_s1_begins_xfer;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire    [  3: 0] onchip_ram_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_ram_s1_chosen_master_rot_left;
  wire             onchip_ram_s1_clken;
  wire             onchip_ram_s1_end_xfer;
  wire             onchip_ram_s1_firsttransfer;
  wire    [  1: 0] onchip_ram_s1_grant_vector;
  wire             onchip_ram_s1_in_a_read_cycle;
  wire             onchip_ram_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_ram_s1_master_qreq_vector;
  wire             onchip_ram_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  reg              onchip_ram_s1_reg_firsttransfer;
  wire             onchip_ram_s1_reset_n;
  reg     [  1: 0] onchip_ram_s1_saved_chosen_master_vector;
  reg              onchip_ram_s1_slavearbiterlockenable;
  wire             onchip_ram_s1_slavearbiterlockenable2;
  wire             onchip_ram_s1_unreg_firsttransfer;
  wire             onchip_ram_s1_waits_for_read;
  wire             onchip_ram_s1_waits_for_write;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  wire    [ 16: 0] shifted_address_to_onchip_ram_s1_from_cpu_data_master;
  wire    [ 16: 0] shifted_address_to_onchip_ram_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_ram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~onchip_ram_s1_end_xfer;
    end


  assign onchip_ram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_ram_s1 | cpu_instruction_master_qualified_request_onchip_ram_s1));
  //assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata;

  assign cpu_data_master_requests_onchip_ram_s1 = ({cpu_data_master_address_to_slave[16] , 16'b0} == 17'h0) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_ram_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register[0];

  //onchip_ram_s1_arb_share_counter set values, which is an e_mux
  assign onchip_ram_s1_arb_share_set_values = 1;

  //onchip_ram_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_ram_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1 |
    cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_ram_s1_any_bursting_master_saved_grant = 0;

  //onchip_ram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_ram_s1_arb_share_counter_next_value = onchip_ram_s1_firsttransfer ? (onchip_ram_s1_arb_share_set_values - 1) : |onchip_ram_s1_arb_share_counter ? (onchip_ram_s1_arb_share_counter - 1) : 0;

  //onchip_ram_s1_allgrants all slave grants, which is an e_mux
  assign onchip_ram_s1_allgrants = |onchip_ram_s1_grant_vector |
    |onchip_ram_s1_grant_vector |
    |onchip_ram_s1_grant_vector |
    |onchip_ram_s1_grant_vector;

  //onchip_ram_s1_end_xfer assignment, which is an e_assign
  assign onchip_ram_s1_end_xfer = ~(onchip_ram_s1_waits_for_read | onchip_ram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_ram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_ram_s1 = onchip_ram_s1_end_xfer & (~onchip_ram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_ram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_ram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_ram_s1 & onchip_ram_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests);

  //onchip_ram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_share_counter <= 0;
      else if (onchip_ram_s1_arb_counter_enable)
          onchip_ram_s1_arb_share_counter <= onchip_ram_s1_arb_share_counter_next_value;
    end


  //onchip_ram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_ram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_ram_s1) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests))
          onchip_ram_s1_slavearbiterlockenable <= |onchip_ram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_ram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_ram_s1_slavearbiterlockenable2 = |onchip_ram_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= cpu_instruction_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 & cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_ram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_ram_s1 = cpu_data_master_requests_onchip_ram_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_ram_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read & ~onchip_ram_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_ram_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_data_master_read_data_valid_onchip_ram_s1_shift_register, cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else if (1)
          cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register[1];

  //onchip_ram_s1_writedata mux, which is an e_mux
  assign onchip_ram_s1_writedata = cpu_data_master_writedata;

  //mux onchip_ram_s1_clken, which is an e_mux
  assign onchip_ram_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_ram_s1 = (({cpu_instruction_master_address_to_slave[16] , 16'b0} == 17'h0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= cpu_data_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 & cpu_data_master_requests_onchip_ram_s1;

  assign cpu_instruction_master_qualified_request_onchip_ram_s1 = cpu_instruction_master_requests_onchip_ram_s1 & ~((cpu_instruction_master_read & ((2 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read & ~onchip_ram_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else if (1)
          cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1 = cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register[1];

  //allow new arb cycle for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_ram_s1;

  //cpu/instruction_master grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_ram_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_ram_s1;

  //cpu/data_master grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[1] && cpu_data_master_requests_onchip_ram_s1;

  //onchip_ram/s1 chosen-master double-vector, which is an e_assign
  assign onchip_ram_s1_chosen_master_double_vector = {onchip_ram_s1_master_qreq_vector, onchip_ram_s1_master_qreq_vector} & ({~onchip_ram_s1_master_qreq_vector, ~onchip_ram_s1_master_qreq_vector} + onchip_ram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_ram_s1_arb_winner = (onchip_ram_s1_allow_new_arb_cycle & | onchip_ram_s1_grant_vector) ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;

  //saved onchip_ram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_saved_chosen_master_vector <= 0;
      else if (onchip_ram_s1_allow_new_arb_cycle)
          onchip_ram_s1_saved_chosen_master_vector <= |onchip_ram_s1_grant_vector ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_ram_s1_grant_vector = {(onchip_ram_s1_chosen_master_double_vector[1] | onchip_ram_s1_chosen_master_double_vector[3]),
    (onchip_ram_s1_chosen_master_double_vector[0] | onchip_ram_s1_chosen_master_double_vector[2])};

  //onchip_ram/s1 chosen master rotated left, which is an e_assign
  assign onchip_ram_s1_chosen_master_rot_left = (onchip_ram_s1_arb_winner << 1) ? (onchip_ram_s1_arb_winner << 1) : 1;

  //onchip_ram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_addend <= 1;
      else if (|onchip_ram_s1_grant_vector)
          onchip_ram_s1_arb_addend <= onchip_ram_s1_end_xfer? onchip_ram_s1_chosen_master_rot_left : onchip_ram_s1_grant_vector;
    end


  //onchip_ram_s1_reset_n assignment, which is an e_assign
  assign onchip_ram_s1_reset_n = reset_n;

  assign onchip_ram_s1_chipselect = cpu_data_master_granted_onchip_ram_s1 | cpu_instruction_master_granted_onchip_ram_s1;
  //onchip_ram_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_firsttransfer = onchip_ram_s1_begins_xfer ? onchip_ram_s1_unreg_firsttransfer : onchip_ram_s1_reg_firsttransfer;

  //onchip_ram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_unreg_firsttransfer = ~(onchip_ram_s1_slavearbiterlockenable & onchip_ram_s1_any_continuerequest);

  //onchip_ram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_ram_s1_begins_xfer)
          onchip_ram_s1_reg_firsttransfer <= onchip_ram_s1_unreg_firsttransfer;
    end


  //onchip_ram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_ram_s1_beginbursttransfer_internal = onchip_ram_s1_begins_xfer;

  //onchip_ram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_ram_s1_arbitration_holdoff_internal = onchip_ram_s1_begins_xfer & onchip_ram_s1_firsttransfer;

  //onchip_ram_s1_write assignment, which is an e_mux
  assign onchip_ram_s1_write = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_ram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_ram_s1_address mux, which is an e_mux
  assign onchip_ram_s1_address = (cpu_data_master_granted_onchip_ram_s1)? (shifted_address_to_onchip_ram_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_ram_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_ram_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_ram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_ram_s1_end_xfer <= 1;
      else if (1)
          d1_onchip_ram_s1_end_xfer <= onchip_ram_s1_end_xfer;
    end


  //onchip_ram_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_read = onchip_ram_s1_in_a_read_cycle & 0;

  //onchip_ram_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_ram_s1_in_a_read_cycle;

  //onchip_ram_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_write = onchip_ram_s1_in_a_write_cycle & 0;

  //onchip_ram_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_write_cycle = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_ram_s1_in_a_write_cycle;

  assign wait_for_onchip_ram_s1_counter = 0;
  //onchip_ram_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_ram_s1_byteenable = (cpu_data_master_granted_onchip_ram_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_ram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_ram_s1 + cpu_instruction_master_granted_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_ram_s1 + cpu_instruction_master_saved_grant_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_s1_arbitrator (
                           // inputs:
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata,
                            clk,
                            pll_s1_readdata,
                            pll_s1_resetrequest,
                            reset_n,

                           // outputs:
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1,
                            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1,
                            d1_pll_s1_end_xfer,
                            pll_s1_address,
                            pll_s1_chipselect,
                            pll_s1_read,
                            pll_s1_readdata_from_sa,
                            pll_s1_reset_n,
                            pll_s1_resetrequest_from_sa,
                            pll_s1_write,
                            pll_s1_writedata
                         )
;

  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1;
  output           NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;
  output           d1_pll_s1_end_xfer;
  output  [  2: 0] pll_s1_address;
  output           pll_s1_chipselect;
  output           pll_s1_read;
  output  [ 15: 0] pll_s1_readdata_from_sa;
  output           pll_s1_reset_n;
  output           pll_s1_resetrequest_from_sa;
  output           pll_s1_write;
  output  [ 15: 0] pll_s1_writedata;
  input   [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave;
  input   [  2: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read;
  input            NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write;
  input   [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata;
  input            clk;
  input   [ 15: 0] pll_s1_readdata;
  input            pll_s1_resetrequest;
  input            reset_n;

  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_arbiterlock;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_arbiterlock2;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_continuerequest;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_saved_grant_pll_s1;
  reg              d1_pll_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_allgrants;
  wire             pll_s1_allow_new_arb_cycle;
  wire             pll_s1_any_bursting_master_saved_grant;
  wire             pll_s1_any_continuerequest;
  wire             pll_s1_arb_counter_enable;
  reg              pll_s1_arb_share_counter;
  wire             pll_s1_arb_share_counter_next_value;
  wire             pll_s1_arb_share_set_values;
  wire             pll_s1_beginbursttransfer_internal;
  wire             pll_s1_begins_xfer;
  wire             pll_s1_chipselect;
  wire             pll_s1_end_xfer;
  wire             pll_s1_firsttransfer;
  wire             pll_s1_grant_vector;
  wire             pll_s1_in_a_read_cycle;
  wire             pll_s1_in_a_write_cycle;
  wire             pll_s1_master_qreq_vector;
  wire             pll_s1_non_bursting_master_requests;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  reg              pll_s1_reg_firsttransfer;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest_from_sa;
  reg              pll_s1_slavearbiterlockenable;
  wire             pll_s1_slavearbiterlockenable2;
  wire             pll_s1_unreg_firsttransfer;
  wire             pll_s1_waits_for_read;
  wire             pll_s1_waits_for_write;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             wait_for_pll_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~pll_s1_end_xfer;
    end


  assign pll_s1_begins_xfer = ~d1_reasons_to_wait & ((NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1));
  //assign pll_s1_readdata_from_sa = pll_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_readdata_from_sa = pll_s1_readdata;

  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1 = (1) & (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read | NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write);
  //pll_s1_arb_share_counter set values, which is an e_mux
  assign pll_s1_arb_share_set_values = 1;

  //pll_s1_non_bursting_master_requests mux, which is an e_mux
  assign pll_s1_non_bursting_master_requests = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;

  //pll_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_s1_any_bursting_master_saved_grant = 0;

  //pll_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_s1_arb_share_counter_next_value = pll_s1_firsttransfer ? (pll_s1_arb_share_set_values - 1) : |pll_s1_arb_share_counter ? (pll_s1_arb_share_counter - 1) : 0;

  //pll_s1_allgrants all slave grants, which is an e_mux
  assign pll_s1_allgrants = |pll_s1_grant_vector;

  //pll_s1_end_xfer assignment, which is an e_assign
  assign pll_s1_end_xfer = ~(pll_s1_waits_for_read | pll_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_s1 = pll_s1_end_xfer & (~pll_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_s1 & pll_s1_allgrants) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests);

  //pll_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_arb_share_counter <= 0;
      else if (pll_s1_arb_counter_enable)
          pll_s1_arb_share_counter <= pll_s1_arb_share_counter_next_value;
    end


  //pll_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_slavearbiterlockenable <= 0;
      else if ((|pll_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pll_s1) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests))
          pll_s1_slavearbiterlockenable <= |pll_s1_arb_share_counter_next_value;
    end


  //NiosII_stratixII_2s60_RoHS_fast_clock_0/out pll/s1 arbiterlock, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_arbiterlock = pll_s1_slavearbiterlockenable & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_continuerequest;

  //pll_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_s1_slavearbiterlockenable2 = |pll_s1_arb_share_counter_next_value;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0/out pll/s1 arbiterlock2, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_arbiterlock2 = pll_s1_slavearbiterlockenable2 & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_continuerequest;

  //pll_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_s1_any_continuerequest = 1;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_continuerequest continued request, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_continuerequest = 1;

  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1 = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;
  //pll_s1_writedata mux, which is an e_mux
  assign pll_s1_writedata = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata;

  //master is always granted when requested
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1 = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1;

  //NiosII_stratixII_2s60_RoHS_fast_clock_0/out saved-grant pll/s1, which is an e_assign
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_saved_grant_pll_s1 = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;

  //allow new arb cycle for pll/s1, which is an e_assign
  assign pll_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_s1_master_qreq_vector = 1;

  //pll_s1_reset_n assignment, which is an e_assign
  assign pll_s1_reset_n = reset_n;

  //assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest;

  assign pll_s1_chipselect = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1;
  //pll_s1_firsttransfer first transaction, which is an e_assign
  assign pll_s1_firsttransfer = pll_s1_begins_xfer ? pll_s1_unreg_firsttransfer : pll_s1_reg_firsttransfer;

  //pll_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_s1_unreg_firsttransfer = ~(pll_s1_slavearbiterlockenable & pll_s1_any_continuerequest);

  //pll_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_reg_firsttransfer <= 1'b1;
      else if (pll_s1_begins_xfer)
          pll_s1_reg_firsttransfer <= pll_s1_unreg_firsttransfer;
    end


  //pll_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_s1_beginbursttransfer_internal = pll_s1_begins_xfer;

  //pll_s1_read assignment, which is an e_mux
  assign pll_s1_read = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1 & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read;

  //pll_s1_write assignment, which is an e_mux
  assign pll_s1_write = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1 & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write;

  //pll_s1_address mux, which is an e_mux
  assign pll_s1_address = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress;

  //d1_pll_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_s1_end_xfer <= 1;
      else if (1)
          d1_pll_s1_end_xfer <= pll_s1_end_xfer;
    end


  //pll_s1_waits_for_read in a cycle, which is an e_mux
  assign pll_s1_waits_for_read = pll_s1_in_a_read_cycle & pll_s1_begins_xfer;

  //pll_s1_in_a_read_cycle assignment, which is an e_assign
  assign pll_s1_in_a_read_cycle = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1 & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_s1_in_a_read_cycle;

  //pll_s1_waits_for_write in a cycle, which is an e_mux
  assign pll_s1_waits_for_write = pll_s1_in_a_write_cycle & 0;

  //pll_s1_in_a_write_cycle assignment, which is an e_assign
  assign pll_s1_in_a_write_cycle = NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1 & NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_s1_in_a_write_cycle;

  assign wait_for_pll_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module NiosII_stratixII_2s60_RoHS_fast_reset_pll_c0_out_domain_synch_module (
                                                                              // inputs:
                                                                               clk,
                                                                               data_in,
                                                                               reset_n,

                                                                              // outputs:
                                                                               data_out
                                                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module NiosII_stratixII_2s60_RoHS_fast_reset_clk_domain_synch_module (
                                                                       // inputs:
                                                                        clk,
                                                                        data_in,
                                                                        reset_n,

                                                                       // outputs:
                                                                        data_out
                                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module NiosII_stratixII_2s60_RoHS_fast (
                                         // 1) global signals:
                                          clk,
                                          pll_c0_out,
                                          reset_n
                                       )
;

  output           pll_c0_out;
  input            clk;
  input            reset_n;

  wire    [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address;
  wire    [  1: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa;
  wire    [  2: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata;
  wire    [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address;
  wire    [  3: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave;
  wire    [  1: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_byteenable;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_endofpacket;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1;
  wire    [  2: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write;
  wire    [ 15: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata;
  wire             clk_reset_n;
  wire    [ 16: 0] cpu_data_master_address;
  wire    [ 16: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_high_res_timer_s1;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_high_res_timer_s1;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_high_res_timer_s1;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_high_res_timer_s1;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 16: 0] cpu_instruction_master_address;
  wire    [ 16: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_high_res_timer_s1_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_onchip_ram_s1_end_xfer;
  wire             d1_pll_s1_end_xfer;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_irq;
  wire             high_res_timer_s1_irq_from_sa;
  wire    [ 15: 0] high_res_timer_s1_readdata;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  wire             high_res_timer_s1_reset_n;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 13: 0] onchip_ram_s1_address;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire             onchip_ram_s1_clken;
  wire    [ 31: 0] onchip_ram_s1_readdata;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  wire             onchip_ram_s1_reset_n;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire             out_clk_pll_c0;
  wire             pll_c0_out;
  wire             pll_c0_out_reset_n;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_chipselect;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest;
  wire             pll_s1_resetrequest_from_sa;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  wire             reset_n_sources;
  NiosII_stratixII_2s60_RoHS_fast_clock_0_in_arbitrator the_NiosII_stratixII_2s60_RoHS_fast_clock_0_in
    (
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address                           (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable                        (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket                       (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa               (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress                     (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read                              (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata                          (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa                  (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n                           (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest                       (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa               (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write                             (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata                         (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata),
      .clk                                                                          (pll_c0_out),
      .cpu_data_master_address_to_slave                                             (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                   (cpu_data_master_byteenable),
      .cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in           (cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in (cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_read                                                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in   (cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in          (cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_waitrequest                                                  (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                        (cpu_data_master_write),
      .cpu_data_master_writedata                                                    (cpu_data_master_writedata),
      .d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer                       (d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer),
      .reset_n                                                                      (pll_c0_out_reset_n)
    );

  NiosII_stratixII_2s60_RoHS_fast_clock_0_out_arbitrator the_NiosII_stratixII_2s60_RoHS_fast_clock_0_out
    (
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address                  (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave         (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1           (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1 (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read                     (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1   (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata                 (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1          (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n                  (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest              (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write                    (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata                (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata),
      .clk                                                                  (clk),
      .d1_pll_s1_end_xfer                                                   (d1_pll_s1_end_xfer),
      .pll_s1_readdata_from_sa                                              (pll_s1_readdata_from_sa),
      .reset_n                                                              (clk_reset_n)
    );

  NiosII_stratixII_2s60_RoHS_fast_clock_0 the_NiosII_stratixII_2s60_RoHS_fast_clock_0
    (
      .master_address       (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address),
      .master_byteenable    (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_endofpacket),
      .master_nativeaddress (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress),
      .master_read          (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read),
      .master_readdata      (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_readdata),
      .master_reset_n       (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_reset_n),
      .master_waitrequest   (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_waitrequest),
      .master_write         (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write),
      .master_writedata     (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata),
      .slave_address        (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_address),
      .slave_byteenable     (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_byteenable),
      .slave_clk            (pll_c0_out),
      .slave_endofpacket    (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket),
      .slave_nativeaddress  (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_nativeaddress),
      .slave_read           (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_read),
      .slave_readdata       (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata),
      .slave_reset_n        (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_reset_n),
      .slave_waitrequest    (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest),
      .slave_write          (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_write),
      .slave_writedata      (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (pll_c0_out),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset                                    (cpu_jtag_debug_module_reset),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (pll_c0_out_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa                  (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_readdata_from_sa),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa               (NiosII_stratixII_2s60_RoHS_fast_clock_0_in_waitrequest_from_sa),
      .clk                                                                          (pll_c0_out),
      .cpu_data_master_address                                                      (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                             (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in           (cpu_data_master_granted_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_granted_cpu_jtag_debug_module                                (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_high_res_timer_s1                                    (cpu_data_master_granted_high_res_timer_s1),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                          (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_onchip_ram_s1                                        (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_irq                                                          (cpu_data_master_irq),
      .cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in (cpu_data_master_qualified_request_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                      (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_high_res_timer_s1                          (cpu_data_master_qualified_request_high_res_timer_s1),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave                (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_onchip_ram_s1                              (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_read                                                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in   (cpu_data_master_read_data_valid_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                        (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_high_res_timer_s1                            (cpu_data_master_read_data_valid_high_res_timer_s1),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave                  (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_onchip_ram_s1                                (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_readdata                                                     (cpu_data_master_readdata),
      .cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in          (cpu_data_master_requests_NiosII_stratixII_2s60_RoHS_fast_clock_0_in),
      .cpu_data_master_requests_cpu_jtag_debug_module                               (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_high_res_timer_s1                                   (cpu_data_master_requests_high_res_timer_s1),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                         (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_onchip_ram_s1                                       (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_waitrequest                                                  (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                        (cpu_data_master_write),
      .cpu_jtag_debug_module_readdata_from_sa                                       (cpu_jtag_debug_module_readdata_from_sa),
      .d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer                       (d1_NiosII_stratixII_2s60_RoHS_fast_clock_0_in_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                            (d1_cpu_jtag_debug_module_end_xfer),
      .d1_high_res_timer_s1_end_xfer                                                (d1_high_res_timer_s1_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                      (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                                    (d1_onchip_ram_s1_end_xfer),
      .high_res_timer_s1_irq_from_sa                                                (high_res_timer_s1_irq_from_sa),
      .high_res_timer_s1_readdata_from_sa                                           (high_res_timer_s1_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                      (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                                 (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                              (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .onchip_ram_s1_readdata_from_sa                                               (onchip_ram_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_onchip_ram_s1                     (registered_cpu_data_master_read_data_valid_onchip_ram_s1),
      .reset_n                                                                      (pll_c0_out_reset_n)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                            (pll_c0_out),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_ram_s1                   (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_ram_s1         (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1           (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                           (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_ram_s1                  (cpu_instruction_master_requests_onchip_ram_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                      (d1_onchip_ram_s1_end_xfer),
      .onchip_ram_s1_readdata_from_sa                                 (onchip_ram_s1_readdata_from_sa),
      .reset_n                                                        (pll_c0_out_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (pll_c0_out),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (pll_c0_out),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (cpu_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  high_res_timer_s1_arbitrator the_high_res_timer_s1
    (
      .clk                                                 (pll_c0_out),
      .cpu_data_master_address_to_slave                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_high_res_timer_s1           (cpu_data_master_granted_high_res_timer_s1),
      .cpu_data_master_qualified_request_high_res_timer_s1 (cpu_data_master_qualified_request_high_res_timer_s1),
      .cpu_data_master_read                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_high_res_timer_s1   (cpu_data_master_read_data_valid_high_res_timer_s1),
      .cpu_data_master_requests_high_res_timer_s1          (cpu_data_master_requests_high_res_timer_s1),
      .cpu_data_master_waitrequest                         (cpu_data_master_waitrequest),
      .cpu_data_master_write                               (cpu_data_master_write),
      .cpu_data_master_writedata                           (cpu_data_master_writedata),
      .d1_high_res_timer_s1_end_xfer                       (d1_high_res_timer_s1_end_xfer),
      .high_res_timer_s1_address                           (high_res_timer_s1_address),
      .high_res_timer_s1_chipselect                        (high_res_timer_s1_chipselect),
      .high_res_timer_s1_irq                               (high_res_timer_s1_irq),
      .high_res_timer_s1_irq_from_sa                       (high_res_timer_s1_irq_from_sa),
      .high_res_timer_s1_readdata                          (high_res_timer_s1_readdata),
      .high_res_timer_s1_readdata_from_sa                  (high_res_timer_s1_readdata_from_sa),
      .high_res_timer_s1_reset_n                           (high_res_timer_s1_reset_n),
      .high_res_timer_s1_write_n                           (high_res_timer_s1_write_n),
      .high_res_timer_s1_writedata                         (high_res_timer_s1_writedata),
      .reset_n                                             (pll_c0_out_reset_n)
    );

  high_res_timer the_high_res_timer
    (
      .address    (high_res_timer_s1_address),
      .chipselect (high_res_timer_s1_chipselect),
      .clk        (pll_c0_out),
      .irq        (high_res_timer_s1_irq),
      .readdata   (high_res_timer_s1_readdata),
      .reset_n    (high_res_timer_s1_reset_n),
      .write_n    (high_res_timer_s1_write_n),
      .writedata  (high_res_timer_s1_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (pll_c0_out),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (pll_c0_out_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (pll_c0_out),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  onchip_ram_s1_arbitrator the_onchip_ram_s1
    (
      .clk                                                      (pll_c0_out),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                               (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_ram_s1                    (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_qualified_request_onchip_ram_s1          (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_ram_s1            (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_requests_onchip_ram_s1                   (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_data_master_writedata                                (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                  (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_ram_s1             (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_latency_counter                   (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_ram_s1   (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_read                              (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1     (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_requests_onchip_ram_s1            (cpu_instruction_master_requests_onchip_ram_s1),
      .d1_onchip_ram_s1_end_xfer                                (d1_onchip_ram_s1_end_xfer),
      .onchip_ram_s1_address                                    (onchip_ram_s1_address),
      .onchip_ram_s1_byteenable                                 (onchip_ram_s1_byteenable),
      .onchip_ram_s1_chipselect                                 (onchip_ram_s1_chipselect),
      .onchip_ram_s1_clken                                      (onchip_ram_s1_clken),
      .onchip_ram_s1_readdata                                   (onchip_ram_s1_readdata),
      .onchip_ram_s1_readdata_from_sa                           (onchip_ram_s1_readdata_from_sa),
      .onchip_ram_s1_reset_n                                    (onchip_ram_s1_reset_n),
      .onchip_ram_s1_write                                      (onchip_ram_s1_write),
      .onchip_ram_s1_writedata                                  (onchip_ram_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_ram_s1 (registered_cpu_data_master_read_data_valid_onchip_ram_s1),
      .reset_n                                                  (pll_c0_out_reset_n)
    );

  onchip_ram the_onchip_ram
    (
      .address    (onchip_ram_s1_address),
      .byteenable (onchip_ram_s1_byteenable),
      .chipselect (onchip_ram_s1_chipselect),
      .clk        (pll_c0_out),
      .clken      (onchip_ram_s1_clken),
      .readdata   (onchip_ram_s1_readdata),
      .reset_n    (onchip_ram_s1_reset_n),
      .write      (onchip_ram_s1_write),
      .writedata  (onchip_ram_s1_writedata)
    );

  pll_s1_arbitrator the_pll_s1
    (
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave         (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_address_to_slave),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1           (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_granted_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress            (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_nativeaddress),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1 (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_qualified_request_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read                     (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1   (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_read_data_valid_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1          (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_requests_pll_s1),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write                    (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_write),
      .NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata                (NiosII_stratixII_2s60_RoHS_fast_clock_0_out_writedata),
      .clk                                                                  (clk),
      .d1_pll_s1_end_xfer                                                   (d1_pll_s1_end_xfer),
      .pll_s1_address                                                       (pll_s1_address),
      .pll_s1_chipselect                                                    (pll_s1_chipselect),
      .pll_s1_read                                                          (pll_s1_read),
      .pll_s1_readdata                                                      (pll_s1_readdata),
      .pll_s1_readdata_from_sa                                              (pll_s1_readdata_from_sa),
      .pll_s1_reset_n                                                       (pll_s1_reset_n),
      .pll_s1_resetrequest                                                  (pll_s1_resetrequest),
      .pll_s1_resetrequest_from_sa                                          (pll_s1_resetrequest_from_sa),
      .pll_s1_write                                                         (pll_s1_write),
      .pll_s1_writedata                                                     (pll_s1_writedata),
      .reset_n                                                              (clk_reset_n)
    );

  //pll_c0_out out_clk assignment, which is an e_assign
  assign pll_c0_out = out_clk_pll_c0;

  pll the_pll
    (
      .address      (pll_s1_address),
      .c0           (out_clk_pll_c0),
      .chipselect   (pll_s1_chipselect),
      .clk          (clk),
      .read         (pll_s1_read),
      .readdata     (pll_s1_readdata),
      .reset_n      (pll_s1_reset_n),
      .resetrequest (pll_s1_resetrequest),
      .write        (pll_s1_write),
      .writedata    (pll_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  NiosII_stratixII_2s60_RoHS_fast_reset_pll_c0_out_domain_synch_module NiosII_stratixII_2s60_RoHS_fast_reset_pll_c0_out_domain_synch
    (
      .clk      (pll_c0_out),
      .data_in  (1'b1),
      .data_out (pll_c0_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0 |
    pll_s1_resetrequest_from_sa |
    pll_s1_resetrequest_from_sa);

  //reset is asserted asynchronously and deasserted synchronously
  NiosII_stratixII_2s60_RoHS_fast_reset_clk_domain_synch_module NiosII_stratixII_2s60_RoHS_fast_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //NiosII_stratixII_2s60_RoHS_fast_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign NiosII_stratixII_2s60_RoHS_fast_clock_0_out_endofpacket = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/80release/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/80release/quartus/eda/sim_lib/220model.v"
`include "c:/altera/80release/quartus/eda/sim_lib/sgate.v"
`include "pll.v"
`include "altpllpll.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "NiosII_stratixII_2s60_RoHS_fast_clock_0.v"
`include "jtag_uart.v"
`include "high_res_timer.v"
`include "onchip_ram.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] NiosII_stratixII_2s60_RoHS_fast_clock_0_out_byteenable;
  wire             NiosII_stratixII_2s60_RoHS_fast_clock_0_out_endofpacket;
  reg              clk;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             pll_c0_out;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  NiosII_stratixII_2s60_RoHS_fast DUT
    (
      .clk        (clk),
      .pll_c0_out (pll_c0_out),
      .reset_n    (reset_n)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on