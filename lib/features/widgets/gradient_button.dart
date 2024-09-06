import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: [
              Theme.of(context).colorScheme.onPrimary,
              Theme.of(context).colorScheme.primary
            ]),
            borderRadius: BorderRadius.circular(5)),
            child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor
            ),
          ),
        ),
          ),
      ),
    );
  }
}
