import 'package:flutter/material.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white),
      child: child,
    );
  }
}
