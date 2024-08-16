import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/features/add_visit/bloc/add_visit_controller.dart';
import 'package:dashmesh_ro/features/widgets/custom_text_field.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../widgets/gradient_button.dart';

class AddVisitView extends StatefulWidget {
  final int customerID;

  const AddVisitView({super.key, required this.customerID});

  @override
  State<AddVisitView> createState() => _AddVisitViewState();
}

class _AddVisitViewState extends State<AddVisitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Visit'),
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
                  child:
                  FutureBuilder(
                      future: DbOperation.getVisitListDataFromDbByCustomerId(widget.customerID),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<VisitModel>> snapshot) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(child: Text('${snapshot.data?[index].visitDate}')),
                                Expanded(child: Text('${snapshot.data?[index].serviceType}')),
                                Expanded(child: Text('${snapshot.data?[index].billingAmount}')),
                                Expanded(child: Text('${snapshot.data?[index].pendingAmount}')),
                                Expanded(child: Text('${snapshot.data?[index].guaranteePeriod}')),
                                Expanded(child: Text('${snapshot.data?[index].visitRemarks}')),
                                Expanded(child: Text('${snapshot.data?[index].visitStatus}')),
                                Expanded(child: Text('${snapshot.data?[index].serviceDuration}')),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        );
                      }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ADD COSTUMER VISIT",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 30),
                          ),
                          const SizedBox(height: 35),
                          CustomTextField(
                              label: StringConstants.enterAmount,
                              maxLength: 5,
                              controller: controller.amountController,
                              icon: const Icon(Icons.add_box_rounded)),
                          const SizedBox(height: 15),
                          CustomTextField(
                              label: StringConstants.enterPaidAmount,
                              maxLength: 5,
                              controller: controller.pendingAmountController,
                              icon: const Icon(Icons.add_box_rounded)),
                          const SizedBox(height: 15),
                          CustomTextField(
                              label: StringConstants.enterGaranteeDuration,
                              maxLength: 5,
                              controller: controller.gtdurationController,
                              icon: const Icon(Icons.access_alarm_rounded)),
                          const SizedBox(height: 15),
                          CustomTextField(
                              label: StringConstants.enterServiceDuration,
                              controller: controller.serdurationController,
                              icon: const Icon(Icons.access_time_rounded)),
                          const SizedBox(height: 15),
                          CustomTextField(
                            label: StringConstants.enterNote,
                            maxlines: 3,
                            controller: controller.noteController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Service Date",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller.date,
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
                                      firstDate:
                                          DateTime(DateTime.now().year - 70),
                                      currentDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 70));
                                  if (pickeddate != null) {
                                    setState(() {
                                      controller.date?.text =
                                          DateFormat("dd-MM-yyyy")
                                              .format(pickeddate);
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
                                controller.addVisit(widget.customerID);
                              },
                              text: 'Submit',
                            ),
                          ),
                        ],
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
