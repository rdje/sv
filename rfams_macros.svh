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

`ifndef  RFAMS_MACROS__SVH
`define  RFAMS_MACROS__SVH

// Macro: var_decl
//
`define var_decl(name, T=bit)	            \
T name;                                   \
                                          \
function automatic void name``_set(T v);  \
  name = v;                               \
endfunction : name``_set                  \
                                          \
function automatic void name``_clear;     \
  name``_set(0);                          \
endfunction : name``_clear                \
                                          \
function automatic T name``_get;          \
  return name;                            \
endfunction : name``_get                  \
                                          \
function automatic void name``_inc(int inc=1);  \
  name  += inc;                                 \
endfunction : name``_inc                        \
                                                \
function automatic void name``_dec(int dec=1);  \
  name  -= dec;                                 \
endfunction : name``_dec



// Macro: event_decl
//
`define event_decl(name, T=logic)               \
event		  name``_evt;                           \
bit   		name``_bit;                           \
longint unsigned  name``_count;                 \
longint unsigned  name``_ts;                    \
T		              name``_var;	                  \
                                                \
function automatic void name``_trigger(T v=0);  \
  if (!name``_evt.triggered) begin              \
    -> name``_evt;                              \
                                                \
    name``_bit = 1;                             \
    name``_ts  = $realtime * 1000;              \
    name``_var = v;		                          \
    name``_count++;                             \
  end                                           \
endfunction : name``_trigger                    \
                                                \
always @name``_evt #1ps ##1 name``_bit = 0;     \
                                                \
function automatic void name``_clear;           \
  name``_count = 0;                             \
endfunction : name``_clear


// Macro: uvm_event_decl
//
`define uvm_event_decl(name, pool, env_type, env_id, ev_name=NOTDEF)	\
`define ev_name								                                        \
`ifdef NOTDEF                                                         \
`event_decl(name``_``pool``_``env_type``_``env_id)                    \
`else										                                              \
`event_decl(ev_name)								                                  \
`endif										                                            \
                                                                                    \
always #1ps begin get_event(`"name`", `"pool`", `"env_type`", env_id).wait_ptrigger;  \
`ifdef NOTDEF									                                                      \
  name``_``pool``_``env_type``_``env_id``_trigger();                                \
`else                                                                               \
  ev_name``_trigger();                                                              \
`endif                                                                              \
end										                                                              \
`undef ev_name


// Macro: toggle_decl
//
`define toggle_decl(name)	              \
`var_decl(name)			                    \
				                                \
function automatic void name``_toggle;	\
  name ^= 1;			                      \
endfunction : name``_toggle


// Macro: toggle_with_event_decl
//
`define toggle_with_event_decl(name, ev)  \
`toggle_decl(name)			                  \
					                                \
always @((ev)) name``_toggle();

`endif   // RFAMS_MACROS__SVH
