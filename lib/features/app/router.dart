// import 'package:dashmesh_ro/core/di/service_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
//
//
// class AppRouter {
//   GoRouter generateRoute() {
//     return
//       GoRouter(routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) {
//           return BlocProvider.value(
//             value: serviceLocator<MainNewsBloc>()
//               ..add(MainNewsGetRecentNewsEvent()),
//             child: const MainNewsScreen(),
//           );
//         },
//       )
//     ]);
//   }
// }