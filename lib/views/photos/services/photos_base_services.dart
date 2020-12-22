import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';

abstract class PhotosBaseServices {
  Future<Photo> createPhoto(
      User signInUser, Photo insertedPhoto, Function stateControl);
  Future<Photo> deletePhoto(
      User signInUser, Photo deletedPhoto, Function stateControl);
}
