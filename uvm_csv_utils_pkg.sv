//////////////////////////////////////////////////////////////////////////////
// Copyright 2023 Xilinx, Inc. All rights reserved.
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

package uvm_csv_utils_pkg;

import uvm_pkg::*;
import uvm_string_utils_pkg::*;

//
// CSV Generic functions
//
// Dump CSV data into the transcript/run.log
//

int     csv_index[string];
bit     csv_has_header[string];
bit     csv_dump_enable = $test$plusargs("csv_dump_enable");

// Function: csv_open
//
function automatic void csv_open(string key, string header[$]={}, string label="");
  if (csv_dump_enable) begin
    if (header.size) begin
      foreach (header[k]) header[k] = {header[k], $sformatf(" %s", label)};

      header.push_front("Index");

      $display("csv:", key, ":", join_string(header, ","));

      csv_has_header[key] = 1;
    end
  end
endfunction : csv_open

// Function: csv_display
//
function automatic void csv_display(string key, int data[$]);
  if (csv_dump_enable) begin
    string sample_str[$];

    foreach (data[k]) sample_str[k] = $sformatf("%0d", data[k]); 

    if (csv_index[key] == 0 && !csv_has_header[key]) begin
      string default_header[$];

      default_header.push_back("Index");
      foreach (sample_str[k]) default_header.push_back($sformatf("H%0d", k));

      $display("csv:", key, ":", join_string(default_header, ","));
    end

    sample_str.push_front($sformatf("%0d", csv_index[key]));
    $display("csv:", key, ":", join_string(sample_str, ","));

    csv_index[key]++;
  end
endfunction : csv_display

endpackage : uvm_csv_utils_pkg
