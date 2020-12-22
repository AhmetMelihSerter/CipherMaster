import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ciphermaster/core/base/model/i_count.dart';
import 'package:ciphermaster/core/base/model/base_count.dart';

class PhotoCount extends BaseCount implements ICount {
  int _currentCount;
  int _totalCount;

  static const tableName = 'photoCount';
  static const tableUserID = 'userID';

  int get currentCount => _currentCount;

  void incrementCount() => _currentCount++;

  void decrementCount() => _currentCount--;

  int get totalCount => _totalCount;

  PhotoCount();

  PhotoCount.photoRegister() {

  }

  PhotoCount.fromMap(int current) {

  }

  PhotoCount.fromCloudMap(Map<String, dynamic> map) {
    _currentCount = map['currentPhotoCount'];
    _totalCount = map['totalPhotoCount'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'currentPhotoCount': _currentCount,
      'totalPhotoCount': _totalCount,
    };
  }

  Map<String, dynamic> toCloudMap() {
    return {
      'currentPhotoCount': _currentCount,
      'totalPhotoCount': _totalCount,
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
