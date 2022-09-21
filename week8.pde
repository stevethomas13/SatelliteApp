PImage map;
import java.io.*;
import java.util.ArrayList;
ArrayList<DataPoint> myData = new ArrayList<DataPoint>();
int numberUS=0;
int numberSU=0;
int numberI=0;
int numberUK=0;
int numberCA=0;
int result=0;
ArrayList<String> states = new ArrayList<String>(); 
ArrayList<Integer> countStates = new ArrayList<Integer>(); 
boolean foundMatch = false; 
String lines[];
BarChart myBar = new BarChart();
HomeScreen home = new HomeScreen();
NavBar navbar = new NavBar();
Apogee apogee;
Perigee perigee;
Status status;
State state;
LaunchDate launchDate;
PImage rocket;
PImage astronaut;
Table DataTable;
Controller DataController;
PImage staticorbit;
TextWidget focus = null;
PShape s;
String name1Query;
String name2Query;
//SoundFile backgroundMusic;
//SoundManager newSoundManager;
String name1GeneralQuery = "0";
String name2GeneralQuery = "0" ;

void settings(){
  size(SCREENX, SCREENY);
}

void setup(){  
  //backgroundMusic = new SoundFile( this, "sample.mp3" );
  rocket = loadImage("13581-200.png");
  astronaut = loadImage("astronaut.jpg");
  myFont = loadFont("AlTarikh-38.vlw");
  map = loadImage ("map3.png");
  map = loadImage ("worldmap.webp");
  s = loadShape("BlankMap-World_gray.svg");
  staticorbit = loadImage("staticorbit.jpeg");
  titleFont = loadFont("AlTarikh-58.vlw");
  //initData();
  //stateQuery3();
  myBar.setupBarChart(states,countStates,myFont);
  //DataTable = loadTable("gcat1k.tsv", "header");
  DataTable = loadTable("gcat.tsv", "header");
  DataController = new Controller( DataTable );
  status = new Status( DataController );
  launchDate = new LaunchDate(DataController);
  state = new State(DataController);
  apogee = new Apogee(DataController);
  perigee = new Perigee(DataController);
  //newSoundManager = new SoundManager( backgroundMusic );
}

  void draw(){
    background(255);
    textFont(myFont, 8);
    navbar.show(rocket);
    //newSoundManager.playMusic();
    // rob
    switch(currentPage){
      case HOME:
        home.show(astronaut);
        break;
      case APOGEE:
        apogee.show();
        break;
      case PERIGEE:
        perigee.show();
        break;
      case STATUS:
        status.show();
        break;
      case LAUNCH_DATE:
        launchDate.show();
        break;
      case STATE:
        state.show();
        break;
    }
  } 

//void initData(){
//  lines = loadStrings("gcat1k.tsv");
//  for( int i =1; lines.length>i; i++ ) 
//  {
//       String[] wordArray= lines[i].split("\t");
//       String id = wordArray[ 0 ];
//       String name = wordArray[4];
//       String launchDate = wordArray[6];
//       String status = wordArray[11];
//       String state = wordArray[14];
//       int mass, perigee, apogee;
//       double diameter;
//       try{
//         mass = Integer.parseInt( wordArray[ 18 ] );
//       }
//       catch ( Exception error ) {
//         mass = -1;
//       }
//       try{
//         diameter = Double.parseDouble(wordArray[26]);
//       }
//       catch ( Exception error ) {
//         diameter = -1;
//       }
//       try{
//         perigee =  Integer.parseInt(wordArray[32]);
//       }
//       catch ( Exception error ) {
//         perigee = -1;
//       }
//       try{
//         apogee = Integer.parseInt(wordArray[34]);
//       }
//       catch ( Exception error ) {
//         apogee = -1;
//       }
//        myData.add( new DataPoint( id, name, launchDate, status,
//                                    state, mass, diameter, perigee, apogee) );
//  }
//}

//void //printString(){
//  for( DataPoint myPoint: myData ){
//    System.out.//print(myPoint.createString());
//    System.out.////println();
//  }
//}



void mousePressed(){ 
  // rob - will register clicks within a specific page
  navbar.click();
    switch(currentPage){
     case HOME:
      home.click();
      break;
    case APOGEE:
      apogee.click();
      break;
    case PERIGEE:
      perigee.click();
      break;
    case STATUS:
      status.click();
      break;
    case LAUNCH_DATE:
      launchDate.click();
      break;
    case STATE:
      state.click();
      break;
  }
}

//void stateQuery3(){
//  states.add(myData.get(0).getState());
//  countStates.add( 1 );
//  foundMatch = false;
//  for (DataPoint myPoint: myData){
//      if ( !states.contains( myPoint.state ) ) {
//        states.add( myPoint.state );
//        countStates.add( 0 );
//      }
//    for ( int i = 0; i < states.size(); i++ ) {
//        if ( myPoint.state.equalsIgnoreCase( states.get( i ) ) ) {
//        int count = countStates.get( i );
//        count = count + 1;
//        countStates.set( i, count );
//        }
//    }
//  }
//  for ( String state: states ) {
//    //print(state + " " );
//  }
//  System.out.////println();
//  for( int num: countStates ) {
//    //print(num + " " );
//  }
//}

void keyPressed(){ 
     ////println("hey");
  if(focus != null && key!= ENTER) {
    ////println("focus");
    focus.append(key);
  }
  if (searchButton == true){
    ////println("to");
    if (generalCount == 1){
       name1GeneralQuery = focus.getLabel();
       
     }
    if (generalCount == 2){
      name2GeneralQuery = focus.getLabel();      
    }
   ////println(name1GeneralQuery + "1");
   ////println(name2GeneralQuery + "2");
  } 
     if (searchButton2 == true){
    if (generalCount == 1){
      name1GeneralQuery = focus.getLabel();
       
     }
    if (generalCount == 2){
      name2GeneralQuery = focus.getLabel();    
  }
   ////println(name1GeneralQuery + "111111111");
   ////println(name2GeneralQuery + "22222222");
  
  }
  if (searchButton3 == true){
    if (generalCount == 1){
      name1GeneralQuery = focus.getLabel();
       
     }
    if (generalCount == 2){
      name2GeneralQuery = focus.getLabel();    
  }
   ////println(name1GeneralQuery + "1 two three");
   ////println(name2GeneralQuery + "2 three four ");
  
  }
  changeBar = 0.0;
  ////println(changeBar);
  
  
    
}
