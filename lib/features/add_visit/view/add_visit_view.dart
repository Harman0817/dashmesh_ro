import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/features/add_visit/bloc/add_visit_controller.dart';
import 'package:dashmesh_ro/features/widgets/custom_text_field.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/gradient_button.dart';

class AddVisitView extends StatefulWidget {
  final customerID;

  const AddVisitView({super.key, required this.customerID});

  @override
  State<AddVisitView> createState() => _AddVisitViewState();
}

class _AddVisitViewState extends State<AddVisitView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showColNames = true;
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
        body: GetBuilder<AddVisitController>(initState: (_) {
          Get.put(AddVisitController());
        }, builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      !showColNames
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    StringConstants.visitdate,
                                    style: GoogleFonts.montserrat(),
                                  )),
                                  Expanded(
                                      child: Text(
                                    StringConstants.enterAmount,
                                    style: GoogleFonts.montserrat(),
                                  )),
                                  Expanded(
                                      child: Center(
                                    child: Text(
                                      StringConstants.enterGaranteeDuration,
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
                                    StringConstants.enterServiceDuration,
                                    style: GoogleFonts.montserrat(),
                                  )),
                                  Expanded(
                                      child: Text(
                                    StringConstants.enterPendingAmount,
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
                            future:
                                DbOperation.getVisitListDataFromDbByCustomerId(
                                    widget.customerID),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.data == null ||
                                  snapshot.data!.isEmpty) //{
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
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index]['Date']}'
                                              .split(" ")[0],
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        // Expanded(
                                        //     child: Text(
                                        //   '${snapshot.data?[index]['Service_Type']}',
                                        //   style: GoogleFonts.montserrat(),
                                        // )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index]['Bill_Amount']}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        // Expanded(
                                        //     child: Text(
                                        //   '${snapshot.data?[index]['Pending_Amount']}',
                                        //   style: GoogleFonts.montserrat(),
                                        // )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index]['Guarantee']}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Expanded(
                                            child: Center(
                                          child: Text(
                                            '${snapshot.data?[index]['Note']}',
                                            style: GoogleFonts.montserrat(),
                                          ),
                                        )),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        // Expanded(
                                        //     child: Text(
                                        //   '${snapshot.data?[index]['Equipment_List']}',
                                        //   style: GoogleFonts.montserrat(),
                                        // )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index]['Service_Duration']}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index]['Pending_Amount']}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Customer Visit",
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                            const SizedBox(height: 35),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
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
                                    prefixIcon:
                                        const Icon(Icons.type_specimen_rounded),
                                    hintText: "Select Type",
                                  ),
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
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: controller.date,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the date';
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
                                          borderRadius:
                                              BorderRadius.vertical()),
                                      prefixIcon: Icon(Icons.aod_outlined)),
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                        context: context,
                                        firstDate:
                                            DateTime(DateTime.now().year - 70),
                                        currentDate: DateTime.now(),
                                        lastDate:
                                            DateTime(DateTime.now().year + 70));
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
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
