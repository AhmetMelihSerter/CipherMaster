import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/base/view_model/base_view_model.dart';
import 'package:ciphermaster/core/constants/enums/view_state_enum.dart';
import 'package:ciphermaster/views/auth/repository/auth_repository.dart';

class AuthViewModel extends BaseViewModel {
  final _authRepository = AuthRepository.instance;

  User user = User();

  /// [passwordVisible] // * Şifrenin Görünürlüğü.
  bool _passwordVisible = true;

  bool get passwordVisible => _passwordVisible;

  void passwordVisibleChange() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  /// [_activeStep] Index of the current active step.
  int _activeStep = 0;

  int get activeStep => _activeStep;

  set activeStep(int value) {
    if (value > 0 && value < 4)
      _activeStep = value;
    else
      _activeStep = 0;
    notifyListeners();
  }

  /// Error if [_validateError] is true, else editing or complete
  bool _validateError = false;

  void createStep() {
    _activeStep = 0;
  }

  void nextStep() {
    _validateError = false;
    activeStep++;
    debugPrint("RegisterPage Next Step $activeStep");
  }

  void backStep() {
    _validateError = false;
    activeStep--;
    debugPrint("RegisterPage Back Step $activeStep");
  }

  void currentStepError() {
    _validateError = true;
    activeStep = activeStep;
    debugPrint("RegisterPage Validate Error $activeStep");
  }

  void mailError() {
    _validateError = true;
    activeStep = 1;
    debugPrint("RegisterPage Mail Error $activeStep");
  }

  /// [stateActiveControl()] // * Aktif Durum Kontrolü yapar.
  // * Durum aktifse ve hata yoksa true
  // * Durum aktif fakat hata varsa false
  // * else if ise aktif olanların altındaki durumların false yapılmasını sağlar.
  bool stateActiveControl(int stateValue) {
    bool tempBool;
    if (activeStep == stateValue)
      _validateError ? tempBool = false : tempBool = true;
    else if (activeStep < stateValue)
      tempBool = false;
    else
      tempBool = true;
    return tempBool;
  }

  /// [stateIconControl()]  İconun Durum Kontrolünü yapar.
  // * Durum aktifse ve hata yoksa editing
  // * Durum aktifse ve hata varsa error
  // * Durum pasifse complete
  StepState stateIconControl(int currentState) {
    if (activeStep == currentState)
      return _validateError ? StepState.error : StepState.editing;
    else
      return StepState.complete;
  }

  Future<void> signInWithEmailAndPassword() async {
    
  }

  Future<void> createUserWithEmailAndPassword() async {
    
  }

  void signOut() {
    user = User();
  }
}
