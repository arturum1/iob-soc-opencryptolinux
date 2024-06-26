`timescale 1ns / 1ps

module SBox #(
  parameter DATA_W = 32
) (
   input run,
   input running,

   input clk,
   input rst,

   input [DATA_W-1:0] in0,

   (* versat_latency=0 *) output reg [DATA_W-1:0] out0
);
    
  always @* begin
     out0 = 32'h0;

     case(in0[7:0])
         8'h00: out0[7:0] = 8'h63;
         8'h01: out0[7:0] = 8'h7c;
         8'h02: out0[7:0] = 8'h77;
         8'h03: out0[7:0] = 8'h7b;
         8'h04: out0[7:0] = 8'hf2;
         8'h05: out0[7:0] = 8'h6b;
         8'h06: out0[7:0] = 8'h6f;
         8'h07: out0[7:0] = 8'hc5;
         8'h08: out0[7:0] = 8'h30;
         8'h09: out0[7:0] = 8'h01;
         8'h0a: out0[7:0] = 8'h67;
         8'h0b: out0[7:0] = 8'h2b;
         8'h0c: out0[7:0] = 8'hfe;
         8'h0d: out0[7:0] = 8'hd7;
         8'h0e: out0[7:0] = 8'hab;
         8'h0f: out0[7:0] = 8'h76;
         8'h10: out0[7:0] = 8'hca;
         8'h11: out0[7:0] = 8'h82;
         8'h12: out0[7:0] = 8'hc9;
         8'h13: out0[7:0] = 8'h7d;
         8'h14: out0[7:0] = 8'hfa;
         8'h15: out0[7:0] = 8'h59;
         8'h16: out0[7:0] = 8'h47;
         8'h17: out0[7:0] = 8'hf0;
         8'h18: out0[7:0] = 8'had;
         8'h19: out0[7:0] = 8'hd4;
         8'h1a: out0[7:0] = 8'ha2;
         8'h1b: out0[7:0] = 8'haf;
         8'h1c: out0[7:0] = 8'h9c;
         8'h1d: out0[7:0] = 8'ha4;
         8'h1e: out0[7:0] = 8'h72;
         8'h1f: out0[7:0] = 8'hc0;
         8'h20: out0[7:0] = 8'hb7;
         8'h21: out0[7:0] = 8'hfd;
         8'h22: out0[7:0] = 8'h93;
         8'h23: out0[7:0] = 8'h26;
         8'h24: out0[7:0] = 8'h36;
         8'h25: out0[7:0] = 8'h3f;
         8'h26: out0[7:0] = 8'hf7;
         8'h27: out0[7:0] = 8'hcc;
         8'h28: out0[7:0] = 8'h34;
         8'h29: out0[7:0] = 8'ha5;
         8'h2a: out0[7:0] = 8'he5;
         8'h2b: out0[7:0] = 8'hf1;
         8'h2c: out0[7:0] = 8'h71;
         8'h2d: out0[7:0] = 8'hd8;
         8'h2e: out0[7:0] = 8'h31;
         8'h2f: out0[7:0] = 8'h15;
         8'h30: out0[7:0] = 8'h04;
         8'h31: out0[7:0] = 8'hc7;
         8'h32: out0[7:0] = 8'h23;
         8'h33: out0[7:0] = 8'hc3;
         8'h34: out0[7:0] = 8'h18;
         8'h35: out0[7:0] = 8'h96;
         8'h36: out0[7:0] = 8'h05;
         8'h37: out0[7:0] = 8'h9a;
         8'h38: out0[7:0] = 8'h07;
         8'h39: out0[7:0] = 8'h12;
         8'h3a: out0[7:0] = 8'h80;
         8'h3b: out0[7:0] = 8'he2;
         8'h3c: out0[7:0] = 8'heb;
         8'h3d: out0[7:0] = 8'h27;
         8'h3e: out0[7:0] = 8'hb2;
         8'h3f: out0[7:0] = 8'h75;
         8'h40: out0[7:0] = 8'h09;
         8'h41: out0[7:0] = 8'h83;
         8'h42: out0[7:0] = 8'h2c;
         8'h43: out0[7:0] = 8'h1a;
         8'h44: out0[7:0] = 8'h1b;
         8'h45: out0[7:0] = 8'h6e;
         8'h46: out0[7:0] = 8'h5a;
         8'h47: out0[7:0] = 8'ha0;
         8'h48: out0[7:0] = 8'h52;
         8'h49: out0[7:0] = 8'h3b;
         8'h4a: out0[7:0] = 8'hd6;
         8'h4b: out0[7:0] = 8'hb3;
         8'h4c: out0[7:0] = 8'h29;
         8'h4d: out0[7:0] = 8'he3;
         8'h4e: out0[7:0] = 8'h2f;
         8'h4f: out0[7:0] = 8'h84;
         8'h50: out0[7:0] = 8'h53;
         8'h51: out0[7:0] = 8'hd1;
         8'h52: out0[7:0] = 8'h00;
         8'h53: out0[7:0] = 8'hed;
         8'h54: out0[7:0] = 8'h20;
         8'h55: out0[7:0] = 8'hfc;
         8'h56: out0[7:0] = 8'hb1;
         8'h57: out0[7:0] = 8'h5b;
         8'h58: out0[7:0] = 8'h6a;
         8'h59: out0[7:0] = 8'hcb;
         8'h5a: out0[7:0] = 8'hbe;
         8'h5b: out0[7:0] = 8'h39;
         8'h5c: out0[7:0] = 8'h4a;
         8'h5d: out0[7:0] = 8'h4c;
         8'h5e: out0[7:0] = 8'h58;
         8'h5f: out0[7:0] = 8'hcf;
         8'h60: out0[7:0] = 8'hd0;
         8'h61: out0[7:0] = 8'hef;
         8'h62: out0[7:0] = 8'haa;
         8'h63: out0[7:0] = 8'hfb;
         8'h64: out0[7:0] = 8'h43;
         8'h65: out0[7:0] = 8'h4d;
         8'h66: out0[7:0] = 8'h33;
         8'h67: out0[7:0] = 8'h85;
         8'h68: out0[7:0] = 8'h45;
         8'h69: out0[7:0] = 8'hf9;
         8'h6a: out0[7:0] = 8'h02;
         8'h6b: out0[7:0] = 8'h7f;
         8'h6c: out0[7:0] = 8'h50;
         8'h6d: out0[7:0] = 8'h3c;
         8'h6e: out0[7:0] = 8'h9f;
         8'h6f: out0[7:0] = 8'ha8;
         8'h70: out0[7:0] = 8'h51;
         8'h71: out0[7:0] = 8'ha3;
         8'h72: out0[7:0] = 8'h40;
         8'h73: out0[7:0] = 8'h8f;
         8'h74: out0[7:0] = 8'h92;
         8'h75: out0[7:0] = 8'h9d;
         8'h76: out0[7:0] = 8'h38;
         8'h77: out0[7:0] = 8'hf5;
         8'h78: out0[7:0] = 8'hbc;
         8'h79: out0[7:0] = 8'hb6;
         8'h7a: out0[7:0] = 8'hda;
         8'h7b: out0[7:0] = 8'h21;
         8'h7c: out0[7:0] = 8'h10;
         8'h7d: out0[7:0] = 8'hff;
         8'h7e: out0[7:0] = 8'hf3;
         8'h7f: out0[7:0] = 8'hd2;
         8'h80: out0[7:0] = 8'hcd;
         8'h81: out0[7:0] = 8'h0c;
         8'h82: out0[7:0] = 8'h13;
         8'h83: out0[7:0] = 8'hec;
         8'h84: out0[7:0] = 8'h5f;
         8'h85: out0[7:0] = 8'h97;
         8'h86: out0[7:0] = 8'h44;
         8'h87: out0[7:0] = 8'h17;
         8'h88: out0[7:0] = 8'hc4;
         8'h89: out0[7:0] = 8'ha7;
         8'h8a: out0[7:0] = 8'h7e;
         8'h8b: out0[7:0] = 8'h3d;
         8'h8c: out0[7:0] = 8'h64;
         8'h8d: out0[7:0] = 8'h5d;
         8'h8e: out0[7:0] = 8'h19;
         8'h8f: out0[7:0] = 8'h73;
         8'h90: out0[7:0] = 8'h60;
         8'h91: out0[7:0] = 8'h81;
         8'h92: out0[7:0] = 8'h4f;
         8'h93: out0[7:0] = 8'hdc;
         8'h94: out0[7:0] = 8'h22;
         8'h95: out0[7:0] = 8'h2a;
         8'h96: out0[7:0] = 8'h90;
         8'h97: out0[7:0] = 8'h88;
         8'h98: out0[7:0] = 8'h46;
         8'h99: out0[7:0] = 8'hee;
         8'h9a: out0[7:0] = 8'hb8;
         8'h9b: out0[7:0] = 8'h14;
         8'h9c: out0[7:0] = 8'hde;
         8'h9d: out0[7:0] = 8'h5e;
         8'h9e: out0[7:0] = 8'h0b;
         8'h9f: out0[7:0] = 8'hdb;
         8'ha0: out0[7:0] = 8'he0;
         8'ha1: out0[7:0] = 8'h32;
         8'ha2: out0[7:0] = 8'h3a;
         8'ha3: out0[7:0] = 8'h0a;
         8'ha4: out0[7:0] = 8'h49;
         8'ha5: out0[7:0] = 8'h06;
         8'ha6: out0[7:0] = 8'h24;
         8'ha7: out0[7:0] = 8'h5c;
         8'ha8: out0[7:0] = 8'hc2;
         8'ha9: out0[7:0] = 8'hd3;
         8'haa: out0[7:0] = 8'hac;
         8'hab: out0[7:0] = 8'h62;
         8'hac: out0[7:0] = 8'h91;
         8'had: out0[7:0] = 8'h95;
         8'hae: out0[7:0] = 8'he4;
         8'haf: out0[7:0] = 8'h79;
         8'hb0: out0[7:0] = 8'he7;
         8'hb1: out0[7:0] = 8'hc8;
         8'hb2: out0[7:0] = 8'h37;
         8'hb3: out0[7:0] = 8'h6d;
         8'hb4: out0[7:0] = 8'h8d;
         8'hb5: out0[7:0] = 8'hd5;
         8'hb6: out0[7:0] = 8'h4e;
         8'hb7: out0[7:0] = 8'ha9;
         8'hb8: out0[7:0] = 8'h6c;
         8'hb9: out0[7:0] = 8'h56;
         8'hba: out0[7:0] = 8'hf4;
         8'hbb: out0[7:0] = 8'hea;
         8'hbc: out0[7:0] = 8'h65;
         8'hbd: out0[7:0] = 8'h7a;
         8'hbe: out0[7:0] = 8'hae;
         8'hbf: out0[7:0] = 8'h08;
         8'hc0: out0[7:0] = 8'hba;
         8'hc1: out0[7:0] = 8'h78;
         8'hc2: out0[7:0] = 8'h25;
         8'hc3: out0[7:0] = 8'h2e;
         8'hc4: out0[7:0] = 8'h1c;
         8'hc5: out0[7:0] = 8'ha6;
         8'hc6: out0[7:0] = 8'hb4;
         8'hc7: out0[7:0] = 8'hc6;
         8'hc8: out0[7:0] = 8'he8;
         8'hc9: out0[7:0] = 8'hdd;
         8'hca: out0[7:0] = 8'h74;
         8'hcb: out0[7:0] = 8'h1f;
         8'hcc: out0[7:0] = 8'h4b;
         8'hcd: out0[7:0] = 8'hbd;
         8'hce: out0[7:0] = 8'h8b;
         8'hcf: out0[7:0] = 8'h8a;
         8'hd0: out0[7:0] = 8'h70;
         8'hd1: out0[7:0] = 8'h3e;
         8'hd2: out0[7:0] = 8'hb5;
         8'hd3: out0[7:0] = 8'h66;
         8'hd4: out0[7:0] = 8'h48;
         8'hd5: out0[7:0] = 8'h03;
         8'hd6: out0[7:0] = 8'hf6;
         8'hd7: out0[7:0] = 8'h0e;
         8'hd8: out0[7:0] = 8'h61;
         8'hd9: out0[7:0] = 8'h35;
         8'hda: out0[7:0] = 8'h57;
         8'hdb: out0[7:0] = 8'hb9;
         8'hdc: out0[7:0] = 8'h86;
         8'hdd: out0[7:0] = 8'hc1;
         8'hde: out0[7:0] = 8'h1d;
         8'hdf: out0[7:0] = 8'h9e;
         8'he0: out0[7:0] = 8'he1;
         8'he1: out0[7:0] = 8'hf8;
         8'he2: out0[7:0] = 8'h98;
         8'he3: out0[7:0] = 8'h11;
         8'he4: out0[7:0] = 8'h69;
         8'he5: out0[7:0] = 8'hd9;
         8'he6: out0[7:0] = 8'h8e;
         8'he7: out0[7:0] = 8'h94;
         8'he8: out0[7:0] = 8'h9b;
         8'he9: out0[7:0] = 8'h1e;
         8'hea: out0[7:0] = 8'h87;
         8'heb: out0[7:0] = 8'he9;
         8'hec: out0[7:0] = 8'hce;
         8'hed: out0[7:0] = 8'h55;
         8'hee: out0[7:0] = 8'h28;
         8'hef: out0[7:0] = 8'hdf;
         8'hf0: out0[7:0] = 8'h8c;
         8'hf1: out0[7:0] = 8'ha1;
         8'hf2: out0[7:0] = 8'h89;
         8'hf3: out0[7:0] = 8'h0d;
         8'hf4: out0[7:0] = 8'hbf;
         8'hf5: out0[7:0] = 8'he6;
         8'hf6: out0[7:0] = 8'h42;
         8'hf7: out0[7:0] = 8'h68;
         8'hf8: out0[7:0] = 8'h41;
         8'hf9: out0[7:0] = 8'h99;
         8'hfa: out0[7:0] = 8'h2d;
         8'hfb: out0[7:0] = 8'h0f;
         8'hfc: out0[7:0] = 8'hb0;
         8'hfd: out0[7:0] = 8'h54;
         8'hfe: out0[7:0] = 8'hbb;
         8'hff: out0[7:0] = 8'h16;
      endcase
   end

endmodule
 