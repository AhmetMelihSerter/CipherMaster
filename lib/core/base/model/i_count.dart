abstract class ICount {

  Map<String, dynamic> increment();
  Map<String, dynamic> decrement();
  Map<String, dynamic> premiumMap();
  Map<String, dynamic> toMap();
  bool get capacityControl;
  double get diffCount;

}
