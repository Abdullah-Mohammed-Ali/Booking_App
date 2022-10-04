import 'package:booking_app/features/profile/domain/entities/profile_info_saved.dart';
import 'package:booking_app/features/profile/domain/entities/saved_variables.dart';
import 'package:booking_app/features/profile/persentation/bloc/profile_bloc.dart';
import 'package:booking_app/features/profile/persentation/pages/changePassword.dart';
import 'package:booking_app/features/profile/persentation/pages/editProfile.dart';
import 'package:booking_app/features/profile/persentation/pages/user.dart';
import 'package:booking_app/features/profile/persentation/pages/user_predrences.dart';
import 'package:booking_app/features/profile/persentation/widgets/messgae.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/appbar_widget.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/button2.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/button_widget.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../splash/presentaion/screens/splash_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Builder(
      builder: (context) => Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          appBar: buildAppBar(context),
          body: _buildBody()),
    );
  }

  Widget buildName(String name, String mail) => Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            mail,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 30),
        ],
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return MaterialButton(
              onPressed: () {
                BlocProvider.of<ProfileBloc>(context)
                    .add(GetProfileInfoEvent());
              },
              child: Column(
                children: const [
                  Text(
                    "loadingggggg",
                    style: TextStyle(fontSize: 45),
                  ),
                ],
              ),
            );
          } else if (state is ProfileInfoState  ) {




            ProfileInfoSaved.name=state.profile_Info.data.name;
            ProfileInfoSaved.email =state.profile_Info.data.email;
            ProfileInfoSaved.imagePath= state.profile_Info.data.image;



            return ListView(
              physics: BouncingScrollPhysics(),
              children: [









                ProfileWidget(
                  imagePath: state.profile_Info.data.image,

                  //"https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",



                  onClicked: () {


                    print(ProfileInfoSaved.name,);





                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()


                      ),
                    )
                    ;
                  },
                ),












                const SizedBox(height: 24),
                buildName(state.profile_Info.data.name,
                    state.profile_Info.data.email),
                const SizedBox(height: 24),
                Center(
                    child: ButtonWidget2(
                  text: "Upgrade To PRO",
                  onClicked: () {},
                )),
                const SizedBox(height: 24),
                buildChangePasswordButton(
                    text: "change password", icon: UniconsLine.lock , onClicked: () {


                  //print(profileInfoSaved.name,);






                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ChnagePassword()),
                  );

                      },) ,
                buildChangePasswordButton(
                    text: "Invite Friend", icon: UniconsLine.invoice , onClicked: () {},),
                buildChangePasswordButton(
                    text: "Credit & Coupons", icon: UniconsLine.gift , onClicked: () {},),
                buildChangePasswordButton(
                    text: "Help Center", icon: UniconsLine.message , onClicked: () {},),
                buildChangePasswordButton(
                    text: "Payment", icon: UniconsLine.paypal , onClicked: () {},),
                buildChangePasswordButton(
                  text: "setting", icon: UniconsLine.setting , onClicked: () {},) ,
                buildChangePasswordButton(
                    text: "Log out", icon: UniconsLine.sign_out_alt , onClicked: () {

                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SplashScreen()


                    ),
                  )
                  ;
                },) ,
              ],
            );
          } else if (state is PassChangeState) {
            BlocProvider.of<ProfileBloc>(context).add((GetProfileInfoEvent()));

            return MaterialButton(
              onPressed: () {
                print(state.pass_Change);
                //BlocProvider.of<ProfileBloc>(context).add(UpdateEvent());
              },
              child: Text(
                "pass_Change",
                style: TextStyle(fontSize: 45),
              ),
            );
          }
          // else if (state is UpdateEventState) {
          //   return MaterialButton(
          //
          //     onPressed: (){
          //       print(state.updateEvent);
          //       BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());
          //
          //
          //
          //     },
          //     child: Text("updateEvent" ,style: TextStyle(
          //         fontSize: 45
          //
          //     ), ),
          //
          //
          //
          //   );
          // }

          else if (state is ErrorProfileState) {
            return MessageDisplayWidget(message: state.message);
          }

          else {
            BlocProvider.of<ProfileBloc>(context).add((GetProfileInfoEvent()));

            return MaterialButton(
                onPressed: () {
                  BlocProvider.of<ProfileBloc>(context)
                      .add(GetProfileInfoEvent());

                  //BlocProvider.of<ProfileBloc>(context).getProfileInfo;
                  print("i presed");
                },
                child: Container(
                  child: Text(
                    "nothing ",
                    style: TextStyle(fontSize: 45),
                  ),
                ));
          }
        },
      ),
    );
  }

  Widget buildChangePasswordButton(
          {required String text, required IconData icon  , required  VoidCallback onClicked, }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonWidget(
          icon: icon,
          text: text,
          onClicked:   onClicked
        ),
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
