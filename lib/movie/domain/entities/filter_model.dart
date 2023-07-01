import '../response/genres_response.dart';

 class FilterModel {
  int? year;
  List<GenreResponse> genreSelected = [];

  FilterModel({required this.year, required this.genreSelected});
}
