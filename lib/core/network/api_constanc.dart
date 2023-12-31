class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=15923dabb14e5f0f8e45ad1634273db6';
  static const String getNowPlayingMoviePath =
      '$baseUrl/movie/now_playing?$apiKey';
  static const String getPopularMoviePath = '$baseUrl/movie/popular?$apiKey';
  static const String getTopRatedMoviePath = '$baseUrl/movie/top_rated?$apiKey';
  static const String getTvTrendingMoviePath =
      '$baseUrl/trending/tv/day?$apiKey';
  static const String getPersonTrendingMoviePath =
      '$baseUrl/trending/person/week?$apiKey';
  static  String getMovieDetailsPath (int movieId) =>
      '$baseUrl/movie/$movieId?$apiKey';
  static  String getPersonDetailsPath (int personId) =>
      '$baseUrl/person/$personId?$apiKey';
  static  String getMovieRecommendationsPath (int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?$apiKey';
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$imagePath$path';
}
