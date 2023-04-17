class base_reg_field #(type R=base_reg) extends uvm_reg_field;
`uvm_object_utils(base_reg_field #(R))

typedef base_reg_field #(R) this_type;

// Function: new
//
function new (string name="base_reg_field", );
endfunction : new

endclass : base_reg_field