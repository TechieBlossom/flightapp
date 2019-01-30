import 'dart:async';
import 'package:flighttickets/api/services.dart';
import 'package:flighttickets/blocs/bloc_provider.dart';
import 'package:flighttickets/flight_list.dart';

class FlightListBloc implements BlocBase {

  StreamController<List<FlightDetails>> dealsController = StreamController<List<FlightDetails>>();

  StreamSink<List<FlightDetails>> get dealsSink => dealsController.sink;

  Stream<List<FlightDetails>> get dealsStream => dealsController.stream;

  FlightListBloc(Service firebaseService) {
    firebaseService.getDeals().listen((event) {
      dealsSink.add(event);
    });
  }

  @override
  void dispose() {
    dealsController.close();
  }

}