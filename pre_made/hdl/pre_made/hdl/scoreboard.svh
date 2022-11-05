//----------------------------------------------------------------------
//                   Mentor Graphics Corporation
//----------------------------------------------------------------------
// Project         : multadd_uvm
// Unit            : scoreboard
// File            : scoreboard.svh
//----------------------------------------------------------------------
// Created by      : user.group
// Creation Date   : 2013/10/25
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//   Takes the ma_agent_req_item transactions driven into the DUT by 
//   ma_agent_req, predicts the result and compares the prediction to 
//   the ma_agent_rsp_item transactions read from the DUT by ma_agent_rsp.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// scoreboard
//----------------------------------------------------------------------
class scoreboard extends uvm_scoreboard;

  // factory registration macro
  `uvm_component_utils(scoreboard)

  // external interfaces
  uvm_analysis_export #(ma_agent_req_item) expected_export;
  uvm_analysis_export #(ma_agent_rsp_item) actual_export;

  // internal channels     
  uvm_tlm_analysis_fifo #(ma_agent_req_item) expected_fifo;
  uvm_tlm_analysis_fifo #(ma_agent_rsp_item) actual_fifo;

  // variables
  string msg;
  ma_agent_req_item expected_txn;
  ma_agent_rsp_item actual_txn;
  ma_agent_rsp_item predicted_txn;

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------  
  function new (string name = "scoreboard",  
                uvm_component parent = null);
    super.new(name,parent);
  endfunction: new

  //--------------------------------------------------------------------
  // build_phase
  //--------------------------------------------------------------------  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    expected_fifo   = new("expected_fifo",this);
    actual_fifo     = new("actual_fifo",this);   
    expected_export = new("expected_export",this);   
    actual_export   = new("actual_export",this);   
  endfunction: build_phase

  //--------------------------------------------------------------------
  // connect_phase
  //--------------------------------------------------------------------  
  virtual function void connect_phase(uvm_phase phase);
    super.connect();
    expected_export.connect(expected_fifo.analysis_export);
    actual_export.connect(actual_fifo.analysis_export);
  endfunction: connect_phase

  //--------------------------------------------------------------------
  // run_phase
  //--------------------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
  
    forever begin
      expected_fifo.get(expected_txn);
      actual_fifo.get(actual_txn);
      predicted_txn = predict_expected(expected_txn);
      assert (predicted_txn.compare(actual_txn)) begin
        $sformat(msg, "Expected RSP: {%s}  Actual RSP: {%s}",
                       predicted_txn.convert2string(),
                       actual_txn.convert2string());
        `uvm_info("SCOREBOARD_PASS", msg, UVM_MEDIUM)
      end
      else begin
        $sformat(msg, "REQ: {%s} ... Expected RSP: {%s}  Actual RSP: {%s}",
                       expected_txn.convert2string(),
                       predicted_txn.convert2string(),
                       actual_txn.convert2string());
        `uvm_error("SCOREBOARD_FAIL", msg)
      end
    end

  endtask: run_phase

  //--------------------------------------------------------------------
  // predict_expected
  //--------------------------------------------------------------------  
  function ma_agent_rsp_item predict_expected(ma_agent_req_item expected);
    ma_agent_rsp_item predicted = ma_agent_rsp_item::type_id::create("predicted");
    
    // --- User code here to calculate expected response ---
     predicted.prodsum = ((expected.a * expected.b) + (expected.c * expected.d));
      
    `uvm_info("SCOREBOARD",
              $sformatf("INPUT: %s",expected.convert2string()),
              UVM_MEDIUM)
    return predicted;

  endfunction: predict_expected


endclass: scoreboard

