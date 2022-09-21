// rob
class Button {
  int xpos; int ypos;
  Text theText;
  
  Button(){
    xpos=0;
    ypos=0;
    theText = new Text();
  }
  
  //rob
  void title(){
    int start = 120 - 56/3;
    int h = 8;
    int diameter = 42;
    int xStart = padding + 6*diameter/16;
    int xEnd = padding + 9*diameter/16;
    int circleX = padding + diameter/2;
    int circleY = start;
    chevronHover(circleX, circleY, diameter/2);
    circle(circleX, circleY, diameter);
    fill(text);
    stroke(4);
    strokeWeight(3);
    line(xStart, start, xEnd, start-h);
    line(xStart, start, xEnd, start+h);
  }
  
  //rob
  void btnSm(int x, int y, int w){
    int h = 35;
    btnHover(x, y, w, h);
    rect(x, y, w, h, 4);
    fill(background);
    textAlign(CENTER, CENTER);
    text("Click me", x+(w/2) , y+(h/2));
    strokeWeight(1);
  }
  
  // rob
  void chevronHover(int x, int y, int r){
    if ( x + r >= mouseX && x - r <= mouseX && y + r >= mouseY && y - r <= mouseY){
      fill(secondary);
      stroke(secondary);
    }
    else{
      fill(background);
      stroke(background);
    }
  }

  // rob
  void btnHover(int x, int y, int l, int h){
    if ((x + l) >= mouseX && mouseX >= x && mouseY >= y && mouseY <= (y + h)){
      cursor(HAND);
      fill(primaryHover);
      stroke(primaryHover);
    }
    else{
      cursor(ARROW);
      fill(primary);
      stroke(primary);
    }
  }
  
  // rob
  void btnLg(String title){
    textFont(myFont, 50);
    fill(text);
    text(title, 200, 120);
  }
}
