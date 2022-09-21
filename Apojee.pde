// rob created class + navigation
// Mariam main program
// harry intergrate dateCut
import java.util.Arrays; 
class Apogee
{
  Text theText;
  Button theButton;
  float[] data;
  int[] dataNum;
  BarChartHorizontal currentBar = new BarChartHorizontal();
  Controller theController;
  TextWidget text1;
  TextWidget text2;
  ArrayList widgetList;
  ArrayList myWidgets;
  ArrayList<Float> queries;
  BarChartHorizontal myBar = new BarChartHorizontal();
  ArrayList<Float> dataArrayList = new ArrayList<Float>();
  int initialSet = 1;
  DateSorting myDate=new DateSorting();
  DateCut cuttingDate=new DateCut(myDate);
  
// Mariam 
   Apogee(Controller aController){  
     theController = aController;
     String [] date = aController.getDates(null);
     myDate.setUp(date);
     theText = new Text();
     theButton = new Button();
     widgetList = new ArrayList();
     //Widget widget1 = new Widget(100, 100, 90, 40,"Name", color(100), myFont, HOME);
     //Widget widget2 = new Widget(90,"Home", myFont, HOME);
     //rob
     text1=new TextWidget(150, "", myFont, EVENT_TEXT1, 4, "From date:"); 
     text2=new TextWidget(150, "", myFont, EVENT_TEXT2, 4, "To date:"); 
     //Widget widget1 = new Widget(420,175, 90, 30, "Search", color(primary), myFont, SEARCH);
     Widget widget1 = new Widget(90,"Search", myFont, SEARCH);

     myWidgets = new ArrayList();
     myWidgets.add(text1); myWidgets.add(text2);
     widgetList.add(widget1);
     //widgetList.add(widget1);widgetList.add(widget2);
     currentBar = myBar;
     aController.createData();
     data = aController.getApogee(null);

    for (int i = 0; i < data.length; i++){
       dataArrayList.add(data[i]);
      }
       myBar.setUp(dataArrayList,myFont);
    
    }
   
  void show()
  {
    int height = 170;
    theText.title("Apogee");
    myBar.drawBar();
   //   currentBar.drawBar();
   //image (staticorbit, 900, 150);
   // rob + mariam search bar display
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
  
  // Mariam
  void click(){
    int event = 0;
    for(int i = 0; i < myWidgets.size(); i++){ 
      Widget aWidget = (Widget) myWidgets.get(i);
      event = aWidget.getEvent(); 
      switch(event) {
         case EVENT_TEXT1:
          //////println("clicked on a text widget!"); 
         focus= (TextWidget)aWidget;
         generalCount = 1;
         return; 
        case EVENT_TEXT2:
          //////println("clicked on text widget2");
          focus = (TextWidget)aWidget;
          generalCount = 2;
          return;
        default:
        focus = null;
      } 
    }
    
    int event2 = 0;
    for(int i = 0; i < widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i);
      event2 = aWidget.getEvent(); 
      switch(event2) {
        case SEARCH: //<>// //<>//
          searchButton = true;
          changeBarChart();
          break;
      }
    }
    
  }
    

  
  //Mariam   
  /*int[] query( float[] queryData ){
    queries = new ArrayList<Float>();
    countQueries = new ArrayList<Integer>();
    for ( float query: queryData ){
        if ( !queries.contains( query ) ) {
          queries.add( query );
          countQueries.add( 0 );
        }
        for ( int i = 0; i < queries.size(); i++ ) {
          if ( query == queries.get( i ) ) {
          int count = countQueries.get( i );
          count = count + 1;
          countQueries.set( i, count );
         }
      }
    }
    int[] array = new int[ countQueries.size() ];
    for( int i = 0; i < array.length; i++ ) {
      array[ i ] = countQueries.get( i );
    }
    return array;
  }*/
   void changeBarChart (){
    ////println(name1GeneralQuery);
    ////println(name2GeneralQuery);
    //////println("khgvbkh aduhaadshvoauhvoauhfub ofgfoduhdo");
    int pass1 = Integer.parseInt(name1GeneralQuery);
    int pass2 = Integer.parseInt(name2GeneralQuery);
    data = theController.getApogee(null);
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
    currentBar = myBar;
    changeBar = 1.0;
    searchButton = false;
  }
}
