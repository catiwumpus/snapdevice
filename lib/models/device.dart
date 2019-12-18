class Device {
  String manufacturer;
  String name;
  String version;
  String platform;
  String image;
  bool isAndroid;
  bool isSelected;
  bool isCheckedOut;

  bool get selected {
    return isSelected;
  }

  bool get checkedOut {
    return isCheckedOut;
  }

  Device(
      {this.manufacturer,
      this.name,
      this.version,
      this.platform,
      this.image,
      this.isAndroid,
      this.isSelected = false,
      this.isCheckedOut = false});
}
