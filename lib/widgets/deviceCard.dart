import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_devices/data/deviceData.dart';

class DeviceCard extends StatefulWidget {
  final int index;
  final Function() notifyParent;
  DeviceCard(this.index, this.notifyParent);

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          deviceData[widget.index].isSelected =
              !deviceData[widget.index].isSelected;
          widget.notifyParent();
        });
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: deviceData[widget.index].isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Color(0xffffd600), width: 3))
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "lib/assets/wallpaper.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    child: Image.asset(
                      deviceData[widget.index].image,
                    ),
                  ),
                ),
                deviceData[widget.index].isCheckedOut
                    ? Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.8),
                          child: Center(child: Text("UNAVAILABLE")),
                        ),
                      )
                    : Container(),
              ],
            ),
            Divider(
              color: Color(0xff323232),
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xff141414)),
              child: ListTile(
                leading: Icon(
                  deviceData[widget.index].isAndroid
                      ? FontAwesomeIcons.android
                      : FontAwesomeIcons.apple,
                  color: Color(0xffc0c0c0),
                  size: 30.0,
                ),
                title: Text(
                  deviceData[widget.index].manufacturer +
                      " " +
                      deviceData[widget.index].name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "OS Version: " + deviceData[widget.index].version,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.info,
                  color: Color(0xff4d4d4d),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
