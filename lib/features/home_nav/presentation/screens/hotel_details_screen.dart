import 'dart:ui';

import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/features/home_nav/presentation/components/hotel_details/default_button.dart';
import 'package:booking_app/features/home_nav/presentation/components/hotel_details/header_widget.dart';
import 'package:booking_app/features/home_nav/presentation/components/hotel_details/hotel_highlights_widgets.dart';
import 'package:booking_app/features/home_nav/presentation/components/hotel_details/my_spacer.dart';
import 'package:booking_app/features/home_nav/presentation/components/hotel_details/rating_card_widget.dart';
import 'package:booking_app/features/home_nav/presentation/components/hotel_details/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key}) : super(key: key);

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
            toolbarHeight: 150,
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
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // margin: const EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(.2)),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.black),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    // margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.black),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border_outlined,
                          color: AppColors.myGreen),
                      onPressed: () {},
                    ),
                  )
                ]),
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
              Image.network(
                'https://marketplace.canva.com/Ic2KM/MAE3X1Ic2KM/1/s2/canva-woman-at-outdoor-iftar-picnic-MAE3X1Ic2KM.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
                height: double.infinity,
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
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HotelHightlightsWidget(
                                hotelName: 'Grand Royal Hotel',
                                price: '180',
                                address: 'Wembley, London',
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              DefaultButton(
                                  backgroundColor: AppColors.myGreen,
                                  text: 'Book Now',
                                  textColor: AppColors.white,
                                  onclick: () {},
                                  borderRadius: 25,
                                  fontWeight: FontWeight.normal,
                                  height: 50)
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
                  const HotelHightlightsWidget(
                    hotelName: 'Grand Royal Hotel',
                    price: '180',
                    address: 'Wembley, London',
                  ),
                  const MySpacer(),
                  Text(
                    'Summary',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
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
                    ),
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myGreen),
                    lessStyle: TextStyle(
                        fontSize: 14,
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
                  const HeaderWidget(title: 'photo'),
                  Container(
                    height: 150,
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
                  const HeaderWidget(title: 'reviews'),
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
                  DefaultButton(
                      backgroundColor: AppColors.myGreen,
                      text: 'Book Now',
                      textColor: AppColors.white,
                      onclick: () {},
                      borderRadius: 25,
                      fontWeight: FontWeight.normal,
                      height: 50)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
