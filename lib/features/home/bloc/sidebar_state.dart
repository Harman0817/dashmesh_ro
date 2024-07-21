import 'package:dashmesh_ro/features/add_customer/view/add_customer_view.dart';
import 'package:dashmesh_ro/features/add_visit/view/add_visit_view.dart';
import 'package:dashmesh_ro/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';

sealed class SidebarState {
  final String title;
  final Widget layout;

  SidebarState({required this.title, required this.layout});
}

class DashboardSelected extends SidebarState {
  DashboardSelected()
      : super(title: 'Dashboard', layout: const DashboardView());
}

class AddCustomerSelected extends SidebarState {
  AddCustomerSelected()
      : super(title: 'Add Customer', layout: const AddCustomerView());
}

class AddVisitSelected extends SidebarState {
  AddVisitSelected() : super(title: 'Add Visit', layout: const AddVisitView());
}

class CustomerListSelected extends SidebarState {
  CustomerListSelected()
      : super(title: 'Customer List', layout: const CustomerListView());
}

class ManageSelected extends SidebarState {
  ManageSelected() : super(title: 'Manage', layout: const ManageView());
}



class CustomerListView extends StatelessWidget {
  const CustomerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class ManageView extends StatelessWidget {
  const ManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}
