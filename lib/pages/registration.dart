import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idz_assignment_1/enums.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  static const routeName = 'registration_page';

  final nameTextFieldController = TextEditingController();
  final birthDateMonthTextFieldController = TextEditingController();
  final birthDateDayTextFieldController = TextEditingController();
  final birthDateYearTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 28, right: 28, top: 118, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //headline large
              Text('Welcome User', style: textTheme.headlineLarge),
              const SizedBox(height: 2),
              //headline small
              Text('Please enter your details', style: textTheme.headlineSmall),
              const SizedBox(height: 28),
              //name
              Text('Name', style: textTheme.titleLarge),
              const SizedBox(height: 4),
              TextField(
                style: GoogleFonts.quicksand(fontWeight: FontWeight.w600),
                decoration: const InputDecoration(hintText: 'Enter Your Name'),
              ),
              const SizedBox(height: 28),
              //birth date
              Text('Birth Date', style: textTheme.titleLarge),
              const SizedBox(height: 4),
              StatefulBuilder(
                builder: (context, setState) {
                  return InkWell(
                    onTap: () async {
                      var birthDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(1960),
                          firstDate: DateTime(1700),
                          lastDate: DateTime.now());
                      if (birthDate != null) {
                        birthDateDayTextFieldController.text =
                            birthDate.day.toString();
                        birthDateMonthTextFieldController.text =
                            Months.values[birthDate.month - 1].name;
                        birthDateYearTextFieldController.text =
                            birthDate.year.toString();
                      }
                    },
                    child: Row(children: [
                      Expanded(
                          child: TextField(
                        style:
                            GoogleFonts.quicksand(fontWeight: FontWeight.w600),
                        controller: birthDateMonthTextFieldController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Month',
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      )),
                      Expanded(
                        child: TextField(
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600),
                            controller: birthDateDayTextFieldController,
                            enabled: false,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: 'Day',
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            )),
                      ),
                      Expanded(
                          child: TextField(
                        style:
                            GoogleFonts.quicksand(fontWeight: FontWeight.w600),
                        controller: birthDateYearTextFieldController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            hintText: 'Year',
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(8),
                              ),
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                      )),
                    ]),
                  );
                },
              ),
              const SizedBox(height: 28),
              //email id
              Text('Email Id', style: textTheme.titleLarge),
              const SizedBox(height: 4),
              TextField(
                style: GoogleFonts.quicksand(fontWeight: FontWeight.w600),
                decoration:
                    const InputDecoration(hintText: 'Enter Your Email Id'),
              ),
              const SizedBox(height: 28),
              //submit button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(double.maxFinite, 42),
                      backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: Text('Submit',
                      style:
                          GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }
}
