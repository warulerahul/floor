import 'dart:async';

import 'package:floor_demo/retrofit/SubscriptionViewModel.dart';

class SubscriptionViewModelImpl implements SubscriptionViewModel {
  var _mailTextController = StreamController<String>.broadcast();

  @override
  Sink get inputMailText => _mailTextController;

  @override
  Stream<bool> get outPutIsButtonEnabled => _mailTextController.stream
      .map((email) => EmailValidator.isEmailValid(email));

  @override
  Stream<String> get outputErrorText => outputIsButtonEnabled
      .map((isEnabled) => isEnabled ? null : "Invalid email");

  @override
  void dispose() => _mailTextController.close();
}