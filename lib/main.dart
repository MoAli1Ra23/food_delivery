import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/user_managment/view/Pages/profile_page.dart';
import 'package:food_delivery/features/user_managment/view/bloc/auth_master_bloc.dart';
import 'package:food_delivery/features/user_managment/view/bloc/log_in_bloc.dart';
import 'package:food_delivery/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'features/image_management/domain/entities/image_cashed_data.dart';
import 'features/menu/view/bloc/select_food_bloc.dart';
import 'features/menu/view/page/select_food_page.dart';
import 'features/user_managment/view/Pages/log_in_page.dart';
import 'features/user_managment/view/bloc/profile_bloc_bloc.dart';
import 'features/user_managment/view/bloc/sing_up_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ImageCashedDataAdapter());
  await Hive.openBox<ImageCashedData>('Imagedata');

  configureDependencies("debug");

  runApp( BlocProvider(
        create: (context) => AuthMasterBloc()..add(AuthMasterCheckAuthState()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: true,
              create: (context) => SingUpBloc(),
            ),
            BlocProvider(
              lazy: true,
              create: (context) => ProfileBlocBloc(),
              // child: const ProfilePage(),
            ),
            BlocProvider(
              lazy: true,
              create: (context) => LogInBloc(),
              // child: LogInPage(),
            ),
            BlocProvider(
              lazy: true,
              create: (context) => ProfileBlocBloc(),
              // child: const ProfilePage(),
            ),
          ],
           child: const MyApp(),),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:   BlocProvider(
      //   create: (context) => FoodsCubit()..onReqest(),
      //   child: const FoodsPage(),)

      home: const AuthLister(),
        
      
      // home:   PageforTest(),
      // home:   BlocProvider(
      //   create: (context) => SelectFoodBloc()..add(LoadMenu()),
      //   child: const SelectFoodPage(),
      // ),
    );
  }
}

class AuthLister extends StatelessWidget {
  const AuthLister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthMasterBloc, AuthMasterState>(
      listener: (context, state) {
        if (state is AuthMasterInitial) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return LogInPage();
          }));
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              BlocProvider.of<ProfileBlocBloc>(context)
                .add(
                    ProfileBlocRequsit((state as AuthMasterISAuth).user.fbID!));

              return const ProfilePage();
            }),
            // MaterialPageRoute(
            //   builder: (_) {
            //     return BlocProvider(
            //         create: (context) => SelectFoodBloc()..add(LoadMenu()),
            //         child: const SelectFoodPage());
            //   },
          );
        }
      },
      child: Container(
        color: Colors.blueAccent,
        child: const Center(
          child: RefreshProgressIndicator(color: Colors.amber),
        ),
      ),
    );
  }
}
