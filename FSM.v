module FSM(Y,clk,rst,A);

output reg Y;
input clk,rst,A;

reg [2:0]current_state,next_state;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;

always @(posedge clk or posedge rst)  begin
    if(rst) begin
        Y=1'b0; 
        current_state <= S0;
    end else begin
        current_state <= next_state;
    end
end
always @(*) begin
    // Default values
    Y = 1'b0;
    #3;

    
        case(current_state) 
            S0 : begin
                if(A) begin
                    Y=1'b0;
                    next_state = S1;
                end else begin
                    next_state = S0;
                end
            end

            S1 : begin
                if(A) begin
                    Y=1'b0;
                    next_state = S2;
                end else begin
                    next_state = S0;
                end
            end

            S2 : begin
                if(!A) begin
                    Y=1'b0;
                    next_state = S3;
                end else begin
                    next_state = S1;
                end
            end

            S3 : begin
                if(A) begin
                    Y=1'b0;
                    next_state = S4;
                end else begin
                    next_state = S0;
                end
            end

            S4 : begin
                if(!A) begin
                    Y=1'b0;
                    next_state = S5;
                end else begin
                    next_state = S2;
                end
            end

            S5 : begin
                if(A) begin
                    Y=1'b1;
                    next_state = S1;
                end else begin
                    next_state = S0;
                end
            end

        endcase

    end


endmodule

module tb_FSM();

reg A,clk,rst;
wire Y;

FSM F1(Y,clk,rst,A);

initial begin
clk=1'b1;
forever #5 clk=~clk;
end


initial begin

rst=1'b1;
#10;
rst=1'b0;
end



initial begin
A=1'b0;
$monitor("Time:%0t\t | A:%b\t | rst:%b\t clk:%b\t | current_state:%b\t | Y:%b",$time,A,rst,clk,F1.current_state,Y);



A=1'b0;#10;     //Time:0
A=1'b1;#10;     //Time:10
A=1'b1;#10;     //Time:20
A=1'b0;#10;     //Time:30
A=1'b1;#10;     //Time:40
A=1'b0;#10;     //Time:50
A=1'b1;#10;     //Time:60
A=1'b0;#10;
A=1'b1;#10;
A=1'b1;#10;
A=1'b0;#10;
A=1'b1;#10;
A=1'b0;#10;
A=1'b1;#10;

$finish;
end

endmodule