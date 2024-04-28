import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name
  late String time; //time in location
  late String flag; //url for flag
  late String url; //location url api
  late bool isDaytime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // http.Response res = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Amman'));
      http.Response res = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(res.body);
      //print(data);

      String utc_d = data['utc_datetime'];
      String utc_o = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(utc_d);
      now = now.add(Duration(hours: int.parse(utc_o)));
      print(now);

      //time = now.toString();
      time = DateFormat.jm().format(now);

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
