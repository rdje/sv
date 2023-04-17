class base_env  extends uvm_env;
`uvm_component_utils(base_env)

local uvm_object_string_pool #(uvm_event_pool) m_pools; 

// Function: new
//
function new(string name="base_env", uvm_component parent=null);
  super.new(name, parent);

  set_id(register_env(this));
endfunction : new

`set_get_decl(id, int unsigned)


// Function: get_pool
//
function uvm_event_pool get_pool(string name);
  if (!m_pools) m_pools = new;
  
  get_pool = m_pools.get(name);
endfunction : get_pool

endclass : base_env

// base_scoreboard  -> foo_scoreboard_pkg
// base_monitor
// base_driver