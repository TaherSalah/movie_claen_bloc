import '../../../../domain/response/genres_response.dart';

abstract class FilterRepo {
  Future<List<GenreResponse>> getGenres();
}
