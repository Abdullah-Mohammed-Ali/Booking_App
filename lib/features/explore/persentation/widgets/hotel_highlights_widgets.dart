import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelHightlightsWidget extends StatelessWidget {
  final String hotelName;
  final String address;
  final String price;

  const HotelHightlightsWidget(
      {Key? key,
      required this.hotelName,
      required this.price,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hotelName,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 230,
                          child: Text(
                            address,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 9,
                            ),
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Icon(
                            Icons.location_on,
                            color: AppColors.myGreen,
                            size: 12,
                          ),
                        ),

                        Text(
                          '2.0 km to city',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color:Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            debugPrint(rating.toString());
                          },
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '80 reviews',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 9),
                        ),
                      ],
                    )
                    // Text(
                    //   'rate: 9:00',
                    //   style:
                    //       TextStyle(color: AppColors.white),
                    // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/per night',
                      style: TextStyle(color: AppColors.white, fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
