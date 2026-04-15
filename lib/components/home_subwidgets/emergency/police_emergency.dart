import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:safety_companion/utils/app_colors.dart';

class PoliceEmergency extends StatelessWidget {
  const PoliceEmergency({super.key});

  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 4, bottom: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          // onTap: () => _callNumber(''),
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.78,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.emergencyDark,
                      AppColors.emergencyPrimary,
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          AppColors.emergencyLight.withOpacity(0.35),
                      child: Image.asset('assets/alert.png'),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Active Emergency',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                              )),
                          Text('Dial 1-1-9 for emergencies',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                              )),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.fieldBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text('1-1-9',
                                  style: TextStyle(
                                    color: AppColors.emergencyPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
