import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/providers/login_form_provider.dart';
import 'package:flutter_dignal_2023/screens/app/screens.dart';
import 'package:flutter_dignal_2023/screens/listview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String route = "/app-login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('assets/logo.png'),
            onTap: () =>
                {Navigator.pushReplacementNamed(context, ListviewScreen.route)},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: const LoginForm(),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginFormProvider>(context);
    print('LoginForm');
    print('username: ${loginProvider.username}');
    print('password: ${loginProvider.password}');
    return Form(
      key: loginProvider.formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'User',
              hintText: 'Enter your user',
              prefixIcon: Icon(Icons.person),
              focusColor: Colors.red,
            ),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            onSaved: (newValue) => loginProvider.username = newValue!,
          ),
          TextFormField(
            initialValue: loginProvider.password,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.vpn_key),
            ),
            textInputAction: TextInputAction.next,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            onSaved: (newValue) => loginProvider.password = newValue!,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: loginProvider.isLoading
                  ? null
                  : () async {
                      print('login');
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (loginProvider.validate()) {
                        final response = await loginProvider.login();
                        await checkResponse(response, context);
                      }
                    },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: loginProvider.isLoading
                    ? const SizedBox(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 3,
                        ),
                        height: 16,
                        width: 16,
                      )
                    : const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> checkResponse(response, context) async {
    if (response.statusCode == 200) {
      print("Respuesta correcta");
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      final data = jsonResponse['data'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['token']);
      prefs.setInt('id', data['user']['id']);
      prefs.setString('name', data['user']['name']);
      prefs.setString('username', data['user']['username']);
      Navigator.of(context).pushReplacementNamed(DashboardScreen.route);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Hubo un error en la solicitud",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
