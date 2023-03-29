import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_connectivity_checker/cubits/connectivity_cubit.dart';
import 'package:flutter_bloc_connectivity_checker/cubits/connectivity_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Connectivitiy Checker'),
      ),
      body: Center(
        child: BlocConsumer<ConnectivityCubit, ConnectivityState>(
          listener: (context, state) {
            if (state is ConnectivityGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Connected'),
                backgroundColor: Colors.green,
              ));
            } else if (state is ConnectivityLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Disconnected'),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is ConnectivityGainedState) {
              return const Text('Connected');
            } else if (state is ConnectivityLostState) {
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
