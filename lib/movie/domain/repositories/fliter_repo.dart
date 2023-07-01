import 'dart:developer';

import 'package:movie_db_bloc/movie/data/data_sources/remote/repositories/filter_repo.dart';
import 'package:movie_db_bloc/movie/domain/response/genres_response.dart';
import 'package:movie_db_bloc/movie/shard/constant/app_value.dart';
import 'package:movie_db_bloc/movie/shard/core/network/dio_manager.dart';

class FilterRepoImplemetion extends FilterRepo {
  final DioManager dioManager;

  FilterRepoImplemetion(this.dioManager);

  @override
  Future<List<GenreResponse>> getGenres() async {
    List<GenreResponse> res = <GenreResponse>[];
  try {
    await  dioManager.dio?.get('genre/movie/list', queryParameters: {
        'api_key': AppValues.apiKey,
        'language': 'en-Us'
      }).then((response) {
        res = (response.data['genres'] as List)
            .map((e) => GenreResponse.fromJson(e))
            .toList();
      });
  } on Exception catch (e) {
    // TODO
    log(e.toString());
    return res;
  }
    // TODO: implement getGenres

    return res;
  }
}
