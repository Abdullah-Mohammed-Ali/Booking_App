import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:booking_app/dependency_container.dart' as di;
import '../../domain/entities/hotels.dart';
import '../bloc/hotels_bloc.dart';
import 'hotelspage.dart';

class HotelsMapsScreen extends StatefulWidget {
  HotelsMapsScreen({super.key});

  @override
  State<HotelsMapsScreen> createState() => _HotelsMapsScreenState();
}

class _HotelsMapsScreenState extends State<HotelsMapsScreen> {
  Completer<GoogleMapController> controllerForMap =
      Completer<GoogleMapController>();

  var mapsListController = ScrollController();
  CameraPosition camera = CameraPosition(target: LatLng(11, 11), zoom: 15);

  Set<Marker>? markers = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HotelsBloc>(
      create: (context) => di.sl()..add(GetHotelsEvent()),
      child: BlocBuilder<HotelsBloc, HotelsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0x302F30),
              title: Text('Hotels'),
            ),
            body: Stack(
              children: [
                GoogleMap(
                    onMapCreated: ((controller) {
                      controllerForMap.complete(controller);
                    }),
                    markers: markers!,
                    initialCameraPosition: camera),
                if (state is GetHotelsState)
                  FutureBuilder(
                    future: controllerForMap.future,
                    builder: (BuildContext context,
                        AsyncSnapshot<GoogleMapController> snapshot) {
                      return Positioned(
                        bottom: 25.h,
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            controller: mapsListController,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            cacheExtent: 8,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 15.0),
                            itemCount: state.hotels.data?.data2?.length ?? 3,
                            itemBuilder: (BuildContext context, int index) {
                              var item = state.hotels.data!.data2![index];
                              LatLng currentHotelPos = LatLng(
                                  double.parse(item.latitude!),
                                  double.parse(item.longitude!));
                              Marker currentMarker = Marker(
                                markerId: MarkerId(index.toString()),
                                position: currentHotelPos,
                                infoWindow:
                                    InfoWindow(title: '\$ ${item.price}'),
                              );

                              SchedulerBinding.instance.addPostFrameCallback(
                                (timeStamp) {
                                  setState(() {
                                    snapshot.data!.animateCamera(
                                        CameraUpdate.newLatLng(
                                            currentHotelPos));
                                  });
                                },
                              );
                              markers!.clear();
                              markers!.add(currentMarker);
                              snapshot.data?.showMarkerInfoWindow(
                                  MarkerId(index.toString()));

                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: HotelItem(context,
                                    state.hotels.data!.data2![index], index),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
