import 'package:http/http.dart';  // to use get func
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String location; //loaction name for UI
  String time; //time in that lo9cation
  String flag; //url to asset flag icon
  String url; //location url for api end points
  bool isDaytime; //background image for day and night

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //  print(data);
      //get prop from data
      String datetime = data["datetime"];
      String offsethrs = data["utc_offset"].substring(1, 3);
      String offsetmin = data["utc_offset"].substring(4, 6);

      //flutter inbuilt function to convert data time string to date time objec
      DateTime utc = DateTime.parse(datetime);
      DateTime localtime = utc.add(
          Duration(hours: int.parse(offsethrs), minutes: int.parse(offsetmin)));
      isDaytime = localtime.hour > 6 && localtime.hour < 20 ? true : false;
      time = DateFormat.jm().format(localtime);
    }
    catch(e){
      //print('caught error: $e');
      time='Could not get time data!';

    }

  }


}

