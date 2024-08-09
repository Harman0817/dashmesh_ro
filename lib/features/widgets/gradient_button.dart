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
   child:Container(
     height:50,
     width:150,
     decoration: BoxDecoration(
       gradient:  LinearGradient(colors: [
         Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary
       ]),
       borderRadius: BorderRadius.circular(5)
     ),
     child:TextButton(onPressed: onPressed,
     child: Text("SUBMIT",style: Theme.of(context).textTheme.displayMedium,),),
   )
   );
  }
}
