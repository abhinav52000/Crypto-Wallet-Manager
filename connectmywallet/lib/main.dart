import 'package:connectmywallet/network/di/di_container.dart';
import 'package:connectmywallet/screen_and_cubit/GetMyBalance/cubit/get_my_balnce_cubit.dart';
import 'package:connectmywallet/screen_and_cubit/home_screen.dart';
import 'package:connectmywallet/screen_and_cubit/send_tokens/cubit/send_token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectmywallet/network/di/di_container.dart' as di;

void main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetMyBalnceCubit(repository: diInstance.call()),
        ),
        BlocProvider(
          create: (context) => SendTokenCubit(repository: diInstance.call()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
