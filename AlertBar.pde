// AlertBar, work in progress, might be used in the main program, beta feature, Steve @05.04.2022
public class AlertBar{
  
  float widthBar = 200;
  float lengthBar = 80;
  float posx;
  float posy;
  PFont font1 = new PFont();
  String title;
  String line1;
  String line2;
  String line3;
  float borderSpacing = 30;
  float roundedness = 10;
  float textSize = 17;
  float dy=1;
  boolean hideBar = false;
  
  AlertBar(String head, String line1, String line2, String line3 ){
    title = head;
    this.line1 = line1;
    this.line2 = line2;
    this.line3 = line3;
    posx =  width - widthBar - borderSpacing;
    posy = -borderSpacing;
  }

  // draws the alert bar, length and width, x, y position of alert bar is constant, Steve @04.04.2022
  void draw() {
    fill( 255, 0, 0);
    rect( posx, posy, widthBar, lengthBar, roundedness);
    {
      font1 = loadFont("AgencyFB-Bold-25.vlw");
      textSize(textSize );
      fill(10);
      text( title, posx + 5, posy + textSize*1.2);
      textSize( textSize - 3); 
      text( line1, posx + 5, posy + textSize*2.2);
      text( line2, posx + 5, posy + textSize*3.2);
      text( line3, posx + 5, posy + textSize*4.2);
    }
  }
  
  void move(){
    while( posy < borderSpacing ){
      posy= posy+dy;
    }
  }
  
  

}
