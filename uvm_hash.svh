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

`ifndef  UVM_HASH__SVH
`define  UVM_HASH__SVH

// Class: uvm_hash
//
class uvm_hash extends uvm_box_base;
`uvm_object_utils(uvm_hash)

typedef uvm_hash this_type;

protected uvm_object_string_pool #(uvm_box_base) m_pool = new;

// Function: new
//
function new(string name="");
  super.new(name);
endfunction : new

// Function: to_void
//
function void to_void();
endfunction: to_void

// Function: exists
//
function bit exists(string key);
  return m_pool.exists(key);
endfunction : exists

// Function: num
//
function int num();
  return m_pool.num();
endfunction : num

// Function: delete
//
function this_type delete(string key);
  m_pool.delete(key);

  return this;
endfunction : delete

// Function: add
//
function this_type add(string key, uvm_object v);
  uvm_box_base base;;

  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  $cast(base, v);

  m_pool.add(key, base);

  return this;
endfunction : add

// Function: add_logicvec
//
function this_type add_logicvec(string key, uvm_reg_data_t v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_logicvec(v));
endfunction : add_logicvec

// Function: add_logic
//
function this_type add_logic(string key, logic v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_logic(v));
endfunction : add_logic

// Function: add_bit
//
function this_type add_bit(string key, bit v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_bit(v));
endfunction : add_bit

// Function: add_int
//
function this_type add_int(string key, int v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_int(v));
endfunction : add_int


// Function: add_uint
//
function this_type add_uint(string key, int unsigned v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_uint(v));
endfunction : add_uint

// Function: add_longint
//
function this_type add_longint(string key, longint v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_longint(v));
endfunction : add_longint


// Function: add_ulongint
//
function this_type add_ulongint(string key, longint unsigned v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_ulongint(v));
endfunction : add_ulongint

// Function: add_real
//
function this_type add_real(string key, real v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_real(v));
endfunction : add_real

// Function: add_string
//
function this_type add_string(string key, string v);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_string(v));
endfunction : add_string

// Function: add_intarray
//
function this_type add_intarray(string key, int v[$]);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_intarray (v));
endfunction : add_intarray

// Function: add_longintarray
//
function this_type add_longintarray(string key, longint v[$]);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_longintarray (v));
endfunction : add_longintarray

// Function: add_realarray
//
function this_type add_realarray(string key, real v[$]);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_realarray (v));
endfunction : add_realarray

// Function: add_stringarray
//
function this_type add_stringarray(string key, string v[$]);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_stringarray (v));
endfunction : add_stringarray

// Function: add_objarray
//
function this_type add_objarray(string key, uvm_object v[$]);
  if (m_pool.exists(key)) `uvm_warning("KEYALREADYEXISTS", $sformatf("%m: An entry always exists for key '%s'", key))

  return add(key, box_objarray (v));
endfunction : add_objarray


// Function: get
//
function uvm_object get(string key);
  uvm_box #(uvm_object) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get

// Function: get_logicvec
//
function uvm_reg_data_t get_logicvec(string key);
  uvm_box #(uvm_reg_data_t) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_logicvec

// Function: get_logic
//
function logic get_logic(string key);
  uvm_box #(logic) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_logic

// Function: get_bit
//
function bit get_bit(string key);
  uvm_box #(bit) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_bit

// Function: get_int
//
function int get_int(string key);
  uvm_box #(int) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_int

// Function: get_uint
//
function int unsigned get_uint(string key);
  uvm_box #(int unsigned) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_uint

// Function: get_longint
//
function longint get_longint(string key);
  uvm_box #(longint) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_longint

// Function: get_ulongint
//
function longint unsigned get_ulongint(string key);
  uvm_box #(longint unsigned) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_ulongint

// Function: get_integer
//
function longint unsigned get_integer(string key);
  uvm_box #(integer) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_integer

// Function: get_real
//
function real get_real(string key);
  uvm_box #(real) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_real

// Function: get_string
//
function string get_string(string key);
  uvm_box #(string) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  return v.get;
endfunction : get_string

// Function: get_intarray
//
function uvm_box_array #(int)::array_t get_intarray(string key);
  uvm_box_array #(int) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  get_intarray = v.get;
endfunction : get_intarray

// Function: get_longintarray
//
function uvm_box_array #(longint)::array_t get_longintarray(string key);
  uvm_box_array #(longint) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  get_longintarray = v.get;
endfunction : get_longintarray

// Function: get_realarray
//
function uvm_box_array #(real)::array_t get_realarray(string key);
  uvm_box_array #(real) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  get_realarray = v.get;
endfunction : get_realarray

// Function: get_stringarray
//
function uvm_box_array #(string)::array_t get_stringarray(string key);
  uvm_box_array #(string) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  get_stringarray = v.get;
endfunction : get_stringarray

// Function: get_objarray
//
function uvm_box_array #(uvm_object)::array_t get_objarray(string key);
  uvm_box_array #(uvm_object) v;

  if (!m_pool.exists(key)) `uvm_fatal("NONEXISTENTKEY", $sformatf("%m: No entry for key '%s'", key))

  $cast(v, m_pool.get(key));

  get_objarray = v.get;
endfunction : get_objarray

endclass : uvm_hash

`endif   // UVM_HASH__SVH
