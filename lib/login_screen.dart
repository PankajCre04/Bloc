import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mstblc/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                        AuthLoginButtonPresses(
                            email: _emailController.text,
                            password: _passwordController.text));
                  },
                  child: (state is AuthLoading)
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                );
              }, listener: (context, state) {
                if (state is AuthFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.msg)));
                }
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.msg)));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
