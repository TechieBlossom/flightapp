import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  FirebaseService() {
    initFirebase();
  }

  initFirebase() async {
    final FirebaseApp app = await FirebaseApp.configure(
        name: 'flight-firestore',
        options: Platform.isIOS
            ? const FirebaseOptions(
                googleAppID: '1:1009830851809:ios:8658d2b8af672428',
                gcmSenderID: '1009830851809',
                databaseURL: 'https://flight-app-mock.firebaseio.com/',
              )
            : const FirebaseOptions(
                googleAppID: '1:1009830851809:android:8658d2b8af672428',
                apiKey: 'AIzaSyD40ZrOJQh-hTva6dQ-ddYo95fXq5LOb3E',
                databaseURL: 'https://flight-app-mock.firebaseio.com/',
              ));
  }

  Stream<QuerySnapshot> getLocations() {
    return Firestore.instance.collection('locations').snapshots();
  }

  Stream<QuerySnapshot> getCities() {
    return Firestore.instance
        .collection('cities')
        .orderBy('newPrice')
        .snapshots();
  }

  Stream<QuerySnapshot> getDeals() {
    return Firestore.instance.collection('deals').snapshots();
  }
}
