// rob created class and navigation
//Mariam - actual page
class State
{
  Text theText;
  Button theButton;
  ArrayList widgetList;
  ArrayList circleWidgets;
  String text;
  Controller aControllerLocal;
  Integer data;
  ArrayList<Integer> queries;
  ArrayList<Integer> countQueries;
  String name;
  int result2;
//Mariam
  State(Controller aController){  
    theText = new Text();
    theButton = new Button();
    widgetList = new ArrayList();
    circleWidgets = new ArrayList();
    Widget widget1 = new Widget(100, 100, 90, 40,"Name", color(100), myFont, HOME);
    CircleWidget widget2 = new CircleWidget(345, 565, color(255, 153, 51), SOUTHAMERICA);
    CircleWidget widget3 = new CircleWidget(800, 280, color(255, 153, 51), ASIA);
    CircleWidget widget4 = new CircleWidget(615, 450, color(255, 153, 51), AFRICA);
    CircleWidget widget5 = new CircleWidget(220, 310, color(255, 153, 51), NORTHAMERICA);
    CircleWidget widget6 = new CircleWidget(580, 275, color(255, 153, 51), EUROPE);
    CircleWidget widget7 = new CircleWidget(980, 595, color(255, 153, 51), AUSTRALIA);
    widgetList.add(widget1);
    circleWidgets.add(widget2);
    circleWidgets.add(widget3);
    circleWidgets.add(widget4);
    circleWidgets.add(widget5);
    circleWidgets.add(widget6);
    circleWidgets.add(widget7);
    aControllerLocal = aController;
  }
 //Mariam
  void show()
  {
    int event;
    for(int i = 0; i<circleWidgets.size(); i++){
    CircleWidget aWidget = (CircleWidget) circleWidgets.get(i);
       event = aWidget.getEvent2();
       switch(event) {
         case SOUTHAMERICA:
           aWidget.setBoolean(true);
           break;
         case ASIA:
           aWidget.setBoolean(true);
           break;
         case AFRICA:
           aWidget.setBoolean(true);
           break;
         case NORTHAMERICA:
           aWidget.setBoolean(true);
           break;
         case EUROPE:
           aWidget.setBoolean(true);
           break;
         case AUSTRALIA:
           aWidget.setBoolean(true);
           break;
         default:
            aWidget.setBoolean(false);
    }
    }
    theText.title("Continents");
    theButton.title();
    shape(s, padding-50, 150, mapHeight*imageRatio, mapHeight);
    
    mouseMoved();
    for(int i = 0; i<circleWidgets.size(); i++){
    CircleWidget aWidget = (CircleWidget)circleWidgets.get(i);
      if (aWidget.boolean1()){
        determineQuery();
        strokeWeight(2); 
        stroke(secondary);
        fill(background);
        rect(aWidget.xCircleWidget() + 20, aWidget.yCircleWidget() - 25, 255, 90, 10);
        fill(255);
        strokeWeight(1); 
        stroke(primaryHover);
        fill(#222222);
        textFont(myFont, 18);
        text(text, aWidget.xCircleWidget() + 30,aWidget.yCircleWidget() );
      }
      else {
         noStroke();
      }
      aWidget.draw();
    }
   strokeWeight(1);
   stroke(secondaryHover);
   
  }
  
  // rob
  void click(){
    int event = 0;
    for(int i = 0; i < widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(); 
      switch(event) {
        case HOME:
          ////println("forward"); 
          currentPage = 0;
          break;
      } 
    }
  }
  //Mariam
  void mouseMoved(){
    int event;
    for(int i = 0; i<circleWidgets.size(); i++){
    CircleWidget aWidget = (CircleWidget) circleWidgets.get(i);
       event = aWidget.getEvent2();
       switch(event) {
         case SOUTHAMERICA:
           aWidget.setBoolean(true);
           break;
         case ASIA:
           aWidget.setBoolean(true);
           break;
         case AFRICA:
           aWidget.setBoolean(true);
           break;
         case NORTHAMERICA:
           aWidget.setBoolean(true);
           break;
         case EUROPE:
           aWidget.setBoolean(true);
           break;
         case AUSTRALIA:
           aWidget.setBoolean(true);
           break;
         default:
            aWidget.setBoolean(false);
  }
    }
  }
  
  void determineQuery (){
    int event;
    for(int i = 0; i<circleWidgets.size(); i++){
    CircleWidget aWidget = (CircleWidget) circleWidgets.get(i);
       event = aWidget.getEvent2();
       switch(event) {
         case SOUTHAMERICA:
           name = "SOUTH_AMERICA";
           actuallyQuery(name);
           break;
         case ASIA:
           name = "ASIA";
           actuallyQuery(name);
           break;
         case AFRICA:
           name = "AFRICA";
           actuallyQuery(name);
           break;
         case NORTHAMERICA:
            name = "NORTH_AMERICA";
           actuallyQuery(name);
           break;
         case EUROPE:
            name = "EUROPE";
           actuallyQuery(name);
           break;
         case AUSTRALIA:
            name = "AUSTRALIA";
           actuallyQuery(name);
           break;
         default:
            aWidget.setBoolean(false);
  }
    }
  }
/*  
  void determineQuery(){
     int event;
    for(int i = 0; i<circleWidgets.size(); i++){
    CircleWidget aWidget = (CircleWidget) circleWidgets.get(i);
       event = aWidget.getEvent2();
       switch(event) {
         case USA:
           name = "US";
           actuallyQuery(name);
           break;
          case SU:
           name = "SU";
           actuallyQuery(name);
           break;
          case UK:
           name = "UK";
           actuallyQuery(name);
           break;
          case CA:
           name = "CA";
           actuallyQuery(name);
           break;
          case I:
           name = "I";
           actuallyQuery(name);
           break;
          default:
            aWidget.setBoolean(false);
  }
    }
  }
  */
  void actuallyQuery(String name){
    aControllerLocal.createData();
    data = aControllerLocal.getStates(null, name);
    String v1 = data.toString();
    String result2 = "Continent: " + name.replace("_", " ") + "\n";
    result2 += "Total spacecraft: " + v1 + "\n";
    Integer frequency = round((data.floatValue() / 50000 ) * 100);
    //////println("This is frequency" + frequency);
    result2 += "Proportion: " + frequency + "%";
    text = result2;
    
  }

}
