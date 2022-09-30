import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final Color color;
  final Color color2;
  TextInputType keyboardType;
  bool obsecure;
  final ValueChanged<String> onChanged;
  TextEditingController controller;

   TextFieldWidget({
    Key? key,
     this.keyboardType=TextInputType.name,
    this.maxLines = 1,
     this.obsecure=false,
    required this.label,
    required this.text,
    required this.onChanged,
     required this.controller,
      this.color=Colors.blue,
      this.color2=Colors.black26,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  //late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    //widget.controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
   //widget.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 , color: Colors.white),
          ),
          const SizedBox(height: 8),
          TextFormField(

            keyboardType: widget.keyboardType,
           // Only numbers can be entered
            obscureText: widget.obsecure,

            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13),

            controller: widget.controller,




            decoration: InputDecoration(

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(12),
              ),

              enabledBorder:  OutlineInputBorder(
                borderSide:  BorderSide(color: widget.color2, width: 2.0),
                borderRadius: BorderRadius.circular(12),
              ),

                focusedBorder:
                OutlineInputBorder(
                  borderSide:  BorderSide(color: widget.color, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),

            ),
            maxLines: widget.maxLines,
          ),
        ],
      );
}
