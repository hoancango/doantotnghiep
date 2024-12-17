import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/players_detail/players_detail.dart';
import 'package:mynewapp/setting/setting.dart';
import 'package:mynewapp/setting/translation.dart';
import 'package:mynewapp/standings/standings.dart';
import 'package:mynewapp/teams_detail/teams_detail.dart';
import 'package:mynewapp/welcome/favTeamQuest.dart';
import 'package:mynewapp/welcome/loading_screen.dart';
import 'package:mynewapp/welcome/successLogin.dart';
import 'package:mynewapp/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_screen.dart';
import 'favourite/favourite_screen.dart';
import 'fixtures/fixtures.dart';
import 'home/home_screen.dart';
import 'matches_detail/matches_detail.dart';
import 'news/news_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await loadUserChoices();
  runApp(const MyGetApp());
}

Future<void> loadUserChoices() async {
  final prefs = await SharedPreferences.getInstance();
  String? selectedLanguage = prefs.getString('selectedLanguage');
  (selectedLanguage == 'English')
      ? Get.locale = const Locale('en', 'GB')
      : Get.locale = const Locale('vi', 'VN');
  bool? isDarkMode = prefs.getBool('isDarkMode');
  if (isDarkMode != null){
    Get.changeTheme((isDarkMode)?ThemeData.dark():ThemeData.light());
    Get.changeThemeMode((isDarkMode)?ThemeMode.dark:ThemeMode.light);
  }
}


class MyGetApp extends StatelessWidget {
  const MyGetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 843),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, __) {
        return GlobalLoaderOverlay(
          overlayWidgetBuilder: (_) {
            return const Center(
                child: SpinKitFadingCircle(
              color: Colors.white,
              size: 50,
            ));
          },
          child: GetMaterialApp(
            translations: AppTranslation(),
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            locale: Get.locale ?? Get.deviceLocale ?? const Locale('vi', 'VN'),
            fallbackLocale: const Locale('vi', 'VN'),

            home: const LoadingScreen(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Welcome(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
