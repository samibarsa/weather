import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connection Timeout Api  Service ");

      case DioExceptionType.sendTimeout:
        return ServerFailure("send Timeout Api Service ");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive Timeout Api Service ");
      case DioExceptionType.badCertificate:
        return ServerFailure("bad Certificate Api Service ");

      case DioExceptionType.badResponse:
        return ServerFailure.frombadresponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("cancel Timeout Api Service ");
      case DioExceptionType.connectionError:
        return ServerFailure("connectionError Api Service ");
      case DioExceptionType.unknown:
        return ServerFailure("there was an error pleas try again");
    }
  }

  factory ServerFailure.frombadresponse(int statuscode, dynamic response) {
    if (statuscode == 404) {
      return ServerFailure("your request was not found , please try later");
    } else if (statuscode == 500) {
      return ServerFailure("your server was not found , please try later");
    } else if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure("there was an error please try again");
    }
  }
}
