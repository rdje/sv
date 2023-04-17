class base_scoreboard extends uvm_scoreboard;
`uvm_component_utils(base_scoreboard)

// Function: new
//
function new(string name="base_scoreboard", uvm_component parent=null);
  super.new(name, parent);
endfunction : new

`set_get_decl(env_id, int unsigned)

// Function: get_event
//
function uvm_event get_event(string e, string pool);
  event_pkg::get_event(e, pool, get_parent().get_type_name, get_env_id);
endfunction : get_event

endclass : base_scoreboard