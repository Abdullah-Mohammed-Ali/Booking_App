import 'package:booking_app/fathi_test/fathi_bloc.dart';
import 'package:booking_app/fathi_test/fathi_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FathiTestScreen extends StatelessWidget {
  const FathiTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => fSl<FathiBloc>()
        ..add(const GetFacilitiesEvent())
        ..add(const GetSearchHotelsEvent(name: "5000",count: 10,page: 5)),
      child: BlocBuilder<FathiBloc, FathiState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
                child: Column(
              children: [
                Text(
                  state.facilities.facilitiesData[0].name,
                  style: const TextStyle(color: Colors.pink, fontSize: 24),
                ),
                Text(
                  state.searchHotels.searchHotelsAllData.data.length>0?state.searchHotels.searchHotelsAllData.data[0].name:'empty',
                  style: const TextStyle(color: Colors.pink, fontSize: 24),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
