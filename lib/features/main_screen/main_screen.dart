import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_downloader_1/components/base_app_bar.dart';
import 'package:movie_downloader_1/features/main_screen/cubit/cubit.dart';
import 'package:movie_downloader_1/features/main_screen/cubit/moviesState.dart';
import 'package:movie_downloader_1/values/app_theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;

            print(movies.length);

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(
                    movies[index].title,
                    style: context.bodyText1Style(),
                  ),
                  //leading: CircleAvatar(
                  // backgroundImage: NetworkImage(movies[index].urlImage),
                  //  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
