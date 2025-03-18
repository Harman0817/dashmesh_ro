import 'package:dashmesh_ro/features/add_customer/view/add_customer_view.dart';
import 'package:dashmesh_ro/features/customer_list/view/customer_list_view.dart';
import 'package:dashmesh_ro/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';

import '../../management/view/manangement_view.dart';

sealed class SidebarState {
  final String title;
  final Widget layout;
  final IconData icon;

  SidebarState({required this.title, required this.layout, required this.icon});
}

class DashboardSelected extends SidebarState {
  DashboardSelected()
      : super(title: 'Dashboard', layout: const DashboardView(), icon: Icons.dashboard_customize_outlined);
}

class AddCustomerSelected extends SidebarState {
  AddCustomerSelected()
      : super(title: 'Add Customer', layout: const AddCustomerView(), icon: Icons.add_reaction_outlined);
}

class CustomerListSelected extends SidebarState {
  CustomerListSelected()
      : super(title: 'Customer List', layout: const CustomerListView(), icon: Icons.checklist_rtl);
}

class ManageSelected extends SidebarState {
  ManageSelected() : super(title: 'Manage', layout: const ManageView(), icon: Icons.settings);
}






