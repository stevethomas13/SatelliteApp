// rob
class Text {
  int xpos; int ypos;
  
  // rob
  Text(){
    xpos=0;
    ypos=0;
  }
  
  // rob
  void HomeScreen(String title, int y){
    textAlign(LEFT);
    textFont(titleFont, 70);
    fill(text);
    text(title, padding, y);
  }
  
  //rob
  void title(String title){
    textAlign(LEFT);
    textFont(titleFont, 56);
    fill(text);
    text(title, padding+50, 120);
  }
  
  // rob
  void bodyCopy(String thisText, int y){
    textAlign(LEFT);
    textFont(myFont, 18);
    fill(text);
    text(thisText, padding, y);
  }
}
