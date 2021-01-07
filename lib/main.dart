import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'GetLocation.dart';
void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    getLocation();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: displayImage(),//Image.asset('images/dayTime.jpg'),
            ),
           // SizedBox(height: 50.0,),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text('You are in:', style:
                TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('Dehradun', style:
                      TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[500],
                      ),),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 17.0, horizontal: 25.0),
              color: Colors.white70,
              child: ListTile(
                leading: Icon(
                  Icons.wb_sunny,
                  color: Colors.amber,
                  size: 30.0,
                ),
                title: Text('Temp: 13 C'),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  //display image based on current time
  displayImage(){
    var now = DateTime.now();
    final currentTime= DateFormat.jm().format(now);
    if(currentTime.contains('AM')){                 //For AM
      return Image.asset('images/dayTime.jpg');
    }
    else if(currentTime.contains('PM')){            //For PM
      return Image.asset('images/nightTime.jpg');
    }
  }

  //getLocation
  void getLocation() async{
    GetLocation getlocation = GetLocation();
    await getlocation.getCurrentLocation();

    print(getlocation.latitude);
    print(getlocation.longitude);
    print(getlocation.city);
  }
}
