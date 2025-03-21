import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/features/add_visit/bloc/add_visit_controller.dart';
import 'package:dashmesh_ro/features/widgets/custom_text_field.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../widgets/gradient_button.dart';

class AddVisitView extends StatefulWidget {
  final customerID;

  const AddVisitView({super.key, required this.customerID});

  @override
  State<AddVisitView> createState() => _AddVisitViewState();
}

class _AddVisitViewState extends State<AddVisitView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showColNames = false;

  @override
  void initState() {
    Get.put(AddVisitController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.onPrimary,
              Theme.of(context).colorScheme.primary
            ])),
          ),
          title: Text(
            'Add Visit',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
        floatingActionButton: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return const SizedBox.shrink();
          }
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Get.bottomSheet(
                GetBuilder<AddVisitController>(builder: (controller) {
                  return Container(
                      color: Colors.white,
                      child: _buildAddVisitForm(context, controller));
                }),enableDrag: true,
              );
            },
          );
        }),
        body: GetBuilder<AddVisitController>(
            //     initState: (_) {
            //   Get.put(AddVisitController());
            // },
            builder: (controller) {
          return LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return _buildVisitList();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: _buildVisitList()),
                  const SizedBox(width: 20),
                  Expanded(child: _buildAddVisitForm(context, controller)),
                ],
              ),
            );
          });
        }));
  }

  Column _buildVisitList() {
    return Column(
      children: [
        !showColNames
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringConstants.dairy,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.visitdate,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.equipmentList,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.bill,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.paid,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.service_type,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                        StringConstants.garanteeDuration,
                        style: GoogleFonts.montserrat(),
                      ),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                        StringConstants.enterNote,
                        style: GoogleFonts.montserrat(),
                      ),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.serviceDuration,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.enterPendingAmount,
                      style: GoogleFonts.montserrat(),
                    )),
                    Expanded(
                        child: Text(
                      StringConstants.flt,
                      style: GoogleFonts.montserrat(),
                    ))
                  ],
                ),
              ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: FutureBuilder(
              future: DbOperation.getVisitListDataFromDbByCustomerId(
                  widget.customerID),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.data == null || snapshot.data!.isEmpty) //{
                // WidgetsBinding.instance
                //     .addPostFrameCallback((_) {
                //   setState(() {
                //     showColNames = false;
                //   });
                // });
                {
                  return Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/no_data.png',
                        height: 400,
                      ));
                }
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(6),
                      child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [


                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Text(
                                         '${snapshot.data?[index]['Service_Type']}'.toUpperCase(),
                                         style:
                                         context.textTheme.headlineSmall
                                       ),
                                       Text(
                                         '(${snapshot.data?[index]['Equipment_List']})',
                                         style: GoogleFonts.montserrat().copyWith(
                                           fontStyle: FontStyle.italic
                                         ),

                                       ),
                                     ],
                                   ),
                                   Text(
                                     DateFormat('dd-MM-yy').format(DateTime.parse('${snapshot.data?[index]['Date']}')),
                                     style: GoogleFonts.montserrat(),
                                   ),
                                 ],
                               ),

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 RichText(text: TextSpan(
                                   text: 'Bill: ₹',
                                 style: GoogleFonts.montserrat(fontSize: 12),
                                   children: [
                                     TextSpan(
                                       text: '${snapshot.data?[index]['Bill_Amount']}',
                                       style: context.textTheme.labelLarge
                                     )
                                   ]
                                 )),
                                 RichText(text: TextSpan(
                                     text: 'Paid: ₹',
                                     style: GoogleFonts.montserrat(fontSize: 12),
                                     children: [
                                       TextSpan(
                                           text: '${snapshot.data?[index]['Paid_Amount']}',
                                           style: context.textTheme.labelLarge
                                       )
                                     ]
                                 )),
                                 RichText(text: TextSpan(
                                     text: 'Pending: ₹',
                                     style: GoogleFonts.montserrat(fontSize: 12),
                                     children: [
                                       TextSpan(
                                           text: '${snapshot.data?[index]['Pending_Amount']}',
                                           style: context.textTheme.labelLarge
                                       )
                                     ]
                                 )),

                               ],
                             )
                           ],),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                             Flexible(
                               child: Text(
                                 '${snapshot.data?[index]['Note']}',
                                 style: GoogleFonts.montserrat(),
                               ),
                             ),
                           ],),
                           Row(children: [
                             Expanded(
                                 child: Text(
                                   'Duration ${snapshot.data?[index]['Service_Duration']}',
                                   style: GoogleFonts.montserrat(),
                                 )),
                             Expanded(
                               child: Text(
                                 'Fault ${snapshot.data?[index]['Fault']}',
                                 style: GoogleFonts.montserrat(),
                               ),
                             ),
                             Expanded(
                                 child: Text(
                                   'Ser. Dur ${snapshot.data?[index]['Service_Duration']}',
                                   style: GoogleFonts.montserrat(),
                                 )),
                             Container(
                               height:24,
                               width:24,
                               decoration:BoxDecoration(shape: BoxShape.circle,
                                   color: context.theme.primaryColor),
                               child: Center(
                                 child: Text(
                                   '${snapshot.data?[index]['Diary_Number']}',
                                   style: GoogleFonts.montserrat().copyWith(
                                     color: Colors.white
                                   ),
                                 ),
                               ),
                             ),


                           ],),
                         ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildAddVisitForm(
      BuildContext context, AddVisitController controller) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Customer Visit",
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 35),
              CustomTextField(
                  label: StringConstants.enterDairy,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the amount';
                  //   }
                  //   return null;
                  // },
                  controller: controller.dairyController,
                  icon: const Icon(Icons.book)),
              const SizedBox(height: 15),
              CustomTextField(
                  label: StringConstants.enterAmount,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the amount';
                    }
                    return null;
                  },
                  controller: controller.amountController,
                  icon: const Icon(Icons.add_box_rounded)),
              const SizedBox(height: 15),
              CustomTextField(
                  label: StringConstants.enterPaidAmount,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the amount';
                    }
                    return null;
                  },
                  controller: controller.paidAmountController,
                  icon: const Icon(Icons.add_box_rounded)),
              const SizedBox(height: 15),
              CustomTextField(
                  label: StringConstants.enterGaranteeDuration,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the duration';
                  //   }
                  //   return null;
                  // },
                  controller: controller.gtdurationController,
                  icon: const Icon(Icons.access_alarm_rounded)),
              const SizedBox(height: 15),
              CustomTextField(
                  label: StringConstants.enterServiceDuration,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the duration';
                  //   }
                  //   return null;
                  // },
                  controller: controller.serdurationController,
                  icon: const Icon(Icons.timelapse_outlined)),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Service Type ",
                      style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 5),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select type';
                      }
                      return null;
                    },
                    items: controller.type
                        .map((element) => DropdownMenuItem(
                            value: element, child: Text(element)))
                        .toList(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        prefixIcon: const Icon(Icons.type_specimen_rounded),
                        hintText: "Select Type",
                        hintStyle: GoogleFonts.montserrat()),
                    onChanged: (value) {
                      print(value.runtimeType);
                      controller.selectedType = value ?? '';
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomTextField(
                  label: StringConstants.enterFaultDuration,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the duration';
                  //   }
                  //   return null;
                  // },
                  controller: controller.faultController,
                  icon: const Icon(Icons.build)),
              const SizedBox(height: 15),
              CustomTextField(
                  label: StringConstants.enterEquipmentList,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the duration';
                  //   }
                  //   return null;
                  // },
                  controller: controller.equipmentlistController,
                  icon: const Icon(Icons.list_alt)),
              const SizedBox(height: 15),
              CustomTextField(
                label: StringConstants.enterNote,
                maxlines: 3,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter the note';
                //   }
                //   return null;
                // },
                controller: controller.noteController,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service Date",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: controller.date,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return  'Please enter the date';
                      }
                      return null;
                    },
                    onChanged: (_) {
                      print(controller.serdateController?.text);
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter the date of service',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.vertical()),
                        prefixIcon: Icon(Icons.aod_outlined)),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 70),
                          currentDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 70));
                      if (pickeddate != null) {
                        setState(() {
                          controller.date?.text = "$pickeddate";
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: GradientButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.addVisit(widget.customerID);
                    }
                  },
                  text: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
