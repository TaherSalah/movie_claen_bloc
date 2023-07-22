import 'package:movie_db_bloc/core/exports/exports_files.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalDataBaseException implements Exception {
  final String message;

  LocalDataBaseException(this.message);
}
