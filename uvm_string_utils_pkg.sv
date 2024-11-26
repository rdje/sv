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

package uvm_string_utils_pkg;

import uvm_pkg::*;

typedef string sa_t[$];

// Function: join_string
//
function automatic string join_string(string sa[$], string sep="");
  foreach (sa[k]) join_string = {join_string, k ? sep : "", sa[k]};
endfunction : join_string

// Function: split_string
//
function automatic sa_t split_string(string s, string sep="");
  if (sep.len) begin
    byte  sepa[$];
    int	  pos[$];

    foreach (sep[k]) begin
      sepa[k]=sep[k];

      `uvm_info("SPLIT_STRING", $sformatf("sep[%0d] = <%s>", k, sep[k]), UVM_FULL)
    end

    foreach (s[k]) if (s[k] inside {sepa}) pos.push_back(k);

    foreach (pos[k]) begin
      `uvm_info("SPLIT_STRING", $sformatf("pos[%0d] = <%0d>", k, pos[k]), UVM_FULL)

      if (k) begin // k not first
      	if (pos[k] - 1 > pos[k-1]) 
      	  split_string.push_back(s.substr(pos[k-1] + 1, pos[k] - 1));
      	else
      	  split_string.push_back("");
      end
      else begin // k first
        if (pos[k] == 0)
          split_string.push_back("");
        else
          split_string.push_back(s.substr(0, pos[k] - 1));
      end

      if (k == pos.size - 1) begin // k last
        if (pos[k] == s.len - 1)
          split_string.push_back("");
        else
          split_string.push_back(s.substr(pos[k] + 1, s.len - 1));
      end
    end

    if (!pos.size) split_string.push_back(s);

    foreach (split_string[k]) `uvm_info("SPLIT_STRING", $sformatf("[%0d] = <%s>", k, split_string[k]), UVM_FULL)
  end
  else
    foreach (s[k]) split_string.push_back(s[k]);

endfunction : split_string

// Function: find_string
//
// Check the existence or presence of a token in a string
// 
function automatic bit find_string(string s, string t);
  for (int i = 0; i <= s.len - t.len; i++) begin
    if (s.substr(i, i + t.len - 1) == t) return 1;
  end
endfunction : find_string

// Function: find_any_string
//
// Check the existence or presence of any token in a string
//
function automatic bit find_any_string(string s, string t[]);
  foreach (t[k]) if (find_string(s, t[k])) return 1;
endfunction : find_any_string

endpackage : uvm_string_utils_pkg
