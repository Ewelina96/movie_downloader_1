import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/features/main_screen/cubit/cubit.dart';
import 'package:movie_downloader_1/features/main_screen/main_screen.dart';
import 'package:movie_downloader_1/values/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: context.primaryColor() as MaterialColor?,
      ),
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          moviesRepository: MoviesRepository.init(),
        ),
        child: MainScreen(),
      ),
    );
  }
}
