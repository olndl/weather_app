abstract class ApiConsumer {
  Future get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  });
}
