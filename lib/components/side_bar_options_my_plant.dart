import 'package:flutter/material.dart';

class SideBarOptionsMyPlant extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const SideBarOptionsMyPlant({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      )),
      onTap: onTap,
    );
  }
}