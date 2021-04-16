import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkInitialLoading());

  void loading() => emit(NetworkInitialLoading());

  void success() {
    List<String> list = [];

    for (int i = 0; i <= 10; i++) {
      list.add("item $i");
    }
    emit(NetworkSuccess(data: list));
  }

  void fail() => emit(NetworkError(error: 'This is Error'));
}
