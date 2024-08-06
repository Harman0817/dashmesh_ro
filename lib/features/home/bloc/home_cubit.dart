import 'package:dashmesh_ro/core/models/sidebar_item.dart';
import 'package:dashmesh_ro/core/models/summary_item.dart';
import 'package:dashmesh_ro/features/home/bloc/sidebar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<SidebarState>{
  HomeCubit(super.initialState);
  List<SidebarItem> sidebarMenu = [
    SidebarItem(DashboardSelected()),
    SidebarItem(AddCustomerSelected()),
    // SidebarItem(AddVisitSelected()),
    SidebarItem(CustomerListSelected()),
    SidebarItem(ManageSelected())];

  List<SummaryItem> summaryList = [
    SummaryItem(title: 'Total Customers', count: 5, icon:  Icons.manage_accounts_rounded),
    SummaryItem(title: 'AMC Customer', count: 7, icon:  Icons.manage_accounts_rounded),
    SummaryItem(title: 'Pending Visits', count: 11, icon: Icons.manage_accounts_rounded),
    SummaryItem(title: 'Upcoming Visits', count: 4, icon:  Icons.manage_accounts_rounded),
    SummaryItem(title: 'Upcoming Visits', count: 4, icon:  Icons.manage_accounts_rounded),
  ];


  changeState(SidebarState state){
    emit(state);
  }


}