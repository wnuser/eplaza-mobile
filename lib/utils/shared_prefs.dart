import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //Set/Get UserLoggedIn Status
  void setTutorialSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tutorialSeen', true);
  }

  Future<bool> getTutorialSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('tutorialSeen') ?? false;
  }

  Future<bool> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('darkMode') as bool? ?? true;
  }

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  void setUserLoggedIn(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', loggedIn);
  }

  void setBioMetricAuthStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bioMetricAuthStatus', status);
  }

  Future<bool> getBioMetricAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('bioMetricAuthStatus') ?? false;
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
  //Set/Get UserID Status
  Future setUserId(String authKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', authKey);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('id') as String?;
  }

  //Set/Get isUserRegistered Status
  Future setUserRegistered(bool isUserRegistered) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isUserRegistered', isUserRegistered);
  }

  Future<bool?> getUserRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('isUserRegistered') as bool?;
  }

  //Set/Get UserID Status
  Future setRemaingHourTime(int hour_time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('hour_time', hour_time);
  }

  Future<int?> getRemaingHourTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('hour_time') as int?;
  }

  //Set/Get UserID Status
  Future setMyTamboalTicket(List<String> myticket) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('myticket', myticket);
  }

  Future<List<String>?> getMyTamboalTicket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('myticket');
  }

  //Set/Get UserID Status
  Future setRemaingMinTime(int min_time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('min_time', min_time);
  }

  Future<int?> getRemaingMinTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('min_time') as int?;
  }

  //Set/Get UserLoggedIn Status
  Future setAuthorizationKey(String authKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authKey', authKey);
  }

  Future<String?> getAuthorizationKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('authKey') as String?;
  }

  void setFCMToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('FCMToken', token);
  }

  Future<String?> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('FCMToken') as String?;
  }

  void setVoipToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('VOIPToken', token);
  }

  Future<String?> getVoipToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('VOIPToken') as String?;
  }

  void setWallpaper({required int roomId, required String wallpaper}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(roomId.toString(), wallpaper);
  }

  Future<String> getWallpaper({required int roomId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(roomId.toString()) as String? ??
        "assets/chatbg/chatbg3.jpg";
  }

  //Set/Get UserLoggedIn Status
  // Future<bool> setLanguageCode(String code) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.setString('language', code);
  // }

  Future<String> getLanguageCode() async {
    return 'en';
  }

  void clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setUserLoggedIn(false);
    prefs.remove('authKey');

    //
    // prefs.clear();
    //
    // if (fcmToken != null) {
    //   setFCMToken(fcmToken);
    // }
  }

  void setLanguage(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', lang);
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('language') as String? ?? 'en';
  }
}
