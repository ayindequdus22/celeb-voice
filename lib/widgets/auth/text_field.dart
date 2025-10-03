import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({super.key, required this.hintText, required this.labelText});
  final String hintText;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: Theme.of(context).textTheme.bodyMedium),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }
}

class AuthPasswordInput extends StatefulWidget {
  const AuthPasswordInput({
    super.key,
    required this.hintText,
    required this.labelText,
  });
  final String hintText;
  final String labelText;

  @override
  State<AuthPasswordInput> createState() => _AuthPasswordInputState();
}

class _AuthPasswordInputState extends State<AuthPasswordInput> {
  bool isobsecure = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: Theme.of(context).textTheme.bodyMedium),
        TextFormField(
          obscureText: isobsecure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: IconButton(
              icon: isobsecure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () => {
                setState(() {
                  isobsecure = !isobsecure;
                }),
              },
            ),
          ),
        ),
      ],
    );
  }
}
