import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '24a4fe59ca04f2d7bf6101d089fb42c8';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherDataModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric',
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    String url;
    if (condition < 300) {
      return '🌩️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '⛄';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 800) {
      return '☁️️';
    } else
      return '🤷';
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 20) {
      return 'You will need 🧣 and 🧢';
    } else {
      return 'Bring 🧍‍♂️ just in case';
    }
  }

  String getUrl(int condition) {
    String url;
    if (condition < 300) {
      url = 'https://wallpapercave.com/wp/wp9119760.jpg';
    } else if (condition < 400) {
      url =
          'https://tse3.mm.bing.net/th/id/OIP.EFCmtaZ6zmT1KQZgpFQMAgHaLH?pid=Api&P=0&h=220';
    } else if (condition < 600) {
      url =
          'https://static.vecteezy.com/system/resources/previews/015/412/592/non_2x/rain-on-city-background-rainy-day-urban-landscape-in-rainy-weather-illustration-in-flat-style-vector.jpg';
    } else if (condition < 700) {
      url =
          'https://w0.peakpx.com/wallpaper/881/122/HD-wallpaper-nebula-cold-weather-nature-snow-stars-trees-winter-winter-is-here.jpg';
    } else if (condition < 800) {
      url =
          'https://img.freepik.com/premium-photo/vertical-long-exposure-shot-highway-road-foggy-seattle-city_665346-79620.jpg';
    } else if (condition == 800) {
      url =
          'https://static.vecteezy.com/system/resources/previews/009/880/308/original/blue-sky-with-altostratus-clouds-background-cartoon-sky-with-cirrus-clouds-concept-all-seasonal-vertical-banner-in-sunny-day-spring-and-summer-in-the-morning-3dillustration-of-nature-vector.jpg';
    } else if (condition <= 800) {
      url =
          'https://i.pinimg.com/736x/76/e9/1b/76e91b074d1fa4d56bd0b4e964f8e044.jpg';
    } else {
      url =
          'https://cdn.dribbble.com/users/925716/screenshots/3333720/attachments/722375/night.png';
    }
    return url;
  }
}
