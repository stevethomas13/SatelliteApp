//rob
class HomeScreen
{
  // rob
  Text theText;
  Button theButton;
  ArrayList widgetList;
  
  HomeScreen(){  
    theText = new Text();
    widgetList = new ArrayList();
    Widget widget1 = new Widget(120,"Get started", myFont);
    widgetList.add(widget1);
  }
  
  // rob
  void show(PImage astronaut) {
    theText.HomeScreen("To infinity", 300);
    theText.HomeScreen("And beyond", 370);
    image(astronaut, 670, 110);
    theText.bodyCopy(homePageLine1, 410);
    theText.bodyCopy(homePageLine2, 430);
    for(int i = 0; i < widgetList.size(); i++){
      //int j = int(random(1, 5));
      ((Widget)widgetList.get(i)).getEvent(1);
      ((Widget)widgetList.get(i)).btnPrimary(padding, 450);
    }
  }
  
  //rob + mariam
  void click(){
    int event = 0;
    for(int i = 0; i < widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(); 
      switch(event) {
        case APOGEE:
          ////println("forward"); 
          currentPage = APOGEE;
          break;
        case PERIGEE:
          ////println("forward"); 
          currentPage = PERIGEE;
          break;
        case STATUS:
          ////println("forward"); 
          currentPage = STATUS;
          break;
        case LAUNCH_DATE:
          ////println("forward"); 
          currentPage = LAUNCH_DATE;
          break;
        case STATE:
          ////println("forward"); 
          currentPage = STATE;
          break;
      } 
    }
  }
}
