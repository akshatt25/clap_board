import 'package:clap_board/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;

  final String hintText;
  final int maxLines;
  final bool hidden;
  final bool isReadOnly;
  final void Function()? onTap;
  List<TextInputFormatter> inputFormatters;
  TextInputType type;
  final Function(String)? onChanged;

  CustomTextField({
    required this.controller,
    super.key,
    required this.hintText,
    this.onTap,
    this.hidden = false,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.type = TextInputType.text,
    this.inputFormatters = const [],
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField> {
  bool? _passwordHidden;
  @override
  void initState() {
    _passwordHidden = widget.hidden;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextFormField(
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        readOnly: widget.isReadOnly,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.type,
        textAlignVertical: TextAlignVertical.center,
        obscureText: _passwordHidden!,
        controller: widget.controller,
        maxLines: widget.maxLines,
        decoration: widget.hintText == 'Password' ||
                widget.hintText == 'Retype Password'
            ? InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    fontFamily: 'SF',
                    color: Colors.grey.shade600,
                    fontSize: 17.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.black26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide:
                      const BorderSide(width: 1.5, color: AppColors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordHidden! ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordHidden = !_passwordHidden!;
                    });
                  },
                ),
              )
            : InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    fontFamily: 'SF',
                    color: Colors.grey.shade600,
                    fontSize: 17.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.black26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide:
                      const BorderSide(width: 1.5, color: AppColors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.black26),
                ),
              ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your ${widget.hintText}';
          }
          if (widget.hintText == 'Password' && val.length < 6) {
            return 'Enter a password minimum of 6 character';
          }
          if (widget.hintText == 'Email' && isEmailValid(val) == false) {
            return 'Enter a valid Email';
          }
          if (widget.hintText == 'Business Email' &&
              isEmailValid(val) == false) {
            return 'Enter a valid Email';
          }
          if (widget.hintText == 'Business Phone' &&
              isPhoneValid(val) == false) {
            return 'Enter a valid Phone';
          }
          if (widget.hintText == 'Phone Number' && isPhoneValid(val) == false) {
            return 'Enter a valid Phone';
          }
          // if (widget.hintText == 'Phone Number') {
          //   return 'Enter a valid Number';
          // }

          return null;
        },
      ),
    );
  }

  bool isEmailValid(String email) {
    String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$'; // Regular expression for email validation
    RegExp regExp = RegExp(emailRegex);

    return regExp.hasMatch(email);
  }

  bool isPhoneValid(String phone) {
    phone = phone.replaceAll(RegExp(r'\D'), '');

    return phone.length == 10;
  }
}
