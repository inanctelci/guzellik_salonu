import 'package:flutter/material.dart';

import '../../../constans.dart';

class ProfileSettingsItem extends StatelessWidget {
  const ProfileSettingsItem({
    Key? key,
    required this.title,
    required this.leading,
    this.trailing = const Icon(
      Icons.arrow_forward_ios_rounded,
      color: primaryColor,
    ),
    required this.press,
  }) : super(key: key);

  final String title;
  final Widget leading;
  final Widget trailing;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Sans',
        ),
      ),
      trailing: trailing,
      onTap: press,
    );
  }
}
