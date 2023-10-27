import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3_homepage/widgets/EditDate.dart';
import 'package:task3_homepage/widgets/upcoming_schedule.dart';
import 'package:task3_homepage/widgets/viewtasks.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scheduleWidgets = [
    UpcomingSchedule(),
  ];
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 47),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              child: Text(
                "Welcome,",
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                  color: Color.fromARGB(255, 45, 113, 113),
                  fontSize: 18,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 20),
                    child: Text(
                      "Hi Dr.James",
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(fontSize: 24),
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(221, 52, 50, 50)),
                      //color: const Color.fromARGB(221, 71, 71, 71)),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(2.0),
                  //   child: Image.asset(
                  //     'images/drmeera.jpg',
                  //     width: 60,
                  //     height: 70,
                  //   ),
                  // ),

                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/dr2.jpg"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                "Oct 22,2023",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 60, 130, 129),
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Today",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 68, 67, 67),
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  _editbuttontask(),
                ],
              ),
            ),
            _addDateBar(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                "Upcoming Appointments",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                "These are upcoming requests for appointments",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 16,
                )),
              ),
            ),
            SizedBox(height: 15),
            scheduleWidgets[0],
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                "View Test Result",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                "These are the test results from previous appointment",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 16,
                )),
              ),
            ),
            SizedBox(height: 15),
            Viewtasks(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => _viewmore()));
                    // Handle edit button press
                  },
                  icon: Icon(
                    Icons.read_more,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: Text(
                    'View More',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 227, 208),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editbuttontask() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditDate()));
          // Handle edit button press
        },
        icon: Icon(
          Icons.edit,
          color: Colors.white,
          size: 17,
        ),
        label: Text(
          'Edit',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 31, 227, 208),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Color.fromARGB(255, 49, 218, 212),
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 91, 89, 89))),
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _viewmore() {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 56, horizontal: 15),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromARGB(31, 183, 36, 36),
        //     blurRadius: 4,
        //     spreadRadius: 2,
        //   )
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Text(
                "Last Appointment Details",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Mr. Anuj at 9 oct 2023, 5:41 pm",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                )),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Image.asset(
                              "images/tick.png",
                              height: 40,
                              width: 40,
                            ),
                          ),

                          // Image(
                          //   radius: 27,
                          //   backgroundImage: AssetImage(
                          //     "images/tick.png}",
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
