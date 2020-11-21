import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments ;
   // print(data);

    //set background

    String bgimage= data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.yellowAccent : Colors.black54;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,180.0,0.0,0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState((){
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                    icon: Icon(Icons.edit_location),
                    label: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          'Edit location',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
