
abstract class NotificationStates {}

class InitialNotificationState extends NotificationStates {}

class NotificationLoadingState extends NotificationStates {}

class NotificationSuccessState extends NotificationStates {
  // late LoginResponse loginResponse;
  // LoginSuccessState(this.loginResponse);
  NotificationSuccessState();
}

class NotificationErrorState extends NotificationStates {
  String? message;
  NotificationErrorState(this.message);
}

