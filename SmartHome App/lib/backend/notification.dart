import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_login/backend/DBService.dart';
import 'package:simple_login/classes/sensor.dart';

class NotificationService {
  
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  
  showNotification(int id, String name, String value) async {

    var android = new AndroidNotificationDetails(
      'Sensors Notifications',
      'Sensors',
      'Alerts from Smart Home Connected Sensors',
      priority: Priority.High,
      importance: Importance.Max,
      ongoing: false,
      onlyAlertOnce: true,
      ledOnMs: 1,
      ledOffMs: 1,
      ledColor: Colors.blueGrey[900],
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    await flutterLocalNotificationsPlugin.show(
      id, name, 'Alert: ${id == 0 ? '$value %' : id == 1 ? '$value C' : '$value'}', platform,
      payload: 'Smart Home sensor reading alert \n$name alert \nReading: $value');
  }

  hideNotification(int id) async => await flutterLocalNotificationsPlugin.cancel(id);

  void checkStatus(List<Sensor> sensors) {  // thresholds is to be modefied
    
    if(int.parse(sensors[0].value) >= 50) {

      DatabaseService().changeSensorStatus(did: sensors[0].id, status: true);
      showNotification(0, sensors[0].name, sensors[0].value);
    } else {
      DatabaseService().changeSensorStatus(did: sensors[0].id, status: false);
      hideNotification(0);
    }

    if(int.parse(sensors[1].value) >= 50) {
      DatabaseService().changeSensorStatus(did: sensors[1].id, status: true);
      showNotification(1, sensors[1].name, sensors[1].value);
    } else {
      DatabaseService().changeSensorStatus(did: sensors[1].id, status: false);
      hideNotification(1);
    }

    if(sensors[2].status) {
      showNotification(2, sensors[2].name, 'The door is OPEN');
    } else {
      hideNotification(2);
    }

    if(sensors[3].status) {
      showNotification(3, sensors[3].name, 'There is a GAS leakage');
    } else {
      hideNotification(3);
    }

    if(sensors[4].status) {
      showNotification(4, sensors[4].name, 'There is a WATER leakage');
    } else {
      hideNotification(4);
    }

  }

}