import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map args = {};


  @override
  Widget build(BuildContext context) {

    args = args.isNotEmpty? args : ModalRoute.of(context)!.settings.arguments as Map;

    //set background
    String bgImage = args['isDayTime']? 'day.png' : 'night.png';
    Color? bgroudColor = args['isDayTime']? Colors.blue : Colors.indigo[700];


   return Scaffold(
      backgroundColor: bgroudColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover

            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         args = {
                           'time': result['time'],
                           'location': result['location'],
                           'isDayTime': result['isDayTime'],
                           'flag': result['flag']
                         };
                       });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  args['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white
                  )
                )
              ],
            )
                ),
        )
      ),
    );
  }
}

