import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? label; // optional label
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
  final inputWidth = screenWidth > 600
      ? screenWidth * 0.7
      : screenWidth; 

    return SizedBox(
      width: inputWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) 
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                widget.label!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),
          TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscure : false,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
