part of 'network_cubit.dart';

@immutable
abstract class NetworkState {}

class NetworkInitialLoading extends NetworkState {}

class NetworkSuccess extends NetworkState {
  final List<String> data;

  NetworkSuccess({this.data});
}

class NetworkError extends NetworkState {
  final String error;

  NetworkError({this.error});
}
