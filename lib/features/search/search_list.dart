import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/features/add_visit/view/add_visit_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextFormField(
        controller: searchController,
        onChanged: (_) {
          setState(() {});
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
      content: SizedBox(
        height: 500,
        width: 1000,
        child: FutureBuilder(
            future: DbOperation.searchCustomer(searchController.text),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error fetching data'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No results found'));
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                      child: Text("${snapshot.data?[index]['Customer_id']}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white)),
                    ),
                    title: Text(
                      '${snapshot.data?[index]['Name'].toString()} - ${snapshot.data?[index]['Ro_Type']} ',
                      style: GoogleFonts.montserrat(),
                    ),
                    subtitle: Text(
                      '${snapshot.data?[index]['Address'].toString()},${snapshot.data?[index]['Locality'].toString()} - ${snapshot.data?[index]['Number'].toString()}\n${snapshot.data?[index]['Note'].toString()}',
                      style: GoogleFonts.montserrat(),
                    ),
                    trailing: SizedBox(
                      width: 105,
                      child: Row(
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
                                              customerID: snapshot.data![index]
                                                  ['Customer_id'])));
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
                                                    child: Text(numbers![idx]));
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
    );
  }
}

class SearchListDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',

      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return getData();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return getData();
  }

  FutureBuilder getData() => FutureBuilder(
      future: DbOperation.searchCustomer(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No results found'));
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
              if (snapshot.data != null &&
                  snapshot.data?[index]['Customer_id'] != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddVisitView(
                            customerID: snapshot.data![index]
                            ['Customer_id'])));
              }
              },
              leading: CircleAvatar(
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                child: Text("${snapshot.data?[index]['Customer_id']}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white)),
              ),
              title: Text(
                '${snapshot.data?[index]['Name'].toString()} - ${snapshot.data?[index]['Ro_Type']} ',
                style: GoogleFonts.montserrat(),
              ),
              subtitle: Text(
                '${snapshot.data?[index]['Address'].toString()},${snapshot.data?[index]['Locality'].toString()} - ${snapshot.data?[index]['Number'].toString()}\n${snapshot.data?[index]['Note'].toString()}',
                style: GoogleFonts.montserrat(),
              ),
              trailing: IconButton(
                  icon: const Icon(FontAwesomeIcons.whatsapp),
                  onPressed: () {
                    // launchUrl(
                    //   Uri.parse(
                    //       'https://wa.me/+91${snapshot.data?[index]['Number']}?text=Hello%20${snapshot.data?[index]['Name']}'),
                    //   mode: LaunchMode.externalApplication);
                    if (snapshot.data?[index]['Number'].length <= 10) {
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
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                        child: Text(numbers![idx]));
                                  }),
                            ),
                          );
                        },
                      );
                    }
                  }),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        );
      });
}
