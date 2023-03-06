abstract class Failure {
  Failure({this.message});

  final String? message;
}

class NetworkFailure extends Failure {
  NetworkFailure({String? message, this.errorCode}) : super(message: message);

  int? errorCode;
}

class GeneralFailure extends Failure {
  GeneralFailure({String? message}) : super(message: message);
}
