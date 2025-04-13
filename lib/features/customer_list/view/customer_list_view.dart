import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/features/add_visit/view/add_visit_view.dart';
import 'package:dashmesh_ro/features/search/search_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchListDelegate());
                    // showDialog(
                    //   context: context,
                    //
                    //   builder: (context) {
                    //     return const SearchPage();
                    //   },
                    // );
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: DbOperation.getCustomerListDataFromDb(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        child: Text(
                            "${snapshot.data?[index]['Customer_id'].toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Theme.of(context).colorScheme.primary)),
                      ),
                      title: Text(
                        '${snapshot.data?[index]['Name'].toString()} - ${snapshot.data?[index]['Ro_Type']} - ${snapshot.data?[index]['Diary_Number']}',
                        style: GoogleFonts.montserrat(),
                      ),
                      subtitle: Text(
                        '${snapshot.data?[index]['Address'].toString()},${snapshot.data?[index]['Locality'].toString()} - ${snapshot.data?[index]['Number'].toString()}\n${snapshot.data?[index]['Note'].toString()}',
                        style: GoogleFonts.montserrat(),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: const Icon(FontAwesomeIcons.house),
                                onPressed: () {
                                  if (snapshot.data != null &&
                                      snapshot.data?[index]['Customer_id'] !=
                                          null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddVisitView(
                                                customerID:
                                                    snapshot.data![index]['Customer_id'])));
                                  }
                                }),
                            const SizedBox(
                              width: 25,
                            ),
                            IconButton(
                                icon: const Icon(FontAwesomeIcons.whatsapp),
                                onPressed: () {
                                  // launchUrl(
                                  //   Uri.parse(
                                  //       'https://wa.me/+91${snapshot.data?[index]['Number']}?text=Hello%20${snapshot.data?[index]['Name']}'),
                                  //   mode: LaunchMode.externalApplication);
                                  if (snapshot.data?[index]['Number'].length <=
                                      10) {
                                    launchUrl(
                                        Uri.parse(
                                            'https://wa.me/+91${snapshot.data?[index]['Number']}?text=Hello%20${snapshot.data?[index]['Name']}'),
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    List<String>? numbers = snapshot.data?[index]
                                    ['Number']
                                        .toString()
                                        .split('/');
                                    print(numbers?[0]);
                                    print(numbers?[1]);


                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(Icons.close))
                                            ],
                                          ),
                                          content: SizedBox(
                                            height: 100,
                                            width: 200,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                const NeverScrollableScrollPhysics(),
                                                itemCount: numbers?.length,
                                                itemBuilder: (context, idx) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        launchUrl(
                                                            Uri.parse(
                                                                'https://wa.me/+91${numbers[idx].trim()}?text=Hello%20${snapshot.data?[index]['Name']}'),
                                                            mode: LaunchMode
                                                                .externalApplication);
                                                      },
                                                      child:
                                                      Text(numbers![idx]));
                                                }),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }),
                          ],
                        ),
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
}