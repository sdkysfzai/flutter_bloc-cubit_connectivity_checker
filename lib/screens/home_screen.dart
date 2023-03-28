import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_connectivity_checker/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_connectivity_checker/blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Connectivitiy Checker'),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGaintedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Connected'),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Disconnected'),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetGaintedState) {
              return const Text('Connected');
            } else if (state is InternetLostState) {
              return const Text('Not Connected!');
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
