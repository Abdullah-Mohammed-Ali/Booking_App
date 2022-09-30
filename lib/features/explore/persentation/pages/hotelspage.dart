import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/features/explore/persentation/bloc/hotels_bloc.dart';
import 'package:booking_app/features/explore/persentation/pages/book_now.dart';
import 'package:booking_app/features/explore/persentation/widgets/buttonWiget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/messgae.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  bool flag = true;

  List<String> img = [
    'assets/img/1.jpg',
    'assets/img/2.jpg',
    'assets/img/3.jpg',
    'assets/img/4.jpg',
    'assets/img/5.jpg',
    'assets/img/6.jpg',
    'assets/img/7.jpg',
    'assets/img/8.jpg'
  ];

  @override
  void initState() {
    super.initState();
    //BlocProvider.of<HotelsBloc>(context).GetProfileInfoEvent();
  }

  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(fontSize: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.grey.shade900,

        //
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //
        //   centerTitle: true,
        //   elevation: 0,
        //   //title: const Text('Timeline' , style: TextStyle(fontSize: 20 , color: Colors.blueAccent),),
        //   title: Icon(UniconsLine.atom ,size: 30 , color: Colors.teal,),
        //
        //
        //
        //
        //   // leading: IconButton(
        //   //     onPressed: () => null,
        //   //     icon: Icon(
        //   //         UniconsLine.user_circle,
        //   //         color: Theme.of(context).iconTheme.color,
        //   //         size: 30
        //   //     ))
        //   //,
        //
        //
        //
        // ),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppbar() => AppBar(title: Text('Posts'));

  Widget _buildBody() {
    return BlocBuilder<HotelsBloc, HotelsState>(
      builder: (context, state) {
        if (state is LoadingHotelsState) {
          return MaterialButton(
            onPressed: () {
              BlocProvider.of<HotelsBloc>(context).add(GetHotelsEvent());
            },
            child: Column(
              children: [
                Text(
                  "loadingggggg",
                  style: TextStyle(fontSize: 45),
                ),
              ],
            ),
          );
        } else if (state is GetHotelsState) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              // elevation: 0,
              //
              // collapsedHeight: 230,
              // stretch: true,
              // pinned: true,

              pinned: true,
              floating: true,
              primary: false,
              toolbarHeight: 200,
              elevation: 0,

              backgroundColor: Colors.transparent,
              expandedHeight: 450,
              flexibleSpace: Stack(
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: const Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(0),
                          bottomLeft: Radius.circular(30)),
                      child: Image.asset(
                        'assets/img/6.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 50,
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: AppColors.darkGrey,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkGrey, width: 33.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkGrey, width: 2.0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.teal,
                            ),
                            hintText: 'Where are you going',
                            hintStyle: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ButtonWidget3(
                          text: "View Hotel",
                          onClicked: () {},
                        )),
                  ),
                ],
              ),

              //floating: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.vertical,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    cacheExtent: 8,
                    separatorBuilder: (context, index) => const Divider(),
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                    itemCount: state.hotels.data?.data2?.length ?? 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => BookNow(
                                      image:
                                          "http://api.mahmoudtaha.com/images/${state.hotels.data?.data2?[index].hotelImages?[0].image}",
                                      adress: state.hotels.data?.data2?[index]
                                              .address ??
                                          "Roma fgfgm gfn",
                                      name: state.hotels.data?.data2?[index]
                                              .name ??
                                          "Grand Royal Hotel",
                                      price: state.hotels.data?.data2?[index]
                                              .price ??
                                          "Grand Royal",
                                      facilities: state
                                              .hotels
                                              .data
                                              ?.data2?[index]
                                              .hotelFacilities?[0]
                                              .facilityId ??
                                          "Grand Royal",
                                      hoteId:
                                          state.hotels.data?.data2?[index].id,
                                      userId: 22,
                                    )),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  40.0, 5.0, 20.0, 5.0),
                              height: 200.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.darkGrey,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    100.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 170,
                                            child: state
                                                            .hotels
                                                            .data
                                                            ?.data2?[index]
                                                            .name !=
                                                        "Roma fgfgm gfn" &&
                                                    state
                                                            .hotels
                                                            .data
                                                            ?.data2?[index]
                                                            .name !=
                                                        "Nasr Ciry Price 5000"
                                                ? Text(
                                                    state
                                                            .hotels
                                                            .data
                                                            ?.data2?[index]
                                                            .name ??
                                                        "Grand Royal Hotel",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  )
                                                : Text(
                                                    "Grand Royal",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      state.hotels.data?.data2?[index]
                                              .address ??
                                          "Roma fgfgm gfn",
                                      style: TextStyle(
                                        fontSize: 7,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.wrong_location_rounded,
                                                  size: 13,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  " ${index + 3} km to city",
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ), // <-- Text

                                                Text(
                                                  state
                                                          .hotels
                                                          .data
                                                          ?.data2?[index]
                                                          .price ??
                                                      "Grand Royal",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ), // <-- Text
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        state.hotels.data?.data2?[index].rate ==
                                                "10.50"
                                            ? _buildRatingStars(5)
                                            : _buildRatingStars(4),
                                        Text(
                                          '/per night',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${state.hotels.data?.data2?[index].rate ?? "Grand Hotel"} out from 5 stars",
                                      style: TextStyle(fontSize: 7),
                                    )
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
                                child: Image(
                                  image: NetworkImage(
                                    "http://api.mahmoudtaha.com/images/${state.hotels.data?.data2?[index].hotelImages?[0].image ?? "Grand Hotel"}",
                                  ),

                                  //img[index],

                                  width: 120,

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ]);
        } else if (state is ErrorHotelsState) {
          return MessageDisplayWidget(message: state.message);
        }
        return MaterialButton(
            onPressed: () {
              BlocProvider.of<HotelsBloc>(context).add(GetHotelsEvent());

              //BlocProvider.of<HotelsBloc>(context).getProfileInfo;
              print("i presed");
            },
            child: Container(
              child: Text(
                "nothing ",
                style: TextStyle(fontSize: 45),
              ),
            ));
      },
    );
  }
}
