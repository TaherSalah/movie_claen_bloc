class ApiConstance {
  static const String baseUrl =
      'https://api.themoviedb.org/3';
  static const String apiKey =
      'api_key=15923dabb14e5f0f8e45ad1634273db6';
  static const String getNowPlayingMoviePath='$baseUrl/movie/now_playing?$apiKey';
  static const String getPopularMoviePath='$baseUrl/movie/popular?$apiKey';
  static const String getTopRatedMoviePath='$baseUrl/movie/top_rated?$apiKey';
}
