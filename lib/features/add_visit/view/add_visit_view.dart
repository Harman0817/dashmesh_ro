import 'package:flutter/material.dart';

class AddVisitView extends StatelessWidget {
  const AddVisitView({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Padding(padding: EdgeInsets.all(35),
         child:SingleChildScrollView(
         child:Column(
           children: [
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                 SingleChildScrollView(
                 child:SizedBox(
                   width: 1000,
                   child: Padding(padding: EdgeInsets.all(8),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("ADD COSTUMER VISIT",
                         style: TextStyle(fontWeight:FontWeight.w800,
                             fontSize:30),
                       ),
                       SizedBox(
                         height: 25,
                       ),
                       SizedBox(
                         width: 250,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Select costumer",
                             style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600
                             ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 25,
                       ),
                       Row(
                         children: [
                           SizedBox(
                             width: 550,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Billing Amount",
                                   style:TextStyle(fontWeight:FontWeight.w500),),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 TextField(
                                   decoration: InputDecoration(
                                       hintText: 'Enter Amount',
                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.vertical()
                                       ),
                                       prefixIcon: Icon(Icons.add_box_rounded)
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(
                             height: 10,
                           )
                         ],
                       ),
                       SizedBox(
                         width: 550,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Service Type",
                               style:TextStyle(fontWeight:FontWeight.w500),),
                             SizedBox(
                               height: 5,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   hintText: 'Enter the type of service',
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.vertical()
                                   ),
                                   prefixIcon: Icon(Icons.account_tree_outlined)
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         width: 550,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Guarantee Duration",
                               style:TextStyle(fontWeight:FontWeight.w500),),
                             SizedBox(
                               height: 5,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   hintText: 'Enter the duration of guarantee',
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.vertical()
                                   ),
                                   prefixIcon: Icon(Icons.access_alarm_outlined)
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         width: 550,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Service Duration",
                               style:TextStyle(fontWeight:FontWeight.w500),),
                             SizedBox(
                               height: 5,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   hintText: 'Enter the duration of service',
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.vertical()
                                   ),
                                   prefixIcon: Icon(Icons.access_time_outlined)
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         width: 550,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Service Date",
                               style:TextStyle(fontWeight:FontWeight.w500),),
                             SizedBox(
                               height: 5,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   hintText: 'Enter the date of service',
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.vertical()
                                   ),
                                   prefixIcon: Icon(Icons.aod_outlined)
                               ),
                             ),
                           ],
                         ),
                       ),SizedBox(
                         width: 550,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Notes",
                               style:TextStyle(fontWeight:FontWeight.w500),),
                             SizedBox(
                               height: 5,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   hintText: 'Enter',
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.vertical()
                                   ),
                                   prefixIcon: Icon(Icons.announcement_outlined)
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   ),
                 )
                 )
               ],
             ),
             ElevatedButton(
               onPressed: null,
               child: Text('Submit'),
             ),
           ],
         ),
      ),
      )
    );
  }
}