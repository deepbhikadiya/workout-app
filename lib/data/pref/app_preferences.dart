import 'package:ft_task/package/config_packages.dart';

class AppPref {
  Future? _isPreferenceInstanceReady;
  late SharedPreferences _preferences;

  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance().then((preferences) => _preferences = preferences);
  }

  Future? get isPreferenceReady => _isPreferenceInstanceReady;

  /// retrieve app current language
  String get languageCode => _preferences.getString('languageCode') ?? '';

  set languageCode(String value) => _preferences.setString('languageCode', value);

  /// retrieve app mode light/dark
  bool get isDark => _preferences.getBool('isDark') ?? false;

  set isDark(bool value) => _preferences.setBool('isDark', value);

  /// set notification
  bool get notification => _preferences.getBool('notification') ?? false;

  set notification(bool value) => _preferences.setBool('notification', value);

  void clear() async {
    _preferences.clear();
  }
}
