import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idz_assignment_1/database/user_database.dart';
import 'package:idz_assignment_1/enums.dart';
import 'package:intl/intl.dart';

import '../models/user_model.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  static const routeName = 'user_details_page';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 28, right: 28, top: 64, bottom: 28),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Registration Successful',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your Details are Submitted Successfully',
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Table(
                      border: TableBorder.all(color: Colors.grey),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('Name',
                                textAlign: TextAlign.center,
                                style: textTheme.titleMedium),
                          ),
                          Text('Birthday',
                              textAlign: TextAlign.center,
                              style: textTheme.titleMedium),
                          Text('Email Id',
                              textAlign: TextAlign.center,
                              style: textTheme.titleMedium),
                        ])
                      ]),
                  FutureBuilder<List<UserModel>>(
                    future: UserDatabase.instance.readAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(color: Colors.grey),
                          children: snapshot.data!
                              .map((e) => TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        e.name,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '${Months.values[e.birthDate.month - 1].name} ${e.birthDate.day}${ordinal(e.birthDate.day)} ${e.birthDate.year}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        e.emailId,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ]))
                              .toList(),
                        );
                      }
                      return const Center(child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      ));
                    },
                  )
                ]),
          ),
        ),
      ),
      onWillPop: () async {
        await UserDatabase.instance.close();
        return Future.value(true);
      },
    );
  }

  String ordinal(int number) {
    switch (number) {
      case 1:
      case 21:
      case 31:
        return 'st';
      case 2:
      case 22:
        return 'nd';
      case 3:
      case 23:
        return 'rd';
      default:
        return 'th';
    }
  }
}
