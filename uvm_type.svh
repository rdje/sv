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

`ifndef  UVM_TYPE__SVH
`define  UVM_TYPE__SVH

// Class: uvm_array
//
class uvm_array #(type T=int)  extends uvm_object;
`uvm_object_param_utils(uvm_array #(T))

typedef T type_t[$];

// Function: new
//
function new(string name="uvm_array");
  super.new(name);
endfunction : new
endclass : uvm_array

// Class: uvm_bnd_array
//
class uvm_bnd_array #(type T=int, int N)  extends uvm_object;
`uvm_object_param_utils(uvm_bnd_array #(T, N))

typedef T type_t[$:N];

// Function: new
//
function new(string name="uvm_bnd_array");
  super.new(name);
endfunction : new
endclass : uvm_bnd_array

// Class: uvm_fsize_array
//
class uvm_fsize_array #(type T=int, int S) extends uvm_object;
`uvm_object_param_utils(uvm_fsize_array #(T, S))

typedef T type_t[S];

// Function: new
//
function new(string name="uvm_fsize_array");
  super.new(name);
endfunction : new
endclass : uvm_fsize_array

// Class: uvm_asso_array
//
class uvm_asso_array #(type T=int, type K=string) extends uvm_object;
`uvm_object_param_utils(uvm_asso_array #(T, K))

typedef T type_t[K];

// Function: new
//
function new(string name="uvm_asso_array");
  super.new(name);
endfunction : new
endclass : uvm_asso_array

// Class: uvm_vector
//
class uvm_vector #(type T=logic, int S) extends uvm_object;
`uvm_object_param_utils(uvm_vector #(T, S))

typedef T [S-1:0] type_t;

// Function: new
//
function new(string name="uvm_vector");
  super.new(name);
endfunction : new
endclass : uvm_vector

`endif   // UVM_TYPR__SVH
