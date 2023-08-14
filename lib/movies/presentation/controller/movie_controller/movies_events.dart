import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvents {
  const GetNowPlayingMoviesEvent();
}

class GetPopularMoviesEvent extends MoviesEvents {
  const GetPopularMoviesEvent();
}

class GetTopRatedMoviesEvent extends MoviesEvents {
  const GetTopRatedMoviesEvent();
}
class GetTvTrendingMoviesEvent extends MoviesEvents {
  const GetTvTrendingMoviesEvent();
}
class GetPersonTrendingMoviesEvent extends MoviesEvents {
  const GetPersonTrendingMoviesEvent();
}