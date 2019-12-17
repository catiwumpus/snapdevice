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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "lib/assets/background.png",
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
          ListTile(
            leading: Icon(
              deviceData[widget.index].isAndroid
                  ? Icons.android
                  : FontAwesomeIcons.apple,
              color: deviceData[widget.index].isAndroid
                  ? Color(0xffa4c639)
                  : Color(0xffc0c0c0),
              size: 30.0,
            ),
            title: Text(deviceData[widget.index].manufacturer +
                " " +
                deviceData[widget.index].name),
            subtitle: Text("OS Version: " + deviceData[widget.index].version),
            trailing: Icon(Icons.info),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
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
