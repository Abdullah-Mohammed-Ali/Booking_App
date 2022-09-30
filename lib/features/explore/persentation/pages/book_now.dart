import 'dart:ui';

import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/features/booking/domain/entities/create_booking.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:booking_app/features/booking/persentation/bloc/booking_bloc.dart';
import 'package:booking_app/features/explore/persentation/bloc/hotels_bloc.dart';
import 'package:booking_app/features/explore/persentation/widgets/default_button.dart';
import 'package:booking_app/features/explore/persentation/widgets/header_widget.dart';
import 'package:booking_app/features/explore/persentation/widgets/hotel_highlights_widgets.dart';
import 'package:booking_app/features/explore/persentation/widgets/my_spacer.dart';
import 'package:booking_app/features/explore/persentation/widgets/rating_card_widget.dart';
import 'package:booking_app/features/explore/persentation/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookNow extends StatefulWidget {
  String? name;
  String? adress;
  String? facilities;

  String? image;
  String? price;
  int? hoteId;
  int? userId;

  BookNow({
    Key? key,
    required this.image,
    required this.price,
    required this.name,
    required this.adress,
    required this.facilities,
    required this.hoteId,
    required this.userId,
  }) : super(key: key);

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  static bool flag = true;

  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBcgrnd,
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            pinned: true,
            floating: true,
            primary: false,
            toolbarHeight: 150.h,
            backgroundColor: Colors.transparent,
            // leading: Container(
            //   margin: const EdgeInsets.all(5),
            //   height: 30,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppColors.white.withOpacity(.2)),
            //   child: IconButton(
            //     icon: Icon(Icons.arrow_back, color: AppColors.black),
            //     onPressed: () {},
            //   ),
            // ),

            // actions: [
            //   Container(
            //     height: 30,
            //     margin: const EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle, color: AppColors.black),
            //     child: IconButton(
            //       icon: Icon(Icons.favorite_border_outlined,
            //           color: AppColors.myGreen),
            //       onPressed: () {},
            //     ),
            //   )
            // ],
            flexibleSpace:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Hero(
                tag: "sadas",
                child: Image.network(
                  widget.image!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              LayoutBuilder(builder: (context, cons) {
                top = cons.biggest.height;
                return AnimatedOpacity(
                  duration: const Duration(microseconds: 100),
                  opacity: top >= 400 ? top * .0012 : 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HotelHightlightsWidget(
                                hotelName: widget.name!,
                                price: widget.price!,
                                address: widget.adress!,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              AnimatedSwitcher(
                                  duration: const Duration(seconds: 0),
                                  transitionBuilder: (Widget child,
                                          Animation<double> animation) =>
                                      ScaleTransition(
                                          scale: animation, child: child),
                                  child: flag
                                      ? DefaultButton(
                                          key: Key('1'),
                                          backgroundColor: Colors.teal,
                                          text: 'Book Now',
                                          fontSize: 12,
                                          textColor: AppColors.white,
                                          onclick: () {
                                            setState(() {
                                              flag = false;
                                            });

                                            setState(() {});

                                            CreateBooking createBooking =
                                                CreateBooking(
                                              hoteId: widget.hoteId!,
                                              userId: widget.userId!,
                                            );

                                            BlocProvider.of<BookingBloc>(
                                                    context)
                                                .add((CreateBookingEvent(
                                                    createBooking:
                                                        createBooking)));

                                            print("pressssed1");
                                            print(flag);
                                          },
                                          borderRadius: 25,
                                          fontWeight: FontWeight.normal,
                                          height: 40)
                                      : DefaultButton(
                                          key: Key('2'),
                                          backgroundColor: Colors.red,
                                          text: 'Up Coming',
                                          fontSize: 12,
                                          textColor: AppColors.white,
                                          onclick: () {
                                            // UpdateBooking updateBooking =UpdateBooking(
                                            //   bookinId: hoteId! ,
                                            //   type: "" ,
                                            //
                                            //
                                            // );
                                            //
                                            // BlocProvider.of<BookingBloc>(context).add((UpdateBookingEvent(updateBooking: updateBooking)));
                                            //

                                            setState(() {
                                              flag = !flag;
                                            });
                                          },
                                          borderRadius: 25,
                                          fontWeight: FontWeight.normal,
                                          height: 40)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ]),
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(10),
            //   child:
            // ),

            // flexibleSpace: FlexibleSpaceBar(
            //   centerTitle: true,
            //   collapseMode: CollapseMode.pin,
            //   background: Image.network(
            //     'https://marketplace.canva.com/Ic2KM/MAE3X1Ic2KM/1/s2/canva-woman-at-outdoor-iftar-picnic-MAE3X1Ic2KM.jpg',
            //     width: double.maxFinite,
            //     fit: BoxFit.cover,
            //   ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HotelHightlightsWidget(
                    hotelName: widget.name!,
                    price: widget.price!,
                    address: widget.adress!,
                  ),
                  const MySpacer(),
                  Text(
                    'Summary',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ReadMoreText(
                    'featuring a fitness center, Grand Royal Park is located in sweden 4.7 km from national musuem a fitness center. featuring a fitness center, Grand Royal Park is located in sweden 4.7 km from national musuem a fitness center. featuring a fitness center, Grand Royal Park is located in sweden 4.7 km from national musuem a fitness center. featuring a fitness center, Grand Royal Park is located in sweden 4.7 km from national musuem a fitness center.',
                    trimLines: 7,
                    trimMode: TrimMode.Line,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 9,
                    ),
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myGreen),
                    lessStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myGreen),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RatingCardWidget(
                    roomRating: 10,
                    servicsRating: 7,
                    locationRating: 8.5,
                    priceRating: 9.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const HeaderWidget(title: 'photo'),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://marketplace.canva.com/ixlvc/MAEGxWixlvc/1/s2/canva-teacher-asking-a-question-to-the-class-MAEGxWixlvc.jpg',
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 6,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const HeaderWidget(title: 'reviews'),
                  SizedBox(
                    height: 10,
                  ),
                  const ReviewWidget(
                    reviewerName: 'Alexia Jane',
                    imageUrl:
                        'https://marketplace.canva.com/ixlvc/MAEGxWixlvc/1/s2/canva-teacher-asking-a-question-to-the-class-MAEGxWixlvc.jpg',
                    rate: 8.0,
                    review:
                        'This is located in a great spot close to shops and bars, very quiet location.',
                  ),
                  const MySpacer(),
                  const ReviewWidget(
                    reviewerName: 'Jacky Depp',
                    imageUrl:
                        'https://marketplace.canva.com/ixlvc/MAEGxWixlvc/1/s2/canva-teacher-asking-a-question-to-the-class-MAEGxWixlvc.jpg',
                    rate: 8.0,
                    review:
                        'Good staff, very comfortable bed. Very quiet location, place could be with an update',
                  ),
                  const MySpacer(),
                  Image.network(
                    'https://www.infinetsoft.com/Uploads/20170111101701google%20maps%20directions%20from%20current%20location.png',
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 15),
                  AnimatedSwitcher(
                      duration: const Duration(seconds: 0),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) =>
                              ScaleTransition(scale: animation, child: child),
                      child: flag
                          ? DefaultButton(
                              key: Key('1'),
                              backgroundColor: Colors.teal,
                              text: 'Book Now',
                              fontSize: 12,
                              textColor: AppColors.white,
                              onclick: () {
                                setState(() {
                                  flag = false;
                                });

                                setState(() {});

                                CreateBooking createBooking = CreateBooking(
                                  hoteId: widget.hoteId!,
                                  userId: widget.userId!,
                                );

                                BlocProvider.of<BookingBloc>(context).add(
                                    (CreateBookingEvent(
                                        createBooking: createBooking)));

                                print("pressssed1");
                                print(flag);
                              },
                              borderRadius: 25,
                              fontWeight: FontWeight.normal,
                              height: 40)
                          : DefaultButton(
                              key: Key('2'),
                              backgroundColor: Colors.red,
                              text: 'Up Coming',
                              fontSize: 12,
                              textColor: AppColors.white,
                              onclick: () {
                                // UpdateBooking updateBooking =UpdateBooking(
                                //   bookinId: hoteId! ,
                                //   type: "" ,
                                //
                                //
                                // );
                                //
                                // BlocProvider.of<BookingBloc>(context).add((UpdateBookingEvent(updateBooking: updateBooking)));
                                //

                                setState(() {
                                  flag = !flag;
                                });
                              },
                              borderRadius: 25,
                              fontWeight: FontWeight.normal,
                              height: 40)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
