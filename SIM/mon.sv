`include "wra.sv"
`include "Trans.sv";

class monitor;

 mailbox mon2scb;
 virtual ahb_lite.mon ahb_inf;
 Trans tr;

 function new(virtual ahb_lite.mon ahb_inf, mailbox mon2scb);
  this.ahb_inf = ahb_inf;
  this.mon2scb = mon2scb;
 endfunction

 task run();
  logic HRESETn;
  logic [31:0]HADDR;
  logic [2:0]HBURST;
  logic HMASTLOCK;
  logic [3:0]HPROT;
  logic [2:0]HSIZE;
  logic [1:0]HTRANS;
  logic [31:0]HWDATA;
  logic HWRITE;
  logic [31:0]HRDATA;
  logic HREADYOUT;
  logic HRESP;
  logic HSEL;
  logic HREADY;
  while(1) begin
   @(posedge HCLK);
   if(ahb_inf.HRESETn && ahb_inf.HREADY) begin
    HRESETn   = ahb_inf.HRESETn;
    HADDR     = ahb_inf.HADDR;
    HBURST    = ahb_inf.HBURST;
    HMASTLOCK = ahb_inf.HMASTLOCK;
    HPROT     = ahb_inf.HPROT;
    HSIZE     = ahb_inf.HSIZE;
    HTRANS    = ahb_inf.HTRANS;
    HWDATA    = ahb_inf.HWDATA;
    HSEL      = ahb_inf.HSEL;
    HRDATA    = ahb_inf.HRDATA;
    HREADYOUT = ahb_inf.HREADYOUT;
    HRESP     = ahb_inf.HRESP;

    tr = new(HRESETn, HADDR, HBURST, HMASTLOCK, HPROT, HSIZE, HTRANS, HWDATA, HSEL, HRDATA, HREADYOUT, HRESP); // error yahan a raha "Number of actuals and formals does not match in function call."
    this.mon2scb.put(tr);
   end 
  end
 endtask

endclass
