import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cubit/auth_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.onPressed,
    required this.cubit,
  }) : super(key: key);

  final VoidCallback onPressed;
  final AuthCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          ClipOval(
            child: cubit.profileImage == null
                ? Image.asset('assets/images/person.png',
                    height: 128.h, width: 128.h, fit: BoxFit.cover)
                : Image.file(cubit.profileImage!,
                    height: 128.h, width: 128.h,  fit: BoxFit.cover,),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(

                height: 45.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.w)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.upload,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
