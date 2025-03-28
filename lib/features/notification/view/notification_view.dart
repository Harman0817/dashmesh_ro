import 'package:dashmesh_ro/core/models/notification_model.dart';
import 'package:dashmesh_ro/features/notification/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/database/db_operation.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onError),
      child: BlocBuilder<NotificationBloc, DateTime>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: DbOperation.getCustomerAndVisitData(
                            context.read<NotificationBloc>().state.toString()
                    ),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<NotificationModel>> snapshot) {
                      if(snapshot.data==null||snapshot.data!.isEmpty){
                        return  Align(
                          alignment: Alignment.topCenter,

                            child: Image.asset('assets/no_data.png',height: 300,));
                      }
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                           return    GestureDetector(
                             onTap: (){
                               if (snapshot.data?[index].mobileNumber?.length == 10) {
                                 launchUrl(
                                     Uri.parse('tel:${snapshot.data?[index].mobileNumber}'),
                                     mode: LaunchMode.externalApplication);
                               }
                             },
                             child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).secondaryHeaderColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding:const EdgeInsets.all(4),
                                              decoration:BoxDecoration(shape: BoxShape.circle,
                                                  color: Theme.of(context).primaryColor,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${snapshot.data?[index].customerId.toString()}",
                                                  style: GoogleFonts.montserrat().copyWith(
                                                      color: Colors.white,fontSize: 10
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                                '${snapshot.data?[index].name}',
                                                style:
                                                Theme.of(context).textTheme.headlineSmall
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${snapshot.data?[index].mobileNumber}',
                                          style: GoogleFonts.montserrat(),
                                        ),
                                      ],),
                                    Text(
                                      '${snapshot.data?[index].purifierType}',
                                      style: GoogleFonts.montserrat(),
                                    ),
                                    Text(
                                      '${snapshot.data?[index].address}, ${snapshot.data?[index].locality}',
                                      style: GoogleFonts.montserrat(),
                                    ),
                                  ],
                                ),
                              ),
                           );
                          });
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
