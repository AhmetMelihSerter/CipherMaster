import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ciphermaster/core/base/model/i_count.dart';
import 'package:ciphermaster/core/base/model/base_count.dart';

class AppCount extends BaseCount implements ICount {
  int _currentCount;
  int _totalCount;

  static const tableName = 'appCount';
  static const tableUserID = 'userID';

  int get currentCount => _currentCount;

  void incrementCount() => _currentCount++;

  void decrementCount() => _currentCount--;

  int get totalCount => _totalCount;

  AppCount();

  // ! Deprecate. Registerde belirle.
  AppCount.appRegister() {
    
  }

  AppCount.fromMap(int current) {
    
  }

  AppCount.fromCloudMap(Map<String, dynamic> map) {
    _currentCount = map['currentAppCount'];
    _totalCount = map['totalAppCount'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'currentAppCount': _currentCount,
      'totalAppCount': _totalCount,
    };
  }

  Map<String, dynamic> toCloudMap() {
    return {
      'currentAppCount': _currentCount,
      'totalAppCount': _totalCount,
    };
  }

  @override
  Map<String, dynamic> increment() {
    
  }

  @override
  Map<String, dynamic> decrement() {
    
  }

  @override
  Map<String, dynamic> premiumMap() {
    
  }

  @override
  bool get capacityControl => _totalCount > (_currentCount + 1) ? true : false;

  @override
  double get diffCount => _currentCount.toDouble() / _totalCount.toDouble();
}
