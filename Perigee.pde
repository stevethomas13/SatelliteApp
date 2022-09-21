// rob created class + navigation
// rob + mariam created page
// mariam date sorting + widgets
class Perigee
{
  Text theText;
  Controller theController;
  Button theButton;
  ArrayList widgetList;
  float[] data;
  BarChartHorizontal myBar = new BarChartHorizontal();
  ArrayList<Float> dataArrayList = new ArrayList<Float>();
  TextWidget text1;
  TextWidget text2;
  ArrayList myWidgets;
  DateSorting myDate=new DateSorting();
  DateCut cuttingDate=new DateCut(myDate);


  Perigee(Controller aController){  
    theController = aController;
    String [] date = aController.getDates(null);
    myDate.setUp(date);
    theText = new Text();
    theButton = new Button();
    widgetList = new ArrayList();
    text1=new TextWidget(150, "", myFont, EVENT_TEXT3, 4, "From date:"); 
    text2=new TextWidget(150, "", myFont, EVENT_TEXT4, 4, "To date:"); 
    //Widget widget1 = new Widget(420,175, 90, 30, "Search", color(primary), myFont, SEARCH2);
    Widget widget1 = new Widget(90,"Search", myFont, SEARCH2);

    myWidgets = new ArrayList();
    myWidgets.add(text1); myWidgets.add(text2);
    widgetList.add(widget1); 
    aController.createData();
    data = aController.getPerigee(null);
    for (int i = 0; i < data.length; i++){
      dataArrayList.add(data[i]);
    }
    myBar.setUp(dataArrayList,myFont);

  }
 
  void show()
  {
    int height = 170;
    theText.title("Perigee");
    myBar.drawBar();
    theButton.title();
    int w = padding;
    for(int i = 0; i < myWidgets.size(); i++){
      String title = ((Widget)myWidgets.get(i)).getTitle();
      ((Widget)myWidgets.get(i)).inputBox(w, height, title);
      w = w + ((Widget)myWidgets.get(i)).width() + 30;
    }
    
    for(int i = 0; i<widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i); 
      aWidget.btnPrimary(425, 170);
    }
  }
  //Mariam
  void click(){
     int event = 0;
    for(int i = 0; i < myWidgets.size(); i++){ 
      Widget aWidget = (Widget) myWidgets.get(i);
      event = aWidget.getEvent(); 
      switch(event) {
         case EVENT_TEXT3:
          ////println("clicked on a text widget!"); 
         focus= (TextWidget)aWidget;
         generalCount = 1;
         return; 
        case EVENT_TEXT4:
          ////println("clicked on text widget2");
          focus = (TextWidget)aWidget;
          generalCount = 2;
          return;
        default:
        focus = null;
      } 
    }
    //Mariam
    int event2 = 0;
    for(int i = 0; i < widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i);
      event2 = aWidget.getEvent(); 
      switch(event2) {
        case SEARCH2:
          searchButton2 = true;
          changeBarChart();
          break;
      }
    }
    
  }
  //Mariam 
     void changeBarChart (){
    ////println(name1GeneralQuery);
    ////println(name2GeneralQuery);
    //////println("khgvbkh aduhaadshvoauhvoauhfub ofgfoduhdo");
    int pass1 = Integer.parseInt(name1GeneralQuery);
    int pass2 = Integer.parseInt(name2GeneralQuery);
    data = theController.getPerigee(null);
    Float [] workingData = new Float[data.length];
    for(int i=0; i < data.length; i ++){
      workingData[i] = data[i];
    }
    ////println(workingData.length);
    Float [] newData =cuttingDate.setUpF(workingData, pass1, pass2);
    //////println(newData.length);
    ArrayList<Float> dataArrayList2 = new ArrayList<Float>();
    for (int i = 0; i < newData.length; i++){
      Float temp = newData[i];
      dataArrayList2.add(temp); 
    }
    ////println(data.length + "sjdhgzdjhbfzhfijz");
    for (int i = 0; i < data.length; i++){
    dataArrayList.add(data[i]);
    }
     
    ////println(dataArrayList2.size());
    myBar.setUp(dataArrayList2,myFont);
    searchButton2 = false;
  }
}
