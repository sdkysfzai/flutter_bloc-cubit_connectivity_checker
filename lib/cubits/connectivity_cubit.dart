import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_connectivity_checker/cubits/connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? subscription;
  ConnectivityCubit() : super(ConnectivityInitialState()) {
    subscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(ConnectivityGainedState());
      } else {
        emit(ConnectivityLostState());
      }
    });
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
