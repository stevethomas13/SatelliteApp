// Mariam - class for states 
class CircleWidget {
  int x, y; String label; int event;
  color widgetColor, labelColor;
  boolean stroke = false;

  CircleWidget(int x,int y, color widgetColor,int event){
    this.x=x; this.y=y; this.event=event; 
    this.widgetColor=widgetColor; labelColor= color(0);
   }   
 
  CircleWidget(int event){
    this.event=event; 
    labelColor= color(0);
  }
  
   void draw(){
    fill(primary); 
    ellipse (x, y, radius, radius);
  }

  int getEvent2(){
    if(mouseX > x - radius && mouseX < x + radius && mouseY > y - radius && mouseY < y + radius){ 
      return event;
    }
    return EVENT_NULL; 
  }
  
  boolean boolean1(){
    return stroke;
  }
  
  void setBoolean(boolean boolean2){
    stroke = boolean2;
  }
  
  int xCircleWidget (){
    return x;
  }
  
  int yCircleWidget() {
    return y;
  }
  
  
  
}
