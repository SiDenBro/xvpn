class ServerException implements Exception {
  final String message;
  
  const ServerException(this.message);
  
  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;
  
  const CacheException(this.message);
  
  @override
  String toString() => 'CacheException: $message';
}

class NotFoundException implements Exception {
  final String message;
  
  const NotFoundException(this.message);
  
  @override
  String toString() => 'NotFoundException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  
  const UnauthorizedException(this.message);
  
  @override
  String toString() => 'UnauthorizedException: $message';
}

class InvalidCredentialsException implements Exception {
  final String message;
  
  const InvalidCredentialsException(this.message);
  
  @override
  String toString() => 'InvalidCredentialsException: $message';
}

class TokenExpiredException implements Exception {
  final String message;
  
  const TokenExpiredException(this.message);
  
  @override
  String toString() => 'TokenExpiredException: $message';
}

class StorageException implements Exception {
  final String message;
  
  const StorageException(this.message);
  
  @override
  String toString() => 'StorageException: $message';
}

