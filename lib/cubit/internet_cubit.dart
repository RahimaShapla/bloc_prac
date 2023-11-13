import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetStateC { initial, lost, gained }

class InternetCubit extends Cubit<InternetStateC> {
  StreamSubscription? _streamSubscription;
  final Connectivity _connectivity = Connectivity();

  InternetCubit() : super(InternetStateC.initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetStateC.gained);
      } else {
        emit(InternetStateC.lost);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
