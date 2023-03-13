import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/patients/patients_service.dart';
import 'package:gohealthination/pages/patients/patientsdetail.dart';
import 'package:gohealthination/shared/custom_text.dart';
import 'package:intl/intl.dart';

import 'models/patientsmodel.dart';

class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {

  final PatientsService _service = PatientsService();
  List<Result> _patients =[];
  bool? isLoading;

  Color color1 = const Color(0xff7367f0);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);


  @override
  void initState() {
    super.initState();
    _service.bringPatients().then((value){
      if(_service != null && value!= null)  {
        setState(() {
          _patients=value;
          isLoading=true;
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
    return  Scaffold(
      body: isLoading==null ? const Center(child: CircularProgressIndicator()) :
      isLoading == true ? ListView.builder(
          itemCount: _patients.length,
          itemBuilder: (context, index) => Card(
            elevation: 5,
            color:  Colors.white,
            shape: RoundedRectangleBorder(
         //     side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(height: 140.h, alignment: Alignment.center,
              child: ListTile(
                // leading: Image.asset('assets/kullan/ders.png'),
                trailing:
                SizedBox(
                  width: 100.w,
                  height: 140.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(text:'PRIORITY',fontSize: 14.sp,color: Colors.black38,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5).r,
                              decoration:   BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5).r,
                                color:Colors.green,
                              ),
                              child: const Icon(Icons.phone, color:  Colors.white )),
                          Container(
                              padding: const EdgeInsets.all(5).r,decoration:   BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5).r,
                            color:Colors.blue,
                          ),child: const Icon(Icons.remove_red_eye_outlined, color:  Colors.white )),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: ()  {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              PatientDetail(_patients[index].id!)));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text:"${_patients[index].patient?.fullname} ",fontSize: 26.sp),
                    CustomText(text:"${_patients[index].treatment}",fontSize: 20.sp,color: Colors.black38),
                    Container(width: 160.w,
                      alignment: Alignment.center,
                      decoration:   BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10).r,

                          color: Colors.red
                      ),
                      child: CustomText(text:DateFormat.yMMMEd('tr_TR')
                          .format(DateTime.parse(_patients[index].orderDate!)),fontSize: 20.sp, color: Colors.white),
                    ),
                  ],
                ),
              //  subtitle: CustomText(text:"${_patients[index].patient?.email} ",fontSize: 20.sp),
              ),
            ),
          )): const Center(child:  CustomText(text:"Hata")) ,

    );
  }
}
