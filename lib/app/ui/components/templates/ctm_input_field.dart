import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final TextInputType? inputType;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomInputField({
    Key? key,
    this.onChanged,
    required this.label,
    this.inputType,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      initialValue: '',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: _obscureText,
              keyboardType: widget.inputType,
              onChanged: (text) {
                if (widget.validator != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(text);
                  state.validate();
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(text);
                }
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: widget.label,
                /* fillColor: Color.fromRGBO(100, 157, 243, 100),
                filled: true, */

                /* border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ), */
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 3, 48, 120)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 3, 48, 120)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                suffixIcon: widget.isPassword
                    ? CupertinoButton(
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _obscureText = !_obscureText;
                          setState(() {});
                        },
                      )
                    : const SizedBox(),
              ),
            ),
            if (state.hasError)
              Text(
                state.errorText!,
                style: TextStyle(color: Colors.redAccent),
              )
          ],
        );
      },
    );
  }
}
