`timescale 1ns / 1ps


module test_tb();
reg clk,card,idel,rst;
reg[1:0]modes;
reg[16:0]money,pin,new_pin;
wire [16:0]balance;
wire sucess,error;

test dut(clk,rst,idel,card,pin,new_pin,modes,money,balance,sucess,error);

always #5 clk=~clk;

initial begin

clk=0;rst=0;idel=0;card=0;pin=0;money=0;

#10
rst=1;
//@(posedge clk)
#10 card=1;
//@(posedge clk)
#10 pin=17'd1211;

//withdrawl
//@(posedge clk)
#10 pin=17'd1211;
//@(posedge clk)
#10 modes=2'b00;
//@(posedge clk)
#10 money=17'd100;

//deposite
//@(posedge clk)
#10 pin=17'd1211;
//@(posedge clk)
#10 modes=2'd01;
//@(posedge clk)
#10 money=17'd200;

//@(posedge clk)
#15 modes=2'b10;

//pin change
//#15 modes=2'b11;
//#15 new_pin=17'd1234;

#20 pin=17'd1211;
#20 modes=2'b00;
#20 money=17'd100;

#20 $finish;

end
endmodule
