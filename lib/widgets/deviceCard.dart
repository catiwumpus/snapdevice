import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_devices/data/deviceData.dart';
import 'package:snap_devices/data/employees.dart';

class DeviceCard extends StatefulWidget {
  final int index;
  DeviceCard(this.index);

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  var _isButtonDisabled = false;
  var _employees = employees;
  var _currentSelectedValue = " ";
  var _isCheckedOut = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
              )
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
          Container(
            decoration: BoxDecoration(color: Color(0xff141414)),
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              textColor: _isCheckedOut ? Colors.grey : Color(0xff998300),
              child: Text(_isCheckedOut
                  ? "Currently checked out to " + _currentSelectedValue
                  : "Check out"),
              onPressed: _isButtonDisabled
                  ? null
                  : () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => AlertDialog(
                                title: FormField(
                                  builder: (FormFieldState<String> state) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Selected Devices:",
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          deviceData[widget.index]
                                                  .manufacturer +
                                              " " +
                                              deviceData[widget.index].name,
                                          textAlign: TextAlign.left,
                                        ),
                                        DropdownButtonFormField(
                                          decoration: InputDecoration(
                                              helperText:
                                                  "Please select your name"),
                                          items: _employees.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: _currentSelectedValue,
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _currentSelectedValue = newValue;
                                              state.didChange(newValue);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentSelectedValue = " ";
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("Cancel"),
                                    textColor: Color(0xff998300),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _isButtonDisabled = true;
                                        _isCheckedOut = true;
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("Confirm"),
                                    textColor: Color(0xff998300),
                                  ),
                                ],
                              ));
                    },
            ),
          )
        ],
      ),
    );
  }
}
