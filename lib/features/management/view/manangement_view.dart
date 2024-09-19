import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../../widgets/custom_text_field.dart';
import '../../management/bloc/rotype_controller.dart';
import '../../widgets/gradient_button.dart';

class ManageView extends StatefulWidget {
  const ManageView({super.key});

  @override
  State<ManageView> createState() => _ManageViewState();
}

class _ManageViewState extends State<ManageView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<AddorRemoveRoTypeController>(
        initState: (_) {
          Get.put(AddorRemoveRoTypeController());
          // print(_.controller?.type.length);
        },
        builder: (controller) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Or Remove Ro Type',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        CustomTextField(
                          label: StringConstants.addRoType,
                          controller: controller.addController,
                          icon: const Icon(Icons.add_box_rounded),
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          // return 'Please enter Ro Type to add';
                          //       }
                          //       return null;
                          //     },
                        ),
                        const SizedBox(height: 10),
                        GradientButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.addrotype();
                            }
                          },
                          text: 'Add',
                        )
                      ],
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      children: [
                        Text("Remove Ro Type",
                            style: Theme.of(context).textTheme.displaySmall),
                        const SizedBox(height: 5),
                        FutureBuilder(
                            future: AddorRemoveRoTypeController().rotype(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<String>> snapshot) {
                              if (snapshot.data == null)
                                return const SizedBox();
                              else {
                                return DropdownButtonFormField(
                                  // validator: (value) {
                                  //   if (value == null ) {
                                  //     return 'Please select type';
                                  //   }
                                  //   return null;
                                  // },
                                  items: snapshot.data!
                                      .map((element) => DropdownMenuItem(
                                          value: element, child: Text(element)))
                                      .toList(),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: const Icon(
                                          Icons.type_specimen_rounded),
                                      hintText: "Select Ro Type to remove",
                                      hintStyle: GoogleFonts.montserrat()),
                                  onChanged: (value) {
                                    print(value.runtimeType);
                                    controller.selectedType = value ?? '';
                                  },
                                );
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        GradientButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.removerotype();
                            }
                          },
                          text: 'Remove',
                        )
                      ],
                    ))
                  ],
                ),
              ],
            ),
          );
        },
        // child:
      ),
    );
  }
}
