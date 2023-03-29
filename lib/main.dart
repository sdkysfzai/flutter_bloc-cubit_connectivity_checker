import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_connectivity_checker/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_connectivity_checker/cubits/connectivity_cubit.dart';
import 'package:flutter_bloc_connectivity_checker/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityCubit(),
      child: MaterialApp(
        title: 'Flutter_Bloc Connectivity Checker ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
