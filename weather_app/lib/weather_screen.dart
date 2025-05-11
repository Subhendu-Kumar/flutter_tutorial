import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  Future<Map<String, dynamic>> getCurrentWeatherData() async {
    final res = await http.get(
      Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=66d6c1dab6f44a1f9fc173154250705&q=rourkela&aqi=yes",
      ),
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() async {
    try {
      final data = await getCurrentWeatherData();
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching weather: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.brown,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 30),
            onPressed: () {
              setState(() {
                isLoading = true;
                fetchWeather();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : weatherData == null
                ? const Center(child: Text('Failed to load data.'))
                : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      surfaceTintColor: Color.fromARGB(31, 242, 206, 206),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                        title: Text(
                          "${weatherData!["location"]['name']}, ${weatherData!["location"]['region']}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${weatherData!["location"]['country']}\nTime: ${weatherData!["location"]['localtime']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      surfaceTintColor: Color.fromARGB(31, 242, 206, 206),
                      elevation: 2,
                      child: ListTile(
                        leading: Image.network(
                          'https:${weatherData!["current"]["condition"]["icon"]}',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          weatherData!["current"]["condition"]["text"],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${weatherData!["current"]["temp_c"]}°C',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Air Quality Index',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HourlyForecastItem(
                            time: 'CO',
                            icon: Icons.air,
                            value: weatherData!["current"]["air_quality"]["co"]
                                .toStringAsFixed(2),
                          ),
                          const SizedBox(width: 3),
                          HourlyForecastItem(
                            time: 'NO₂',
                            icon: Icons.air,
                            value: weatherData!["current"]["air_quality"]["no2"]
                                .toStringAsFixed(2),
                          ),
                          const SizedBox(width: 3),
                          HourlyForecastItem(
                            time: 'O₃',
                            icon: Icons.air,
                            value: weatherData!["current"]["air_quality"]["o3"]
                                .toStringAsFixed(2),
                          ),
                          const SizedBox(width: 3),
                          HourlyForecastItem(
                            time: 'PM2.5',
                            icon: Icons.air,
                            value:
                                weatherData!["current"]["air_quality"]["pm2_5"]
                                    .toStringAsFixed(2),
                          ),
                          const SizedBox(width: 3),
                          HourlyForecastItem(
                            time: 'PM10',
                            icon: Icons.air,
                            value:
                                weatherData!["current"]["air_quality"]["pm10"]
                                    .toStringAsFixed(2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Additional Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AddiitionalInfoItem(
                          icon: Icons.water_drop,
                          title: 'Humidity',
                          value: '${weatherData!["current"]["humidity"]}%',
                        ),
                        AddiitionalInfoItem(
                          icon: Icons.air,
                          title: 'Wind Speed',
                          value: '${weatherData!["current"]["wind_kph"]} km/h',
                        ),
                        AddiitionalInfoItem(
                          icon: Icons.beach_access_sharp,
                          title: 'Pressure',
                          value: '${weatherData!["current"]["pressure_mb"]} mb',
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
