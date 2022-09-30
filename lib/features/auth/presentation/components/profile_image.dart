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
                ? Image.asset('assets/images/background.jpg',
                    height: 130.h, width: 130.h, fit: BoxFit.fill)
                : Image.file(cubit.profileImage!,
                    height: 130.h, width: 130.h, fit: BoxFit.fill),
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
                    child: IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.upload,
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
