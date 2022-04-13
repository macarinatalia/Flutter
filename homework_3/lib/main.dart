import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Forecast',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red.shade400,
          elevation: 0,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return Container(
    padding: EdgeInsets.all(10),
    color: Colors.red.shade400,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchArea(),
        Divider(
          height: 20,
        ),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _areaAndDayDescription(),
              Divider(
                height: 40,
              ),
              _temperature(),
              Divider(
                height: 40,
              ),
              _dayForecast(),
              Divider(
                height: 40,
              ),
              _sevenDayForecast(),
            ],
          ),
        )),
      ],
    ),
  );
}

Row _searchArea() {
  return Row(
    children: [
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        'Enter City Name',
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}

Column _areaAndDayDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Murmansk Oblast, RU',
        style: TextStyle(fontSize: 26, color: Colors.white),
      ),
      Divider(),
      Text(
        'Friday, Mar 20, 2020',
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.sunny,
        size: 70,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '14 °F',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          Text(
            'LIGHT SNOW',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

Row _dayForecast() {
  return Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            Text(
              '5',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'km/hr',
              style: TextStyle(fontSize: 13, color: Colors.white),
            )
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            Text(
              '3',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              '%',
              style: TextStyle(fontSize: 13, color: Colors.white),
            )
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            Text(
              '20',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              '%',
              style: TextStyle(fontSize: 13, color: Colors.white),
            )
          ],
        ),
      ),
    ],
  );
}

Container _sevenDayForecast() {
  return Container(
    height: 200,
    //width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '7-DAY WEATHER FORECAST',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Divider(
          height: 10,
        ),
        DayListView(),
      ],
    ),
  );
}

class DayListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _dayListView();
  }
}

Widget _dayListView() {
  return Container(
    height: 100,
    child: ListView(
      // padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      // itemExtent: 100,
      children: [
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          // padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Friday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '6 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.sunny,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Saturday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '5 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.sunny,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sunday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '22 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.sunny,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Monday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '15 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.wb_cloudy,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thuesday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '11 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.wb_twilight_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wednesday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '12 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 130.0,
          color: Color.fromARGB(93, 255, 255, 255),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thursday',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '10 °F',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Icon(
                    Icons.sunny,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
