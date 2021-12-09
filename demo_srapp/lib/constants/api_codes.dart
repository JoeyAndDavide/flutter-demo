enum ApiCode {
  success,
  invalidResponse,
}

abstract class ApiCodeMessage {
  static String decode(ApiCode code) {
    switch (code) {
      case ApiCode.success:
        return 'SUCCESS';
      case ApiCode.invalidResponse:
        return 'INVALID RESPONSE';
    }
  }
}
