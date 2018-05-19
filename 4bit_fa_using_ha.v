
module 4bit_adder (a,b,cin,cout,sum);
 input [3:0] a,b;
 input cin;
 output cout;
 output [3:0] sum;
 wire [3:1] c;
 fa st0 (a[0],b[0],cin,sum[0],c[1]);
 fa st1 (a[1],b[1],c[1],sum[1],c[2]);
 fa st2 (a[2],b[2],c[2],sum[2],c[3]);
 fa st3 (a[3],b[3],c[3],sum[3],cout);

 endmodule

module fa(a,b,c,sum,cout);
input a,b,c;
output sum,cout;
wire c1,c2;

assign sum=hasum(a,b);
assign sum=hasum(sum,c);
assign c1=hacarry(a,b);
assign c2=hacarry(hasum(a,b),c);
assign cout=c1 or c2;

function hasum;
input ain,bin;
begin
assign suout=ain^bin;
end
endfunction


function hacarry;

input ain,bin;
begin
assign cou=ain and bin;
end
endfunction

endmodule
