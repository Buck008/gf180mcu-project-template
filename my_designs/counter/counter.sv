module counter #(
    parameter N = 10
)(
    input  comparator_1,
    input  comparator_2,
    input  rst_n,
    output binary_val
);

reg [3:0] count_a;
reg [3:0] count_b;

reg S_bar;   // goes high when A hits N
reg R_bar;   // goes high when B hits N

// Separate winner flags from each domain
reg a_won;   // Set by comparator_1 when A wins
reg b_won;   // Set by comparator_2 when B wins

initial begin
    S_bar = 0;
    R_bar = 0;
    count_a = 4'b0;
    count_b = 4'b0;
    a_won = 0;
    b_won = 0;
end

// Count comparator_1 - A domain
always_ff @(posedge comparator_1) begin
    if (!rst_n)
    begin
        count_a <= 4'b0;
        S_bar <= 0;
        a_won <= 0;
    end
    // Count logic
    if (!S_bar) begin
        if (count_a + 1 == N) begin
            S_bar <= 1;
            // Check if we won (B hasn't finished yet)
            if (!R_bar) begin
                a_won <= 1;
            end
        end
        else begin
            count_a <= count_a + 1;
        end
    end
end

// Count comparator_2 - B domain
always_ff @(posedge comparator_2) begin
    // Count logic
    if(!rst_n)
    begin
        count_b <= 4'b0;
        R_bar <= 0;
        b_won <= 0;
    end
    if (!R_bar) begin
        if (count_b + 1 == N) begin
            R_bar <= 1;
            // Check if we won (A hasn't finished yet)
            if (!S_bar) begin
                b_won <= 1;
            end
        end
        else begin
            count_b <= count_b + 1;
        end
    end
end

// Output: A wins (1) if a_won is set, B wins (0) if b_won is set
// Use priority: if both somehow set (shouldn't happen), A wins
assign binary_val = a_won ? 1'b1 : (b_won ? 1'b0 : 1'b0);

endmodule