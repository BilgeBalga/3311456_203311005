import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  String? dataTemp;

  Future<String> fetchData() async {
    final response = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=36.884804&longitude=30.704044&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m",
      ),
    );
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final currentWeather = decoded['current_weather'];
      final temp = currentWeather['temperature'];
      print(temp);
      dataTemp = temp.toString();
    } else {
      print("Sunucu Hatası");
    }
    return dataTemp!;
  }
}
