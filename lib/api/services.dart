import 'package:flighttickets/flight_list.dart';
import 'package:flighttickets/main.dart';

class Service {
  Stream<List<City>> getCities() async* {
    List<City> cities = List();
    City athensCity = City(
        imagePath:
            'https://firebasestorage.googleapis.com/v0/b/flight-app-mock.appspot.com/o/athens.jpg?alt=media&token=76d68802-c63f-49ce-bbda-a5511defd490',
        cityName: 'Athens',
        discount: "60",
        monthYear: "Apr 2019",
        newPrice: 2000,
        oldPrice: 9999);

    cities.add(athensCity);

    City lasVegasCity = City(
        imagePath:
            'https://firebasestorage.googleapis.com/v0/b/flight-app-mock.appspot.com/o/lasvegas.jpg?alt=media&token=811b3f98-875d-40e7-b592-e80422a8fce3',
        cityName: 'Las Vegas',
        discount: "45",
        monthYear: "Feb 2019",
        newPrice: 2500,
        oldPrice: 4299);

    cities.add(lasVegasCity);

    City sydneyCity = City(
        imagePath:
            'https://firebasestorage.googleapis.com/v0/b/flight-app-mock.appspot.com/o/sydney.jpeg?alt=media&token=2bc37c7b-230a-476b-9ee6-b8d49bc8e710',
        cityName: 'Sydney',
        discount: "35",
        monthYear: "Dec 2019",
        newPrice: 2399,
        oldPrice: 5999);

    cities.add(sydneyCity);
    yield cities;
  }

  Stream<List<FlightDetails>> getDeals() async* {
    List<FlightDetails> deals = List();
    FlightDetails american = FlightDetails(
        airlines: "American",
        date: "Feb 2019",
        discount: "15",
        newPrice: 5199,
        oldPrice: 6999,
        rating: "4.3");
    deals.add(american);

    FlightDetails british = FlightDetails(
        airlines: "British Airlines",
        date: "Jan 2019",
        discount: "20",
        newPrice: 7099,
        oldPrice: 8999,
        rating: "4.8");
    deals.add(british);

    FlightDetails cathayPacific = FlightDetails(
        airlines: "Cathay Pacific",
        date: "June 2019",
        discount: "55",
        newPrice: 4159,
        oldPrice: 9999,
        rating: "4.6");
    deals.add(cathayPacific);

    FlightDetails jetAirways = FlightDetails(
        airlines: "Jet Airways",
        date: "Jan 2019",
        discount: "20",
        newPrice: 6599,
        oldPrice: 7999,
        rating: "4.4");
    deals.add(jetAirways);

    yield deals;
  }
}
