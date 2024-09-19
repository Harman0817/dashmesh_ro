import 'package:dashmesh_ro/core/models/sidebar_item.dart';
import 'package:dashmesh_ro/core/models/summary_item.dart';
import 'package:dashmesh_ro/features/home/bloc/sidebar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../count_controller/count.dart';

class HomeCubit extends Cubit<SidebarState> {
  HomeCubit(super.initialState) {
    loadSummaryList();
  }

  List<SidebarItem> sidebarMenu = [
    SidebarItem(DashboardSelected()),
    SidebarItem(AddCustomerSelected()),
    SidebarItem(CustomerListSelected()),
    SidebarItem(ManageSelected())
  ];
  List<SummaryItem> summaryList = [];
  Future<void> loadSummaryList() async {
      int totalCount = await Count.countTotal();
      int amcCount = await Count.countAmc();
      int newRoCount = await Count.countnewro();
      int serviceCount = await Count.countService();
      summaryList = [
        SummaryItem(title: 'Total',
            count: totalCount,
            icon: Icons.manage_accounts_rounded),
        SummaryItem(
            title: 'AMC', count: amcCount, icon: Icons.manage_accounts_rounded),
        SummaryItem(title: 'New RO',
            count: newRoCount,
            icon: Icons.manage_accounts_rounded),
        SummaryItem(title: 'Service & Repair',
            count: serviceCount,
            icon: Icons.manage_accounts_rounded),
      ];
  }
  void changeState(SidebarState state) {
    emit(state);
  }
}