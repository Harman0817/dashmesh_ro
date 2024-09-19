import 'package:dashmesh_ro/features/add_customer/bloc/add_customer_controller.dart';
import 'package:dashmesh_ro/features/widgets/custom_text_field.dart';
import 'package:dashmesh_ro/features/widgets/gradient_button.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                                    Text("Ro Type ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall),
                                    const SizedBox(height: 5),
                                    FutureBuilder(
                                        future:
                                            AddCustomerController().rotype(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<String>>
                                                snapshot) {
                                          if (snapshot.data == null)
                                            return const SizedBox();
                                          else {
                                            return DropdownButtonFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select type';
                                                }
                                                return null;
                                              },
                                              items: snapshot.data!
                                                  .map((element) =>
                                                      DropdownMenuItem(
                                                          value: element,
                                                          child: Text(element)))
                                                  .toList(),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  prefixIcon: const Icon(Icons
                                                      .type_specimen_rounded),
                                                  hintText: "Select Ro Type",
                                                  hintStyle:
                                                      GoogleFonts.montserrat()),
                                              onChanged: (value) {
                                                print(value.runtimeType);
                                                controller.selectedType =
                                                    value ?? '';
                                              },
                                            );
                                          }
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                              Expanded(
                                child: CustomTextField(
                                  label: StringConstants.enterNote,
                                  controller: controller.noteController,
                                  icon: const Icon(Icons.note),

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
                          CustomTextField(
                            label: StringConstants.enterDairy,
                            controller: controller.dairyController,
                            icon: const Icon(Icons.book),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Address';
                            //   }
                            //   return null;
                            // },
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          GradientButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
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
