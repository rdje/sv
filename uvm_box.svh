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
