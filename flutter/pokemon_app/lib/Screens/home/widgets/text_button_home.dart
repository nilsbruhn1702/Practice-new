import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextButtonHome extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const TextButtonHome({this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: onPressed,
          child: PokemonText(text: text),
        ),
      ),
    );
  }
}

class PokemonText extends StatelessWidget {
  const PokemonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text ?? '',
          style: TextStyle(
            fontFamily: 'Pocket',
            fontSize: 25,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = Colors.blue,
          ),
        ),
        Text(
          text ?? '',
          style: TextStyle(
            fontFamily: 'Pocket',
            fontSize: 25,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
