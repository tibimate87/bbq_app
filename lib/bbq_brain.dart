import 'package:bbq_app/bbq_info.dart';

class BBQBrain {
  List<BBQinfo> _meatData = [
    BBQinfo(name: 'Pulled Pork', weight: 0.0),
    // BBQinfo(name: 'Hamburger', weight: 0.0)
  ];

  String getName(int number) {
    return _meatData[number].name;
  }

  double getWeight(int number) {
    return _meatData[number].weight;
  }

  void setWeight(int number, double weight) {
    _meatData[number].weight = weight;
  }

  int getSize() {
    return _meatData.length;
  }
}
