import 'package:demo_srapp/app_state.dart';
import 'package:demo_srapp/data/auth_repository.dart';
import 'package:demo_srapp/data/responses/repo_response.dart';
import 'package:demo_srapp/models/patron.dart';
import 'package:demo_srapp/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AppState appState = AppState();
  final AuthRepository authRepository;

  AuthViewModel(this.authRepository);

  bool _loggingIn = false;
  bool get loggingIn => _loggingIn;
  set loggingIn(value) {
    _loggingIn = value;
    notifyListeners();
  }

  bool _loggingOut = false;
  bool get loggingOut => _loggingOut;
  set loggingOut(value) {
    _loggingOut = value;
    notifyListeners();
  }

  login(String pid) async {
    RepoResponse rsp;

    loggingIn = true;
    rsp = await authRepository.login(pid);
    appState.setLoggedInAndAppTheme(
        Utils.mapPatronTierTheme((rsp.data as Patron).tier));
    loggingIn = false;
  }

  logout() async {
    loggingOut = true;
    appState.setLoggedOut();
    loggingOut = false;
  }
}
