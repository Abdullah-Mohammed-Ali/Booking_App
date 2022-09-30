import 'package:booking_app/features/booking/domain/entities/booking.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:booking_app/features/booking/persentation/bloc/booking_bloc.dart';
import 'package:booking_app/features/booking/persentation/widgets/loading.dart';
import 'package:booking_app/features/booking/persentation/widgets/loading2.dart';
import 'package:booking_app/features/profile/persentation/widgets/messgae.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/button2.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/button_widget.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();



}




class _BookingPageState extends State<BookingPage> with SingleTickerProviderStateMixin  {
  bool flag=true;
  String ?imageChanged;
  List<String> hotelImagesList=[] ;


  List<String> img=[
    'assets/img/1.jpg',
    'assets/img/2.jpg',
    'assets/img/3.jpg',
    'assets/img/4.jpg',
    'assets/img/5.jpg',
    'assets/img/6.jpg',
    'assets/img/7.jpg',
    'assets/img/8.jpg'





  ];


  TabController ?_tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    // _tabController?.addListener(() {
    //   GetBooking getBooking =GetBooking(
    //       count: 9 ,
    //       upcoming: "upcomming"
    //
    //   );
    //   BlocProvider.of<BookingBloc>(context).add((GetBookingEvent(getBooking:getBooking )));
    //
    //
    // });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }





  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,

        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]

             // Row(
             //   children: [
             //     Text("My Trip" ,
             //       style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),
             //     ),
             //   ],
             // ),
              SizedBox(height: 10,),

              Container(
                height: 45,

                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  //give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(

                    borderRadius: BorderRadius.circular(
                      40.0,
                    ),

                    color: Colors.teal,
                  ),



                  onTap: ( pageNumber){

                    print(pageNumber);

                    if(pageNumber ==0){

                      GetBooking getBooking =GetBooking(
                          count: 9 ,
                          upcoming: "upcomming"

                      );
                      BlocProvider.of<BookingBloc>(context).add((GetBookingEvent(getBooking:getBooking )));

                    }

                    if(pageNumber ==1){
                      GetBooking getBooking =GetBooking(
                          count: 9 ,
                          upcoming: "cancelled"

                      );
                      BlocProvider.of<BookingBloc>(context).add((GetBookingEvent(getBooking:getBooking )));


                    }

                    if(pageNumber ==2){

                      GetBooking getBooking =GetBooking(
                          count: 9 ,
                          upcoming: "completed"

                      );
                      BlocProvider.of<BookingBloc>(context).add((GetBookingEvent(getBooking:getBooking )));


                    }







                  },
                  labelColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,


                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),
                  labelStyle: TextStyle(fontSize: 11 , fontWeight: FontWeight.bold),
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Upcoming',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Cancelled',
                    ),

                    Tab(
                      text: 'Finished',
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),

                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Center(
                      child: _buildBody()
                    ),

                    // second tab bar view widget
                    Center(
                        child: _buildBody()
                    ),

                    Center(
                        child: _buildBody()
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );


  }


  Widget _buildBody() {




    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is LoadingBookingState ) {


            return MaterialButton(

              onPressed: (){


                //BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());



              },
              child: CircularProgressIndicator(

                color: Colors.teal,
              ),



            );
          }




          else if (state is GetBookingState) {

            return
              SingleChildScrollView(

                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),

                scrollDirection: Axis.vertical,

                child: ListView.separated(





                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,


                    itemBuilder: (context, index) {




                      //imageChanged=state.booking.data?.data?[index].hotel?.hotelImages?[1].image;

                        List ?facilities=state.booking.data?.data?[index].hotel?.facilities;


                        //List ?Fac= state.booking.data?.data?[index].hotel?.facilities?[0].image;

                        List<HotelImages> ?hotelImages2 =state.booking.data?.data?[index].hotel?.hotelImages ?? [];









                      //  print(imageChanged);

                        for(int i=0 ; i<hotelImages2.length ; i++){
                         // print(i);

                          var value =hotelImages2[i].image;

                          hotelImagesList.add(value!);



                          // print(value);

                        }


                        if(imageChanged!=null) {
                          if (hotelImagesList.contains(imageChanged)) {
                            print("sameeeeeeeeeeeeeeeeee");

                            imageChanged = hotelImages2[index].image;

                            hotelImagesList.clear();

                            //break;

                          }
                          else {
                            print("elseeeeeeeeeeeeeeee");
                            imageChanged = state.booking.data?.data?[index]
                                .hotel?.hotelImages?[1].image;

                            print("what the fuck");
                            //imageChanged=null;

                            hotelImagesList.clear();
                          }
                        }
                        else{


                        }









                        //print(imageChanged);
                        print(state.booking.data?.data?[index].hotel?.hotelImages?[1].image);

                        List<Facilities> ?images =[];
                        List<String> names =[];

                        //kimo



                        // String ?image1;
                        // String ?image2;
                        // String ?name1;
                        // String ?name2;
                        if(facilities?.length !=0){


                          images=state.booking.data?.data?[index].hotel?.facilities;


                          // image1= state.booking.data?.data?[index].hotel?.facilities?[0].image;
                          //
                          // image2= state.booking.data?.data?[index].hotel?.facilities?[1].image;
                          //
                          // name1=state.booking.data?.data?[index].hotel?.facilities?[0].name;
                          // name2=state.booking.data?.data?[index].hotel?.facilities?[1].name;

                        }

                        else{

                          // image1 ="";
                          // image2="";
                          // name1 ="";
                          // name2="";

                          images=[];



                        }













                      return Card(

                        // style:Theme.of(context).textTheme.bodyText1!.copyWith(
                        //color: Theme.of(context).buttonTheme.colorScheme!.background),
                        elevation: 0,
                        //color: Theme.of(context).scaffoldBackgroundColor,
                        color:        Colors.grey.shade900,

                        //color: Colors.black,
                        //margin: const EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const SizedBox(height: 12),


                              //      Row(
                              //   children: [
                              //     const Text('  '),
                              //     Flexible(
                              //       child: Text(
                              //        "description" ,
                              //         textAlign: TextAlign.left,
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              const SizedBox(height: 12),



                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  //img[index] ,



                                  //hotelImages2[index].image==imageChanged?


                                  imageChanged!=null?

                                  "http://api.mahmoudtaha.com/images/${imageChanged ??"Grand Hotel"}"

                                  :

                                    "http://api.mahmoudtaha.com/images/${state.booking.data?.data?[index].hotel?.hotelImages?[1].image ??"Grand Hotel"}" ,









                                //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(height: 12),

                              Container(
                                width: 350,
                                height: 80,

                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: state.booking.data?.data?[index].hotel?.hotelImages?.length ?? 0,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Container(

                                      height: 50,
                                      child: InkWell(
                                        onTap: (){
                                          imageChanged= state.booking.data?.data?[index].hotel?.hotelImages?[i].image;
                                          setState(() {

                                          });
                                          print("pressed");

                                        //  print(hotelImages2[index].image);
                                          print(imageChanged);


                                        },
                                        child: Card(
                                          child: Image.network(
                                            "http://api.mahmoudtaha.com/images/${state.booking.data?.data?[index].hotel?.hotelImages?[i].image ??"Grand Hotel"}" ,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 12),




                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(

                              state.booking.data?.data?[index].hotel?.name.toString() ?? "Grand Royal Hotel",




                                           style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.bold

                                        ),),
                                      ),
                                    ],
                                  ),





                                  // AnimatedSwitcher(
                                  //   duration: const Duration(seconds:  0),
                                  //
                                  //
                                  //   transitionBuilder:(Widget child,
                                  //       Animation<double>animation)=>
                                  //       ScaleTransition(scale: animation, child: child),
                                  //
                                  //   child:
                                  //
                                  //   flag ?
                                  //   FloatingActionButton.extended(
                                  //     key: Key('1'),
                                  //     label: const Text('Upcomming' , style: TextStyle(color: Colors.redAccent , fontWeight: FontWeight.bold , fontSize: 12),), // <-- Text
                                  //     backgroundColor: Colors.white12,
                                  //     icon: const Icon( // <-- Icon
                                  //       Icons.done,
                                  //       size: 20.0,
                                  //       color: Colors.red,
                                  //
                                  //     ),
                                  //
                                  //     onPressed: () {
                                  //       setState(() {
                                  //         flag=!flag;
                                  //
                                  //         //UpdateBooking
                                  //
                                  //
                                  //
                                  //         UpdateBooking updateBooking =UpdateBooking(
                                  //             bookinId:    state.booking.data?.data?[index].id ??5 ,
                                  //             type:  "cancelled"
                                  //
                                  //         );
                                  //         BlocProvider.of<BookingBloc>(context).add((UpdateBookingEvent(updateBooking: updateBooking)));
                                  //
                                  //
                                  //
                                  //       });
                                  //
                                  //     },
                                  //   )
                                  //
                                  //     :
                                  //     FloatingActionButton.extended(
                                  //     key: Key('2'),
                                  //     label: const Text('Book now' , style: TextStyle(color: Colors.blueAccent , fontWeight: FontWeight.bold , fontSize: 15),), // <-- Text
                                  //     backgroundColor: Colors.white12,
                                  //     icon: const Icon( // <-- Icon
                                  //       Icons.notification_add,
                                  //       size: 20.0,
                                  //       color: Colors.blueAccent,
                                  //
                                  //     ),
                                  //
                                  //
                                  //     onPressed: () {
                                  //       setState(() {
                                  //
                                  //         print("pressssed");
                                  //         flag=!flag;
                                  //         print(flag);
                                  //
                                  //       });
                                  //
                                  //       setState(() {
                                  //
                                  //       });
                                  //
                                  //     },
                                  //   )
                                  //
                                  //
                                  //
                                  //
                                  //
                                  // ),
                                  FloatingActionButton.extended(
                                    key: Key('1'),
                                    label: const Text('Cancel' , style: TextStyle(color: Colors.redAccent , fontWeight: FontWeight.w400 , fontSize: 13),), // <-- Text
                                    backgroundColor: Colors.white12,
                                    icon: const Icon( // <-- Icon
                                      Icons.cancel,
                                      size: 17.0,
                                      color: Colors.red,

                                    ),

                                    onPressed: () {
                                      setState(() {
                                        flag=!flag;

                                        //UpdateBooking



                                        UpdateBooking updateBooking =UpdateBooking(
                                            bookinId:    state.booking.data?.data?[index].id ??5 ,
                                            type:  "cancelled"

                                        );
                                        BlocProvider.of<BookingBloc>(context).add((UpdateBookingEvent(updateBooking: updateBooking)));



                                      });

                                    },
                                  )



                                ],
                              ),
                              const SizedBox(height: 10),


                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text("\$" , style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold , fontSize: 18),), // <-- Text

                                      Text(                              state.booking.data?.data?[index].hotel?.price.toString() ?? "Grand Royal Hotel",
                                        style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold , fontSize: 15),), // <-- Text
                                      Text('/per night' , style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold , fontSize: 12),), // <-- Text




                                    ],
                                  ),






                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("sleeps 2 people + 2 children" , style: TextStyle(color: Colors.white.withOpacity(0.5) , fontWeight: FontWeight.bold , fontSize: 12),), // <-- Text


                                  const SizedBox(width: 10),





                                ],
                              ),
                              SizedBox(height: 10,),


                              Container(
                                width: double.infinity,
                                height: 30,

                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: images?.length != null ? images?.length : 0 ,
                                  itemBuilder: (context, i) {

                                    List<Color> colors =[Colors.blue,Colors.red,
                                      Colors.green,Colors.yellowAccent,
                                    ];

                                    return Row(

                                      children: [



                                        images!=[]?
                                        Container(

                                          child: CircleAvatar(
                                            radius: 10,

                                            backgroundColor: colors[i],

                                            child: Image.network(



                                              "http://api.mahmoudtaha.com/images/${images?[i].image ?? ""}" ,





                                              //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
                                              height: 350,
                                              width: MediaQuery.of(context).size.width,
                                              fit: BoxFit.fill,
                                            ),

                                            // backgroundImage: NetworkImage(
                                            //   "http://api.mahmoudtaha.com/images/${state.booking.data?.data?[index].hotel?.hotelImages?[0].image}" ,
                                            //
                                            //   //"https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2022/04/12/1329/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.jpg/MUMGH-P0765-Inner-Courtyard-Hotel-Exterior-Evening.16x9.jpg?imwidth=1920",
                                            //
                                            //
                                            //
                                            //
                                            // ),
                                          ),
                                        ) :
                                        Text(""),


                                        const SizedBox(width: 10),



                                        Text(images?[i].name ?? "" , style: TextStyle(fontSize: 10),),

                                        SizedBox(width: 10,),











                                      ],
                                    );
                                  },
                                ),
                              ),











                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:

                    state.booking.data?.data?.length ?? 1,
                )
              );








          }
          else if (state is UpdateBookingState) {

            GetBooking getBooking =GetBooking(
                count: 9 ,
                upcoming: "upcomming"

            );
            BlocProvider.of<BookingBloc>(context).add((GetBookingEvent(getBooking:getBooking )));



            return MaterialButton(
                  key: Key("1"),

              onPressed: (){
                print(state.bookingStatus);
                //BlocProvider.of<BookingBloc>(context).add(CreateBookingEvent());



              },
            //   child:  CircularProgressIndicator(
            //
            //   color: Colors.teal,
            // ),



            );
          }
          else if (state is CreateBookingState) {
            GetBooking getBooking =GetBooking(
                count: 9 ,
                upcoming: "upcomming"

            );
            BlocProvider.of<BookingBloc>(context).add((GetBookingEvent(getBooking:getBooking )));

            return MaterialButton(

              onPressed: (){
                print(state.bookingStatus);
                //BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());



              },
              child: Text("updateEvent" ,style: TextStyle(
                  fontSize: 45

              ), ),



            );
          }

          else if (state is ErrorBookingState) {
            return MessageDisplayWidget(message: state.message);
          }
          return
            MaterialButton(

              onPressed: (){

                //BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());

                //BlocProvider.of<BookingBloc>(context).getProfileInfo;
                print("i presed");

              },
              child: Container(child: Text("nothing " ,style: TextStyle(
                  fontSize: 45

              ), ),)




            );

        },
      ),
    );
  }



}