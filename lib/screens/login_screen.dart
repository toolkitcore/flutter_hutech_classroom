import 'package:flutter/material.dart';
import 'package:flutter_hutech_classroom/managers/route_manager.dart';
import 'package:flutter_hutech_classroom/stores/user_store.dart';
import 'package:flutter_hutech_classroom/widgets/auth/login_form.dart';
import 'dart:developer' as developer;

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Đăng nhập"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              LoginForm(
                onLogin: (userName, password) async {
                  developer.log('Username: $userName, Password: $password');
                  var isSucceed = await userStore.login(userName, password);
                  if (isSucceed && context.mounted) {
                    Navigator.pushReplacementNamed(context, RouteManager.home);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
