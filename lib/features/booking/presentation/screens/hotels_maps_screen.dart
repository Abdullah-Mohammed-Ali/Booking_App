import 'package:booking_app/features/explore/presentation/cubit/hotels_cubit.dart';
import 'package:booking_app/features/explore/presentation/widget/explore_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:booking_app/dependency_container.dart' as di;

import '../../../explore/presentation/cubit/hotels_state.dart';

class HotelsMapScreen extends StatelessWidget {
  const HotelsMapScreen({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HotelsCubit>(
      create: (context) => di.sl()..getHotels(),
      child: BlocBuilder<HotelsCubit, HotelsState>(
        builder: (context, state) {
          var cubit = HotelsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Hotels Map'),
              backgroundColor: Colors.black87,
            ),
            body: Stack(
              fit: StackFit.passthrough,
              children: [
                const GoogleMap(
                  myLocationButtonEnabled: false,
                  initialCameraPosition: _kGooglePlex,
                ),
                Positioned(
                  bottom: 50.h,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: 170,
                    child: ListView.builder(
                      itemCount: cubit.hotels.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return HotelExploreItem(
                          hotelsModel: cubit.hotels[index],
                        );
                      },
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
