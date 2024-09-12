import 'package:dashmesh_ro/features/add_customer/view/add_customer_view.dart';
import 'package:dashmesh_ro/features/customer_list/view/customer_list_view.dart';
import 'package:dashmesh_ro/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';

import '../../management/view/manangement_view.dart';

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

class CustomerListSelected extends SidebarState {
  CustomerListSelected()
      : super(title: 'Customer List', layout: const CustomerListView());
}

class ManageSelected extends SidebarState {
  ManageSelected() : super(title: 'Manage', layout: const ManageView());
}






