import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:kevin_demo_app/domain/i_kevin_repository.dart';
import 'package:kevin_demo_app/domain/repository_failure/repository_failure.dart';
import 'package:kevin_demo_app/injectable.dart';
import 'package:kevin_demo_app/presentation/widgets/kevin_demo_button.dart';

//------------------------------------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //----------------------------------------------------------------------------
  // Actions
  //----------------------------------------------------------------------------

  void _onLinkAccount(BuildContext context) async {
    final result = await getIt<IKevinRepository>().startAccountLinking();

    result.fold(
      (RepositoryFailure error) {
        _presentAlert(
          message: error.getErrorMessage(),
          isSuccess: false,
          context: context,
        );
      },
      (result) {
        _presentAlert(
          message: "Authorization token: $result",
          isSuccess: true,
          context: context,
        );
      },
    );
  }

  void _onMakeBankPayment(BuildContext context) async {
    final result = await getIt<IKevinRepository>().startBankPayment();

    result.fold(
      (RepositoryFailure error) {
        _presentAlert(
          message: error.getErrorMessage(),
          isSuccess: false,
          context: context,
        );
      },
      (result) {
        _presentAlert(
          message: "Token: $result",
          isSuccess: true,
          context: context,
        );
      },
    );
  }

  void _onMakeCardPayment(BuildContext context) async {
    final result = await getIt<IKevinRepository>().startCardPayment();

    result.fold(
      (RepositoryFailure error) {
        _presentAlert(
          message: error.getErrorMessage(),
          isSuccess: false,
          context: context,
        );
      },
      (result) {
        _presentAlert(
          message: "Token: $result",
          isSuccess: true,
          context: context,
        );
      },
    );
  }

  Future _presentAlert({
    required String message,
    bool isSuccess = true,
    required BuildContext context,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(isSuccess ? "Success" : "Error"),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("Ok"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );
    }

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isSuccess ? "Success!" : "Error!"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("Ok"),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Build
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/kevin_logo.svg"),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const FlutterLogo(
                    size: 40.0,
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              KevinDemoButton(
                title: "Link Account",
                onTap: () => _onLinkAccount(context),
              ),
              KevinDemoButton(
                title: "Make Bank Payment",
                onTap: () => _onMakeBankPayment(context),
              ),
              KevinDemoButton(
                title: "Make Card Payment",
                onTap: () => _onMakeCardPayment(context),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
