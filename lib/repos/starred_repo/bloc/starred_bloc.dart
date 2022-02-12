import 'package:bloc/bloc.dart';

import 'starred_event.dart';
import 'starred_state.dart';

export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

export 'starred_event.dart';
export 'starred_state.dart';

class StarredBloc extends Bloc<StarredEvent, StarredState> {
  StarredBloc() : super(const StarredState.initial()) {
    on<StarredEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
