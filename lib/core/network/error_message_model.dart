import 'package:movie_db_bloc/core/exports/exports_files.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        success: json["success"]);
  }

  @override
  // TODO: implement props =====> for return Equatable
  List<Object?> get props => [statusCode, statusMessage, success];
}
