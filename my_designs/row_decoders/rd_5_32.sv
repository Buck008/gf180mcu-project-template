module rd_5_32(A, B, C, D, E, rows);
    input A, B, C, D, E;

    output [31:0] rows;

    wire E0, E1, E2, E3;
    rd_2_4 row_decoder_2_4 (A, B, E0, E1, E2, E3);

    // 
    rd_3_8 row_decoder_3_8_1 (C, D, E, E0, rows[7:0]);
    rd_3_8 row_decoder_3_8_2 (C, D, E, E1, rows[15:8]);
    rd_3_8 row_decoder_3_8_3 (C, D, E, E2, rows[23:16]);
    rd_3_8 row_decoder_3_8_4 (C, D, E, E3, rows[31:24]);

endmodule
