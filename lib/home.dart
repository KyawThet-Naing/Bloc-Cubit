import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter_app_bloc/cubit/network_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER BLOC CUBIT'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text('Counter is $state ', style: TextStyle(fontSize: 25));
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).increase(),
                icon: Icon(Icons.add),
                label: Text('Increase'),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).decrease(),
                  icon: Icon(Icons.remove),
                  label: Text('decrease')),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMaterialButton(
                  title: 'Loading',
                  onPressed: () =>
                      BlocProvider.of<NetworkCubit>(context).loading()),
              _buildMaterialButton(
                  title: 'Success',
                  onPressed: () =>
                      BlocProvider.of<NetworkCubit>(context).success()),
              _buildMaterialButton(
                  title: 'Fail',
                  onPressed: () =>
                      BlocProvider.of<NetworkCubit>(context).fail()),
            ],
          ),
          SizedBox(height: 20),

          BlocBuilder<NetworkCubit, NetworkState>(
            builder: (context, state) {
              if (state is NetworkSuccess) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (_, index) => Center(child: Text(state.data[index]))),
                );
              } else if (state is NetworkError) {
                return Text(state.error);
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          )
        ],
      ),
    );
  }

  MaterialButton _buildMaterialButton(
      {@required String title, @required Function onPressed}) {
    return MaterialButton(
        minWidth: 120,
        color: Colors.green,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
  }
}
