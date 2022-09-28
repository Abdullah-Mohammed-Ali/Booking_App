import 'package:booking_app/features/explore/models/hotels_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../models/hotel_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.white,
                          offset: const Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: const Image(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/housekeeper-cleaning-hotel-room_53876-30786.jpg?w=1480&t=st=1664018135~exp=1664018735~hmac=8f6f2699198af0eb3e2b5ce36c44ce265babaf2921bac5722337787e1c8f8afd',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                floating: true,
              ),
            ]),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return HotelExploreItem();
          },
        ),
      ),
    );
  }
}

class HotelExploreItem extends StatelessWidget {
  HotelExploreItem({
    Key? key,
    this.hotelsModel,
  }) : super(key: key);

  HotelModel? hotelsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hotelsModel?.name ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              hotelsModel?.price ?? "500 EGP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'per night',
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  hotelsModel?.address ?? " Nasr city, Egypt",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                // _buildRatingStars(4),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23.0),
            child: const Image(
              width: 120.0,
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/popular-resort-amara-dolce-vita-luxury-hotel-with-pools-water-parks-recreational-area-along-sea-coast-turkey-sunset-tekirova-kemer_146671-18759.jpg?w=1480&t=st=1664018398~exp=1664018998~hmac=4ef724cb30a02415c5eb6da81322e1055bc5a8bf61edba7e1da6ff4ece2063d6'),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
