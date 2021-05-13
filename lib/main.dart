import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/cubit.dart';
import 'package:movie_downloader_1/features/movies_screen/movie_screen.dart';
import 'package:movie_downloader_1/values/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'generated/l10n.dart';

void main() async {
  await Hive.initFlutter();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Downloader',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          moviesRepository: MoviesRepository.init(),
        )..getMovies(),
        child: MoviesScreen(),
      ),
    );
  }
}
