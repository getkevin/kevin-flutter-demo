import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_demo_app/injectable.dart';
import 'package:kevin_demo_app/application/payment_bloc.dart';

import 'package:kevin_demo_app/presentation/home/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return BlocProvider(
      create: (context) =>
          getIt<PaymentBloc>()..add(const PaymentEvent.loadInitiated()),
      child: MaterialApp(
        title: 'Kevin Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
