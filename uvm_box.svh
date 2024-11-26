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

`ifndef  UVM_BOX__SVH
`define  UVM_BOX__SVH

class uvm_box_base extends uvm_object;
// Function: new
//
function new(string name="");
  super.new(name);
endfunction : new

endclass : uvm_box_base

// class: uvm_box #(T)
//
class uvm_box #(type T=longint) extends uvm_box_base;
`uvm_object_param_utils(uvm_box #(T))

typedef uvm_box #(T) this_type;

protected T this_val;

// Function: new
//
protected function new(string name="uvm_box");
  super.new(name);
endfunction : new

// Function: to_void
//
function void to_void;
endfunction: to_void

// Function: new_box
//
static function this_type new_box(string name="");
  new_box = new(name);
endfunction : new_box

// Function: get_box
//
//  Alias to new_box  
//
static function this_type get_box(string name="");
  get_box = new_box(name);
endfunction : get_box

// Function: set
//
function this_type set(T v);
  this_val = v;

  return this;
endfunction : set

// Function: get
//
function T get;
  get = this_val;
endfunction : get

endclass : uvm_box


// class: uvm_box_array #(T)
//
class uvm_box_array #(type T=int) extends uvm_box_base;
`uvm_object_param_utils(uvm_box_array #(T))

typedef uvm_box_array #(T) this_type;
typedef T array_t[$];

protected array_t this_val;

// Function: new
//
protected function new(string name="uvm_box_array");
  super.new(name);
endfunction : new

// Function: to_void
//
function void to_void;
endfunction: to_void

// Function: new_box
//
static function this_type new_box(string name="");
  new_box = new(name);
endfunction : new_box

// Function: get_box
//
//  Alias to new_box  
//
static function this_type get_box(string name="");
  get_box = new_box(name);
endfunction : get_box

// Function: set
//
function this_type set(array_t v);
  this_val = v;

  return this;
endfunction : set

// Function: get
//
function array_t get;
  get = this_val;
endfunction : get

endclass : uvm_box_array


// class: uvm_box_vector #(T, S)
//
class uvm_box_vector #(type T=logic, int S) extends uvm_box_base;
`uvm_object_param_utils(uvm_box_vector #(T, S))

typedef uvm_box_vector #(T, S) this_type;
typedef T [S-1:0] vector_t;

protected vector_t this_val;

// Function: new
//
protected function new(string name="uvm_box_vector");
  super.new(name);
endfunction : new

// Function: to_void
//
function void to_void;
endfunction: to_void

// Function: new_box
//
static function this_type new_box(string name="");
  new_box = new(name);
endfunction : new_box

// Function: get_box
//
//  Alias to new_box  
//
static function this_type get_box(string name="");
  get_box = new_box(name);
endfunction : get_box

// Function: set
//
function this_type set(vector_t v);
  this_val = v;

  return this;
endfunction : set

// Function: get
//
function vector_t get;
  get = this_val;
endfunction : get

endclass : uvm_box_vector

`endif   // UVM_BOX__SVH
