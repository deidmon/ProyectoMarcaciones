//import 'package:app_marcaciones/app/ui/components/templates/ctn_control.dart';
import 'package:app_marcaciones/app/ui/components/templates/ctn_control.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CtnCalendar extends StatelessWidget {
  const CtnCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime> punctual = [
      DateTime(2023, 8, 18),
      DateTime(2023, 8, 22),
    ];
    List<DateTime> absent = [
      DateTime(2023, 8, 02),
    ];
    List<DateTime> justified = [
      DateTime(2023, 8, 11),
    ];
    DateRangePickerController _controller = DateRangePickerController();
    return Container(
      width: 400.0,
      height: MediaQuery.of(context).size.height * 0.4,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 48, 120),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: 200.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: SfDateRangePicker(
              allowViewNavigation: false,
              enablePastDates: false,
              headerStyle: const DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
              ),
              showNavigationArrow: true,
              selectionShape: DateRangePickerSelectionShape.circle,
              selectionColor: Colors.transparent,
              cellBuilder: (BuildContext context,
                  DateRangePickerCellDetails cellDetails) {
                final DateTime currentDate = cellDetails.date;
                bool ispunctual = punctual.contains(currentDate);
                bool isabsent = absent.contains(currentDate);
                bool isjustified = justified.contains(currentDate);

                Color cellColor = ispunctual
                    ? Colors.green
                    : isabsent
                        ? Colors.red
                        : isjustified
                            ? Colors.yellow
                            : Colors.transparent;

                DateTime today = DateTime.now();
                if (currentDate.year == today.year &&
                    currentDate.month == today.month &&
                    currentDate.day == today.day) {
                  cellColor = Color.fromARGB(
                      255, 132, 155, 209); // Resaltar el día de hoy
                }
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //border: Border.all(color: cellColor, width: 3.0),
                    color: cellColor,
                  ),
                  child: Center(
                    child: Text(
                      currentDate.day.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
          const CtnControl(),
        ],
      ),
    );
  }
}
