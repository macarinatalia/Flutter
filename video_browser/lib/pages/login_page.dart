import 'package:flutter/material.dart';
import 'package:video_browser/pages/user_info_page.dart';
import 'package:video_browser/pages/youtube_list_page.dart';
import '../model/user.dart';
import '../utilities/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _hidePassword = true;
  bool _rememberMe = false;

  User newUser = User();

  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Browser'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _loginForm(),
            const SizedBox(height: 15),
            _passwordForm(),
            const SizedBox(
              height: 20,
            ),
            _rememberMeCheckBox(),
            _signInBth(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return TextFormField(
      controller: _loginController,
      decoration: const InputDecoration(
        labelText: 'Login',
        hintText: 'Enter email',
        prefixIcon: Icon(Icons.person),
        enabledBorder: myTextFieldBorderStyle,
        focusedBorder: myTextFieldBorderStyle,
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => newUser.login = value!,
      validator: _validateLogin,
    );
  }

  Widget _passwordForm() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter password',
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
          icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
        ),
        enabledBorder: myTextFieldBorderStyle,
        focusedBorder: myTextFieldBorderStyle,
      ),
      onSaved: (value) => newUser.password = value!,
      validator: _validatePassword,
    );
  }

  Widget _rememberMeCheckBox() {
    return Container(
      child: Row(children: [
        Checkbox(
            value: _rememberMe,
            onChanged: (value) {
              setState(() {
                _rememberMe = value!;
              });
            }),
        const Text('Remember me', style: myLabelStyle),
      ]),
    );
  }

  Widget _signInBth() {
    return TextButton(
      onPressed: _signIn,
      child: const Text(
        'Sign in',
        style: TextStyle(color: Colors.white),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
    );
  }

  String? _validateLogin(String? value) {
    if (value == null) {
      return 'Login is required';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value == null) {
      return 'Rassword is required';
    } else {
      return null;
    }
  }

  void _signIn() {
    _formKey.currentState!.save();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          //builder: (context) => YoutubeListPage(user: newUser)),
          builder: (context) => UserInfoPage(
                user: newUser,
              )),
    );
  }
}
