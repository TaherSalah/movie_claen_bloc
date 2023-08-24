
import 'package:movie_db/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalDataBaseException implements Exception {
  final String message;

  LocalDataBaseException(this.message);
}
