import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework_4/pages/user_info_page.dart';
import '../model/user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();

  final List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];
  String? _selectedCountry;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name *',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: myFieldStyle.enabledBorderStyle,
                focusedBorder: myFieldStyle.focusedBorderStyle,
              ),
              validator: _validateName,
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _phoneFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone number *',
                hintText: 'Enter phone number',
                helperText: 'Phone format: (XXX)XXX-XXXX',
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: myFieldStyle.enabledBorderStyle,
                focusedBorder: myFieldStyle.focusedBorderStyle,
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: _validatePhone,
              onSaved: (value) => newUser.phone = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter email',
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
              //validator: _validateEmail,
              onSaved: (value) => newUser.email = value,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: myFieldStyle.enabledBorderStyle,
                icon: Icon(Icons.map),
                labelText: 'Country?',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(child: Text(country), value: country);
              }).toList(),
              onChanged: (country) {
                print(country);
                setState(() {
                  _selectedCountry = country.toString();
                  // newUser.country = country.toString();
                });
              },
              value: _selectedCountry,
              onSaved: (value) => newUser.country = _selectedCountry,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _storyController,
              decoration: const InputDecoration(
                labelText: 'Life story',
                hintText: 'Tell your life story',
                helperText: 'Keep it short',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              onSaved: (value) => newUser.story = value,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                ),
                icon: Icon(Icons.key),
              ),
              obscureText: _hidePass,
              maxLength: 8,
              // validator: _validatePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPassController,
              decoration: const InputDecoration(
                labelText: 'Confirm password',
                hintText: 'Confirm password',
                icon: Icon(Icons.border_color),
              ),
              obscureText: _hidePass,
              maxLength: 8,
              // validator: _validatePassword,
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: _submitForm,
              child: const Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(name: _nameController.text);
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('email: ${_emailController.text}');
      print('country: ${_selectedCountry}');
    } else {
      _showMessage(message: 'Form is not filled valid.');
    }
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    } else {
      return null;
    }
  }

  String? _validatePhone(String? value) {
    if (value!.isEmpty) {
      return "Phone is required";
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length != 8) {
      return '8 characters must be';
    } else if (_confirmPassController.text != _passController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }

  void _showDialog({required String name}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registration successful'),
            content: Text(
              '$name is now a verified register form',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserInfoPage(
                                userInfo: newUser,
                              )));
                },
                child: const Text(
                  'Verified',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class myFieldStyle {
  static const enabledBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static const focusedBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
}
