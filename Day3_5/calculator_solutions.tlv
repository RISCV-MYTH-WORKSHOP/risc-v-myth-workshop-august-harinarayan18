RV-D3SK1 - simple Counter Code

\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
    
   $cnt[31:0] = $reset ? 0: ((>>1$cnt) + 1);
    
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
   
   
Makerchip URL: https://makerchip.com/sandbox/00Rf2h2Zv/0KOh2MV#

RV-D3SK3 - simple CAlculator Code

\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   
   
   |calc
      @1
         $reset = *reset;
         m4_rand($rand_val2, 14, 0)
         m4_rand($rand_opcode, 1, 0)
         $val2[31:0] = {17'b0,$rand_val2};
         $opcode[1:0] = {17'b0,$rand_opcode};
            
         $val1[31:0] = >>1$out ;
            
         $sum[31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $mul[31:0] = $val1 * $val2;
         $div[31:0] = $val1 / $val2;
            
         $out[31:0] = $reset ? 32'b0 : ($opcode == 2'b00) ? $sum : 
                      ($opcode == 2'b01) ? $diff : ($opcode == 2'b10) ? $mul :
                         ($opcode == 2'b11) ? $div :32'b0;
             
         $reset = *reset;
         $cnt[31:0] = $reset ? 0: ((>>1$cnt) + 1);            
          
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
   
   
Makerchip URL: https://makerchip.com/sandbox/00Rf2h2Zv/0xGh1D1#   

RV-D3SK3 - 2 Cycle  CAlculator Code

\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   //$reset = *reset;
   |calc
      @1
         $reset = *reset;
         m4_rand($rand_val2, 14, 0)
         m4_rand($rand_opcode, 1, 0)
         $val2[31:0] = {17'b0,$rand_val2};
         $opcode[1:0] = {17'b0,$rand_opcode};
         
         $val1[31:0] = >>2$out ;
         
         $sum[31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $mul[31:0] = $val1 * $val2;
         $div[31:0] = $val1 / $val2;
         
         $cnt = ((>>1$valid) + 1);
         
         $valid = $reset ? 1'b0 : $cnt;
         
      @2
         $select = ($reset || (!($valid)));
         
         //?$select 
            //$out[31:0] = ($opcode == 2'b00) ? $sum : ($opcode == 2'b01) ? $diff : ($opcode == 2'b10) ? $mul :
            //           ($opcode == 2'b11) ? $div :32'b0;
         
         
         $out[31:0] = $select ? 32'b0 : ($opcode == 2'b00) ? $sum : 
                   ($opcode == 2'b01) ? $diff : ($opcode == 2'b10) ? $mul :
                    ($opcode == 2'b11) ? $div :32'b0;
                
          
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule


Makerchip URL: https://makerchip.com/sandbox/00Rf2h2Zv/01jhM84#

RV-D3SK3 - 2 Cycle  CAlculator Alternate Code

\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   //$reset = *reset;
   |calc
      @1
         $reset = *reset;
         m4_rand($rand_val2, 14, 0)
         m4_rand($rand_opcode, 1, 0)
         $val2[31:0] = {17'b0,$rand_val2};
         $opcode[1:0] = {17'b0,$rand_opcode};
         
         $val1[31:0] = >>2$out ;
         
         $sum[31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $mul[31:0] = $val1 * $val2;
         $div[31:0] = $val1 / $val2;
         
         $cnt = ((>>1$valid) + 1);
         
         $valid = $reset ? 1'b0 : $cnt;
         
      @2
         $select = ($reset || (!($valid)));
         
           ?$select 
              $out[31:0] = ($opcode == 2'b00) ? $sum : ($opcode == 2'b01) ? $diff : ($opcode == 2'b10) ? $mul :
                        ($opcode == 2'b11) ? $div :32'b0;
         
         
                
          
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
