import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            title:RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Ro Service for Yash Grover   ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'AMC   ',
                    style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '9876543241',
                    style: TextStyle(
                        color: Colors.indigo  ,
                        fontSize: 18,fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            subtitle:const Text('West Delhi'),
            trailing: const Icon(FontAwesomeIcons.whatsapp),
          );
        });
  }
}
