import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Center(
        child: Text(
          text,
          style: context.textTheme.bodyMedium?.copyWith(fontSize: 44.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
