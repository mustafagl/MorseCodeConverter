module StringSplitter(
  input [63:0] str,
  output reg [4:0][7:0] letters
);
  integer i;

  always @(*) begin
    for (i = 0; i < 5; i = i + 1) begin
      letters[i] = str[(i*8)+:8];
    end
  end

endmodule

module subModule(
  input clk,
  input rst,
  output reg [5:0] leds
);

reg [63:0] str;  // String'i temsil etmek için 64-bit değişken
wire [4:0][7:0] letters_wire;  // Harfleri temsil etmek için 5 adet 8-bit wire sinyali
reg [4:0][7:0] letters;  // Harfleri temsil etmek için 5 adet 8-bit reg sinyali
integer i;
reg [1:0] state;
reg run;



  initial begin
    str = "selam";  // ASCII değerlerini kullanarak "selam" stringini atayın
    i=4;
    run=0;
    leds <= 6'b111111;
  end




  StringSplitter splitter(
    .str(str),
    .letters(letters_wire)
  );


reg [23:0] counter;
reg[5:0] counter2;



always @ (posedge clk or negedge rst) begin


    if(!rst) begin
        counter <= 24'd0; // butondan reset çağrısı geldiğinde counterlar sıfırlanır
        counter2 <= 6'd0;
    end
    else if (counter2 > 6'd12)
        counter2 <=6'd0;    // 17. saniyeden sonra tekrar sıfırıncı saniyeye geçilir
    else if( counter < 24'd1349_9999)
        counter <= counter + 1;
    else begin
        counter2 <= counter2 + 1;
        counter <= 24'd0;
    end


end


  always @(posedge clk or posedge rst) begin




    if (!rst) begin
        leds <= 6'b111111;
        run=0;
         i = 4;

    end else begin
      letters <= letters_wire;  // letters_wire sinyalini letters reg sinyaline atayın
       leds[5:0] <= 6'b111111;

        case (letters[i])
          "a": begin


                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if (counter2 < 6'd1)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd2)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd5)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd6)
                            leds[5:0] <= 6'b111111;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;
                            run=0;
                        end
                end      
          end
          "b": begin
         
                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if (counter2 < 6'd3)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd4)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd5)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd6)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd7)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd8)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd9)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd10)
                            leds[5:0] <= 6'b111111;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;

                            run=0;
                        end
                end  

          end
          "c": begin


                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if ( counter2 < 6'd3)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd4)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd5)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd6)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd9)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd10)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd11)
                            leds[5:0] <= 6'b000000;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;

                            run=0;
                        end
                end  



          end
          "d": begin

                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if ( counter2 < 6'd3)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd4)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd5)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd6)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd7)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd8)
                            leds[5:0] <= 6'b111111;
               
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;

                            run=0;
                        end
                end  



          end

          "e": begin



                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if ( counter2 < 6'd1)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd2)
                            leds[5:0] <= 6'b111111;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;

                            run=0;
                        end
                end  



          end



          "s": begin
                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if ( counter2 < 6'd1)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd3)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd4)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd6)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd7)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd9)
                            leds[5:0] <= 6'b111111;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;

                            run=0;
                        end
                end  



          end


          "l": begin
                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if ( counter2 < 6'd1)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd2)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd5)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd6)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd7)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd9)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd10)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd11)
                            leds[5:0] <= 6'b111111;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;

                            run=0;
                        end
                end  



          end

          "m": begin


                if(!run && counter2 == 6'd0)
                        run=1;
                if(run) begin
                        if (counter2 < 6'd3)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd4)
                            leds[5:0] <= 6'b111111;
                        else if ( counter2 < 6'd7)
                            leds[5:0] <= 6'b000000;
                        else if ( counter2 < 6'd8)
                            leds[5:0] <= 6'b111111;
                        else begin
                            leds[5:0] <= leds;
                            i = i - 1;
                            run=0;
                        end
                end      
          end

          default: begin

          end
        endcase
      
    end
  end

endmodule
