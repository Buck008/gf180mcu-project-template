`timescale 1ns/1ps

module tb_rd5;

    reg A, B, C, D, E;
    wire [31:0] rows;

    // DUT (Device Under Test)
    rd5 uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .rows(rows)
    );

    integer i;

    initial begin
        $display("Starting 5-to-32 decoder test...");

        // Loop through all 32 input combinations
        for (i = 0; i < 32; i = i + 1) begin
            {A, B, C, D, E} = i;   // assign 5-bit vector
            #1;                   // wait 1 timestep

            $display("Inputs A B C D E = %b | rows = %032b", 
                      {A, B, C, D, E}, rows);
        end

        $display("Test completed.");
        $finish;
    end

endmodule
