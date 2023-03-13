import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/patients/models/patientsdetailmodel.dart';
import 'package:gohealthination/pages/patients/patients_service.dart';
import 'package:gohealthination/shared/custom_text.dart';

import 'models/patientsusermodel.dart';

class PatientDetail extends StatefulWidget {
  int id;

   PatientDetail(this.id,{Key? key}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {

  final PatientsService _service = PatientsService();
  PatientsDetailModel _patientDetail = PatientsDetailModel();
  PatientsUsermodel _patientsUser = PatientsUsermodel();
  bool? isLoading;

  Color color1 = const Color(0xff7367f0);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);
 // final List<String> items = List.generate(10, (index) => "Item ${index + 1}");
 // final List<Color> colors = List.generate(10, (index) => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

  @override
  void initState() {
    super.initState();
    _service.bringPatientsDetail(widget.id).then((value) {
      if (value != null && value.patientId != null) {
        setState(() {
          _patientDetail = value;
          isLoading = true;
        });

        _service.bringPatientsUsersDetail(_patientDetail.patientId!).then((value) {
          if (value != null) {
            setState(() {
              _patientsUser = value;
              isLoading = true;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_patientsUser.profile?.phoneNumber);
    return WillPopScope(
      onWillPop: () async {

        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: color1,
          title: CustomText(text: 'Patient Details',fontSize: 26.sp,color: Colors.white,),
        ),
        body:isLoading==null ? const Center(child: CircularProgressIndicator()) :
        isLoading == true ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                  Card(
                    margin: const EdgeInsets.all(10).r,
                  elevation: 3,
                  color:  Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: color2, width: ScreenUtil().setWidth(2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Container(
                        padding:const EdgeInsets.all(10).r,
                        child: CustomText(text: '${_patientDetail.patient?.fullname![0]}${_patientDetail.patient?.fullname![1]}',fontSize: 70.sp)
                    ),
                  ),
                      CustomText(text: '${_patientDetail.patient?.fullname}',),
                    //CustomText(text: '${_patientsUser?.dateJoined ?? "Bekleyin"}'),
                  ],
                ),
              ),
              Container(
                height: 40.h,
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.all(10).r,
                  child: CustomText(text: 'Details', fontSize: 28.sp,)),
              Container(
                padding:const EdgeInsets.fromLTRB(10,0,20,10).r ,
                child: Divider(
                  color: color2,
                  height: 3.h,
                ),
              ),
               Container(
                 padding:const EdgeInsets.all(10).r ,
                   child: CustomText(text: ' User Name: ${_patientDetail.patient?.email} ', fontSize: 20.sp)
               ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Email: ${(_patientDetail.patient?.email==null)?'--':_patientDetail.patient?.email}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Contact: ${(_patientsUser.profile?.phoneNumber==null)?'--':_patientsUser.profile?.phoneNumber}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Country: ${(_patientsUser.profile?.country==null)?'--':_patientsUser.profile?.country}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Process Date: ${(_patientDetail.orderDate==null)?'--':_patientDetail.orderDate}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Treatment: ${(_patientDetail.treatment==null)?'--':_patientDetail.treatment}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Subtreatment: ${(_patientDetail.subTreatment==null)?'--':_patientDetail.subTreatment}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: 'Process Status: ${(_patientDetail.orderStatus.isNotEmpty && _patientDetail.orderStatus.first?.name != null) ? _patientDetail.orderStatus.first?.name : "--"}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Last Status Date: ${(_patientDetail.orderStatus.isNotEmpty && _patientDetail.orderStatus.last?.statusCreatedAt!=null)?_patientDetail.orderStatus.last?.statusCreatedAt : '--'}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Discounted Price: ${(_patientDetail.orderStatus.isNotEmpty && _patientDetail.discountedPrice!= null)?_patientDetail.discountedPrice :'--'}', fontSize: 20.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Doctors: ${(_patientDetail.doctors)}', fontSize: 20.sp)
              ),
              Container(height: 40.h,
                color:Colors.black12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _patientDetail.orderStatus.length,
                  itemBuilder: (context, index) {
                    final random = Random();
                    final color = Color.fromRGBO(
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                      1,
                    );
                    return Container(
                      width: 30.w,
                      height: 40.h,
                      color: color,
                      child: Center(
                        child: Text(
                          _patientDetail.orderStatus.reversed.toList()[index]!.name!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(

                  children: [
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: CustomText(text: 'Online Meetings', fontSize: 26.sp, fontWeight: FontWeight.bold,)
                    ),
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Date', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Participants', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Meeting Note', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Link', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(

                  children: [
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: CustomText(text: 'Flight', fontSize: 26.sp, fontWeight: FontWeight.bold,)
                    ),
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'From', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'To', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Date', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Airlines', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(

                  children: [
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: CustomText(text: 'Hotel', fontSize: 26.sp, fontWeight: FontWeight.bold,)
                    ),
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Check In', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Check Out', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Reservation Date', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Hotal Name', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(

                  children: [
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: CustomText(text: 'Hospital', fontSize: 26.sp, fontWeight: FontWeight.bold,)
                    ),
                    Container(
                        padding:const EdgeInsets.all(10).r ,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Ope. Date', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Date of Entry', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Date of Exit', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: 'Hospital Name', fontSize: 20.sp)
                                ),
                                Container(
                                    padding:const EdgeInsets.all(10).r ,
                                    child: CustomText(text: '----', fontSize: 20.sp)
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ) : const Center(child:  Text("Hata")) ,
      ),
    );
  }


}
