part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String movieMessage;

  MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestStates.loading,
      this.movieMessage = ''});

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? movieMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieMessage: movieMessage ?? this.movieMessage,
    );
  }
}
