// Mariam 
class DataPoint {
  String name;
  String launchDate;
  String status;
  String state;
  int mass;
  double diameter;
  int perigee;
  int apogee;
  String id;
  
  DataPoint (String id, String name, String launchDate, String status,
              String state, int mass, double diameter, int perigee, int apogee){
     this.id = id;
     this.name = name;
     this.launchDate = launchDate;
     this.status = status;
     this.state = state;
     this.mass = mass;
     this.diameter = diameter;
     this.perigee = perigee;
     this.apogee = apogee;
  }
  String getName (){
    return name;
  }
  
  String createString(){
    String dataRow = (id + " " + name + " " + launchDate + " " + status + " " + state + " " + mass + " " + diameter + " " + apogee + " " + perigee);
    return dataRow;
  }
  
  String getState(){
    return state;
}
}
