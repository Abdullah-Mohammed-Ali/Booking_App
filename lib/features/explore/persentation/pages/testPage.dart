//
// import 'package:bookingapp/features/explore/domain/entities/hotels.dart';
// import 'package:bookingapp/features/explore/persentation/bloc/hotels_bloc.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:unicons/unicons.dart';
//
// import '../widgets/messgae.dart';
//
// class HotelsPage extends StatefulWidget {
//   const HotelsPage({Key? key}) : super(key: key);
//
//   @override
//   State<HotelsPage> createState() => _HotelsPageState();
//
//
//
// }
//
//
//
//
// class _HotelsPageState extends State<HotelsPage> {
//   bool flag=true;
//
//   List<String> img=[
//     'assets/img/1.jpg',
//     'assets/img/2.jpg',
//     'assets/img/3.jpg',
//     'assets/img/4.jpg',
//     'assets/img/5.jpg',
//     'assets/img/6.jpg',
//     'assets/img/7.jpg',
//     'assets/img/8.jpg'
//
//
//
//
//
//   ];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     //BlocProvider.of<HotelsBloc>(context).GetProfileInfoEvent();
//   }
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         //
//         // appBar: AppBar(
//         //   backgroundColor: Colors.transparent,
//         //
//         //   centerTitle: true,
//         //   elevation: 0,
//         //   //title: const Text('Timeline' , style: TextStyle(fontSize: 20 , color: Colors.blueAccent),),
//         //   title: Icon(UniconsLine.atom ,size: 30 , color: Colors.teal,),
//         //
//         //
//         //
//         //
//         //   // leading: IconButton(
//         //   //     onPressed: () => null,
//         //   //     icon: Icon(
//         //   //         UniconsLine.user_circle,
//         //   //         color: Theme.of(context).iconTheme.color,
//         //   //         size: 30
//         //   //     ))
//         //   //,
//         //
//         //
//         //
//         // ),
//         body: _buildBody(),
//
//       ),
//     );
//   }
//
//   AppBar _buildAppbar() => AppBar(title: Text('Posts'));
//
//   Widget _buildBody() {
//
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: BlocBuilder<HotelsBloc, HotelsState>(
//         builder: (context, state) {
//           if (state is LoadingHotelsState ) {
//             return MaterialButton(
//
//               onPressed: (){
//
//
//                 BlocProvider.of<HotelsBloc>(context).add(GetHotelsEvent());
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
//           else if (state is GetHotelsState) {
//
//             return
//               SingleChildScrollView(
//
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.only(bottom: 10),
//
//                   scrollDirection: Axis.vertical,
//
//                   child: ListView.separated(
//
//
//
//
//
//                     physics: const BouncingScrollPhysics(),
//                     padding: const EdgeInsets.only(bottom: 10),
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//
//
//                     itemBuilder: (context, index) {
//
//
//                       List ?facilities=state.hotels.data?.data?[index].hotel?.facilities;
//                       //List ?Fac= state.Hotels.data?.data?[index].hotel?.facilities?[0].image;
//
//                       String ?image1;
//                       String ?image2;
//                       String ?name1;
//                       String ?name2;
//                       if(facilities?.length !=0){
//
//
//                         image1= state.hotels.data?.data?[index].hotel?.facilities?[0].image;
//
//                         image2= state.hotels.data?.data?[index].hotel?.facilities?[1].image;
//
//                         name1=state.hotels.data?.data?[index].hotel?.facilities?[0].name;
//                         name2=state.hotels.data?.data?[index].hotel?.facilities?[1].name;
//
//                       }
//
//                       else{
//
//                         image1 ="";
//                         image2="";
//                         name1 ="";
//                         name2="";
//
//
//
//
//                       }
//
//
//
//
//
//
//
//
//
//
//
//
//
//                       return Card(
//
//                         // style:Theme.of(context).textTheme.bodyText1!.copyWith(
//                         //color: Theme.of(context).buttonTheme.colorScheme!.background),
//                         elevation: 0,
//                         //color: Theme.of(context).scaffoldBackgroundColor,
//                         color:        Colors.grey.shade900,
//
//                         //color: Colors.black,
//                         //margin: const EdgeInsets.all(0),
//                         child: Padding(
//                           padding: const EdgeInsets.all(0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//
//                               const SizedBox(height: 12),
//
//
//                               //      Row(
//                               //   children: [
//                               //     const Text('  '),
//                               //     Flexible(
//                               //       child: Text(
//                               //        "description" ,
//                               //         textAlign: TextAlign.left,
//                               //       ),
//                               //     ),
//                               //   ],
//                               // ),
//
//                               const SizedBox(height: 12),
//
//
//
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Image.asset(
//                                   img[index] ,
//
//
//                                   //"http://api.mahmoudtaha.com/images/${state.Hotels.data?.data?[index].hotel?.hotelImages?[index].image}" ,
//
//
//
//
//
//
//                                   //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
//                                   height: 350,
//                                   width: MediaQuery.of(context).size.width,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               const SizedBox(height: 12),
//
//
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//
//                                         state.hotels.data?.data?[index].hotel?.name.toString() ?? "Grand Royal Hotel",
//
//
//
//
//                                         style: TextStyle(
//                                             fontSize: 13, fontWeight: FontWeight.bold
//
//                                         ),),
//                                     ],
//                                   ),
//                                   AnimatedSwitcher(
//                                     duration: const Duration(seconds:  0),
//
//
//                                     transitionBuilder:(Widget child,
//                                         Animation<double>animation)=>
//                                         ScaleTransition(scale: animation, child: child),
//
//                                     child:
//
//                                     flag ?
//                                     FloatingActionButton.extended(
//                                       key: Key('1'),
//                                       label: const Text('Book now' , style: TextStyle(color: Colors.blueAccent , fontWeight: FontWeight.bold , fontSize: 15),), // <-- Text
//                                       backgroundColor: Colors.white12,
//                                       icon: const Icon( // <-- Icon
//                                         Icons.notification_add,
//                                         size: 20.0,
//                                         color: Colors.blueAccent,
//
//                                       ),
//
//
//                                       onPressed: () {
//                                         setState(() {
//
//                                           print("pressssed");
//                                           flag=!flag;
//                                           print(flag);
//
//                                         });
//
//                                         setState(() {
//
//                                         });
//
//                                       },
//                                     )
//                                         :
//                                     FloatingActionButton.extended(
//                                       key: Key('2'),
//                                       label: const Text('Booked' , style: TextStyle(color: Colors.redAccent , fontWeight: FontWeight.bold , fontSize: 15),), // <-- Text
//                                       backgroundColor: Colors.white12,
//                                       icon: const Icon( // <-- Icon
//                                         Icons.done,
//                                         size: 20.0,
//                                         color: Colors.red,
//
//                                       ),
//
//                                       onPressed: () {
//                                         setState(() {
//                                           flag=!flag;
//
//                                         });
//
//                                       },
//                                     ),
//
//
//
//
//                                   ),
//
//
//                                 ],
//                               ),
//                               const SizedBox(height: 10),
//
//
//                               Row(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text("\$" , style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold , fontSize: 18),), // <-- Text
//
//                                       Text(state.hotels.data?.data?[index].hotel?.price.toString() ?? "Grand Royal Hotel",
//                                         style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold , fontSize: 15),), // <-- Text
//                                       Text('/per night' , style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold , fontSize: 12),), // <-- Text
//
//
//
//
//                                     ],
//                                   ),
//
//
//
//
//
//
//                                 ],
//                               ),
//
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("sleeps 2 people + 2 children" , style: TextStyle(color: Colors.white.withOpacity(0.5) , fontWeight: FontWeight.bold , fontSize: 12),), // <-- Text
//
//
//                                   const SizedBox(width: 10),
//
//
//
//
//
//                                 ],
//                               ),
//                               SizedBox(height: 10,),
//
//
//                               Row(
//
//                                 children: [
//
//
//
//                                   Row(
//                                     children: [
//
//
//                                       image1!=""?
//                                       CircleAvatar(
//                                         radius: 10,
//                                         backgroundColor: Colors.red,
//
//                                         child: Image.network(
//
//
//
//                                           "http://api.mahmoudtaha.com/images/${image1 ?? ""}" ,
//
//
//
//
//
//                                           //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
//                                           height: 350,
//                                           width: MediaQuery.of(context).size.width,
//                                           fit: BoxFit.fill,
//                                         ),
//
//                                         // backgroundImage: NetworkImage(
//                                         //   "http://api.mahmoudtaha.com/images/${state.Hotels.data?.data?[index].hotel?.hotelImages?[0].image}" ,
//                                         //
//                                         //   //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
//                                         //
//                                         //
//                                         //
//                                         //
//                                         // ),
//                                       ) :
//                                       Text(""),
//
//
//                                       const SizedBox(width: 10),
//
//
//
//                                       Text(name1 ?? "" , style: TextStyle(fontSize: 10),)
//
//                                     ],
//                                   ),
//
//                                   SizedBox(width: 10,),
//
//                                   Row(
//                                     children: [
//                                       image1!=""?
//                                       CircleAvatar(
//                                         radius: 10,
//                                         backgroundColor: Colors.indigo,
//
//                                         child: Image.network(
//
//
//                                           "http://api.mahmoudtaha.com/images/${image2 ?? ""}" ,
//
//
//
//
//
//                                           //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
//                                           height: 350,
//                                           width: MediaQuery.of(context).size.width,
//                                           fit: BoxFit.fill,
//                                         ),
//
//                                         // backgroundImage: NetworkImage(
//                                         //   "http://api.mahmoudtaha.com/images/${state.Hotels.data?.data?[index].hotel?.hotelImages?[0].image}" ,
//                                         //
//                                         //   //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
//                                         //
//                                         //
//                                         //
//                                         //
//                                         // ),
//                                       ) :
//                                       Container(),
//
//
//                                       const SizedBox(width: 10),
//
//
//                                       Text(name2 ?? "" , style: TextStyle(fontSize: 10),)
//
//                                     ],
//                                   ),
//
//
//
//
//
//
//
//
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) => const Divider(),
//                     itemCount:state.hotels.data?.data?.length ?? 1,
//                   )
//               );
//
//
//
//
//
//
//
//
//           }
//
//
//           else if (state is ErrorHotelsState) {
//             return MessageDisplayWidget(message: state.message);
//           }
//           return
//             MaterialButton(
//
//                 onPressed: (){
//
//                   BlocProvider.of<HotelsBloc>(context).add(GetHotelsEvent());
//
//                   //BlocProvider.of<HotelsBloc>(context).getProfileInfo;
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