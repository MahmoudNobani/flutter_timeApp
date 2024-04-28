import 'package:flutter/material.dart';

import '../services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body:
          //SafeArea(
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(children: [
            TextButton.icon(
              onPressed: () async {
                dynamic res = await Navigator.pushNamed(context, '/location');
                print("----------------------------");
                print(res);
                print(res['isDayTime']);
                setState(() {
                  data = {
                    'time': res['time'],
                    'location': res['location'],
                    'isDayTime': res['isDayTime'],
                    'flag': res['flag']
                  };
                });
              },
              icon: Icon(
                Icons.edit_location_alt,
                color: Colors.grey[300],
              ),
              label: Text('Edit Location',
                  style: TextStyle(color: Colors.grey[300])),
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith<BorderSide>(
                  (states) =>
                      BorderSide(color: Colors.grey[300] ?? Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: const TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              data['time'],
              style: const TextStyle(
                fontSize: 66.0,
                color: Colors.white,
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          WorldTime inst = WorldTime(
              location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
          await inst.getTime();
          setState(() {
            data = {
              'location': inst.location,
              'flag': inst.flag,
              'time': inst.time,
              'isDayTime': inst.isDaytime
            };
          });
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.lock_reset),
      ),
    );
    //);
  }
}
