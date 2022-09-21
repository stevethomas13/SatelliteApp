// steve

class Status
{
  Text theText;
  Button theButton;
  ArrayList widgetList;
  ArrayList<String> queries;
  ArrayList<Integer> countQueries;
  Controller aController;
  String[] data;
  int[] dataNum;
  final int EVENT_AFRICA = 16;
  final int EVENT_ASIA = 11;
  final int EVENT_EUROPE = 12;
  final int EVENT_OCEANIA = 13;
  final int EVENT_NORTH_AMERICA = 14;
  final int EVENT_SOUTH_AMERICA = 15;
  final int EVENT_ALL = 17;
  PieChart aPieChart;
  Controller aControllerLocal;
  float textPosX;
  float textPosY;
  float piePosX;
  float piePosY;
  float circlePosX;
  float circlePosY;
  ArrayList<Integer> sumOfQueries;
  int textSize;
  int sizeCenterCircle;

  // Steve and Rob, contructor for status class
  Status( Controller aController ) {
    aControllerLocal = aController;
    textFont( myFont );
    theText = new Text();
    theButton = new Button();
    widgetList = new ArrayList();
    Widget widget1 = new Widget(40, "America", myFont, 0);
    Widget widget2 = new Widget(50, "Africa", myFont, EVENT_AFRICA);
    Widget widget3 = new Widget(40, "Asia", myFont, EVENT_ASIA);
    Widget widget4 = new Widget(65, "Europe", myFont, EVENT_EUROPE);
    Widget widget5 = new Widget(115, "North America", myFont, EVENT_NORTH_AMERICA);
    Widget widget6 = new Widget(120, "South America", myFont, EVENT_SOUTH_AMERICA );
    Widget widget7 = new Widget(70, "Oceania", myFont, EVENT_OCEANIA );
    Widget widget8 = new Widget(25, "All", myFont, EVENT_ALL );
    widgetList.add(widget1);
    widgetList.add(widget2);
    widgetList.add(widget3);
    widgetList.add(widget4);
    widgetList.add(widget5);
    widgetList.add(widget6);
    widgetList.add(widget7);
    widgetList.add(widget8);
    aController.createData();
    data = aController.getStatuses( null );
    dataNum = query( data );
    piePosX = 500;
    piePosY = 450;
    sizeCenterCircle = 250;
    circlePosX = 330;
    circlePosY = 450;
    aPieChart = new PieChart( dataNum, piePosX, piePosY );
    textPosX = 650;
    textPosY = 225;
    //sumOfQueries = 100;
    textSize = 18;
  }

  // Steve and Rob
  void show()
  {
    int w = padding;
    int event = 0;
    Widget aWidget = (Widget) widgetList.get(1);
    if(aWidget.getEvent() == EVENT_AFRICA){
          theText.title("");
    }
    for (int i = 1; i < widgetList.size(); i++) {
      //Widget aWidget = (Widget) widgetList.get(i);
      //event = aWidget.getEvent();
      //switch( event ) {
      //case EVENT_AFRICA:
      //  {
      //    ((Widget)widgetList.get(1)).btnGrey(w, height);
      //    //((Widget)widgetList.get(1)).btnUnderlineActive(w, height);
      //    break;
      //  }
      //case EVENT_ASIA:
      //  {
      //    ////println( "EVENT_ASIA" );
      //    changeQuery( "ASIA" );
      //    break;
      //  }
      //case EVENT_EUROPE:
      //  {
      //    ////println( "EVENT_EUROPE" );
      //    changeQuery( "EUROPE" );
      //    break;
      //  }
      //case EVENT_NORTH_AMERICA:
      //  {
      //    ////println( "EVENT_NORTH_AMERICA" );
      //    changeQuery( "NORTH_AMERICA" );
      //    break;
      //  }
      //case EVENT_SOUTH_AMERICA:
      //  {
      //    ////println( "EVENT_SOUTH_AMERICA" );
      //    changeQuery( "SOUTH_AMERICA" );
      //    break;
      //  }
      //case EVENT_OCEANIA:
      //  {
      //    ////println( "EVENT_OCEANIA" );
      //    changeQuery( "OCEANIA" );
      //    break;
      //  }
      //case EVENT_ALL:
      //  {
      //    ////println( "ALL" );
      //    changeQuery( "" );
      //    break;
      //  }
      //}
    }
    theText.title("Status");
    theButton.title();
    color[] arrayColors = aPieChart.show();
    {
      fill( 255 );
      circle( circlePosX , circlePosY, sizeCenterCircle );
    }
    w = padding;
    int height = 140;
    //rob
    for (int i = 1; i < widgetList.size(); i++) {
      ((Widget)widgetList.get(i)).btnUnderline(w, height);
      //((Widget)widgetList.get(i)).btnGrey(w, height);
      w = w + ((Widget)widgetList.get(i)).width() + 20;
    }
   
    if( countQueries.size() == queries.size() ){
      textAlign(LEFT);
      textSize( 20 );
      fill( primary );
      float titleYpos = textPosY - textSize - 5;
      float colorXpos = textPosX;
      float stateXpos = textPosX + 70;
      float countXpos = textPosX + 135;
      float accCountXpos = textPosX + 200;
      text( "Color", colorXpos, ( titleYpos ) );
      text( "State", stateXpos, (titleYpos ) );
      text( "Count", countXpos, (titleYpos ) );
      text( "Accumulative Count", accCountXpos, ( titleYpos ) );

      for( int index = 0; index < countQueries.size(); index++ ){
        textSize( 15 );
        fill( text );
        text( queries.get( index ), stateXpos, (textPosY + index * textSize ) );
        fill( text );
        textSize( textSize + 4 );
        text( countQueries.get( index ), countXpos, (textPosY - 3 + index * textSize ) );
        //try {
        textSize( textSize + 4 );
        text( sumOfQueries.get( index ), accCountXpos, ( textPosY - 3 + index * textSize ) );
        //}
        //catch( Exception error ){
        //  text( 0, textPosX + 100, ( textPosY - 3 + index * 14 ) );
        //}
        stroke( secondary );
        fill( arrayColors[ index ] );
        rect( colorXpos , ( textPosY - 6 + index * textSize ), 50, 10, 10 );
      }
    }
  }
 
 
  // steve
  void click() {
    int event = 0;
    for (int i = 1; i < widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent();
      switch( event ) {
      case EVENT_AFRICA:
        {
          ////println( "EVENT_AFRICA" );
          changeQuery( "AFRICA" );
          break;
        }
      case EVENT_ASIA:
        {
          ////println( "EVENT_ASIA" );
          changeQuery( "ASIA" );
          break;
        }
      case EVENT_EUROPE:
        {
          ////println( "EVENT_EUROPE" );
          changeQuery( "EUROPE" );
          break;
        }
      case EVENT_NORTH_AMERICA:
        {
          ////println( "EVENT_NORTH_AMERICA" );
          changeQuery( "NORTH_AMERICA" );
          break;
        }
      case EVENT_SOUTH_AMERICA:
        {
          ////println( "EVENT_SOUTH_AMERICA" );
          changeQuery( "SOUTH_AMERICA" );
          break;
        }
      case EVENT_OCEANIA:
        {
          ////println( "EVENT_OCEANIA" );
          changeQuery( "OCEANIA" );
          break;
        }
      case EVENT_ALL:
        {
          ////println( "ALL" );
          changeQuery( "" );
          break;
        }
      }
    }
    //////println( queries );
    //////println( countQueries );
    //////println( sumOfQueries );
  }

  // queries the data, into number of status and types of statuses, Steve @ 05.04.2022
  int[] query( String[] queryData ) {
    queries = new ArrayList<String>();
    countQueries = new ArrayList<Integer>();
    sumOfQueries = new ArrayList<Integer>();
    //sumOfQueries.add( 0 );
    //sumOfQueries = 100;
    for ( String query : queryData ) {
      if ( !queries.contains( query ) ) {
        queries.add( query );
        countQueries.add( 0 );
      }
      for ( int i = 0; i < queries.size(); i++ ) {
        if ( query.equalsIgnoreCase( queries.get( i ) ) ) {
          int count = countQueries.get( i );
          count = count + 1;
          countQueries.set( i, count );
        }
      }
    }
    int[] array = new int[ countQueries.size() ];
    for ( int i = 0; i < array.length; i++ ) {
      array[ i ] = countQueries.get( i );
      //sumOfQueries.add( sumOfQueries.get(  + countQueries.get( i );
      if( i == 0 ){
         sumOfQueries.add( countQueries.get( i ) );
      }
      else{
        sumOfQueries.add( sumOfQueries.get( i -1 ) + countQueries.get( i ) );
      }
    }
    return array;
  }

  void changeQuery( String queryValue ) {
    aControllerLocal.createData();
    ArrayList<Integer> queryInt = new ArrayList<Integer>();
    ArrayList<String> queryString = new ArrayList<String>();
    queryString.add( queryValue );
    ////println( queryString );
    queryInt = aControllerLocal.getContinents( null, queryString );
    String[] arrayString = aControllerLocal.getStatuses( queryInt );
    int query[] = query( arrayString );
    if ( queryValue == "" ) {
      arrayString = aControllerLocal.getStatuses( null );
      query = query( arrayString );
    }
    aPieChart = new PieChart( query, 500, 450 );
  }
}
