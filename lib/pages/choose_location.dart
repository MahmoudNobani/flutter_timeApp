import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //int c = 0;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'), //T
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'), //T
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'), //T
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'), //T
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'), //T
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'), //T
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'), //T
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'), //T
  ];
  
  void updateTime(index) async{
    WorldTime inst = locations[index];
    await inst.getTime();

    print(inst.isDaytime);

    Navigator.pop(context, {
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDayTime': inst.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("build state ran ${c}");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Choose a Location',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
        },
          itemCount: locations.length,
      )

      // ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       c += 1;
      //     });
      //   },
      //   child: Text('counter is $c'),
      // ),
    );
  }
}
