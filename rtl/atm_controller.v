`timescale 1ns / 1ps


module test(clk,rst,idel,card,pin,new_pin,modes,money,balance,sucess,error);
input clk,card,idel,rst;
input[1:0]modes;
input[16:0]money,pin,new_pin;
output reg[16:0]balance;
output reg sucess,error;

reg[16:0]pin_num=17'd1211;
reg[16:0]amount=17'd800;
reg[2:0]state;

parameter s0=1,s1=2,s2=3,s3=4,s4=5,s5=6,s6=7,s7=8;
//s0  ideal state
//s1  card
//s2  pin
//s3  modes
//s4  withdrawl
//s5  deposite
//s6  balance inquiry
//s7  pin change
always @(posedge clk)begin

if(!rst)begin
sucess<=0;error<=0;balance<=0;amount<=17'd800;state<=s0;end

else begin
case(state)

s0:begin                 //ideal
state<=s1;
sucess<=0;
error<=0;
end

s1:begin                  //card
if(card)begin
state<=s2;
sucess<=1;
error<=0;end
else begin
state<=s0;
sucess<=0;
error<=1;end
end

s2:begin                        //pin 
if(pin==pin_num)begin
state<=s3;
sucess<=1;
error<=0;end
else begin
state<=s0;
sucess<=0;
error<=1;end
end

s3:begin                          //modes
sucess<=0;
error<=0;
case(modes)
2'b00:state<=s4;
2'b01:state<=s5;
2'b10:state<=s6;
2'b11:state<=s7;
default:state<=s0;
endcase
end

s4:begin                              //withdrawl
if(modes==2'b00 && pin==pin_num && amount>=money)begin
amount  <=amount-money;
balance <=amount-money;
sucess<=1;
error<=0;
state<=s3;end
else begin
state<=s3;
error<=1;
sucess<=0;end
end

s5:begin                      //deposite
if(modes==2'b01 && pin==pin_num)begin
amount  <= amount+money;
balance <= amount+money;
sucess  <= 1;
error   <= 0;
state   <= s3;end
else begin
state  <= s3;
sucess <= 0;
error  <= 1;end
end

s6:begin                        //balance_inqury
if(modes==2'b10)begin
balance <= amount;
sucess  <= 1;
error   <= 0;
state<=s3;end
else begin
sucess <=0;
error  <=1;
state<=s3;end
end

s7:begin                   //pin_change
if(modes==2'b11)begin
pin_num<=new_pin;
state<=s3;
sucess<=1;
error<=0;end
else begin
error<=1;
sucess<=0;
state<=s3;end
end

endcase
end
end

endmodule
