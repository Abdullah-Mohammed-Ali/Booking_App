import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final IconData icon;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(


    child: DecoratedBox(
      decoration: BoxDecoration( border: Border( bottom: BorderSide(color: Colors.grey.withOpacity(0.2)), ), ),
      child: ElevatedButton(




            style: ElevatedButton.styleFrom(
            // shape: StadiumBorder(),
              onPrimary: Colors.white,
              primary: Colors.grey.shade900,
              elevation: 0,
              enableFeedback: false,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,


                // side: BorderSide(width: 0, color: Colors.grey.withOpacity(0.3),),








              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),


            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text ,style: TextStyle(fontSize: 12),),
                    Icon(icon , color:Colors.grey,),
                  ],
                ),
                SizedBox(height: 5,),

              ],
            ),
            onPressed: onClicked,
          ),
    ),
  );
}
