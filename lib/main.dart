import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter_app_bloc/cubit/network_cubit.dart';
import 'package:flutter_app_bloc/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Material());
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        BlocProvider<NetworkCubit>(create: (_) => NetworkCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
