import 'package:flutter/material.dart';
import 'package:flutter_3/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  Future<void> setupWorldTime() async {
    WorldTime inst = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await inst.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDayTime': inst.isDaytime
    });

    // print(inst.url);
    // print(inst.time);
    // setState(() {
    //   time = inst.time;
    // });
  }

  // void getData() async {
  //
  //   // http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   // print("-------------------------------------------");
  //   // print("--------------------22---------------------");
  //   // print(res.body);
  //   // Map data = jsonDecode(res.body);
  //   // print(data);
  //   // print(data['title']);
  //   // print("--------------------22---------------------");
  //   // print("-------------------------------------------");
  //
  //   //examples
  //   //simulate a network request 1
  //   // String req = await Future.delayed(Duration(seconds: 3), () {
  //   //   return 'req 0';
  //   // });
  //   //
  //   // print(req);
  //   //
  //   // await Future.delayed(Duration(seconds: 3), () {
  //   //   print('req 1');
  //   // });
  //   //
  //   // //simulate a network request 2
  //   // Future.delayed(Duration(seconds: 2), () {
  //   //   print('req 2');
  //   // });
  //   //
  //   // print("req 3");
  // }

  @override
  void initState() {
    super.initState();
    //print("init state ran");
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
