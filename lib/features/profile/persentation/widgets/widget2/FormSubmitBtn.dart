import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;


  const FormSubmitBtn({
    Key? key,
    required this.onPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: StadiumBorder(),
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit) ,
              SizedBox(width: 5,),
              Text("Update" )

            ],
          ),
          onPressed: onPressed

      );

  }
}