import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/form_error.dart';
import '../../../constans.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((user) {
      if (user == null) {
        print('logged out' + user.toString());
      } else {
        print('logged in' + user.toString());
        Navigator.pushNamed(context, 'HomePage');
        dispose();
      }
    });
  }

  String? _eMail;
  String? _password;

  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildEmailTextFormField(),
            SizedBox(
              height: size.height * 0.05,
            ),
            _buildPasswordTextFormField(),
            FormError(errors: errors),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButton(
                title: 'Giriş Yap',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }

                  setState(() {
                    singInFirebase();
                  });
                }),
          ],
        ));
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      onSaved: ((newValue) => _password = newValue),
      cursorColor: Colors.white,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          _removeError(error: kPassNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          _addError(error: kPassNullError);
          return '';
        }

        if (errors.contains(kPassNullError)) {
          return '';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Şifre',
        hintText: 'Şifre giriniz',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontFamily: 'Sans',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Sans',
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 55, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white,
      onSaved: (newValue) {
        _eMail = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          _removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          _removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          _addError(error: kEmailNullError);
          return '';
        }

        if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          _addError(error: kInvalidEmailError);
          return '';
        }

        if (errors.contains(kEmailNullError)) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Email giriniz',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontFamily: 'Sans',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Sans',
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 55, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _addError({required String error}) => setState(() {
        errors.add(error);
      });
  void _removeError({required String error}) => setState(() {
        errors.remove(error);
      });

  void singInFirebase() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: _eMail!, password: _password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('a' * 10);
        if (!errors.contains(kWrongEmailorPasswordError)) {
          _addError(error: kWrongEmailorPasswordError);
        }
      }
    }
    ;
  }
}
