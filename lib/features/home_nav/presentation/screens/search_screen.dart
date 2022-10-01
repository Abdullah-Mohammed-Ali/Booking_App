import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/features/home_nav/presentation/components/search/default_text_form_field.dart';
import 'package:booking_app/features/home_nav/presentation/components/search/search_card_widget.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/dependency_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../explore/persentation/bloc/hotels_bloc.dart';
import '../../../explore/persentation/pages/hotelspage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var filterIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HotelsBloc>(
      create: (context) => di.sl<HotelsBloc>()..add(GetHotelsEvent()),
      child: BlocBuilder<HotelsBloc, HotelsState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.darkBcgrnd,
            appBar: AppBar(
              backgroundColor: AppColors.darkBcgrnd,
              title: Text('Explore'),
              actions: [
                IconButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, AppRoutingNames.mapsScreen);
                    }),
                    icon: Icon(Icons.maps_ugc)),
                IconButton(
                    onPressed: (() {
                      setState(() {
                        filterIsPressed = !filterIsPressed;
                      });
                    }),
                    icon: Icon(FontAwesomeIcons.filter)),
              ],
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 157,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (filterIsPressed)
                          Container(
                            height: 150,
                            child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            )),
                          ),
                        Container(
                          height: 50,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DefaultTextFormField(
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
                                ),
                                IconButton(
                                    onPressed: (() {}),
                                    icon: Icon(Icons.search))
                              ],
                            ),
                          ),
                        ),
                        if (state is GetHotelsState)
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              cacheExtent: 8,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              padding: const EdgeInsets.only(bottom: 15.0),
                              itemCount: state.hotels.data?.data2?.length ?? 3,
                              itemBuilder: (BuildContext context, int index) {
                                return HotelItem(context,
                                    state.hotels.data!.data2![index], index);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
