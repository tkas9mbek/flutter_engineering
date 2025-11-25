/// Base class for repository executors that handle common concerns.
///
/// Implementations can add cross-cutting features like error handling,
/// caching, retry logic, or logging.
abstract class RepositoryExecutor {
  const RepositoryExecutor();

  /// Executes a repository operation with executor-specific behavior.
  Future<T> execute<T>(Future<T> Function() function);
}

/// Raw executor that simply executes the function without any decoration.
class RawRepositoryExecutor extends RepositoryExecutor {
  const RawRepositoryExecutor();

  @override
  Future<T> execute<T>(Future<T> Function() function) {
    return function();
  }
}

/// Base class for decorators that wrap other executors.
abstract class RepositoryExecutorDecorator extends RepositoryExecutor {
  final RepositoryExecutor wrapped;

  const RepositoryExecutorDecorator(this.wrapped);
}

/// Decorator that handles and normalizes errors to AppException.
class ErrorHandlingExecutor extends RepositoryExecutorDecorator {
  const ErrorHandlingExecutor(super.wrapped);

  @override
  Future<T> execute<T>(Future<T> Function() function) async {
    try {
      return await wrapped.execute(function);
    } catch (e) {
      // In production, you would convert errors to AppException here
      // For now, just rethrow
      rethrow;
    }
  }
}

/// Extension methods for chaining executors.
extension RepositoryExecutorExtensions on RepositoryExecutor {
  /// Wraps this executor with error handling.
  RepositoryExecutor withErrorHandling() {
    return ErrorHandlingExecutor(this);
  }
}
