import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_login/classes/device.dart';
import 'package:simple_login/classes/sensor.dart';
import 'package:simple_login/classes/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection references
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference deviceCollection = Firestore.instance.collection('devices');
  final CollectionReference sensorCollection = Firestore.instance.collection('sensors');

  // user data update | creation
  Future<void> updateUserData(String name, String email, String password) async {
    return await userCollection.document(uid).setData({
      'id': uid,
      'name': name,
      'email': email,
      'password': password,
      // sensors & devices
    });
  }

  // device data update | creation
  Future<void> updateDeviceData({String did, String name}) async {

    return await deviceCollection.document(did).setData({
      'id': did,
      'name': name ?? 'Device $did',
      'status': false,
      'owner': uid
    });
  }

  Future<void> changeDeviceStatus({String did, bool status}) async {

    return await deviceCollection.document(did).updateData({
      'status' : status
    });
  }

  Future<void> changeSensorStatus({String did, bool status}) async {

    return await sensorCollection.document(did).updateData({
      'status' : status
    });
  }

  Future<void> deleteDeviceData(String did) async {
    return await deviceCollection.document(did).delete();
  }
  
  // // sensor data update | creation
  // Future<void> updateSensorData(String sid, String name) async {
  //   return await sensorCollection.document((sid).toString()).setData({
  //     'id': sid,
  //     'name': name ?? 'Sensor $sid',
  //     'value': '0',
  //     'owner': uid
  //   });
  // }

  // devices list from snapshot for the current user
  List<Device> _deviceListFromSnapshot(QuerySnapshot snapshot) {

    List<Device> devices = snapshot.documents.map((doc) {

      String owner = doc.data['owner'];
    
      if(owner == uid) {  // get the current online user's devices only
        return Device(
          id: doc.data['id'],
          name: doc.data['name'],
          status: doc.data['status'],
          owner: owner
        );
      } else {
        return null;
      }
    }).toList();

    devices.removeWhere((element) => element == null);  // remove all elements == null (not owned by the current user)

    return devices;
  }

  // sensors list from snapshot
  List<Sensor> _sensorListFromSnapshot(QuerySnapshot snapshot) {

     List<Sensor> sensors = snapshot.documents.map((doc) {

      String owner = doc.data['owner'];
    
      if(owner == null) { 
        return Sensor(
          id: doc.data['id'],
          name: doc.data['name'],
          value: doc.data['value'],
          status: doc.data['status'],
        );
          
      } else {
        return null;
      }
    }).toList();

    sensors.removeWhere((element) => element == null);  // remove all elements == null (not owned by the current user)

    return sensors;
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      id: snapshot.data['id'],
      name: snapshot.data['name'],
      email: snapshot.data['email'],
    );
  }

  // get user doc stream
  Stream<UserData> get userDataStream {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
  
  // get devices stream
  Stream<List<Device>> get deviceStream {
    return deviceCollection.snapshots().map(_deviceListFromSnapshot);
  }
  
  // get sensors stream
  Stream<List<Sensor>> get sensorStream {
    return sensorCollection.snapshots().map(_sensorListFromSnapshot);
  }
}