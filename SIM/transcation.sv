class transcations;
rand bit   [31:0] HWDATA;
rand bit   [31:0] HADDR;           
bit   [2:0]  HSIZE;      
bit   [2:0]  HBURST; 
logic [1:0]  HTRANS; 
logic [3:0]  HPROT; 
bit          HSEL;
bit	     HWRITE;
bit          HRESP;
bit          HREADY;
function new(bit[31:0] HADDR,bit[31:0]HWDATA);
this.HADDR=HADDR;
this.HWDATA=HWDATA;
endfunction
function void display();
$display("HADDR=%0h","HWDATA=%0h");
endfunction
endclass
