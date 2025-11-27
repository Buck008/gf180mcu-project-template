module rd_2_4(A, B, E0, E1, E2, E3);
    input A, B;
    output E0, E1, E2, E3;

    assign E0 = (!A & !B); //00
    assign E1 = (!A & B); // 01
    assign E2 = (A & !B); // 10
    assign E3 = (A & B); //11
    
endmodule