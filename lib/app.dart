import 'package:ft_task/package/config_packages.dart';


class WorkOut extends StatefulWidget {
  const WorkOut({super.key});

  @override
  State<WorkOut> createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> with WidgetsBindingObserver {
  final List<StreamSubscription> _streams = [];
  bool isInternetAvailable = false;

  var locales = [
    const Locale('en', ''),
    const Locale('ar', ''),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _streams) {
      element.cancel();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WorkOut',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:AppPref().isDark ==true? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRouter.home,
      getPages: AppRouter.getPages,
      locale: Locale(AppPref().languageCode, ''),
      supportedLocales: locales,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child:  AnnotatedRegion<SystemUiOverlayStyle>(
            value: (MediaQuery.of(context).platformBrightness == Brightness.light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.light),
            child: child ?? Container(),
          ),
        );
      },
    );
  }
}
