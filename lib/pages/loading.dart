import 'package:flutter/material.dart';
import 'package:weather/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{



  void setupWorldTime()  async {
    WorldTime instance = WorldTime(location: 'Accra', flag: 'london.png', url: 'Africa/Accra');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitSpinningLines(
            color: Colors.blue,
            size: 90.0,
        ),
      )
    );
  }
}
