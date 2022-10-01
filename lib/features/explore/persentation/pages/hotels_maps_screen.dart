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
                    myLocationButtonEnabled: false,
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
                        bottom: 35.h,
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            controller: mapsListController,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            cacheExtent: 1,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            padding: const EdgeInsets.only(
                              right: 15.0,
                            ),
                            itemCount: state.hotels.data?.data2?.length ?? 3,
                            itemBuilder: (BuildContext context, int index) {
                              var item = state.hotels.data!.data2![index];
                              addMarker(item, index, snapshot);

                              return SizedBox(
                                width: MediaQuery.of(context).size.width + 5,
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

  void addMarker(
      Data2 item, int index, AsyncSnapshot<GoogleMapController> snapshot) {
    LatLng currentHotelPos =
        LatLng(double.parse(item.latitude!), double.parse(item.longitude!));

    var markerID = MarkerId('$index + ${item.name}');
    Marker currentMarker = Marker(
      markerId: markerID,
      position: currentHotelPos,
      infoWindow: InfoWindow(title: '\$ ${item.price}'),
    );

    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          snapshot.data!.animateCamera(CameraUpdate.newLatLng(currentHotelPos));
        });
      },
    );
    markers!.clear();
    markers!.add(currentMarker);
    snapshot.data?.showMarkerInfoWindow(markerID);
  }
}
