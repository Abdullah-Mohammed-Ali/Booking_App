import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchCardWidget extends StatelessWidget {
  final String imageUrl;
  final String address;
  final String price;
  final String rate;
  const SearchCardWidget({
    Key? key,
    required this.imageUrl,
    required this.address,
    required this.rate,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 230,
      child: Card(
        color: AppColors.darkGrey,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              width: 170,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'price: $price\nrate: $rate',
                    style: TextStyle(
                      color: AppColors.offwite,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
