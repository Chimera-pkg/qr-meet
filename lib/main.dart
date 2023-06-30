import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:PictSnap/models/models.dart';
import 'package:PictSnap/services/services.dart';
import 'package:PictSnap/providers/providers.dart';
import 'package:PictSnap/ui/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize a new Firebase App instance
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TypeProvider()),
        ChangeNotifierProvider(create: (context) => TokenProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TextureProvider()),
        ChangeNotifierProvider(create: (context) => TextureRuleProvider()),
        ChangeNotifierProvider(create: (context) => ConfigProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PictSnap - Designer',
        theme: ThemeData(
          splashColor: Colors.white,
        ),
        home: FutureBuilder(
          future: Init.instance.getToken(),
          builder: (context, data) {
            if (data.data == null) {
              return Splash();
            } else if (data.data == false) {
              return StartPage();
            } else if (data.data?.email != null) {
              return ChooseTypePage(data.data);
            }
          },
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(20),
          child: Center(child: Image.asset('assets/pictsnap.png'))),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 0));
  }

  Future<dynamic> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null || token == "") {
      return false;
    } else {
      final result = await UserServices.getUser(token: token);
      return result;
    }
  }
}
