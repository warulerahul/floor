
abstract class SubscriptionViewModel
{
  Sink get inputMailText;
  Stream<bool> get outPutIsButtonEnabled;
  Stream<String> get outputErrorText;

  void dispose();
}