module rd_3_8(C, D, E, En, rows);
    input C, D, E, En;
    output [7:0] rows;

    assign rows[0] =  En & ~C & ~D & ~E;
    assign rows[1] =  En & ~C & ~D &  E;
    assign rows[2] =  En & ~C &  D & ~E;
    assign rows[3] =  En & ~C &  D &  E;

    assign rows[4] =  En &  C & ~D & ~E;
    assign rows[5] =  En &  C & ~D &  E;
    assign rows[6] =  En &  C &  D & ~E;
    assign rows[7] =  En &  C &  D &  E;

endmodule