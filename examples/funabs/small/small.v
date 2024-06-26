function [6:0] increment;
  input [6:0] a;
  begin
    increment = a+1;
  end
endfunction

module small (
  input clk
);

  reg [6:0] counter;
  reg [6:0] counter2;
  initial assume (counter==0);
  initial assume (counter2==0);
  always @(posedge clk) begin
      counter <= increment(counter+7'b0);
      counter2 <= increment(counter2);
  end

`ifdef FORMAL
  always @(posedge clk) begin
    assert property (counter==counter2);
  end
`endif
endmodule
