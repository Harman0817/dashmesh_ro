import 'package:dashmesh_ro/features/home/bloc/sidebar_state.dart';
import 'package:flutter/material.dart';

class SidebarItem {
  SidebarState? state;
  String? title;
  Widget? view;

  SidebarItem(this.state) {
    title = state?.title;
    view = state?.layout;
  }
}