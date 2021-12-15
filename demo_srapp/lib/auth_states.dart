import 'package:demo_srapp/constants/api_codes.dart';
import 'package:demo_srapp/data/auth_repository.dart';
import 'package:demo_srapp/data/responses/repo_response.dart';
import 'package:demo_srapp/models/patron.dart';
import 'package:flutter/material.dart';

class AuthStates extends ChangeNotifier {
  final AuthRepository _authRepository;

  Patron? _patron;
  Patron? get patron => _patron;

  AuthStates(this._authRepository);

  Future<String> get authToken async {
    String token = await _authRepository.storedAuthToken;

    if (token == "") return token;

    // Validate Token
    /*
    String str = snapshot.data as String;
    List<String> jwt = str.split(".");
      - Token length != 3
      - Token Expired
    */

    return token;
  }

  Future<void> login(String pid) async {
    RepoResponse resp = await _authRepository.login(pid);
    if (resp.code == ApiCode.success) {
      _patron = resp.data as Patron;
    } else {
      _patron = null;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _authRepository.logout;
    _patron = null;
    notifyListeners();
  }
}
