import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

void showSelectTimeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(16.r),
    ),
    builder: (BuildContext bContext) {
      final DateTime inputDateTime = DateTime.now();
      final formatter = DateFormat('MMM d, yyyy');
      final fullWeekdayFormatter = DateFormat('EEEE');
      final String formattedDate = formatter.format(inputDateTime);
      final String fullWeekday = fullWeekdayFormatter.format(inputDateTime);

      print(formattedDate);
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bContext).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Text(fullWeekday), Text(formattedDate)],
        ),
      );
    },
  );
}
