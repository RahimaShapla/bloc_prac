import 'package:bloc_prac/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<InternetCubit, InternetStateC>(
              builder: (context, state) {
            if (state == InternetStateC.gained) {
              return const Text("Connected");
            } else if (state == InternetStateC.lost) {
              return const Text("Not Connected");
            }else {
              return const Text("loadinggg");
            }
          }),
        ),
      ),
    );
  }
}
