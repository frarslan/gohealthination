import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/patients/models/patientsdetailmodel.dart';
import 'package:gohealthination/pages/patients/patients_service.dart';
import 'package:gohealthination/shared/custom_text.dart';

import 'models/patientsmodel.dart';

class PatientDetail extends StatefulWidget {
  int id;

   PatientDetail(this.id,{Key? key}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {

  final PatientsService _service = PatientsService();
  PatientsDetailModel _patientDetail = PatientsDetailModel();
  bool? isLoading;

  Color color1 = const Color(0xff3e2093);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);

  @override
  void initState() {
    super.initState();
    _service.bringPatientsDetail(widget.id).then((value){
      if(_service != null && value!= null)  {
        setState(() {
          _patientDetail=value;
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
    return WillPopScope(
      onWillPop: () async {

        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: color1,
          title: CustomText(text: 'Başvuru Detay',fontSize: 26.sp,color: Colors.white,),
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
                    CustomText(text: '${_patientDetail.patientId} ',),
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
                   child: CustomText(text: ' User Name: ${_patientDetail.patient?.email} ', fontSize: 24.sp)
               ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Email: ${(_patientDetail.patient?.email==null)?'--':_patientDetail.patient?.email}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Contact: ${(_patientDetail.patientId==null)?'--':_patientDetail.patientId}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Country: ${(_patientDetail.patientId==null)?'--':_patientDetail.patientId}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Process Date: ${(_patientDetail.patientId==null)?'--':_patientDetail.patientId}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Treatment: ${(_patientDetail.treatment==null)?'--':_patientDetail.treatment}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Subtreatment: ${(_patientDetail.subTreatment==null)?'--':_patientDetail.subTreatment}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Process Status: ${(_patientDetail.currency==null)?'--':_patientDetail.patientId}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Last Status Date: ${(_patientDetail.orderDate==null)?'--':_patientDetail.orderDate}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Discounted Price: ${(_patientDetail.discountedPrice==null)?'--':_patientDetail.discountedPrice}', fontSize: 24.sp)
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Doctors: ${(_patientDetail.id==null)?'--':_patientDetail.id}', fontSize: 24.sp)
              ),
            ],
          ),
        ) : const Center(child:  Text("Hata")) ,
      ),
    );
  }


}
