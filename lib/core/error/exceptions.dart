class Exceptions implements Exception {
  final String message;
  final int? statusCode;

  Exceptions({required this.message, this.statusCode});

  @override
  String toString() => message;
}
