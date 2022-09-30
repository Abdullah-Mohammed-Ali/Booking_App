// import 'package:bookingapp/features/booking/persentation/bloc/booking_bloc.dart';
// import 'package:bookingapp/features/profile/persentation/widgets/messgae.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);
//
//   @override
//   State<TestPage> createState() => _TestPageState();
//
//
//
// }
//
//
//
//
// class _TestPageState extends State<TestPage> {
//
//   @override
//   void initState() {
//     super.initState();
//     //BlocProvider.of<BookingBloc>(context).GetProfileInfoEvent();
//   }
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppbar(),
//       body: _buildBody(),
//
//     );
//   }
//
//   AppBar _buildAppbar() => AppBar(title: Text('Posts'));
//
//   Widget _buildBody() {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: BlocBuilder<BookingBloc, BookingState>(
//         builder: (context, state) {
//           if (state is LoadingHotelsState ) {
//             return MaterialButton(
//
//               onPressed: (){
//
//
//                 BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());
//
//
//
//               },
//               child: Column(
//                 children: [
//                   Text("loadingggggg" ,style: TextStyle(
//                       fontSize: 45
//
//                   ), ),
//
//
//
//                 ],
//               ),
//
//
//
//             );
//           }
//
//           else if (state is GetBookingState) {
//             return MaterialButton(
//
//               onPressed: (){
//                 print(state.booking);
//
//                 BlocProvider.of<BookingBloc>(context).add(UpdateBookingEvent());
//
//
//
//               },
//               child: Column(
//                 children: [
//                   Text("ProfileInfo" ,style: TextStyle(
//                       fontSize: 45
//
//                   ), ),
//
//
//
//                 ],
//               ),
//
//
//
//             );
//           }
//           else if (state is UpdateBookingState) {
//             return MaterialButton(
//
//               onPressed: (){
//                 print(state.bookingStatus);
//                 BlocProvider.of<BookingBloc>(context).add(CreateBookingEvent());
//
//
//
//               },
//               child: Text("pass_Change" ,style: TextStyle(
//                   fontSize: 45
//
//               ), ),
//
//
//
//             );
//           }
//           else if (state is CreateBookingState) {
//             return MaterialButton(
//
//               onPressed: (){
//                 print(state.bookingStatus);
//                 BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());
//
//
//
//               },
//               child: Text("updateEvent" ,style: TextStyle(
//                   fontSize: 45
//
//               ), ),
//
//
//
//             );
//           }
//
//           else if (state is ErrorBookingState) {
//             return MessageDisplayWidget(message: state.message);
//           }
//           return
//             MaterialButton(
//
//                 onPressed: (){
//
//                   BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());
//
//                   //BlocProvider.of<BookingBloc>(context).getProfileInfo;
//                   print("i presed");
//
//                 },
//                 child: Container(child: Text("nothing " ,style: TextStyle(
//                     fontSize: 45
//
//                 ), ),)
//
//
//
//
//             );
//
//         },
//       ),
//     );
//   }
// }