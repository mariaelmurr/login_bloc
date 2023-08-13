import 'package:bloc_tutorial/business_logic/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_tutorial/business_logic/login/bloc/login_bloc.dart';
import 'package:bloc_tutorial/business_logic/theme/cubit/theme_cubit.dart';
import 'package:bloc_tutorial/data/repository/authentication_repository/authentication_repository.dart';
import 'package:bloc_tutorial/navigation/app_routes.dart';
import 'package:bloc_tutorial/navigation/handle_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context, listen: false)
      ..add(checkIfUserSaved());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Demo Bloc',
            debugShowCheckedModeBanner: false,
            themeMode: themeState ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData.light(),
            navigatorKey: HandleNavigation.navigatorKey,
            initialRoute: AppRoutes.homeRoute,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
