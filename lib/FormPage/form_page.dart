import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_progect/FormPage/form_info_page.dart';
import 'package:flutter_first_progect/FormPage/model/user.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  List<String> _countries = ['Ukraine', 'Belarus', 'Germany', 'France'];
  String? _selectedCountry;

  User newUser = User();

  @override
  void dispose() {
    _nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Form Page',
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              validator: _validateName,
              onSaved: (value) => newUser.name = value,
              decoration: InputDecoration(
                labelText: 'Full Name*',
                hintText: 'What do people call you?',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.red, width: 2)),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true)
              ],
              validator: (value) => _validatePhone(value!)
                  ? null
                  : 'Phone number must be as (xxx)xxx-xxxx',
              onSaved: (value) => newUser.phone = value,
              decoration: InputDecoration(
                labelText: 'Phone number *',
                hintText: 'what is your number',
                helperText: 'Phone format (xxx)xxx-xxxx',
                prefixIcon: const Icon(Icons.phone),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _phoneController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.red, width: 2)),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter a email address',
                  icon: Icon(Icons.email)),
              // validator: _validateEmail,
              onSaved: (value) => newUser.email = value,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: 'Country?'),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (country) {
                setState(() {
                  newUser.country = country;
                  _selectedCountry = country;
                });
              },
              validator: (val) => val == null ? 'Please select country' : null,
              value: _selectedCountry,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _storyController,
              onSaved: (value) => newUser.story = value,
              decoration: const InputDecoration(
                labelText: 'Life story',
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short, this is just a demo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              maxLength: 8,
              validator: _validatePassword,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Enter the password',
                suffixIcon: Icon(
                  this._hidePass ? Icons.visibility_off : Icons.visibility,
                ),
                icon: const Icon(Icons.security),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmController,
              maxLength: 8,
              decoration: const InputDecoration(
                labelText: 'Confirm password *',
                hintText: 'Enter the confirm password',
                suffixIcon: Icon(Icons.visibility),
                icon: Icon(Icons.border_color),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _submitForm,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
              child: const Text(
                'Submit form',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Name is required';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters';
    } else {
      return null;
    }
  }

  bool _validatePhone(String input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return _phoneExp.hasMatch(input);
  }

  // String? _validateEmail(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Email cannot be empty';
  //   } else if (!_emailController.text.contains('@')) {
  //     return 'Invalid email';
  //   } else {
  //     return null;
  //   }
  // }

  String? _validatePassword(String? value) {
    if (_passwordController.text.length != 8) {
      return '8 characters required for password';
    } else if (_confirmController.text != _passwordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _showDialog(name: _nameController.text);
      print('name ${_nameController.text}');
      print('phone ${_phoneController.text}');
      print('email ${_emailController.text}');
      print('story ${_storyController.text}');
      print('pass ${_passwordController.text}');
    } else {
      _showMessage(message: 'Form is not valid');
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void _showDialog({required String name}) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text(
              'Registration successful',
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            content: Text(
              '$name is now a verified registration',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                FormInfoPage(userInfo: newUser))));
                  },
                  child: Text(
                    'Verified',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ))
            ],
          );
        }));
  }
}
