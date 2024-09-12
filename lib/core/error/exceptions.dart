import 'package:movieapp/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}
class LocalDatabaseExceotion implements Exception {
  final String message;

  LocalDatabaseExceotion({required this.message});


}