import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:booking_app/core/utils/snekarMessage.dart';
import 'package:booking_app/features/profile/data/models/pass_change_model.dart';
import 'package:booking_app/features/profile/domain/entities/pass.dart';
import 'package:booking_app/features/profile/domain/entities/profile_info_saved.dart';
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

class ChnagePassword extends StatefulWidget {
  @override
  _ChnagePasswordState createState() => _ChnagePasswordState();
}

class _ChnagePasswordState extends State<ChnagePassword> {
  User user = UserPreferences.myUser;
  final _formKey = GlobalKey<FormState>();
  static TextEditingController _emaiController = TextEditingController();
  static TextEditingController _titleController = TextEditingController();
  static TextEditingController _bodyController = TextEditingController();
  Color colorTitleFocus = Colors.blue;
  Color colorBodyFocus = Colors.blue;
  Color colorBody2Focus = Colors.blue;

  Color colorTitleBoder = Colors.black26;
  Color colorBodyBorder = Colors.black26;
  Color colorBody2Border = Colors.black26;

  //var data2;
  String file = "";
  static File? file2;

  //String name='';
  //String mail='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emaiController.text = ProfileInfoSaved.email!;

    //print(ProfileInfoSaved.name);
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
            backgroundColor: Colors.grey.shade900,
            appBar: buildAppBar(context),
            body: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is PassChangeState) {
                  if (state.pass_Change.status.type == "0") {
                    print("0000000000000000000000000000000000000000000000");

                    if (_titleController.text == "") {
                      colorTitleFocus = Colors.red;
                      colorTitleBoder = Colors.red;
                    } else if (_bodyController.text == "") {
                      colorBodyFocus = Colors.red;
                      colorBodyBorder = Colors.red;
                    } else if (_emaiController.text == "") {
                      colorBody2Focus = Colors.red;
                      colorBody2Border = Colors.red;
                    }

                    SnackBarMessage().showErrorSnackBar(
                        message: state.pass_Change.status.title.en,
                        context: context);
                  } else {
                    SnackBarMessage().showSuccessSnackBar(
                        message: state.pass_Change.status.title.en,
                        context: context);

                    colorTitleFocus = Colors.blue;
                    colorTitleBoder = Colors.black26;
                    colorBodyFocus = Colors.blue;
                    colorBodyBorder = Colors.black26;
                    colorBodyFocus = Colors.blue;
                    colorBodyBorder = Colors.black26;

                    BlocProvider.of<ProfileBloc>(context)
                        .add((GetProfileInfoEvent()));

                    Timer(Duration(seconds: 1), () {
                      print("Yeah, this line is printed after 3 seconds");
                      FocusManager.instance.primaryFocus?.unfocus();  //keyboard closing
                      Navigator.pop(context);
                    });
                  }
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        TextFieldWidget(
                          controller: _emaiController,
                          label: 'Email',
                          text: user.email,
                          color: colorBody2Focus,
                          color2: colorBody2Border,
                          onChanged: (email) {},
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          controller: _titleController,
                          label: 'Password',
                          text: "saddddddddddd",
                          color: colorTitleFocus,
                          color2: colorTitleBoder,
                          obsecure: true,
                          keyboardType: TextInputType.number,
                          onChanged: (name) {
                            print(name);
                          },
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          controller: _bodyController,
                          label: 'Confirmation',
                          text: user.email,
                          color: colorBodyFocus,
                          color2: colorBodyBorder,
                          keyboardType: TextInputType.number,
                          obsecure: true,
                          onChanged: (email) {},
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

    if (_emaiController.text == ProfileInfoSaved.email) {
      colorBody2Focus = Colors.blue;
      colorBody2Border = Colors.black26;
      if (isValid) {
        print("hererererere");

        final pass = Pass(
          password: _titleController.text,
          confirmation: _bodyController.text,
          mail: _emaiController.text,
        );
        print(_titleController);
        print(_bodyController);

        BlocProvider.of<ProfileBloc>(context)
            .add((PassChangeEvent(pass: pass)));

        if (_titleController.text.isNotEmpty) {
          colorTitleFocus = Colors.blue;
          colorTitleBoder = Colors.black26;
        } else if (_bodyController.text.isNotEmpty) {
          colorBodyFocus = Colors.blue;
          colorBodyBorder = Colors.black26;
        } else if (_emaiController.text.isNotEmpty) {
          colorBody2Focus = Colors.blue;
          colorBody2Border = Colors.black26;
        }
      }
    } else {
      colorBody2Focus = Colors.red;
      colorBody2Border = Colors.red;
      setState(() {});

      SnackBarMessage().showErrorSnackBar(
          message: "Please enter ur valid email", context: context);
    }
  }

  Future<File?> getImage() async {
    File? _image;
    final ImagePicker _picker = ImagePicker();

    var _pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    if (_pickedFile != null) {
      _image = File(_pickedFile.path);
    }

    // var ttt=_pickedFile?.path;
    // if(ttt!= null){
    //   _image = File (ttt);
    //   print("pathhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    //   print(_image);
    // }
    print(_image);

    file2 = _image;
    setState(() {});
  }
}
