import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../database/app_database.dart';
import '../../database/entities/task.dart';
import '../../database/entities/category.dart';
import '../../model/home/home_category_model.dart';
import '../../resources/strings.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const InitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.applyAsync(this);
  }
}
