import 'package:flutter/material.dart';

//------------------------------------------------------------------------------

typedef Callback = void Function();

//------------------------------------------------------------------------------

class KevinDemoButton extends StatelessWidget {
  final double height;
  final double padding;
  final String title;
  final Callback onTap;

  const KevinDemoButton({
    Key? key,
    this.height = 50.0,
    this.padding = 8.0,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: MaterialButton(
        height: height,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
        ),
        textColor: Colors.white,
        onPressed: onTap,
        child: Text(title.toUpperCase()),
      ),
    );
  }
}
