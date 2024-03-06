import 'package:flutter/material.dart';

class TextHeaderAtom extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const TextHeaderAtom({
    Key? key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.headline6,
      textAlign: textAlign,
    );
  }
}
