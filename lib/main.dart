import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/bloc/blocs.dart';

import 'package:star_wars/page/ui/pages.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/provider/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PeopleBloc()..add(FetchPeople()))
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthPage(),
          )),
    );
  }
}
