import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task3_homepage/homepage.dart';

class EditDate extends StatefulWidget {
  const EditDate({Key? key}) : super(key: key);

  @override
  State<EditDate> createState() => _EditDateState();
}

class _EditDateState extends State<EditDate> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 205, 213),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homepage(),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color.fromARGB(255, 101, 99, 99),
                            size: 20,
                          )),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Center(
                          child: Text("Appointment",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 7, 79, 85),
                      margin: const EdgeInsets.only(left: 5, right: 20),
                      elevation: 5.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        side: BorderSide(
                            color: Color.fromARGB(255, 51, 207, 215)),
                      ),
                      child: TableCalendar(
                        // today's date
                        focusedDay: _focusDay,
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2023, 12, 31),
                        calendarFormat: _format,
                        currentDay: _currentDay,
                        daysOfWeekHeight: 40.0,
                        // height between the date rows, default is 52.0
                        rowHeight: 40.0,

                        // Calendar Header Styling
                        headerStyle: const HeaderStyle(
                          titleTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 55, 220, 220),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          formatButtonTextStyle:
                              TextStyle(color: Colors.red, fontSize: 16.0),
                          formatButtonDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 28,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        // Calendar Days Styling
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.white),
                          // Weekend days color (Sat,Sun)
                          weekendStyle: TextStyle(color: Colors.red),
                        ),
                        calendarStyle: const CalendarStyle(
                          // Weekend dates color (Sat & Sun Column)
                          weekendTextStyle: TextStyle(
                              color: Color.fromARGB(255, 178, 21, 21)),
                          // highlighted color for today
                          todayDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 81, 189, 225),
                            shape: BoxShape.circle,
                          ),
                          // highlighted color for selected day
                          selectedDecoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        onFormatChanged: (format) {
                          setState(() {
                            _format = format;
                          });
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _currentDay = selectedDay;
                            _focusDay = focusedDay;
                            _dateSelected = true;
                            if (selectedDay.weekday == 6 ||
                                selectedDay.weekday == 7) {
                              _isWeekend = true;
                              _timeSelected = false;
                              _currentIndex = null;
                            } else {
                              _isWeekend = false;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Available Time slots",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / .4),
                      ),
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _isWeekend
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 30),
                                      alignment: Alignment.center,
                                      child: Text(
                                          'Weekend is not available, please select another date',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber,
                                          ))),
                                    )
                                  : _currentIndex = index;
                              _timeSelected = true;
                            });
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => AppointmentPage(),
                            //     ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? Color.fromARGB(255, 58, 194, 212)
                                  : Color.fromARGB(255, 221, 239, 240),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                _isWeekend
                                    ? "Weekends are not available"
                                    : '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : null,
                                )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          width: 370,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 56, 191, 188),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("Book Appointment",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))))),
                    ),

                    //

                    // _isWeekend
                    //     ? CustomScrollView(
                    //         slivers: <Widget>[
                    //           SliverToBoxAdapter(
                    //             child: Container(
                    //               padding: const EdgeInsets.symmetric(
                    //                   horizontal: 10, vertical: 30),
                    //               alignment: Alignment.center,
                    //               child: Text(
                    //                   'Weekend is not available, please select another date',
                    //                   style: GoogleFonts.lato(
                    //                       textStyle: TextStyle(
                    //                     fontSize: 18,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.grey,
                    //                   ))),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     : SliverGrid(
                    //         delegate: SliverChildBuilderDelegate(
                    //           (context, index) {
                    //             return InkWell(
                    //               splashColor: Colors.transparent,
                    //               onTap: () {
                    //                 setState(() {
                    //                   _currentIndex = index;
                    //                   _timeSelected = true;
                    //                 });
                    //               },
                    //               child: Container(
                    //                 margin: const EdgeInsets.all(5),
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                     color: _currentIndex == index
                    //                         ? Colors.white
                    //                         : Colors.black,
                    //                   ),
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   color: _currentIndex == index
                    //                       ? Color.fromARGB(255, 52, 191, 201)
                    //                       : null,
                    //                 ),
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                    //                   style: GoogleFonts.lato(
                    //                       textStyle: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     color: _currentIndex == index
                    //                         ? Colors.white
                    //                         : null,
                    //                   )),
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //           childCount: 8,
                    //         ),
                    //         gridDelegate:
                    //             const SliverGridDelegateWithFixedCrossAxisCount(
                    //                 crossAxisCount: 4, childAspectRatio: 1.5),
                    //       ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _timemanage() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    _timeSelected = true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          _currentIndex == index ? Colors.white : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: _currentIndex == index
                        ? Color.fromARGB(255, 52, 191, 201)
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == index ? Colors.white : null,
                    )),
                  ),
                ),
              );
            },
            childCount: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.5),
        ),
      ],
    );
  }

  // Widget _tableCalendar() {
  //   return Card(
  //     // margin: const EdgeInsets.all(8.0),
  //     // elevation: 5.0,
  //     // shape: const RoundedRectangleBorder(
  //     //   borderRadius: BorderRadius.all(Radius.circular(10)),
  //     //   side: BorderSide(color: Colors.amber),
  //     // ),
  //     child: TableCalendar(
  //       focusedDay: _focusDay,
  //       firstDay: DateTime.now(),
  //       lastDay: DateTime(2023, 12, 31),
  //       calendarFormat: _format,
  //       currentDay: _currentDay,
  //       rowHeight: 48,
  //       headerStyle: HeaderStyle(
  //           formatButtonDecoration: BoxDecoration(color: Colors.blue)),

  //       // headerStyle: HeaderStyle(

  //       //   headerPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //       //   titleTextStyle: TextStyle(
  //       //     color: Colors.blue,
  //       //   ),

  //       // ),
  //       calendarStyle: const CalendarStyle(
  //         weekNumberTextStyle: TextStyle(color: Colors.black),
  //         weekendTextStyle: TextStyle(
  //           color: Colors.red,
  //         ),
  //         todayDecoration: BoxDecoration(
  //           color: Color.fromARGB(255, 66, 207, 214),
  //           shape: BoxShape.circle,
  //         ),
  //       ),
  //       availableCalendarFormats: const {
  //         CalendarFormat.month: 'Month',
  //       },
  //       onFormatChanged: (format) {
  //         setState(() {
  //           _format = format;
  //         });
  //       },
  //       onDaySelected: (selectedDay, focusedDay) {
  //         setState(() {
  //           _currentDay = selectedDay;
  //           _focusDay = focusedDay;
  //           _dateSelected = true;
  //           if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
  //             _isWeekend = true;
  //             _timeSelected = false;
  //             _currentIndex = null;
  //           } else {
  //             _isWeekend = false;
  //           }
  //         });
  //       },
  //     ),
  //   );
  // }
}
