class HttpException implements Exception {
  const HttpException(this.message);

  final String message;

  @override
  String toString() {
    return message;

    // return super.toString(); // Instance of HttpException
  }
}
