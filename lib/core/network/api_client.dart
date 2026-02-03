abstract class ApiClient {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? requireAuth,
  });

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool? requireAuth,
  });

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool? requireAuth,
  });

  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool? requireAuth,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? requireAuth,
  });
}
