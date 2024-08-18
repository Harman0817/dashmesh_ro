import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/core/models/customer_model.dart';
import 'package:dashmesh_ro/features/add_visit/view/add_visit_view.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: 12),
              const SizedBox(width: 10),
              Text(
                'Set Change',
                style: GoogleFonts.montserrat(),
              ),
              const SizedBox(width: 100),
              CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  radius: 12),
              const SizedBox(width: 10),
              Text(
                'AMC',
                style: GoogleFonts.montserrat(),
              ),
              const SizedBox(width: 100),
              CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  radius: 12),
              const SizedBox(width: 10),
              Text(
                'Error',
                style: GoogleFonts.montserrat(),
              ),
              const SizedBox(width: 480),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SearchPage();
                      },
                    );
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: DbOperation.getCustomerListDataFromDb(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CustomerModel>> snapshot) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            snapshot.data?[index].purifierType == 'Set Change'
                                ? Theme.of(context).colorScheme.secondary
                                : snapshot.data?[index].purifierType == 'AMC'
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Colors.red,
                        child: Text("${snapshot.data?[index].name![0]}",
                            style: Theme.of(context).textTheme.displayMedium),
                      ),
                      title: Text(
                        '${snapshot.data?[index].name} - ${snapshot.data?[index].lastContactDate}',
                        style: GoogleFonts.montserrat(),
                      ),
                      subtitle: Text(
                        '${snapshot.data?[index].locality} - ${snapshot.data?[index].mobileNumber}',
                        style: GoogleFonts.montserrat(),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(FontAwesomeIcons.house),
                                onPressed: () {
                                  if (snapshot.data != null &&
                                      snapshot.data?[index].id != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddVisitView(
                                                customerID: snapshot
                                                    .data![index].id!)));
                                  }
                                }),
                            const SizedBox(
                              width: 25,
                            ),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.whatsapp),
                              onPressed: () => launchUrl(
                                  Uri.parse(
                                      'https://wa.me/${snapshot.data?[index].mobileNumber}?text=Hello%20${snapshot.data?[index].name}'),
                                  mode: LaunchMode.externalApplication),
                            ),
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
          print('Call on change');
          setState(() {

          });
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
            builder: (BuildContext context,
                AsyncSnapshot<List<CustomerModel>>
                snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text('Error fetching data'));
              } else if (!snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('No results found'));
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: snapshot
                          .data?[index]
                          .purifierType ==
                          'Set Change'
                          ? Theme.of(context)
                          .colorScheme
                          .secondary
                          : snapshot.data?[index]
                          .purifierType ==
                          'AMC'
                          ? Theme.of(context)
                          .colorScheme
                          .onPrimary
                          : Colors.red,
                      child: Text(
                          "${snapshot.data?[index].name![0]}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium),
                    ),
                    title: Text(
                      '${snapshot.data?[index].name} - ${snapshot.data?[index].lastContactDate}',
                      style: GoogleFonts.montserrat(),
                    ),
                    subtitle: Text(
                      '${snapshot.data?[index].locality} - ${snapshot.data?[index].mobileNumber}',
                      style: GoogleFonts.montserrat(),
                    ),
                    trailing: SizedBox(
                      width: 105,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(
                                  FontAwesomeIcons
                                      .house),
                              onPressed: () {
                                if (snapshot.data !=
                                    null &&
                                    snapshot
                                        .data?[
                                    index]
                                        .id !=
                                        null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddVisitView(
                                              customerID: snapshot
                                                  .data![
                                              index]
                                                  .id!)));
                                }
                              }),
                          const SizedBox(
                            width: 25,
                          ),
                          IconButton(
                            icon: const Icon(
                                FontAwesomeIcons
                                    .whatsapp),
                            onPressed: () => launchUrl(
                                Uri.parse(
                                    'https://wa.me/${snapshot.data?[index].mobileNumber}?text=Hello%20${snapshot.data?[index].name}'),
                                mode: LaunchMode
                                    .externalApplication),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                const Divider(),
              );
            }),
      ),
    );
  }
}
