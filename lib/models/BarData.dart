import 'package:efymen/models/indivudualBar.dart';

class BarData {
  final double mon;
  final double tue;
  final double wed;
  final double thu;
  final double fri;
  final double sat;
  final double sun;

  BarData({
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.sun,
  });

  List<IndividualBar> barData = [];

  void initBarData() {
    barData = [
      IndividualBar(x: 0, y: mon),
      IndividualBar(x: 1, y: tue),
      IndividualBar(x: 2, y: wed),
      IndividualBar(x: 3, y: thu),
      IndividualBar(x: 4, y: fri),
      IndividualBar(x: 5, y: sat),
      IndividualBar(x: 6, y: sun),
    ];
  }
}
