import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:booking_app/core/utils/snekarMessage.dart';
import 'package:booking_app/features/explore/persentation/widgets/loading.dart';
import 'package:booking_app/features/profile/data/models/pass_change_model.dart';
import 'package:booking_app/features/profile/domain/entities/profile_info_saved.dart';
import 'package:booking_app/features/profile/persentation/pages/profilePage.dart';
import 'package:booking_app/features/profile/persentation/pages/user_predrences.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/appbar_widget.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/profileWidget2.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/profile_widget.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/update.dart';
import 'package:image_picker/image_picker.dart';
import 'package:booking_app/features/profile/domain/entities/saved_variables.dart';
import 'package:booking_app/features/profile/persentation/bloc/profile_bloc.dart';
import 'package:booking_app/features/profile/persentation/pages/user.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/FormSubmitBtn.dart';
import 'package:booking_app/features/profile/persentation/widgets/widget2/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/update.dart';
import 'package:image_picker/image_picker.dart';




class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  final _formKey = GlobalKey<FormState>();
  static TextEditingController _titleController = TextEditingController();
  static TextEditingController _bodyController = TextEditingController();
  Color colorTitleFocus=Colors.blue;
  Color colorBodyFocus=Colors.blue;
  Color colorTitleBoder=Colors.black26;
  Color colorBodyBorder=Colors.black26;
  //ProfileInfoSaved profileInfoSaved =ProfileInfoSaved();
  //var data2;
  File file=File("");
  static File ?file2;

  //String name='';
  //String mail='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(ProfileInfoSaved.name,);

    _titleController.text=ProfileInfoSaved.name!;
    _bodyController.text=ProfileInfoSaved.email!;


  }

  @override
  Widget build(BuildContext context) =>
      Builder(
        builder: (context) =>
            Scaffold(
              backgroundColor: Colors.grey.shade900,
              appBar:  AppBar(

              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [

              ],
            ),
              body: BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {





                  if (state is UpdateInfoState) {
                    if (state.updateEvent.status.type == "0") {

                     if(_titleController.text ==""){
                       colorTitleFocus=Colors.red;
                       colorTitleBoder=Colors.red;
                     }
                     else if (_bodyController.text==""){
                       colorBodyFocus=Colors.red;
                       colorBodyBorder=Colors.red;
                     }






                     FocusManager.instance.primaryFocus?.unfocus();  //keyboard closing
                     Navigator.pop(context);// for circlar progress indicator




                     SnackBarMessage().showErrorSnackBar(
                          message: state.updateEvent.status.title.en,
                          context: context);
                    }

                    else {
                      SnackBarMessage().showSuccessSnackBar(
                          message: state.updateEvent.status.title.en,
                          context: context);

                      colorTitleFocus=Colors.blue;
                      colorTitleBoder=Colors.black26;
                      colorBodyFocus=Colors.blue;
                      colorBodyBorder=Colors.black26;

                      BlocProvider.of<ProfileBloc>(context).add((GetProfileInfoEvent()));

                      Timer(Duration(seconds: 1), () {
                        print("Yeah, this line is printed after 3 seconds");
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => ProfilePage()),
                        // );

                        FocusManager.instance.primaryFocus?.unfocus();  //keyboard closing
                        Navigator.pop(context);

                        Navigator.pop(context);


                      });


                    }
                  }
                },

                builder: (context, state) {


                  return   Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [

                          file2!=null?

                      ProfileWidget2(
                      imagePath: file2!,
                      isEdit: true,
                        onClicked: () async {
                          getImage();

                        },
                      )


                          // Image.file(
                          //   file2!,
                          //   fit: BoxFit.contain,
                          // )
                          //


                              :

                          ProfileWidget(
                            imagePath:

                            ProfileInfoSaved.imagePath!,
                           //"https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                            isEdit: true,
                            onClicked: () async {
                              getImage();

                            },
                          ),
                          const SizedBox(height: 24),
                          TextFieldWidget(

                            controller: _titleController,
                            label: 'Full Name',
                            text: "saddddddddddd",
                            color: colorTitleFocus,
                            color2: colorTitleBoder,
                            onChanged: (name) {

                              print(name);


                            },
                          ),
                          const SizedBox(height: 24),
                          TextFieldWidget(
                            controller: _bodyController,
                            label: 'Email',
                            text: user.email,
                            color: colorBodyFocus,
                            color2: colorBodyBorder,
                            onChanged: (email) {


                            },
                          ),


                          const SizedBox(height: 24),

                          Container(
                            width: 200,
                            child: FormSubmitBtn(

                              onPressed: validateFormThenUpdateOrAddPost,


                            ),
                          ),

                          // FormSubmitBtn(
                          //
                          //   onPressed:()=> _upload()
                          //
                          //
                          //
                          // )


                        ],
                      ),
                    ),
                  );
                },
              )),



















            );



  void validateFormThenUpdateOrAddPost() {

    final isValid = _formKey.currentState!.validate();


    if (isValid) {

      print("hererererere");



      final update =  file2!=null? Update(
        name: _titleController.text,
        email: _bodyController.text,
        imagePath:file2!,
      ) :

      Update(
        name: _titleController.text,
        email: _bodyController.text,
        imagePath:"",
      );

      print(_titleController);
      print(_bodyController);

      //
      showDialog(
        context: context,
        builder: (context) => ScaffoldMessenger(
          child: Builder(
            builder: (context) => Container(
              height: 30,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  // onTap: () => Navigator.of(context).pop(),
                  child: GestureDetector(
                    onTap: () {},
                    child:    AlertDialog(
                      elevation: 0,
                      backgroundColor: Colors.transparent,


                        content:  Padding(
                          padding: const EdgeInsets.only(top: 350.0),
                          child: Loading(),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
      );











      BlocProvider.of<ProfileBloc>(context).add((UpdateEvent(update: update)));



      if(_titleController.text .isNotEmpty){
        colorTitleFocus=Colors.blue;
        colorTitleBoder=Colors.black26;
      }
      else if (_bodyController.text.isNotEmpty){
        colorBodyFocus=Colors.blue;
        colorBodyBorder=Colors.black26;
      }








    }




    }



  Future<File?> getImage() async {
    File?  _image;
    final ImagePicker _picker = ImagePicker();

    var _pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500,  // <- reduce the image size
        maxWidth: 500);

    if(_pickedFile!=null){
      _image = File (_pickedFile.path);

    }

     print(_image);
    file2=_image;
    setState(() {

    });

  }






}