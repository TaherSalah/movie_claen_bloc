part of 'movie_details_bloc.dart';

// ignore: must_be_immutable
class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String movieMessage;
  final List<Recommendations> movieRecommendation;
  final RequestStates movieRecommendationState;
  final String movieRecommendationMessage;
  PersonDetails? moviePerson;
  final RequestStates moviePersonState;
  final String moviePersonMessage;

  MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestStates.loading,
    this.movieMessage = '',
    this.movieRecommendation = const [],
    this.movieRecommendationState = RequestStates.loading,
    this.movieRecommendationMessage = '',
    this.moviePersonState = RequestStates.loading,
    this.moviePersonMessage = '',
    this.moviePerson,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? movieMessage,
    List<Recommendations>? movieRecommendation,
    RequestStates? movieRecommendationState,
    String? movieRecommendationMessage,
    PersonDetails? moviePerson,
    RequestStates? moviePersonState,
    String? moviePersonMessage,
  }) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieMessage: movieMessage ?? this.movieMessage,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState,
        movieRecommendationMessage:
            movieRecommendationMessage ?? this.movieRecommendationMessage,
        moviePerson: moviePerson ?? this.moviePerson,
        moviePersonMessage: moviePersonMessage ?? this.moviePersonMessage,
        moviePersonState: moviePersonState ?? this.moviePersonState);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieMessage,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationMessage,
        moviePersonState,
        moviePersonMessage,
        moviePerson
      ];
}
