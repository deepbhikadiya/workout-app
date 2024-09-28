import 'package:firebase_core/firebase_core.dart';
import 'package:ft_task/firebase_options.dart';
import 'package:ft_task/package/config_packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPref().isPreferenceReady;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();

  AppPref().languageCode = 'en';
  runApp(const WorkOut());
}
