import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/patients/patients_service.dart';
import 'package:gohealthination/shared/custom_text.dart';

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

  Color color1 = const Color(0xff3e2093);
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
            elevation: 3,
            color:  Colors.white70,
            shape: RoundedRectangleBorder(
         //     side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(height: ScreenUtil().setHeight(100), alignment: Alignment.center,
              child: ListTile(
                // leading: Image.asset('assets/kullan/ders.png'),
                trailing:
                Icon(Icons.arrow_forward, color:  color1 ),
                onTap: ()  {
               /*   Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              QuoteDetail(_quotes[index].id!)));*/

                },
                title: CustomText(text:"${_patients[index].id}. ${_patients[index].firstName} ",fontSize: 26.sp),
                subtitle: CustomText(text:_patients[index].email,fontSize: 20.sp),
              ),
            ),
          )): const Center(child:  CustomText(text:"Hata")) ,

    );
  }
}
