// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// //* ConsumerWidget == StatelessWidget
// //? When We Use Riverpod

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container();
//   }
// }

// //!=================

// //* StatelessWidget == ConsumerWidget
// class HomePage2 extends StatelessWidget {
//   const HomePage2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// //!===================

// //* StatefulWidget == ConsumerStatefulWidget
// class HomePage3 extends StatefulWidget {
//   const HomePage3({super.key});

//   @override
//   State<HomePage3> createState() => _HomePage3State();
// }

// class _HomePage3State extends State<HomePage3> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// //!======
// //* ConsumerStatefulWidget == StatefulWidget
// //? When We Use Riverpod
// class HomePage4 extends ConsumerStatefulWidget {
//   const HomePage4({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomePage4State();
// }

// class _HomePage4State extends ConsumerState<HomePage4> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// // دي في حاله لو هتعمل update  لجزئيه معينه في ال UI 

// // Consumer(
// //             builder: (context, ref, child) {
// //               return  ;
// //             },
// //           )