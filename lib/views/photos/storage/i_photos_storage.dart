import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';

abstract class IPhotosStorage {
  Future<String> createPhoto(User signInUser, Photo insertedPhoto);
  Future<String> deletePhoto(User signInUser, Photo deletedPhoto);
}
