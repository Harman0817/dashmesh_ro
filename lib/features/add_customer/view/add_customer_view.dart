import 'package:dashmesh_ro/features/add_customer/bloc/add_customer_controller.dart';
import 'package:dashmesh_ro/features/widgets/custom_text_field.dart';
import 'package:dashmesh_ro/features/widgets/gradient_button.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<AddCustomerController>(initState: (_) {
            Get.put(AddCustomerController());
          }, builder: (controller) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.customerDetails,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: StringConstants.name,
                                  controller: controller.nameController,
                                  icon: const Icon(Icons.person),
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter name';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                              const SizedBox(width: 25),
                              Expanded(
                                child: CustomTextField(
                                  label: StringConstants.mobileNumber,
                                  controller: controller.mobileController,
                                  icon: const Icon(Icons.phone),
                                  maxLength: 10,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter mobile number';
                                    } else if (value.length > 10) {
                                      return 'Please enter a valid mobile number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: StringConstants.enterAddress,
                                  controller: controller.addressController,
                                  icon: const Icon(Icons.place),
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter Address';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                              const SizedBox(width: 25),
                              Expanded(
                                child: CustomTextField(
                                  label: StringConstants.enterlocality,
                                  controller: controller.localityController,
                                  icon: const Icon(Icons.local_activity),
                                  maxLength: 10,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter Locality';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Purifier Type ",
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
                                              value: element,
                                              child: Text(element)))
                                          .toList(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        prefixIcon: const Icon(
                                            Icons.type_specimen_rounded),
                                        hintText: "Select Type",
                                      ),
                                      onChanged: (value) {
                                        print(value.runtimeType);
                                        controller.selectedType = value ?? '';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Last Contact Date ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    readOnly: true,
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'Please enter last contact date';
                                    //   }
                                    //   return null;
                                    // },
                                    controller:
                                        controller.lastContactDateController,
                                    decoration: InputDecoration(
                                        hintText: 'DD/MM/YYYY',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        prefixIcon: const Icon(
                                            Icons.calendar_today_rounded)),
                                    onTap: () async {
                                      DateTime? pickeddate =
                                          await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(
                                                  DateTime.now().year - 70),
                                              currentDate: DateTime.now(),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 70));
                                      if (pickeddate != null) {
                                        setState(() {
                                          controller.lastContactDateController
                                                  ?.text =
                                              DateFormat("dd-MM-yyyy")
                                                  .format(pickeddate);
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          GradientButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()) {
                                controller.addCustomer();
                              }
                            },
                            text: 'Submit',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
