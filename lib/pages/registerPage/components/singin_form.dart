import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/form_error.dart';
import '../../../constans.dart';

class SingForm extends StatefulWidget {
  SingForm({Key? key}) : super(key: key);
  bool isThereAnyProblem = false;
  @override
  State<SingForm> createState() => _SingFormState();
}

class _SingFormState extends State<SingForm> {
  late FirebaseAuth auth;
  final _formKey = GlobalKey<FormState>();
  bool obscurePass = true;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  String? name;
  String? surName;
  String? email;
  String? password;
  String? conformPassword;

  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(
            height: size.height * 0.02,
          ),
          buildSurNameFormField(),
          SizedBox(
            height: size.height * 0.02,
          ),
          buildEmailFormField(),
          SizedBox(
            height: size.height * 0.02,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: size.height * 0.02,
          ),
          buildConformPasswordFormField(),
          SizedBox(
            height: size.height * 0.05,
          ),
          FormError(errors: errors),
          SizedBox(
            height: size.height * 0.05,
          ),
          CustomButton(
            title: 'Kayıt Ol',
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              createUser();
              if (errors.isEmpty) {
                //Navigator.popAndPushNamed(context, 'HomePage');
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: obscurePass,
      cursorColor: Colors.white,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _removeError(error: kPassNullError);
          if (password == conformPassword) {
            _removeError(error: kMatchPassError);
          }
          if (value.length >= 8 && errors.contains(kShortPassError)) {
            _removeError(error: kShortPassError);
          }
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          _addError(error: kPassNullError);
          return "";
        } else if ((password != value) && !errors.contains(kMatchPassError)) {
          _addError(error: kMatchPassError);
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          _addError(error: kShortPassError);
          return '';
        }

        if (errors.contains(kPassNullError)) {
          return '';
        } else if (errors.contains(kMatchPassError)) {
          return '';
        } else if (errors.contains(kShortPassError)) {
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
        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
        prefixIcon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                obscurePass = !obscurePass;
              });
            },
            icon: Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white,
            ),
          ),
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          _removeError(error: kInvalidEmailError);
        }
        _removeError(error: kEmailAlreadyUse);
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          _addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kEmailNullError)) {
          _addError(error: kInvalidEmailError);
          return "";
        }

        if (errors.contains(kEmailNullError)) {
          return '';
        }
        email = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Emailinizi giriniz',
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
            Icons.mail_outline_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField buildConformPasswordFormField() {
    return TextFormField(
      obscureText: obscurePass,
      cursorColor: Colors.white,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _removeError(error: kPassNullError);
          if (password == conformPassword) {
            _removeError(error: kMatchPassError);
          }
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          _addError(error: kPassNullError);
          return "";
        } else if ((password != value) && !errors.contains(kMatchPassError)) {
          _addError(error: kMatchPassError);
          return "";
        }

        if (errors.contains(kPassNullError)) {
          return '';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Şifreyi Doğrula',
        hintText: 'Şifreyi doğrulayınız',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontFamily: 'Sans',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Sans',
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
        prefixIcon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                obscurePass = !obscurePass;
              });
            },
            icon: Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white,
            ),
          ),
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

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.characters,
      onSaved: ((newValue) {
        name = newValue!.toUpperCase();
      }),
      cursorColor: Colors.white,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          _addError(error: kNameNullError);
          return '';
        }

        if (errors.contains(kNameNullError)) {
          return '';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'İsim',
        hintText: 'İsminizi giriniz',
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
            Icons.person_outline_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField buildSurNameFormField() {
    return TextFormField(
      onSaved: (newValue) => surName = newValue!.toUpperCase(),
      cursorColor: Colors.white,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _removeError(error: kSurNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kSurNameNullError)) {
          _addError(error: kSurNameNullError);
          return '';
        }

        if (errors.contains(kSurNameNullError)) {
          return '';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Soyisim',
        hintText: 'Soyisiminizi giriniz',
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
            Icons.person_outline_outlined,
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

  void createUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      auth.currentUser!.updateDisplayName(name! + '' + surName!);
      print(auth.currentUser!.displayName.toString());
      Navigator.pushNamed(context, 'HomePage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' &&
          !errors.contains(kEmailAlreadyUse)) {
        _addError(error: kEmailAlreadyUse);
        debugPrint('calisti' * 10);
      }
    }
  }
}
