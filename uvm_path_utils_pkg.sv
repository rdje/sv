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

package uvm_path_utils_pkg;

import uvm_pkg::*;
import uvm_string_utils_pkg::*;

// Function: get_parent_path
//
function automatic string get_parent_path(string path, int unsigned up=1);
  string a[$];
  
  `uvm_info("get_parent_path", $sformatf("up: %0d, path: <%s>", up, path), UVM_FULL)
  
  a = split_string(path, ".");
  repeat(up) void'(a.pop_back());
  
  foreach (a[k]) `uvm_info("get_parent_path", $sformatf("a[%0d]: <%s>", k, a[k]), UVM_FULL)
  
  get_parent_path = join_string(a, ".");
  
  `uvm_info("get_parent_path", $sformatf("parent_path: <%s>", get_parent_path), UVM_FULL)
endfunction : get_parent_path

// Function: get_env_type
//
function automatic string get_env_type(string path);
sa_t sa_a = split_string(path, ".");
sa_t sa_b = split_string(sa_a[1], "_");

  get_env_type = {sa_b[1].tolower, "_env"};

  `uvm_info("get_env_type", $sformatf("type: %s, path: <%s>", get_env_type, path), UVM_FULL)
endfunction : get_env_type

// Function: get_env_id
//
function automatic int unsigned get_env_id(string path);
  sa_t a = split_string(path, "[]");

  get_env_id = a[1].atoi;

  `uvm_info("get_env_id", $sformatf("id: %0d, path: <%s>", get_env_id, path), UVM_FULL)
endfunction : get_env_id

// Function: get_subpath
//
function automatic sa_t get_subpath(string path, string token, int unsigned len=0);
  sa_t sa = split_string(path, ".");
  bit  capture;

  foreach (sa[k]) begin
    if (!capture) begin
      if (sa[k] == token) capture=1;
    end
    else begin
      get_subpath.push_back(sa[k]);

      if (get_subpath.size == len) break;
    end
  end

  if (!get_subpath.size) `uvm_fatal("TOKENOTFOUND", $sformatf("%m: Token '%s' Not Found", token))
  if (len && get_subpath.size != len) `uvm_error("MATCHLEN", $sformatf("%m: Match size %0d less than expected(%0d)", get_subpath.size, len))
endfunction : get_subpath

endpackage : uvm_path_utils_pkg
