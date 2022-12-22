import 'package:http/http.dart' as http;
import 'dart:convert';

//===========================================================================================
//function get get time algeria

DateTime dateTime = DateTime.parse('0000-00-00 00:00:00Z');

Future getTime() async {
  //1
  var url =
      //await Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Algiers');
      await Uri.parse(
          'https://timeapi.io/api/Time/current/zone?timeZone=Africa/Algiers');

  //https://timeapi.io/api/Time/current/zone?timeZone=Africa/Algiers

  //2 requst api
  var response = await http.get(url);
  //3
  var responsebody = response.body;
  //4 jsonDecode
  var responsebodyencody = jsonDecode(responsebody);
  //5 get varibal datetime from map
  String timeUplod = "${responsebodyencody['dateTime']}";
  //verfy if get truth time
  if (DateTime.tryParse('$timeUplod') != null) {
    dateTime = DateTime.parse('$timeUplod');
    return dateTime;
  }
  return dateTime;
}
