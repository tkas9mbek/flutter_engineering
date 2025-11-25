/// Domain exception containing minimal error data.
///
/// Pure data class with no UI dependencies.
sealed class AppException implements Exception {
  const AppException();

  /// Exception type identifier for logging
  String get name;

  /// Whether this exception can be retried
  bool get canRetry;
}

/// No internet connection
final class NoInternetException extends AppException {
  const NoInternetException();

  @override
  String get name => 'NoInternet';

  @override
  bool get canRetry => true;
}

/// Server error with status code and optional message
final class ServerException extends AppException {
  const ServerException({
    required this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;

  @override
  String get name => 'Server';

  @override
  bool get canRetry => true;
}

/// Authentication error (401)
final class UnauthorizedException extends AppException {
  const UnauthorizedException({this.message});

  final String? message;

  @override
  String get name => 'Unauthorized';

  @override
  bool get canRetry => false;
}

/// Forbidden error (403)
final class ForbiddenException extends AppException {
  const ForbiddenException({this.message});

  final String? message;

  @override
  String get name => 'Forbidden';

  @override
  bool get canRetry => false;
}

/// Internal server error (500)
final class InternalServerErrorException extends AppException {
  const InternalServerErrorException({this.message});

  final String? message;

  @override
  String get name => 'InternalServerError';

  @override
  bool get canRetry => true;
}

/// Unknown/unexpected error with details
final class UnknownException extends AppException {
  const UnknownException({
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  String get name => 'Unknown';

  @override
  bool get canRetry => true;
}

/// Development/programming error
final class DevelopmentException extends AppException {
  const DevelopmentException();

  @override
  String get name => 'Development';

  @override
  bool get canRetry => false;
}
