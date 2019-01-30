import 'dart:async';

import 'package:flighttickets/api/services.dart';
import 'package:flighttickets/blocs/bloc_provider.dart';
import 'package:flighttickets/main.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc implements BlocBase {

  Service service;

  String fromLocation, toLocation;
  List<String> locations = List();

  StreamController<String> fromLocationController = PublishSubject<String>();
  StreamController<String> toLocationController = PublishSubject<String>();
  StreamController<List<String>> locationsController = StreamController<List<String>>();
  StreamController<List<City>> citiesSnapshotController = StreamController<List<City>>();

  StreamSink<String> get addFromLocation => fromLocationController.sink;
  Stream<String> get fromLocationStream => fromLocationController.stream;

  StreamSink<List<String>> get addLocationsList => locationsController.sink;
  Stream<List<String>> get locationsStream => locationsController.stream;

  StreamSink<String> get addToLocation => toLocationController.sink;
  Stream<String> get toLocationStream => toLocationController.stream;

  StreamSink<List<City>> get citiesSnapshot => citiesSnapshotController.sink;
  Stream<List<City>> get citiesSnapshotStream => citiesSnapshotController.stream;

  AppBloc() {
    addLocations();
    service = Service();
    fromLocationStream.listen((location) {
      fromLocation = location;
    });

    toLocationStream.listen((location) {
      toLocation = location;
    });

    service.getCities().listen((event) {
      citiesSnapshot.add(event);
    });
  }

  addLocations() {
    locations?.clear();
    locations.add("Boston (BOS)");
    locations.add("California (CAF)");
    locations.add("Las Vegas (LAV)");
    locations.add("New York City (JFK)");

    addLocationsList.add(locations);
    addFromLocation.add(locations[0]);
  }

  @override
  void dispose() {
    print('disposed app bloc');
    fromLocationController.close();
    toLocationController.close();
    locationsController.close();
    citiesSnapshotController.close();
  }
}