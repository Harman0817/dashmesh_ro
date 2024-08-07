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
       gradient: LinearGradient(colors: [
         Colors.blue, Colors.purple
       ]),
       borderRadius: BorderRadius.circular(5)
     ),
     child:TextButton(onPressed: () {},
     child:Text("SUBMIT",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),),
   )
   );
  }
}
