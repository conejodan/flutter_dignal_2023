import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/models/models.dart';
import 'package:flutter_dignal_2023/services/my_server.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus { online, offline, connecting }

class TimeSeriesData {
  final DateTime time;
  final double data;

  TimeSeriesData({required this.time, required this.data});
}

class DevicesProvider extends ChangeNotifier {
  DevicesProvider() {
    getDevices();
  }

  late Device selectedDevice;

  List<double> temperatures = [];
  List<double> lights = [];
  List<TimeSeriesData> lightsTimeData = [];
  bool led = true;
  ServerStatus connection = ServerStatus.offline;
  // List<Device> devices = List.generate(
  //   20,
  //   (index) => Device(
  //     id: index + 1,
  //     name: 'Device ${index + 1}',
  //     active: Random().nextBool(),
  //   ),
  // );

  List<Device> devices = [];

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  getDevices() async {
    print('getDevices');
    final deviceList = await MyServer().getDevices();
    if (deviceList == null) return null;
    devices = deviceList;
    notifyListeners();
  }

  io.Socket? socket;

  startSocketDevice() {
    socket = MyServer().socket;
    if (socket != null && socket!.connected) {
      connection = ServerStatus.offline;
      socket?.disconnect();
    }

    print("startSocketDevice");
    socket?.onConnect((_) {
      print('connect');
      socket?.emit('init', selectedDevice.key);
      connection = ServerStatus.online;
      notifyListeners();
    });
    socket?.on('event', (data) => print(data));
    socket?.onDisconnect((_) {
      print('disconnect');
      connection = ServerStatus.offline;
      notifyListeners();
    });
    socket?.on('temperature', (data) {
      print(data);
      //print(data["temperature"]);
      int temperatureInt = data["temperature"];
      temperatures.add(temperatureInt.toDouble());
      notifyListeners();
    });
    socket?.on('light', (data) {
      print(data);
      //print(data["light"]);
      int lightInt = data["light"];
      lights.add(lightInt.toDouble());
      lightsTimeData.add(TimeSeriesData(
        time: DateTime.now(),
        data: lightInt.toDouble(),
      ));
      notifyListeners();
    });
    socket?.connect();
  }

  emitLed(value) {
    if (socket != null) {
      print("Emit led $value");
      led = value;
      socket?.emit('led', value);
      notifyListeners();
      emitCommand("AB");
    }
  }

  emitCommand(value) {
    if (socket != null) {
      socket?.emit('command', value);
      notifyListeners();
    }
  }
}
