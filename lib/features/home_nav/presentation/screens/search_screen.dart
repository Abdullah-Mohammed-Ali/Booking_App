import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/features/home_nav/presentation/components/search/default_text_form_field.dart';
import 'package:booking_app/features/home_nav/presentation/components/search/search_card_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkBcgrnd,
      appBar: AppBar(
        backgroundColor: AppColors.darkBcgrnd,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .778514,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextFormField(
                      hint: 'Where are you going?',
                      radius: 30,
                      type: TextInputType.text,
                      controller: TextEditingController(),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.myGreen,
                        size: 30,
                      ),
                      borderColor: AppColors.darkGrey,
                      fillColor: AppColors.darkGrey,
                      isFilled: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: .74,
                        mainAxisExtent: 230,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) => const SearchCardWidget(
                        address: 'Paris',
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/078d5eb4-87a3-4271-bf9f-3d680e6de577.jpg',
                        rate: "4.5",
                        price: "200",
                      ),
                    ),
                    // const SearchCardWidget(
                    //   address: 'Paris',
                    //   imageUrl:
                    //       'https://a0.muscache.com/im/pictures/078d5eb4-87a3-4271-bf9f-3d680e6de577.jpg',
                    //   rate: "4.5",
                    //   price: "200",
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
