import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final bool isPassword;
  final Icon? icon;
  final String? Function(String?)? validator;
  final IconData? icon2;

  FormRegister(
      {Key? key,
      this.onChanged,
      required this.label,
      this.isPassword = false,
      this.icon,
      this.validator,
      this.icon2})
      : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: widget.validator,
        initialValue: '',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: _obscureText,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: widget.label,
                  icon: widget.icon,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Colors.deepPurple,
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      : IconButton(onPressed: () {}, icon: Icon(widget.icon2)),
                ),
                onChanged: (text) {
                  if (widget.validator != null) {
                    state.setValue(text);
                    state.validate();
                  }
                  if (widget.onChanged != null) {
                    widget.onChanged!(text);
                  }
                },
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.redAccent),
                )
            ],
          );
        });
  }
}
