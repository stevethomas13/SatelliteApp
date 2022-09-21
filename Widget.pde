// Mariam
class Widget {
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  //Mariam
  Widget(int x, int y, int width, int height, String label, color widgetColor, PFont font, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=font;
    labelColor= color(0);
  }
  //rob
  Widget(int width, String label, PFont font, int event) {
    this.width = width;
    this.label=label;
    this.event=event;
    this.widgetFont=font;
    labelColor= color(0);
  }
  //rob
  Widget(int width, String label, PFont font) {
    this.width = width;
    this.label=label;
    //this.event=event;
    this.widgetFont=font;
    labelColor= color(0);
  }
  //Mariam
  void getEvent(int event) {
    this.event = event;
  }

  String getTitle() {
    return " ";
  }

  // rob
  void btnSm(int x, int y) {
    this.x = x;
    this.y = y;
    int h = 35;
    this.height = h;
    btnHover(x, y, width, h);
    rect(x, y, width, h, 4);
    fill(text);
    textAlign(CENTER, CENTER);
    text(label, x+(width/2), y+(h/2));
    strokeWeight(1);
  }

  // rob
  void title() {
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
    this.x = circleX - diameter/2;
    this.width = diameter;
    this.y = circleY - diameter/2;
    this.height = diameter;
    //getChevronEvent(circleX, circleY, diameter/2);
  }

  //rob
  //int getChevronEvent(int x, int y, int r){
  //  if(x + r >= mouseX && x - r <= mouseX && y + r >= mouseY && y - r <= mouseY){
  //    return event;
  //  }
  //  return EVENT_NULL;
  //}

  // rob
  void chevronHover(int x, int y, int r) {
    if (x + r >= mouseX && x - r <= mouseX && y + r >= mouseY && y - r <= mouseY) {
      //cursor(HAND);
      fill(secondary);
      stroke(secondary);
    } else {
      //cursor(ARROW);
      fill(background);
      stroke(background);
    }
  }


  // rob
  void btnPrimary(int x, int y) {
    this.x = x;
    this.y = y;
    int h = 35;
    this.height = h;
    if (btnHover(x, y, width, h)) {
      fill(primaryHover);
      stroke(primaryHover);
    } else {
      fill(primary);
      stroke(primary);
    }
    rect(x, y, width, h, 4);
    fill(background);
    textAlign(CENTER, CENTER);
    textFont(myFont, 18);
    text(label, x+(width/2), y+(h/2));
    strokeWeight(1);
  }

  // rob
  int width() {
    return this.width;
  }

  // rob
  void rocket(int x, int y, PImage rocket) {
    int size = 25;
    int h = 40;
    this.width = 45;
    if (btnHover(x, y, width, h)) {
      fill(secondary);
      stroke(secondary);
    } else {
      fill(background);
      stroke(background);
    }
    rectMode(CORNER);
    rect(x, y, width, h, 360);
    strokeWeight(1);
    rocket.resize(size, size);
    image(rocket, x+10, y+7);
    this.x = x;
    this.y = y;
    this.height = h;
  }

  void rocket(int x, int y) {
    this.x = x;
    this.y = y;
    int h = 35;
    this.height = h;
    if (btnHover(x, y, width, h)) {
      fill(secondary);
      stroke(secondary);
    } else {
      fill(background);
      stroke(background);
    }
    rectMode(CORNER);
    rect(x, y, width, h, 360);
    fill(text);
    textAlign(CENTER, CENTER);
    textFont(myFont, 18);
    text(label, x+(width/2), y+(h/2));
    strokeWeight(1);
  }

  // rob
  void btnGrey(int x, int y) {
    this.x = x;
    this.y = y;
    int h = 35;
    this.height = h;
    if (btnHover(x, y, width, h)) {
      fill(secondary);
      stroke(secondary);
    } else {
      fill(background);
      stroke(background);
    }
    rectMode(CORNER);
    rect(x, y, width, h, 360);
    fill(text);
    textAlign(CENTER, CENTER);
    textFont(myFont, 18);
    text(label, x+(width/2), y+(h/2));
    strokeWeight(1);
  }
  
  // rob
  void inputBox (int x, int y, String title) {
    this.x = x;
    this.y = y;
    int h = 35;
    this.height = h;
    //this.width = width;
    strokeWeight(2);
    if (btnHover(x, y, width, h)) {
      fill(background);
      stroke(secondaryHover);
    } else {
      fill(background);
      stroke(secondary);
    }
    rectMode(CORNER);
    rect(x, y, width, h, 10);
    fill(text);
    textAlign(LEFT, CENTER);
    textFont(myFont, 25);
    //text(label, x+(width/2) , y+(h/2));
    text(label, x+15, y+(h/2));
    textFont(myFont, 18);
    text(title, x, y-15);
  }


  // rob
  void btnUnderline(int x, int y) {
    this.x = x;
    this.y = y;
    int h = 33;
    this.height = h;
    //line(x, y, x + width, y);
    if (btnHover(x, y, width, h)) {
      fill(text);
      stroke(text);
      strokeWeight(2);
      line(x, y+h, x + width, y+h);
      stroke(text);
    } else {
    }
    fill(text);
    textAlign(CENTER, CENTER);
    textFont(myFont, 18);
    text(label, x+(width/2), y+(h/2));
    strokeWeight(1);
  }

  // rob
  void btnUnderlineActive(int x, int y) {
    int h = 33;
    stroke(text);
    fill(text);
    strokeWeight(2);
    line(x, y+h, x + width, y+h);
    stroke(text);
  }



  // rob
  boolean btnHover(int x, int y, int l, int h) {
    if ((x + l) >= mouseX && mouseX >= x && mouseY >= y && mouseY <= (y + h)) {
      return true;
    } else {
      return false;
    }
  }
  // Mariam
  void draw() {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  //Mariam
  int getEvent() {
    if (mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height) {
      return event;
    }
    return EVENT_NULL;
  }
}
