import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guzellik_salonu/components/build_title.dart';
import 'package:guzellik_salonu/components/custom_button.dart';
import 'package:guzellik_salonu/components/form_error.dart';

import '../../../constans.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FirebaseAuth auth;
  String? _oldPassword;
  String? _newPassword;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1, horizontal: size.width * 0.1),
          child: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BuildTitle(
                            title: 'ŞİFRE DEĞİŞTİR',
                            textColor: Colors.white,
                          ),
                          _buildPasswordTextFormField(),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          _buildNewPasswordTextFormField(),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          _buildNewPasswordTextFormField(),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          FormError(errors: errors),
                          CustomButton(
                            title: 'Kaydet',
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      onSaved: ((newValue) => _oldPassword = newValue),
      cursorColor: Colors.white,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          _removeError(error: kPassNullError);
        }
        _oldPassword = value;
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
        labelText: 'Mevcut Şifre',
        hintText: 'Mevcut şifrenizi giriniz',
        hintStyle: TextStyle(
          color: Colors.white,
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

  TextFormField _buildNewPasswordTextFormField() {
    return TextFormField(
      onSaved: ((newValue) => _newPassword = newValue),
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
        labelText: 'Yeni şifre',
        hintText: 'Yeni şifrenizi giriniz',
        hintStyle: TextStyle(
          color: Colors.white,
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

  void changePassword() async {
    if (auth.currentUser == null) {
      return null;
    }

    await auth.currentUser!.updatePassword(_newPassword!);
  }
}
