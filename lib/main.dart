import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/data/firebase_data.dart';
import 'package:task/data/local_data.dart';
import 'package:task/firebase_options.dart';
import 'package:task/screens/homeScreen/home_bloc.dart';
import 'package:task/screens/homeScreen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        taskRepository: kDataSource == Sources.firebase
            ? FirebaseDataProvider()
            : LocalDataProvider(),
      ),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: kAccentColor,
              primary: kPrimaryColor,
            )),
        debugShowCheckedModeBanner: false,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen(),
        ),
      ),
    );
  }
}
