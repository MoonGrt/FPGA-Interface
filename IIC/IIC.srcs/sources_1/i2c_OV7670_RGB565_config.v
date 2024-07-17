/*===========================================================================
15/02/1
--------------------------------------------------------------------------*/

`timescale 1ns/1ns
module	i2c_OV7670_RGB565_config
(
	input	wire	[7:0]	LUT_INDEX,
	output	reg		[15:0]	LUT_DATA,
	output	wire	[7:0]	LUT_SIZE	
);

assign LUT_SIZE = 8'd185;

/////////////////////	Config Data LUT	  //////////////////////////	
always @( *)
begin
	case(LUT_INDEX)
	0 	: 	LUT_DATA	= 	16'h0A76;
	1 	: 	LUT_DATA	= 	16'h0B73;
	2 	: 	LUT_DATA	= 	16'h1280;
	3 	: 	LUT_DATA	=	16'h1180;
	4 	: 	LUT_DATA	= 	16'h3a04;
	5 	: 	LUT_DATA	= 	16'h1214;
	6 	: 	LUT_DATA	= 	16'h1713;
	7 	: 	LUT_DATA	= 	16'h1801;
	8 	: 	LUT_DATA	= 	16'h32b6;
	9 	: 	LUT_DATA	= 	16'h1902;
	10	: 	LUT_DATA	= 	16'h1a7a;
	11	: 	LUT_DATA	= 	16'h030a;
	12 	: 	LUT_DATA	= 	16'h0c00;
	13	: 	LUT_DATA	= 	16'h3e00;
	14	: 	LUT_DATA	= 	16'h7000;
	15	: 	LUT_DATA	= 	16'h7100;
	16	: 	LUT_DATA	= 	16'h7211;
	17	: 	LUT_DATA	= 	16'h7300;
	18	: 	LUT_DATA	= 	16'ha202;
   	
   	19	: 	LUT_DATA	= 	16'h7a20;
	20	: 	LUT_DATA	= 	16'h7b10;
	21	: 	LUT_DATA	= 	16'h7c1e;
	22	: 	LUT_DATA	= 	16'h7d35;
	23	: 	LUT_DATA	= 	16'h7e5a;
	24	: 	LUT_DATA	= 	16'h7f69;
	25	: 	LUT_DATA	= 	16'h8076;
	26	: 	LUT_DATA	= 	16'h8180;
	27	: 	LUT_DATA	= 	16'h8288;
	28	: 	LUT_DATA	= 	16'h838f;
	29	: 	LUT_DATA	= 	16'h8496;
	30	: 	LUT_DATA	= 	16'h85a3;
	31	: 	LUT_DATA	= 	16'h86af;
	32	: 	LUT_DATA	= 	16'h87c4;
	33	: 	LUT_DATA	= 	16'h88d7;
	34	: 	LUT_DATA	= 	16'h89e8;
	35	: 	LUT_DATA	= 	16'h13e0;
	36	: 	LUT_DATA	= 	16'h0150;
	37	: 	LUT_DATA	= 	16'h0268;
	38	: 	LUT_DATA	= 	16'h1e01; 
	
	39	: 	LUT_DATA	= 	16'h1000;
	40	: 	LUT_DATA	= 	16'h0d40;
	41	: 	LUT_DATA	= 	16'h1418;
	42	: 	LUT_DATA	= 	16'ha507;
	43	: 	LUT_DATA	= 	16'hab08;
	44	: 	LUT_DATA	= 	16'h2495;
	45	: 	LUT_DATA	= 	16'h2533;
	46	: 	LUT_DATA	= 	16'h26e3;
	47	: 	LUT_DATA	= 	16'h9f78;
	48	: 	LUT_DATA	= 	16'ha068;
	49	: 	LUT_DATA	= 	16'ha103;
	50	: 	LUT_DATA	= 	16'ha6d8;
	51	: 	LUT_DATA	= 	16'ha7d8;
	52	: 	LUT_DATA	= 	16'ha8f0;
	53	: 	LUT_DATA	= 	16'ha990;
	54	: 	LUT_DATA	= 	16'haa94;
	55	: 	LUT_DATA	= 	16'h13e5;
	56	: 	LUT_DATA	= 	16'h0e61;
	57	: 	LUT_DATA	= 	16'h0f4b;
	58	: 	LUT_DATA	= 	16'h1602;

	60	: 	LUT_DATA	= 	16'h2102;
	61	: 	LUT_DATA	= 	16'h2291;
	62	: 	LUT_DATA	= 	16'h2907;
	63	: 	LUT_DATA	= 	16'h330b;
	64	: 	LUT_DATA	= 	16'h350b;
	65	: 	LUT_DATA	= 	16'h371d;
	66	: 	LUT_DATA	= 	16'h3871;
	67	: 	LUT_DATA	= 	16'h392a;
	68	: 	LUT_DATA	= 	16'h3c78;
	69	: 	LUT_DATA	= 	16'h4d40;
	70	: 	LUT_DATA	= 	16'h4e20;
	71	: 	LUT_DATA	= 	16'h6900;
	72	: 	LUT_DATA	= 	16'h6b0a;
	73	: 	LUT_DATA	= 	16'h7410;
	74	: 	LUT_DATA	= 	16'h8d4f;
	75	: 	LUT_DATA	= 	16'h8e00;
	76	: 	LUT_DATA	= 	16'h8f00;
	77	: 	LUT_DATA	= 	16'h9000;
	78	: 	LUT_DATA	= 	16'h9100;
	79	: 	LUT_DATA	= 	16'h9266;
	80	: 	LUT_DATA	= 	16'h9600;
	81	: 	LUT_DATA	= 	16'h9a80;

    default : LUT_DATA 	=  	16'h0000;
endcase
end 
endmodule
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    























































































































