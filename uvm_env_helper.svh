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

`ifndef  UVM_ENV_HELPER__SVH
`define  UVM_ENV_HELPER__SVH

uvm_env_base __uvm_env_base_registry__[string][$];

// Function: register_env
//
function automatic int unsigned register_env(uvm_env_base env);
  register_env = __uvm_env_base_registry__[env.get_type_name].size;

  `uvm_info($sformatf("%m"), $sformatf(" Registering UVM environment %s (%0h) of type %s at id #%0d", env.get_name, env, env.get_type_name, register_env), UVM_LOW)

  __uvm_env_base_registry__[env.get_type_name].push_back(env);
endfunction : register_env

// Function: get_env
//
function automatic uvm_env_base get_env(string env_type, int unsigned env_id);
  `uvm_info($sformatf("%m"), $sformatf(" Retrieving UVM environment of type %s at id #%0d", env_type, env_id), UVM_DEBUG)

  get_env = __uvm_env_base_registry__[env_type][env_id];

  `uvm_info($sformatf("%m"), $sformatf(" Retrieved  UVM environment %s (%0h) of type %s at id #%0d", get_env.get_name, get_env, get_env.get_type_name, env_id), UVM_DEBUG)
endfunction : get_env

`endif   // UVM_ENV_HELPER__SVH
