import 'package:dashmesh_ro/features/home/bloc/sidebar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<SidebarState>{
  // SidebarState menu = DashboardSelected();
  HomeCubit(super.initialState);
  List<SidebarItem> sidebarMenu = [
    SidebarItem(DashboardSelected()),
    SidebarItem(AddCustomerSelected()),
    SidebarItem(AddVisitSelected()),
    SidebarItem(CustomerListSelected()),
    SidebarItem(ManageSelected())];


  changeState(SidebarState state){
    // changeLayout(state);
    emit(state);
  }

  // changeLayout(SidebarState state){
  //   switch(state) {
  //     case DashboardSelected():
  //
  //
  //     case AddCustomerSelected():
  //
  //     case AddVisitSelected():
  //
  //     case CustomerListSelected():
  //
  //     case ManageSelected():
  //
  //   }
  // }

}