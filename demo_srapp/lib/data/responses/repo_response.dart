import 'package:demo_srapp/constants/api_codes.dart';

class RepoResponse<T> {
  ApiCode code;
  late String message;
  T? data;

  RepoResponse({required this.code, this.data}) {
    message = ApiCodeMessage.decode(code);
  }
}
