import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setupWorldTime() async {   // runs only once
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png',url: 'Asia/Kolkata');
   await instance.getTime();
   Navigator.pushReplacementNamed(context,'/home',arguments:{
     'location': instance.location,
     'flag': instance.flag,
     'time' : instance.time,
     'isDaytime' : instance.isDaytime,


   });
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
           child: SpinKitFadingCube(
            color: Colors.pink,
            size: 50.0,
          ),

      ),
    );
  }
}
