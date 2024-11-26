//////////////////////////////////////////////////////////////////////////////
// Copyright 2022 Xilinx, Inc. All rights reserved.
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// Revision:    $File: $
//              $Revision: $
//              $Author: $
//              $DateTime: $
//              $Change: $
//
// Description:
//
//////////////////////////////////////////////////////////////////////////////

`ifndef  UVM_ENV_BASE__SVH
`define  UVM_ENV_BASE__SVH

// Class: uvm_env_base
//
class uvm_env_base extends uvm_env;
`uvm_component_utils(uvm_env_base)

typedef uvm_env_base this_type;

protected uvm_object_string_pool #(uvm_event_pool) m_pools = new;
protected int unsigned m_id;

// Function: new
//
function new(string name="", uvm_component parent=null);
  super.new(name, parent);

  set_id(register_env(this));
endfunction : new

// Function: set_id 
//
function void set_id(int unsigned id);
  `uvm_info(get_name, $sformatf("%m: id=%0d", id), UVM_HIGH)

  m_id = id;
endfunction : set_id

// Function: get_id 
//
function int unsigned get_id;
  `uvm_info(get_name, $sformatf("%m: id=%0d", m_id), UVM_HIGH)

  get_id = m_id;
endfunction : get_id

// Function: get_pool
//
function uvm_event_pool get_pool(string name);
  get_pool = m_pools.get(name);
endfunction : get_pool

endclass : uvm_env_base

`endif   // UVM_ENV_BASE__SVH
