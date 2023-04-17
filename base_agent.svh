class base_agent extends uvm_agent;
`uvm_component_utils(base_agent)

// Function: new
//
function new(string name="base_agent", uvm_component parent=null)
  super.new(name, parent);
  
  set_id(register_agent(this));
endfunction : new

`set_get_decl(id,     int unsigned)
`set_get_decl(env_id, int unsigned)

endclass : base_agent