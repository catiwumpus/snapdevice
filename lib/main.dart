import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:snap_devices/data/deviceData.dart';
import 'package:snap_devices/widgets/deviceCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black.withOpacity(0.4));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Snap Device Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    bool _canShow(devices) => devices.any((f) => f.selected == true);

    return Scaffold(
      backgroundColor: Color(0xff323232),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xdd000000)),
        ),
        backgroundColor: Color(0xffffd600),
        iconTheme: IconThemeData(color: Color(0xdd000000)),
        brightness: Brightness.dark,
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Check In"),
            onTap: () {},
          )
        ],
      )),
      body: Stack(
        children: <Widget>[
          GridView.builder(
              itemCount: deviceData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: itemHeight / itemWidth + .582),
              itemBuilder: (BuildContext context, int index) {
                return DeviceCard(index, refresh);
              }),
          _canShow(deviceData)
              ? Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: itemHeight / 2,
                    width: itemWidth * 2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.8)
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            stops: [0.0, 1.0])),
                  ),
                )
              : Container()
        ],
      ),
      floatingActionButton: _canShow(deviceData)
          ? FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < deviceData.length - 1; i++) {
                    if (deviceData[i].isSelected) {
                      deviceData[i].isCheckedOut = true;
                    }
                    deviceData[i].isSelected = false;
                  }
                });
              },
              label: Text(
                "CHECKOUT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xffffd600),
            )
          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
