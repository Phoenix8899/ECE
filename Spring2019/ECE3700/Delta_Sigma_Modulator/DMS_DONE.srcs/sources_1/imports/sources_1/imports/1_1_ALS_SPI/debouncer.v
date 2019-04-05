module debouncer
  (
   input clk,
   input button,
   input en,
   output reg button_db
   );

   parameter confirm_time = 100;
   
   reg [1:0]  state;

   integer    count;

   initial begin
      count = 0;
      state = 0;
      button_db = 0;
      
   end

   always @(posedge clk) begin
      case (state)
	0:
	  begin
	     button_db <= 0;
	     count     <= 0;
	     
	     if (en && button)
	       state <= 1;	     
	  end
	1:
	  begin
	     if (en && (count == confirm_time)) begin
		state     <= 2;
		count     <= 0;		
		button_db <= 1;		
	     end
	     else if (!en) begin
		state     <= 0;
		button_db <= 0;		
	     end	       
	     else if (button) 
	       count <= count + 1;
	     else
	       state <= 0;	     

	  end // case: 1
	2:
	  begin
	     button_db <= 0;
	     if (count == confirm_time)
	       state <= 0;
	     else if (~button) begin
		count <= count + 1;		
	     end
	     else
	       count <= 0;	     
	  end
      endcase
   end
endmodule // debouncer
