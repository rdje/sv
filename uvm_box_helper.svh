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

`ifndef  UVM_BOX_HELPER__SVH
`define  UVM_BOX_HELPER__SVH

// Function: box_int
//
function automatic uvm_box #(int) box_int (int v = 0);
  box_int = uvm_box #(int)::new_box().set(v);
endfunction : box_int

// Function: box_uint
//
function automatic uvm_box #(int unsigned) box_uint (int unsigned v = 0);
  box_uint = uvm_box #(int unsigned)::new_box().set(v);
endfunction : box_uint

// Function: box_longint
//
function automatic uvm_box #(longint) box_longint (longint v = 0);
  box_longint = uvm_box #(longint)::new_box().set(v);
endfunction : box_longint

// Function: box_ulongint
//
function automatic uvm_box #(longint unsigned) box_ulongint (longint unsigned v = 0);
  box_ulongint = uvm_box #(longint unsigned)::new_box().set(v);
endfunction : box_ulongint

// Function: box_real
//
function automatic uvm_box #(real) box_real (real v = 0);
  box_real = uvm_box #(real)::new_box().set(v);
endfunction : box_real

// Function: box_logicvec
//
function automatic uvm_box #(uvm_reg_data_t) box_logicvec (uvm_reg_data_t v = '0);
  box_logicvec = uvm_box #(uvm_reg_data_t)::new_box().set(v);
endfunction : box_logicvec

// Function: box_logic
//
function automatic uvm_box #(logic) box_logic (logic v = 0);
  box_logic = uvm_box #(logic)::new_box().set(v);
endfunction : box_logic

// Function: box_bit
//
function automatic uvm_box #(bit) box_bit (bit v = 0);
  box_bit = uvm_box #(bit)::new_box().set(v);
endfunction : box_bit

// Function: box_string
//
function automatic uvm_box #(string) box_string (string v = "");
  box_string = uvm_box #(string)::new_box().set(v);
endfunction : box_string

// Function: box_intarray
//
function automatic uvm_box_array #(int) box_intarray (int v[$]={});
  box_intarray = uvm_box_array #(int)::new_box().set(v);
endfunction : box_intarray

// Function: box_longintarray
//
function automatic uvm_box_array #(longint) box_longintarray (longint v[$]={});
  box_longintarray = uvm_box_array #(longint)::new_box().set(v);
endfunction : box_longintarray

// Function: box_realarray
//
function automatic uvm_box_array #(real) box_realarray (real v[$]={});
  box_realarray = uvm_box_array #(real)::new_box().set(v);
endfunction : box_realarray

// Function: box_stringarray
//
function automatic uvm_box_array #(string) box_stringarray (string v[$]={});
  box_stringarray = uvm_box_array #(string)::new_box().set(v);
endfunction : box_stringarray

// Function: box_objarray
//
function automatic uvm_box_array #(uvm_object) box_objarray (uvm_object v[$]={});
  box_objarray = uvm_box_array #(uvm_object)::new_box().set(v);
endfunction : box_objarray

// Function: get_hash
//
function automatic uvm_hash get_hash(string name = $sformatf("uvm_hash__%0h", $urandom));
  get_hash = uvm_hash::type_id::create(name);
endfunction : get_hash

// Function: hash
//
//  Alias to get_hash
//
function automatic uvm_hash hash(string name = $sformatf("uvm_hash__%0h", $urandom));
  hash = get_hash(name);
endfunction : hash

`endif   // UVM_BOX_HELPER__SVH
