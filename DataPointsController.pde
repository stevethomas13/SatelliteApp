// Controller responsible for manipulating all the data, all data calls occur through the controller
// Steve @05.04.2022
class Controller{
 
 Table DataTable;
 TableRow[] rows;
   String[] AFRICA = {"AO","DZ","EG","ET","GH","I-ARAB","KE","MA","MU","MYM","N","NG","RW","S","SA","SD","TN","ZA"};
  String[] ASIA = {"BD","BT","CN","HK","ID","IL","IN","IR","J","JO","KP","KR","KW","KZ","LA","LK","MN","MY","NP","PH","PK","QA","RU","SG","SU","T","TR","TW","UAE","VN"};
  String[] EUROPE = {"AT","AZ","B","BG","BGN","BY","CH","CSFR","CSSR","CZ","D","DK","E","EE","F","FI","GR","HKUK","HU","I","I-ESA","I-ESRO","I-EU","I-EUT","I-INM","I-RASC","IE","L","LT","LV","MC","NL","PL","RO","SI","SK","UA","UK"};
  String[] SOUTH_AMERICA = {"AR","BO","BR","CL","CO","EC","I-EUM","P","PE","PY","UY","VE"};
  String[] OCEANIA = {"AU" ,"NZ" ,"PG"};
  String[] NORTH_AMERICA = {"BM","CA","CR","CYM","GT","I-INT","I-NATO","MX","PR","US"};

 Controller( Table table ){
   DataTable = table;
   DataTable.addColumn( "Continent" );
   rows = new TableRow[ DataTable.getRowCount() ];
 }


  void createData() {
    for( int i = 0; i < DataTable.getRowCount(); i++ ) {
      rows[ i ] = DataTable.getRow( i );
    }
     assignContinents();
  }
  
  void assignContinents(){
      for( TableRow row: rows ){
        boolean stateSet = false;
        //TableRow row = ;
        String state = row.getString( "State" );
        for( int index = 0; index < AFRICA.length; index++ ){
          if( state.equalsIgnoreCase( AFRICA[ index ] ) ){
            row.setString( "Continent", "AFRICA" );
            stateSet = true;
          }
        }
        for( int index = 0; index < ASIA.length; index++ ){
          if( state.equalsIgnoreCase( ASIA[ index ] ) ){
            row.setString( "Continent", "ASIA" );
            stateSet = true;
          }
        }
        for( int index = 0; index < EUROPE.length; index++ ){
          if( state.equalsIgnoreCase( EUROPE[ index ] ) ){
            row.setString( "Continent", "EUROPE" );
            stateSet = true;
          }
        }
        for( int index = 0; index < OCEANIA.length; index++ ){
          if( state.equalsIgnoreCase( OCEANIA[ index ] ) ){
            row.setString( "Continent", "OCEANIA" );
            stateSet = true;
          }
        }
        for( int index = 0; index < SOUTH_AMERICA.length; index++ ){
          if( state.equalsIgnoreCase( SOUTH_AMERICA[ index ] ) ){
            row.setString( "Continent", "SOUTH_AMERICA" );
            stateSet = true;
          }
        }
        for( int index = 0; index < NORTH_AMERICA.length; index++ ){
          if( state.equalsIgnoreCase( NORTH_AMERICA[ index ] ) ){
            row.setString( "Continent", "NORTH_AMERICA" );
            stateSet = true;
          }
        }
        if( stateSet == false){
          row.setString("Continent", "NA");
        }
      }
  }
 
  
  // returns a String array of all statuses if rowIndexes == null
  // otherwise returns matches of valueCheck from particular rows, Steve @28.03.2022
  ArrayList<Integer> getStatuses( ArrayList<Integer> rowIndexes, ArrayList<String> valueCheck ){
    ArrayList<Integer> indexes = new ArrayList<Integer>();
    if ( rowIndexes == null ){
      if ( valueCheck != null ) {
        for( int i = 0; i < DataTable.getRowCount(); i++ ){
          for( int j =0; j < valueCheck.size(); j++ ){
            if ( valueCheck.get( j ).equalsIgnoreCase( rows[ i ].getString("Status") ) ){
              indexes.add( i );
            }
          }
        }
        return indexes;
      }
    } 
    if ( rowIndexes != null ){
      if ( valueCheck != null ) {
        for( int i =0; i< rowIndexes.size(); i++ ){
           for( int j = 0; j < valueCheck.size(); j++ ){
             if ( rows[ rowIndexes.get( i ) ].getString("Status")
                   .equalsIgnoreCase( valueCheck.get( j ) ) )
                  indexes.add( rowIndexes.get( i ) ); 
           }
        }
      }
    }
    return indexes;
  }
  
  
  // returns a String array of statuses of specific row indexes,
  // or all statuses if parameter is null, Steve @28.03.2022
  String[] getStatuses( ArrayList<Integer> rowIndexes ){
    if( rowIndexes == null){
      String[] dataStatus = new String[ DataTable.getRowCount() ];
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
        dataStatus[ i ] = rows[ i ].getString("Status");
      }
      return dataStatus;
    }
    else {
      String[] dataStatus = new String[ rowIndexes.size() ];
      for( int i = 0; i < rowIndexes.size(); i++ ){
        dataStatus[ i ] = rows[ rowIndexes.get( i ) ].getString("Status");
      }
      return dataStatus;
    }
  }
  
  // returns a matches of all states if rowIndexes == null
  // otherwise returns matches of valueCheck from particular rows, Steve @28.03.2022
  ArrayList<Integer> getStates( ArrayList<Integer> rowIndexes, ArrayList<String> valueCheck ){
    ArrayList<Integer> indexes = new ArrayList<Integer>();
    if ( rowIndexes == null ){
      if ( valueCheck != null ) {
        for( int i = 0; i < DataTable.getRowCount(); i++ ){
          for( int j =0; j < valueCheck.size(); j++ ){
            if ( valueCheck.get( j ).equalsIgnoreCase( rows[ i ].getString("State") ) ){
              indexes.add( i );
            }
          }
        }
        return indexes;
      }
    } 
    if ( rowIndexes != null ){
      if ( valueCheck != null ) {
        for( int i =0; i< rowIndexes.size(); i++ ){
           for( int j = 0; j < valueCheck.size(); j++ ){
             if ( rows[ rowIndexes.get( i ) ].getString("State")
                   .equalsIgnoreCase( valueCheck.get( j ) ) )
                  indexes.add( rowIndexes.get( i ) ); 
           }
        }
      }
    }
    return indexes;
  }
  
  // returns a String array of states of specific row indexes,
  // or all states if rowIndexes == null, Steve @28.03.2022
  String[] getStates( ArrayList<Integer> rowIndexes ){
    if( rowIndexes == null){
      String[] dataState = new String[ DataTable.getRowCount() ];
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
        dataState[ i ] = rows[ i ].getString("State");
      }
      return dataState;
    }
    else {
      String[] dataState = new String[ rowIndexes.size() ];
      for( int i = 0; i < rowIndexes.size(); i++ ){
        dataState[ i ] = rows[ rowIndexes.get( i ) ].getString("State");
      }
      return dataState;
    }
  }
  
  // returns a matches of all continents if rowIndexes == null
  // otherwise returns matches of valueCheck from particular rows, Steve @10.04.2022
  ArrayList<Integer> getContinents( ArrayList<Integer> rowIndexes, ArrayList<String> valueCheck ){
    ArrayList<Integer> indexes = new ArrayList<Integer>();
    if ( rowIndexes == null ){
      if ( valueCheck != null ) {
        for( int i = 0; i < DataTable.getRowCount(); i++ ){
          for( int j =0; j < valueCheck.size(); j++ ){
            if ( valueCheck.get( j ).equalsIgnoreCase( rows[ i ].getString("Continent") ) ){
              indexes.add( i );
            }
          }
        }
        return indexes;
      }
    } 
    if ( rowIndexes != null ){
      if ( valueCheck != null ) {
        for( int i =0; i< rowIndexes.size(); i++ ){
           for( int j = 0; j < valueCheck.size(); j++ ){
             if ( rows[ rowIndexes.get( i ) ].getString("Continent")
                   .equalsIgnoreCase( valueCheck.get( j ) ) )
                  indexes.add( rowIndexes.get( i ) ); 
           }
        }
      }
    }
    return indexes;
  }
  
  // returns a String array of continents of specific row indexes,
  // or all continents if rowIndexes == null, Steve @10.04.2022
  String[] getContinents( ArrayList<Integer> rowIndexes ){
    if( rowIndexes == null){
      String[] dataContinent = new String[ DataTable.getRowCount() ];
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
        dataContinent[ i ] = rows[ i ].getString("Continent");
      }
      return dataContinent;
    }
    else {
      String[] dataContinent = new String[ rowIndexes.size() ];
      for( int i = 0; i < rowIndexes.size(); i++ ){
        dataContinent[ i ] = rows[ rowIndexes.get( i ) ].getString("Continent");
      }
      return dataContinent;
    }
  }
  
  //Mariam 
  Integer getStates (ArrayList<Integer> rowIndexes, String valueToCheck){
    int count = 0;
    if (rowIndexes == null){
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
        if (valueToCheck.equalsIgnoreCase(rows[i].getString("Continent"))){
          count++;
        }
        
      }
    }
    return count;
  }
  
  // returns a matches of all dates if rowIndexes == null
  // otherwise returns matches of valueCheck from particular rows, Steve @28.03.2022
  ArrayList<Integer> getDates( ArrayList<Integer> rowIndexes, ArrayList<String> valueCheck ){
    ArrayList<Integer> indexes = new ArrayList<Integer>();
    if ( rowIndexes == null ){
      if ( valueCheck != null ) {
        for( int i = 0; i < DataTable.getRowCount(); i++ ){
          for( int j =0; j < valueCheck.size(); j++ ){
            if ( valueCheck.get( j ).equalsIgnoreCase( rows[ i ].getString("LDate") ) ){
              indexes.add( i );
            }
          }
        }
        return indexes;
      }
    } 
    if ( rowIndexes != null ){
      if ( valueCheck != null ) {
        for( int i =0; i< rowIndexes.size(); i++ ){
           for( int j = 0; j < valueCheck.size(); j++ ){
             if ( rows[ rowIndexes.get( i ) ].getString("LDate")
                   .equalsIgnoreCase( valueCheck.get( j ) ) )
                  indexes.add( rowIndexes.get( i ) ); 
           }
        }
      }
    }
    return indexes;
  }
  
  // returns a String array of states of specific row indexes,
  // or all states if rowIndexes == null, Steve @28.03.2022
  String[] getDates( ArrayList<Integer> rowIndexes ){
    if( rowIndexes == null){
      String[] dataDate = new String[ DataTable.getRowCount() ];
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
        dataDate[ i ] = rows[ i ].getString("LDate");
      }
      return dataDate;
    }
    else {
      String[] dataDate = new String[ rowIndexes.size() ];
      for( int i = 0; i < rowIndexes.size(); i++ ){
        dataDate[ i ] = rows[ rowIndexes.get( i ) ].getString("LDate");
      }
      return dataDate;
    }
  }
  

  
  // returns a float array of apogees of specific row indexes,
  // or all apogees if rowIndexes == null, Steve @28.03.2022
  ArrayList<Integer> getApogee( ArrayList<Integer> rowIndexes, int min, int max ){
    ArrayList<Integer> indexes = new ArrayList<Integer>();
    if( rowIndexes == null){
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
        float num = rows[ i ].getFloat("Apogee");
        if( Float.isNaN( num ) ){
          num = 0;
        }
        else{
          if ( num < 0 ){
            num = -num;
          }
          if ( num >= min && num <= max ){
            indexes.add( i );
          }
        }
      }
      return indexes;
    }
    else {
      for( int i = 0; i < rowIndexes.size(); i++ ){
        float num = rows[ rowIndexes.get( i ) ].getFloat( "Apogee" );
        if( Float.isNaN( num ) ){
          num = 0;
        }
        else {
          if ( num < 0 ){
            num = -num;
          }
          if ( num >= min && num <= max ){
            indexes.add( i );
          }
        } 
      }
      return indexes;
    }
  }
  
  // returns a float array of apogees of specific row indexes, Mariam 
  float[] getApogee( ArrayList<Integer> rowIndexes ){
  float[] dataApogee = new float[ DataTable.getRowCount() ];
  if( rowIndexes == null){
      for( int i = 0; i < DataTable.getRowCount(); i++ ){
       float num = rows[ i ].getFloat("Apogee");
        if( Float.isNaN( num ) ){
          num = 0;
        }
        else{
          if ( num < 0 ){
            num = -num;
          }
          dataApogee[i] = num;
        }
      }
  }
  
  return dataApogee;
} 
  // returns a float array of perigees of specific row indexes, Mariam 
  float[] getPerigee( ArrayList<Integer> rowIndexes ){
    float[] dataApogee = new float[ DataTable.getRowCount() ];
    if( rowIndexes == null){
        for( int i = 0; i < DataTable.getRowCount(); i++ ){
         float num = rows[ i ].getFloat("Perigee");
          if( Float.isNaN( num ) ){
            num = 0;
          }
          else{
            if ( num < 0 ){
              num = -num;
            }
            dataApogee[i] = num;
          }
        }
    }  
  return dataApogee;
  } 
  
}


//// returns a float array of all apogees, Steve @28.03.2022
//  float[] getApogee(){
//    float[] dataApogee = new float[ DataTable.getRowCount() ];
//    for( int i = 0; i < DataTable.getRowCount(); i++ ){
//      try {
//        dataApogee[ i ] = rows[ i ].getFloat("Apogee");
//      }
//      catch( Exception error ) {
//        dataApogee[ i ] = -1;
//      }
//    }
//    return dataApogee;
//  }
  
  //// returns a float array of apogees of specific row indexes, Steve @28.03.2022
  //float[] getApogee( ArrayList<Integer> rowIndexes ){
  //  float[] dataApogee = new float[ DataTable.getRowCount() ];
  //  for( int i = 0; i < rowIndexes.size(); i++ ){
  //    try {
  //      dataApogee[ i ] = rows[ rowIndexes.get( i ) ].getFloat("Apogee");
  //    }
  //    catch( Exception error ) {
  //      dataApogee[ i ] = -1;
  //    }
  //  }
  //  return dataApogee;
  //}
  
  
    //// returns a float array of apogees of specific row indexes,
  //// or all apogees if rowIndexes == null, Steve @28.03.2022
  //float[] getApogee( ArrayList<Integer> rowIndexes ){
  //  if( rowIndexes == null){
  //    float[] dataApogee = new float[ DataTable.getRowCount() ];
  //    for( int i = 0; i < DataTable.getRowCount(); i++ ){
  //      float num = rows[ i ].getFloat("Apogee");
  //      if( Float.isNaN( num ) ){
  //        dataApogee[ i ] = 0;
  //      }
  //      else{
  //        if ( num < 0 ){
  //          num = -num;
  //        }
  //        dataApogee[ i ]  = num;
  //      }
  //    }
  //    return dataApogee;
  //  }
  //  else {
  //    float[] dataApogee = new float[ rowIndexes.size() ];
  //    for( int i = 0; i < rowIndexes.size(); i++ ){
  //      float num = rows[ rowIndexes.get( i ) ].getFloat( "Apogee" );
  //      if( Float.isNaN( num ) ){
  //        num = 0;
  //      }
  //      else {
  //        if ( num < 0 ){
  //          num = -num;
  //        }
  //        dataApogee[ i ] = num;
  //      }
        
  //    }
  //    return dataApogee;
  //  }
  //}
