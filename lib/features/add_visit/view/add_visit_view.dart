import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/features/add_visit/bloc/Add_visit_controller.dart';
import 'package:dashmesh_ro/features/widgets/custom_text_field.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddVisitView extends StatefulWidget {
  const AddVisitView({super.key});

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
        body: GetBuilder<AddVisitController>(
          initState: (_) {
            Get.put(AddVisitController());
          },
          builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(35),
            child: Row(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: DbOperation.getVisitListDataFromDb(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<VisitModel>> snapshot) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ListTile(
                            
                              title: Text(
                                  '${snapshot.data?[index].visitDate} - ${snapshot.data?[index].visitRemarks}'),
                              subtitle: Text(
                                  '${snapshot.data?[index].guaranteePeriod} - ${snapshot.data?[index].visitStatus}'),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        );
                      }),
                ),
                const SizedBox(width:20),
                Expanded(
                  child: SingleChildScrollView(
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
                        const SizedBox(height: 15,),
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
                                        DateFormat.yMd().format(pickeddate);
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                             controller.addVisit();
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
