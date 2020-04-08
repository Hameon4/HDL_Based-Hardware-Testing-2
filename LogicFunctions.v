module question1(X, Y, Z, A, B, C);

  input A, B, C;
  output X, Y, Z;

  wire w1, w2, w3,
       w4, w5, w6,
       w7, w8, w9;

  //code for function X
  not g1(w1, C);
  not g2(w2, A);
  xor g3(w3, w1, B);
  or  g4(X, w2, w3);

  //code for function Y
  not g5(w4, B);
  and g6(w5, w4, C);
  and g7(w6, A, B);
  or (w5, w6);

  //code for function Z
  xnor g8(w7, B, C);
  or   g9(w9, A, B);
  and  g10(w8, w7, w9);
  or   g11(Z, A, w8);

endmodule

//TestBench
module tb;
  reg A, B, C;
  wire X, Y, Z;

  question1 uut( .X(X), .Y(Y), .Z(Z), .A(A), .B(B), .C(C));

  initial begin
    #10 assign A = 0;
    assign B = 0;
    assign C = 0;

    #10 assign A = 1;
    assign B = 0;
    assign C = 1;

     #10 assign A = 1;
    assign B = 0;
    assign C = 0;
    $finish;

  end

  initial begin
    $dumpfile("question1.vcd");
    $dumpvars(0, tb);
  end
endmodule
