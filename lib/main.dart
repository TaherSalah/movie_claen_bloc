import 'package:flutter/material.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie.dart';

void main() {
  runApp(const MyApp());

  Movie movie1=  const Movie(adult: false,
      backdropPath: 'backdropPath',
      genreIds: [10],
      id: 1,
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 100,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      voteAverage: 1.5);
  Movie   movie2= const Movie(adult: false,
      backdropPath: 'backdropPath',
      genreIds: [10],
      id: 1,
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 100,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      voteAverage: 1.5);
  print(movie1==movie2);
  print(movie1.hashCode);
  print(movie2.hashCode);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


