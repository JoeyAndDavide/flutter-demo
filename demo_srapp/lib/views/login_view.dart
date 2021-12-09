import 'package:demo_srapp/app_state.dart';
import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/resources/resources.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:demo_srapp/views/router/app_page_action.dart';
import 'package:demo_srapp/views/router/app_pages.dart';
import 'package:demo_srapp/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App State
    final AppState appState = AppState();
    final appTheme = context.watch<AppTheme>();
    final authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      body: authViewModel.loggingIn
          ? const Loading()
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: appTheme.appBackground,
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Resources.of(context).dimensions.paddingXL),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/scl_logo.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: appTheme.themedButtonStyle,
                        onPressed: () async {
                          await authViewModel.login('4988800');
                          appState.nextAppPageAction = AppPageAction(
                              action: AppPageActions.replaceAll,
                              pages: [AppPageCollection.profilePageCofig]);
                        },
                        child: const Text('Gold 1'),
                      ),
                    ),
                    SizedBox(
                        height: Resources.of(context).dimensions.paddingXL),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: appTheme.themedButtonStyle,
                        onPressed: () async {
                          await authViewModel.login('4988801');
                        },
                        child: const Text('Apex'),
                      ),
                    ),
                    SizedBox(
                        height: Resources.of(context).dimensions.paddingXXL),
                  ],
                ),
              ),
            ),
    );
  }
}
