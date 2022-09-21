// rob
class NavBar
{
  // rob
  Text theText;
  Button theButton;
  ArrayList widgetList;
  
  // rob
  NavBar(){
    theText = new Text();
    theButton = new Button();
    widgetList = new ArrayList();
    Widget widget1 = new Widget(90,"Home", myFont, HOME);
    Widget widget2 = new Widget(90,"Apogee", myFont, APOGEE);
    Widget widget3 = new Widget(90,"Perigee", myFont, PERIGEE);
    Widget widget4 = new Widget(90,"Status", myFont, STATUS);
    Widget widget5 = new Widget(130,"Launch Date", myFont, LAUNCH_DATE);
    Widget widget6 = new Widget(120,"Continents", myFont, STATE);
    Widget widget7 = new Widget(90,"Home", myFont, 7);
    widgetList.add(widget1);widgetList.add(widget2);widgetList.add(widget3);widgetList.add(widget4);widgetList.add(widget5);widgetList.add(widget6);
    widgetList.add(widget7);
  }

  // rob
  void show(PImage rocket) {
    int w = padding + 50;
    int height = 20;
    for(int i = 1; i < widgetList.size()-1; i++){ 
      ((Widget)widgetList.get(i)).btnGrey(w, height);
      w = w + ((Widget)widgetList.get(i)).width() + 20;
    }
    ((Widget)widgetList.get(0)).rocket(padding, height-5, rocket);
    if(currentPage != HOME){
      ((Widget)widgetList.get(6)).title();
    }
  }
  
  // rob
  void click(){
    int event = 0;
    for(int i = 0; i < widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(); 
      switch(event) {
         case HOME:
          previousPage = currentPage;
          currentPage = HOME;
          break;
        case APOGEE:
          previousPage = currentPage;
          currentPage = APOGEE;
          break;
        case PERIGEE:
          previousPage = currentPage;
          currentPage = PERIGEE;
          break;
        case STATUS:
          previousPage = currentPage;
          currentPage = STATUS;
          break;
        case LAUNCH_DATE:
          previousPage = currentPage;
          currentPage = LAUNCH_DATE;
          break;
        case STATE:
          previousPage = currentPage;
          currentPage = STATE;
          break;
        case 7:
          currentPage = previousPage;
          previousPage = HOME;
          break;
      } 
    }
  }
}
