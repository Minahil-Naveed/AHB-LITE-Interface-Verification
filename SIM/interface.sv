interface ahb(input bit HCLK,HRESETn);
logic [31:0] HADDR;
logic 	     HWRITE;
logic [31:0] HSIZE;
logic [31:0] HBURST;
logic [31:0] HTRANS;
logic [31:0] HWDATA;
logic [31:0] HRDATA;
logic [3:0]  HPROT;
logic	     HREADY;
logic	     HRESP;
logic	     HSEL;
logic	     HMASTLOCK;
logic	     HREADYOUT;				


modport master (
      input  HRESETn,
      input  HCLK,
      output HSEL,
      output HADDR,
      output HWDATA,
      input  HRDATA,
      output HWRITE,
      output HSIZE,
      output HBURST,
      output HPROT,
      output HTRANS,
      output HMASTLOCK,
      input  HREADY,
      input  HRESP
  );
modport slave (
      input  HRESETn,
      input  HCLK,
      input  HSEL,
      input  HADDR,
      input  HWDATA,
      output HRDATA,
      input  HWRITE,
      input  HSIZE,
      input  HBURST,
      input  HPROT,
      input  HTRANS,
      input  HMASTLOCK,
      input  HREADY,
      output HREADYOUT,
      output HRESP
  );
modport MON(input HADDR, HWRITE,HSIZE,HBURST,HTRANS,HWDATA,HRDATA,HPROT,HREADY,HRESP,HSEL,HMASTLOCK,HREADYOUT,HRESETn);
  	    
endinterface

