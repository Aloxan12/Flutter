import 'dart:convert';

import 'package:flutter_first_progect/AppWeather/models/weather_forecast.dart';
import 'package:flutter_first_progect/AppWeather/util/constants.dart';
import 'package:http/http.dart' as http;

class WeatherApi{
  Future<WeatherForecast> fetchWeatherForecastWithCity({String? cityName}) async{
    var queryParams = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, queryParams);
    var response = await http.get(uri);

    if(response.statusCode == 200){
      return WeatherForecast.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }
  }
}