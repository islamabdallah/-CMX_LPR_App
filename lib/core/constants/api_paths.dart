class AppEndpoints {
  AppEndpoints._();

  static const String baseUrl = 'http://20.86.97.165/SafetyGuard/api';
  static const String userLogin = '$baseUrl/LoginAPI/userLogin';
  static const String pendingLPR= '$baseUrl/LPRAPI/pendingLPR';
  static const String confirmLPR= '$baseUrl/LPRAPI/ConfirmLPR';
  static const String getNotification= '$baseUrl/LPRAPI/notifySammary';
  static const String addLPR= '$baseUrl/LPRAPI/AddLPR';
}