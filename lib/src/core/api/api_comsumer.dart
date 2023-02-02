abstract class ApiConsumer {
  Future get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  });
  Future patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
  });
  Future put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
  });
}
