
import 'package:booking_app/features/profile/domain/entities/pass.dart';
import 'package:booking_app/features/profile/persentation/bloc/profile_bloc.dart';
import 'package:booking_app/features/profile/persentation/widgets/messgae.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();



}




class _PostsPageState extends State<PostsPage> {

  @override
  void initState() {
    super.initState();
    //BlocProvider.of<ProfileBloc>(context).GetProfileInfoEvent();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),

    );
  }

  AppBar _buildAppbar() => AppBar(title: Text('Posts'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is LoadingProfileState ) {
            return MaterialButton(

              onPressed: (){


                BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());



              },
              child: Column(
                children: [
                  Text("loadingggggg" ,style: TextStyle(
                      fontSize: 45

                  ), ),



                ],
              ),



            );
          }

          // else if (state is ProfileInfoState) {
          //   return MaterialButton(
          //
          //     onPressed: (){
          //       print(state.profile_Info);
          //
          //       BlocProvider.of<ProfileBloc>(context).add(PassChangeEvent());
          //
          //
          //
          //     },
          //     child: Column(
          //       children: [
          //         Text("ProfileInfo" ,style: TextStyle(
          //             fontSize: 45
          //
          //         ), ),
          //
          //
          //
          //       ],
          //     ),
          //
          //
          //
          //   );
          // }
          else if (state is PassChangeState) {
            return MaterialButton(

              onPressed: (){
                print(state.pass_Change);
                //BlocProvider.of<ProfileBloc>(context).add(UpdateEvent());



              },
              child: Text("pass_Change" ,style: TextStyle(
                  fontSize: 45

              ), ),



            );
          }
          else if (state is UpdateInfoState) {
            return MaterialButton(

              onPressed: (){
                print(state.updateEvent);
                BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());



              },
              child: Text("updateEvent" ,style: TextStyle(
                  fontSize: 45

              ), ),



            );
          }

          else if (state is ErrorProfileState) {
            return MessageDisplayWidget(message: state.message);
          }
          return
            MaterialButton(

              onPressed: (){

                BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());

                //BlocProvider.of<ProfileBloc>(context).getProfileInfo;
                print("i presed");

              },
              child: Container(child: Text("nothing " ,style: TextStyle(
                  fontSize: 45

              ), ),)




            );

        },
      ),
    );
  }
}