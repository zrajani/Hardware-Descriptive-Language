// Demux 1:4 Data_Flow

module demux (s2,s1,I,en,y0,y1,y2,y3);

input s2,s1,I,en;
output y0,y1,y2,y3;

assign y0=(~s2)&(~s1)& I& en;
assign y1=(~s2)& s1& I& en;
assign y2=s2&(~s1)& I & en;
assign y3=s2& s1 & I & en;

endmodule
