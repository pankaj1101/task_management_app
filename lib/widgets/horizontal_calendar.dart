import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/constants/constants_export.dart';

// IMPORTANT: In a real Flutter project, 'AppColors' would be imported from a constants file.
// For this single-file demonstration context, we'll redefine the minimum colors needed.

// Helper to remove time component for robust date comparison (Date time: 00:00:00)
DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

/// StateProvider to track the date selected in the Horizontal Calendar.
final selectedDateProvider = StateProvider<DateTime>((ref) {
  // Initialize with today's date (time stripped)
  return _dateOnly(DateTime.now());
});

// New Provider to control the start day of the 33-day viewing window.
// Changing this shifts the entire date range visible in the ListView.
final calendarViewStartDayProvider = StateProvider<DateTime>((ref) {
  // Default start day is 3 days before today.
  return _dateOnly(DateTime.now().subtract(const Duration(days: 3)));
});

/// A widget that displays a horizontally scrollable list of dates with month navigation.
class HorizontalCalendar extends ConsumerWidget {
  const HorizontalCalendar({super.key});

  // Generate a list of dates starting from the date provided by the provider.
  List<DateTime> _getDates(WidgetRef ref) {
    // Watch the current start day of the view window
    final startDate = ref.watch(calendarViewStartDayProvider);
    // Generate a fixed range of 33 days from that start date
    return List.generate(33, (index) => startDate.add(Duration(days: index)));
  }

  // Helper to format the day of the week
  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  // Helper to format the month name
  String _getMonthName(DateTime date) {
    switch (date.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  // Action when a navigation button is pressed
  void _navigateMonth(WidgetRef ref, bool isNext) {
    // FIX: Base the navigation logic on the currently selected date,
    // which drives the month name display.
    final selectedDate = ref.read(selectedDateProvider);

    // Calculate the month index for the target month
    final newMonth = isNext ? selectedDate.month + 1 : selectedDate.month - 1;

    // Calculate the first day of the target month (Dart handles year rollover correctly)
    final newMonthFirstDay = _dateOnly(
      DateTime(selectedDate.year, newMonth, 1),
    );

    // We want the new view to start 3 days before the first day of the target month
    final newStartDay = newMonthFirstDay.subtract(const Duration(days: 3));

    // 1. Update the starting date for the 33-day view window, forcing a ListView rebuild
    ref.read(calendarViewStartDayProvider.notifier).state = newStartDay;

    // 2. Also update the selected date to the first day of the new month
    ref.read(selectedDateProvider.notifier).state = newMonthFirstDay;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the providers
    final selectedDate = ref.watch(selectedDateProvider);
    final currentStartDay = ref.watch(calendarViewStartDayProvider);
    final dates = _getDates(ref); // Get dates based on the view provider

    // Find the index of the selected date within the current 33-day window to scroll to it.
    final selectedIndex = dates.indexWhere(
      (date) => _dateOnly(date).isAtSameMomentAs(selectedDate),
    );

    // Calculate the scroll offset to center the newly selected date (first of the new month)
    final initialScrollOffset =
        (selectedIndex != -1)
            ? (60.0 * selectedIndex + 8.0 * selectedIndex)
            : 0.0;

    // Use a unique key to force the ListView to fully rebuild and apply initialScrollOffset
    // when the view range (currentStartDay) changes.
    final listViewKey = ValueKey(currentStartDay.millisecondsSinceEpoch);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            spacing: 20.r,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Button (Previous Month)
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20.r,
                  color: AppColors.blackColor,
                ),
                onPressed: () => _navigateMonth(ref, false),
              ),

              // Month Name
              Text(
                // Displays the month of the currently selected date
                '${_getMonthName(selectedDate)} ${selectedDate.year}',
                style: TextStyle(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),

              // Right Button (Next Month)
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.r,
                  color: AppColors.blackColor,
                ),
                onPressed: () => _navigateMonth(ref, true),
              ),
            ],
          ),
        ),

        // >>> HORIZONTAL DATE LIST <<<
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            key: listViewKey, // Key forces reset on month change
            scrollDirection: Axis.horizontal,
            // The ScrollController sets the initial position to the newly selected date
            controller: ScrollController(
              initialScrollOffset: initialScrollOffset,
            ),
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = _dateOnly(dates[index]);

              final isSelected = date.isAtSameMomentAs(selectedDate);

              final bgColor =
                  isSelected ? AppColors.primaryColor : AppColors.dateCardS;
              final textColor =
                  isSelected ? AppColors.whiteColor : AppColors.grey1Color;

              return GestureDetector(
                onTap: () {
                  // Update the selected date provider on tap
                  ref.read(selectedDateProvider.notifier).state = date;
                },
                child: Container(
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _getDayOfWeek(date),
                        style: TextStyle(
                          fontSize: 12.r,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          fontSize: 14.r,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
