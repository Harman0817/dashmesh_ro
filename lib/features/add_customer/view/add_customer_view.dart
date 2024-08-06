import 'package:dashmesh_ro/features/add_customer/bloc/add_customer_controller.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  StringConstants.customerDetails,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(height: 25),
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        StringConstants.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter name';
                                          }
                                          return null;
                                        },
                                        controller: controller.nameController,
                                        decoration: InputDecoration(
                                            hintText: StringConstants.enterName,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            prefixIcon:
                                                const Icon(Icons.person)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(StringConstants.mobileNumber,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  maxLength: 10,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter mobile number';
                                    }
                                    return null;
                                  },
                                  controller: controller.mobileController,
                                  decoration: InputDecoration(
                                      hintText:
                                          StringConstants.enterMobileNumber,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: const Icon(Icons.phone)),
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  "Last Contact Date ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter last contact date';
                                    }
                                    return null;
                                  },
                                  controller:
                                      controller.lastContactDateController,
                                  decoration: InputDecoration(
                                      hintText: 'MM/DD/YYYY',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: const Icon(
                                          Icons.calendar_today_rounded)),
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
                                        controller.lastContactDateController
                                                ?.text =
                                            DateFormat.yMd().format(pickeddate);
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Purifier Type ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                DropDownTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select type';
                                    }
                                    return null;
                                  },
                                  dropDownList: controller.type
                                      .map((element) => DropDownValueModel(
                                          name: element.label,
                                          value: element.label))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.selectedType = value;
                                  },
                                  textFieldDecoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    prefixIcon:
                                        const Icon(Icons.type_specimen_rounded),
                                    hintText: "Select Type",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "\nADDRESS DETAIL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  StringConstants.state,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter state';
                                    }
                                    return null;
                                  },
                                  controller: controller.stateController,
                                  decoration: InputDecoration(
                                      hintText: StringConstants.enterState,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: const Icon(Icons.place)),
                                ),
                                const SizedBox(height: 15),
                                const Text(StringConstants.district,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter district';
                                    }
                                    return null;
                                  },
                                  controller: controller.districtController,
                                  decoration: InputDecoration(
                                      hintText: StringConstants.enterDistrict,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: const Icon(Icons.place)),
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  "Locality",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter locality';
                                    }
                                    return null;
                                  },
                                  controller: controller.localityController,
                                  decoration: InputDecoration(
                                      labelText: 'Locality',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: const Icon(Icons.place)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 236,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Street",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter street name';
                                              }
                                              return null;
                                            },
                                            controller:
                                                controller.streetController,
                                            decoration: InputDecoration(
                                                hintText: 'Enter Street Name',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                prefixIcon:
                                                    const Icon(Icons.place)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 236,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Pin Code",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter pin code';
                                              }
                                              return null;
                                            },
                                            controller:
                                                controller.pinController,
                                            decoration: InputDecoration(
                                                hintText: 'Enter Pin Code',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed:()=> formKey.currentState!.validate()
                        ? controller.addCustomer()
                        : null,
                    child: const Text('Submit'),
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
