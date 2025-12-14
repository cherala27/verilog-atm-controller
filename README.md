# verilog-atm-controller
ATM controller designed using Verilog HDL with FSM-based control logic

**project overveiw**
This project implements an ATM (Automated Teller Machine) controller using Verilog HDL.
The design is based on a Finite State Machine (FSM) approach and simulates the basic working of a real ATM.

The ATM supports multiple operations such as card detection, PIN verification, withdrawal, deposit, balance inquiry, and PIN change.
A separate testbench is used to verify the functionality through simulation.

🎯 **Features**

1) Card insertion detection
2) Secure PIN verification
3) Mode selection using FSM
4) Cash withdrawal
5) Cash deposit
6) Balance inquiry
7) PIN change functionality
8) Success and error indication
9) Fully synchronous design (clock-based)

    🧠 **Design Approach**
The ATM controller is designed using a Moore-type Finite State Machine.
Each ATM operation is represented by a state, and transitions occur on the positive edge of the clock.

**FSM States**
State     Description
s0	      Idle state (waiting for card)
s1       	Card detected
s2      	PIN verification
s3      	Mode selection
s4      	Withdrawal
s5      	Deposit
s6      	Balance inquiry
s7	      PIN change

**Modes of Operation**
The modes input selects the ATM operation:

Mode     Value	Operation
2'b00   	Withdrawal
2'b01	    Deposit
2'b10	    Balance Inquiry
2'b11	    PIN Change

🧩 **Module Description**
Design Module
Module Name: test
**Inputs**
clk     : Clock signal
rst     : Active-low reset
card    : Card insertion signal
idel    : Idle indicator (optional)
pin     : Entered PIN
new_pin : New PIN for PIN change
modes   : Operation selection
money   : Amount for withdraw/deposit

**Outputs**
balance : Current account balance
sucess : Indicates successful operation
error : Indicates failed operation

**Testbench Description**
A separate testbench is written to simulate real ATM behavior.
All inputs are applied synchronously using clock edges to avoid timing issues.
**Testbench Validates:**
Correct PIN verification
Withdrawal amount deduction
Deposit amount addition
Correct balance inquiry output
PIN change functionality
Proper success and error signaling

**Expected Results**
Balance updates correctly after withdrawal and deposit
Balance inquiry shows the current account balance
PIN change updates the stored PIN
sucess = 1 for valid operations
error = 1 for invalid operations (wrong PIN, insufficient balance, etc.)

**Learning Outcomes**
Understanding FSM-based digital design
Writing clean and synthesizable Verilog
Debugging timing issues in FSMs
Writing effective testbenches
Practical ATM control logic implementation
