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
  final int customerID;

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
                                AsyncSnapshot<List<VisitModel>> snapshot) {
                              if (snapshot.data == null ||
                                  snapshot.data!.isEmpty) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    showColNames = false;
                                  });
                                });

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
                                          '${snapshot.data?[index].visitDate}'
                                              .split(" ")[0],
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index].serviceType}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index].billingAmount}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index].pendingAmount}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index].guaranteePeriod}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Center(
                                          child: Text(
                                            '${snapshot.data?[index].visitRemarks}',
                                            style: GoogleFonts.montserrat(),
                                          ),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index].visitStatus}',
                                          style: GoogleFonts.montserrat(),
                                        )),
                                        Expanded(
                                            child: Text(
                                          '${snapshot.data?[index].serviceDuration}',
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
                                maxLength: 5,
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
                                maxLength: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the amount';
                                  }
                                  return null;
                                },
                                controller: controller.pendingAmountController,
                                icon: const Icon(Icons.add_box_rounded)),
                            const SizedBox(height: 15),
                            CustomTextField(
                                label: StringConstants.enterGaranteeDuration,
                                maxLength: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the duration';
                                  }
                                  return null;
                                },
                                controller: controller.gtdurationController,
                                icon: const Icon(Icons.access_alarm_rounded)),
                            const SizedBox(height: 15),
                            CustomTextField(
                                label: StringConstants.enterServiceDuration,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the duration';
                                  }
                                  return null;
                                },
                                controller: controller.serdurationController,
                                icon: const Icon(Icons.access_time_rounded)),
                            const SizedBox(height: 15),
                            CustomTextField(
                              label: StringConstants.enterNote,
                              maxlines: 3,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the note';
                                }
                                return null;
                              },
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
