import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddVisitView extends StatefulWidget {
  const AddVisitView({super.key});

  @override
  State<AddVisitView> createState() => _AddVisitViewState();
}

class _AddVisitViewState extends State<AddVisitView> {
  TextEditingController amountController = TextEditingController();
  TextEditingController servicetypeController = TextEditingController();
  TextEditingController gtdurationController = TextEditingController();
  TextEditingController serdurationController = TextEditingController();
  TextEditingController serdateController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<String> serviceType = ["AMC", "Set Change"];
  TextEditingController _date= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(35),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ADD COSTUMER VISIT",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select costumer",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 550,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Billing Amount",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  maxLength: 5,
                                  controller: amountController,
                                  onChanged: (_) {
                                    print(amountController.text);
                                    setState(() {});
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Enter Amount',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.vertical()),
                                      prefixIcon: Icon(Icons.add_box_rounded)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 550,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Service Type",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField(
                              value: "AMC",
                                decoration: const InputDecoration(
                                    hintText: 'Enter the type of service',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.vertical()),
                                    prefixIcon:
                                    Icon(Icons.account_tree_outlined)),
                                items: serviceType
                                    .map((element) =>
                                        DropdownMenuItem(value: element,child: Text(element),
                                        ))
                                    .toList(),
                                onChanged: (_) {}),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 550,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Guarantee Duration",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              maxLength: 2,
                              controller: gtdurationController,
                              onChanged: (_) {
                                print(gtdurationController.text);
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Enter the duration of guarantee',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.vertical()),
                                  prefixIcon:
                                      Icon(Icons.access_alarm_outlined)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 550,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Service Duration",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              maxLength: 3,
                              controller: serdurationController,
                              onChanged: (_) {
                                print(serdurationController.text);
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Enter the duration of service',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.vertical()),
                                  prefixIcon: Icon(Icons.access_time_outlined)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 550,
                        child: Column(
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
                              controller: _date,
                              onChanged: (_) {
                                print(serdateController.text);
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Enter the date of service',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.vertical()),
                                  prefixIcon: Icon(Icons.aod_outlined)),
                              onTap: () async {
                                DateTime? pickeddate=await showDatePicker(context: context, firstDate:DateTime(DateTime.now().year - 70), currentDate: DateTime.now(),lastDate: DateTime(DateTime.now().year+70)

                                );
                                if(pickeddate!=null){
                                  setState(() {
                                    _date.text=DateFormat.yMd().format(pickeddate);
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 550,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Notes",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ) ,
                        TextField(
                          maxLines: 3,
                              controller: noteController,
                              onChanged: (_) {
                                print(noteController.text);
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Enter',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.vertical()),
                                  prefixIcon:
                                      Icon(Icons.announcement_outlined)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                ElevatedButton(
                  onPressed: () {},
                  child:const Text('Submit'),
                ),
              ],
            ),
            SizedBox(
              height: 355,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    '${amountController.text}',
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    '${servicetypeController.text}',
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    '${gtdurationController.text}',
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    '${serdurationController.text}',
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    '${serdateController.text}',
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    '${noteController.text}',
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
