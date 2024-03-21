// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:bloc_auth_sample/auth_bloc/bloc/auth_bloc.dart';
import 'package:bloc_auth_sample/auth_bloc/bloc/auth_state.dart';
import 'package:bloc_auth_sample/pages/home_page.dart';
import 'package:bloc_auth_sample/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: "Flutter Login",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is AuthSuccess) {
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
