part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String movieMessage;
  final List<Recommendations> movieRecommendation;
  final RequestStates movieRecommendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestStates.loading,
    this.movieMessage = '',
    this.movieRecommendation = const [],
    this.movieRecommendationState = RequestStates.loading,
    this.movieRecommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? movieMessage,
    List<Recommendations>? movieRecommendation,
    RequestStates? movieRecommendationState,
    String? movieRecommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieMessage: movieMessage ?? this.movieMessage,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState,
        movieRecommendationMessage:
            movieRecommendationMessage ?? this.movieRecommendationMessage);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieMessage,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationMessage,
      ];
}
