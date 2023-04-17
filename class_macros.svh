`ifndef CLASS_MACROS__SVH
`define CLASS_MACROS__SVH

// MACRO: set_decl
//
//  RETURN=void (default), this_type
//  VAR=yes (default), no
//  RADIX=dec (default), hex, enum
//
`define set_decl(name, T, RETURN=void, VAR=yes, RADIX=dec)                    \
`define RETURN                                                                \
`define VAR                                                                   \
`define RADIX                                                                 \
                                                                              \
`ifdef yes                                                                    \
local T m_``name;                                                             \
`endif                                                                        \
                                                                              \
function RETURN set_``name(T v);                                              \
  m_``name = v;                                                               \
                                                                              \
`ifdef  dec                                                                   \
  `uvm_info($sformatf("%m"), $sformatf(`"set name to %0d`", v), UVM_HIGH)     \
`elsif  hex                                                                   \
  `uvm_info($sformatf("%m"), $sformatf(`"set name to 0x%0h`", v), UVM_HIGH)   \
`else   // enum                                                               \
  `uvm_info($sformatf("%m"), $sformatf(`"set name to %s`", v.name), UVM_HIGH) \
`endif                                                                        \
                                                                              \
`ifdef this_type                                                              \
  return this;                                                                \
`endif                                                                        \
                                                                              \
endfunction : set_``name                                                      \
`undef void                                                                   \
`undef this_type                                                              \
`undef yes                                                                    \
`undef no                                                                     \
`undef dec                                                                    \
`undef hex                                                                    \
`undef enum


// MACRO: get_decl
//
//  RADIX=dec (default), hex, enum      
//
`define get_decl(name, T, RADIX=dec)                                                      \
`define RADIX                                                                             \
                                                                                          \
function T get_``name;                                                                    \
  get_``name = m_``name;                                                                  \
                                                                                          \
`ifdef  dec                                                                               \
  `uvm_info($sformatf("%m"), $sformatf(`"get %0d from name`", get_``name), UVM_HIGH)      \
`elsif  hex                                                                               \
  `uvm_info($sformatf("%m"), $sformatf(`"get 0x%0h from name`", get_``name), UVM_HIGH)    \
`else   // enum                                                                           \
  `uvm_info($sformatf("%m"), $sformatf(`"get %s from name`", get_``name.name), UVM_HIGH)  \
`endif                                                                                    \
endfunction : get_``name                                                                  \
`undef dec                                                                                \
`undef hex                                                                                \
`undef enum

// MACRO: set_hex_decl
//
//  VAR=yes (default), no
//
`define set_hex_decl(name, T, VAR=yes)  `set_decl (name, T, void, VAR, hex)

// MACRO: set_enum_decl
//
//  VAR=yes (default), no
//
`define set_enum_decl(name, T, VAR=yes)  `set_decl (name, T, void, VAR, enum)

// MACRO: this_set_decl
//  
//  VAR=yes (default), no
//  RADIX=dec (default), hex, enum
//
`define this_set_decl(name, T, VAR=yes, RADIX=dec)  `set_decl (name, T, this_type, VAR, RADIX)

// MACRO: this_set_hex_decl
//
//  VAR=yes (default), no
//
`define this_set_hex_decl(name, T, VAR=yes)  `this_set_decl (name, T, VAR, hex)

// MACRO: this_set_enum_decl
//
//  VAR=yes (default), no
//
`define this_set_enum_decl(name, T, VAR=yes)  `this_set_decl (name, T, VAR, enum)


// MACRO: get_hex_decl
//
`define get_hex_decl(name, T)  `get_decl (name, T, hex)

// MACRO: get_enum_decl
//
`define get_enum_decl(name, T)  `get_decl (name, T, enum)


// MACRO: set_get_decl
//
//  VAR=yes (default), no
//  RADIX=dec (default), hex, enum
//
`define set_get_decl(name, T, VAR=yes, RADIX=dec) \
`set_decl(name, T, void, VAR, RADIX)              \
`get_decl(name, T, RADIX)

// MACRO: this_set_get_decl
//
//  VAR=yes (default), no
//  RADIX=dec (default), hex, enum
//
`define this_set_get_decl(name, T, VAR=yes, RADIX=dec)  \
`this_set_decl (name, T, VAR, RADIX)                    \
`get_decl (name, T, RADIX)

// MACRO: this_set_get_hex_decl
//
//  VAR=yes (default), no
//
`define this_set_get_hex_decl(name, T, VAR=yes) \
`this_set_hex_decl (name, T, VAR)               \
`get_hex_decl (name, T)

// MACRO: this_set_get_enum_decl
//
//  VAR=yes (default), no
//
`define this_set_get_enum_decl(name, T, VAR=yes)  \
`this_set_enum_decl (name, T, VAR)                \
`get_enum_decl (name, T)


`endif  // CLASS_MACROS__SVH