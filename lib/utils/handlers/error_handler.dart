import 'package:xvpn/core/errors/failure.dart';

class ErrorHandler {
  static String mapFailureToMessage(Object error) {
    if (error is NetworkFailure) return 'Нет интернета';
    if (error is ServerFailure) return 'Ошибка сервера';
    if (error is LocalStorageFailure) return 'Ошибка сохранения настроек';
    if (error is UnauthorizedFailure) return 'Неверный телефон или пароль';
    if (error is ValidationFailure) return 'Ошибка валидации';

    return 'Ошибка загрузки';
  }

  static Exception mapFailureToException(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure _:
        return Exception('Нет подключения к интернету');
      case ServerFailure _:
        return Exception('Ошибка сервера. Попробуйте позже');
      case UnauthorizedFailure _:
        return Exception('Ошибка авторизации');
      case ValidationFailure _:
        return Exception("Ошибка валидации");
      default:
        return Exception('Произошла неизвестная ошибка');
    }
  }
}
