import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherHomePage extends StatelessWidget {
  final String title;

  const WeatherHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
      ),
      body: _buildBody(),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _searchItem(),
        _titleItem(),
        _currentDayItem(),
        _extraDaysItem(),
        _sevenDaysForecast(),
      ],
    ),
  );
}

Widget _searchItem() {
  return const Padding(
    padding: EdgeInsets.only(top: 0, bottom: 10),
    child: TextField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      onChanged: null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(86, 86, 86, 0),
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Enter city name',
        hintStyle: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget _titleItem() {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 20),
    child: Column(
      children: const <Widget>[
        Text(
          'Murmansk Oblast, RU',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        SizedBox(height: 7),
        Text(
          'Friday, Mar 20, 2023',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget _currentDayItem() {
  return Padding(
    padding: const EdgeInsets.only(top: 30, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Icon(Icons.sunny, size: 84, color: Colors.white),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: const <Widget>[
            Text(
              '14 °F',
              style: TextStyle(
                color: Colors.white,
                fontSize: 52,
              ),
            ),
            Text(
              'LIGHT SHOW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _extraDaysItem() {
  return Padding(
    padding: const EdgeInsets.only(top: 30, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _extraDayDetail('5', 'km/h'),
        _extraDayDetail('12', '%'),
        _extraDayDetail('10', '%'),
      ],
    ),
  );
}

Widget _extraDayDetail(String temperature, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const Icon(
        Icons.ac_unit_sharp,
        color: Colors.white,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        temperature,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    ],
  );
}

Widget _sevenDaysForecast() {
  return Container(
      padding: EdgeInsets.only(top: 40),
      width: 300,
      height: 300,
      child: RepaintBoundary(
        child: Column(
          children: [
            const Text(
              '7-day weather Forecast',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: 300,
              height: 84,
              child: ListView(
                itemExtent: 140,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 238, 238, 0.4823529411764706)
                    ),
                    child: Column(
                      children: [
                        Text('Friday', style: TextStyle(fontSize: 24, color: Colors.white),),
                        Row(
                          children: <Widget>[

                          ],
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('14 °F'),
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
