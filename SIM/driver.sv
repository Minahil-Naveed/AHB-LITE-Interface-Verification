`include "transcation.sv"
class driver;
  virtual memory vahb;
 
  mailbox gen2drv;

  function new(virtual memory vahb);
     begin
       this.vahb = vahb;
       this.gen2drv = gen2drv;
     end
  endfunction
task write_send; // write operation
    while (vahb.HRESET)
      forever begin
        @(posedge vahb.HCLK);
        vahb.HREADY <= 1;
        vahb.HWRITE <= 1;
        vahb.HADDR <= tr.HADRR;
        @(posedge vahb.HCLK);
        vahb.HWDATA <= tr.HWDATA;
      end
  endtask
task read_send; // read operation
    while (vahb.HRESET)
      forever begin
        @(posedge vahb.HCLK);
         vahb.HWRITE <= 0;
	vahb.HREADY <= 1;
        vahb.HADDR <= tr.HADRR;
        @(posedge vahb.HCLK);
        vahb.HRDATA <= tr.HWDATA;
      end
  endtask
 
  task rst; // reset
    wait(!vahb.HRESET)
      begin
      $display("Reset state is low");
      vahb.HADDR <= 0;
      vahb.HSIZE <= 0;                  
      vahb.HREADY <= 0;
      end
    wait(vahb.HRESET)
      $display("Reset state is high");
  endtask
 
 

    task run;
      transcations tr;
      gen2drv.get(tr);
      @(posedge vahb.HCLK);
      if (tr.HWRITE == 1);
      write_send;
      $display("Write transaction");
      elseif (tr.HWRITE == 0);
      read_send;
      $display("Read transaction");
     
    endtask
endclass: driver


