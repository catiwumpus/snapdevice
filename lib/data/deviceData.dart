import 'dart:core';

import 'package:snap_devices/models/device.dart';

List<Device> deviceData = []
  ..add(Device(
      manufacturer: "Samsung",
      name: "Galaxy S10",
      platform: "Android",
      image: "lib/assets/s10.png",
      isAndroid: true,
      version: "10.0"))
  ..add(Device(
      manufacturer: "Apple",
      name: "iPhone XR",
      platform: "iOS",
      image: "lib/assets/iphonexs.png",
      isAndroid: false,
      version: "13.1"))
  ..add(Device(
      manufacturer: "Apple",
      name: "iPhone 5",
      platform: "iOS",
      image: "lib/assets/iphone5.PNG",
      isAndroid: false,
      version: "10.3.3"))
  ..add(Device(
      manufacturer: "Google",
      name: "Pixel 3",
      platform: "Android",
      image: "lib/assets/pixel3.png",
      isAndroid: true,
      version: "9.0"))
  ..add(Device(
      manufacturer: "Huawei",
      name: "Nexus 6P",
      platform: "Android",
      image: "lib/assets/nexus6p.png",
      isAndroid: true,
      version: "7.0"))
  ..add(Device(
      manufacturer: "Samsung",
      name: "Galaxy S6",
      platform: "Android",
      image: "lib/assets/galaxys6.png",
      isAndroid: true,
      version: "6.0.1"))
  ..add(Device(
      manufacturer: "Apple",
      name: "iPhone 11",
      platform: "iOS",
      image: "lib/assets/iphone11.png",
      isAndroid: false,
      version: "13.1"))
  ..add(Device(
      manufacturer: "Apple",
      name: "iPhone 11 Pro",
      platform: "iOS",
      image: "lib/assets/iphone11.png",
      isAndroid: false,
      version: "13.1"))
  ..add(Device(
      manufacturer: "HTC",
      name: "Moto G4 Plus",
      platform: "Android",
      image: "lib/assets/motog4.png",
      isAndroid: true,
      version: "6.1"))
  ..add(Device(
      manufacturer: "Xaiomi",
      name: "Redmi",
      platform: "Android",
      image: "lib/assets/redmi.png",
      isAndroid: true,
      version: "8.1.0"));
