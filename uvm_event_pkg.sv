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

package uvm_event_pkg;

import uvm_pkg::*;
import uvm_env_pkg::*;

bit __show_event__ = $test$plusargs("showevent");

// Function: get_event
//
function automatic uvm_event get_event(string ev, string pool="default", string env_type="???", int unsigned env_id=0);
  `uvm_info($sformatf("%m"), $sformatf("event: %s, pool: %s, type: %s, id: %0d", ev, pool, env_type, env_id), __show_event__ ? UVM_LOW : UVM_DEBUG)
  
  get_event = get_env(env_type, env_id).get_pool(pool).get(ev);
endfunction : get_event



// Class: default_tr_cb
//
// Default CB for Transition uvm_events
//
class default_tr_cb extends uvm_event_callback;
// Function: new
//
function new(string name="default_tr_cb");
  super.new(name);
endfunction : new

// Function: post_trigger
//
function void post_trigger(uvm_event #(uvm_object) e, uvm_object data);
  super.post_trigger(e, data);

  `uvm_fatal(get_name, $sformatf("Transition not enabled: %s", e.get_name()))
endfunction : post_trigger

endclass : default_tr_cb


// Class: uvm_event_tr
//
class uvm_event_tr #(type T=uvm_object) extends uvm_event #(T);

default_tr_cb cb;

// Function: new
//
function new(string name="");
  super.new(name);
  
  cb = new;
  add_callback(cb);
endfunction : new

// Function: enable
//
function void enable(uvm_event_callback #(T) default_cb = null);
  delete_callback(cb);

  if (default_cb) add_callback(default_cb);
endfunction : enable

// Function: num_callback
//
function int unsigned num_callback;
  num_callback = callbacks.size;
endfunction : num_callback

// Function: set_callback
//
function void set_callback(uvm_event_callback #(T) cb);
  callbacks = {cb};
endfunction : set_callback

endclass : uvm_event_tr;


endpackage : uvm_event_pkg
