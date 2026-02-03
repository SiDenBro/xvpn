/*
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInUseCaseProvider = Provider<SignIn>(
  (ref) => SignIn(ref.read(authRepositoryProvider)),
);

final signUpUseCaseProvider = Provider<SignUp>(
  (ref) => SignUp(ref.read(authRepositoryProvider)),
);

final logoutUseCaseProvider = Provider<Logout>(
  (ref) => Logout(ref.read(authRepositoryProvider)),
);

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;
  final String? token;

  AuthState({
    required this.isAuthenticated,
    this.isLoading = false,
    this.error,
    this.token,
  });

  AuthState.unlogged()
      : isAuthenticated = false,
        isLoading = false,
        error = null,
        token = null;

  AuthState.logged({required String token})
      : isAuthenticated = true,
        isLoading = false,
        error = null,
        token = token;

  AuthState.loading()
      : isAuthenticated = false,
        isLoading = true,
        error = null,
        token = null;

  AuthState.error(String error)
      : isAuthenticated = false,
        isLoading = false,
        error = error,
        token = null;

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
    String? token,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      token: token ?? this.token,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  SignIn get _signIn => ref.read(signInUseCaseProvider);
  SignUp get _signUp => ref.read(signUpUseCaseProvider);
  Logout get _logout => ref.read(logoutUseCaseProvider);

  @override
  AuthState build() {
    _checkAuthStatus();
    return AuthState.loading();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = await ref.read(authLocalDataSourceProvider).getTokens();

    state = (token != null)
        ? AuthState.logged(token: token.accessToken)
        : AuthState.unlogged();
  }

  Future<void> signIn({
    required String phone,
    required String password,
  }) async {
    state = AuthState.loading();
    await Future.delayed(const Duration(seconds: 2));
    final result = await _signIn.call(
      phone,
      password,
    );

    result.fold(
      (failure) =>
          state = AuthState.error(ErrorHandler.mapFailureToMessage(failure)),
      (authEntity) => state = AuthState.logged(token: authEntity.accessToken),
    );
  }

  Future<void> signUp({
    required String phone,
    required String email,
    required String password,
    required String repeatPassword,
  }) async {
    state = AuthState.loading();

    final result = await _signUp.call(
      phone,
      email,
      password,
    );

    result.fold(
      (failure) =>
          state = AuthState.error(ErrorHandler.mapFailureToMessage(failure)),
      (authEntity) => state = AuthState.logged(token: authEntity.accessToken),
    );
  }

  Future<void> logout() async {
    state = AuthState.loading();
    final result = await _logout.call();
    result.fold(
      (failure) {},
      (authEntity) => state = AuthState.unlogged(),
    );
  }

  void clearError() => state = state.copyWith(error: null);
}
*/