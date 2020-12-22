import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageManager {
  static FirebaseStorageManager _instance = FirebaseStorageManager._internal();

  static FirebaseStorageManager get instance => _instance;

  FirebaseStorageManager._internal();

  /// [maxDownloadDataSize] The file must be maximum 10 mb.
  final maxDownloadDataSize = 10 * 1024 * 1024;
  final firebaseStorage = FirebaseStorage.instance;
}
