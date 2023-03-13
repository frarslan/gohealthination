import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/freequote/models/detailmodel.dart';
import 'package:gohealthination/pages/freequote/quote_service.dart';
import 'package:gohealthination/shared/custom_text.dart';
import 'package:gohealthination/pages/freequote/models/treatmentwidemodel.dart' as treatment;

import '../../shared/custom_button.dart';

class QuoteDetail extends StatefulWidget {
  int id;

   QuoteDetail(this.id,{Key? key}) : super(key: key);

  @override
  State<QuoteDetail> createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
  List<treatment.Result> _treatment = [];
  final QuoteService _service = QuoteService();
  Detailmodel _quoteDetail = Detailmodel();
  bool? isLoading;

  Color color1 = const Color(0xff7367f0);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);

  @override
  void initState() {
    super.initState();
    _service.bringQuotesDetail(widget.id).then((value){
      if(_service != null)  {
        setState(() {
          _quoteDetail=value! ;
          isLoading=true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
    _service.bringtreatment().then((value){
      if(_service != null && value?.results != null)  {
        setState(() {
          _treatment=value!.results;

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
          title: CustomText(text: 'Forms Detail',fontSize: 26.sp,color: Colors.white,),
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
                        child: CustomText(text: '${_quoteDetail.firstName![0]}${_quoteDetail.lastName![0]}',fontSize: 70.sp)
                    ),
                  ),
                    CustomText(text: _quoteDetail.treatment != null && _treatment.any((t) => t.id == _quoteDetail.treatment)
                        ? _treatment.firstWhere((t) => t.id == _quoteDetail.treatment).nameTr ?? "---"
                        : "---",
                      fontSize: 20.sp,color: Colors.black38,
                    ),
                    CustomText(text: '${_quoteDetail.firstName} ${_quoteDetail.lastName}',fontSize: 26.sp,),
                  ],
                ),
              ),
              Container(
                height: 80.h,
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.all(10).r,
                  child: CustomText(text: 'Customer Details', fontSize: 28.sp,)),
              Container(
                padding:const EdgeInsets.fromLTRB(10,0,20,10).r ,
                child: Divider(
                  color: color1,
                  height: 3.h,
                ),
              ),
               Container(
                 padding:const EdgeInsets.all(10).r ,
                   child: CustomText(text: ' Full Name : ${_quoteDetail.firstName} ${_quoteDetail.lastName}', fontSize: 24.sp)
               ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Email : ${(_quoteDetail.email==null)?'yok':_quoteDetail.email}', fontSize: 24.sp)
              ),

              Container(
                padding:const EdgeInsets.all(10).r ,
                child: CustomText(text:'Treatment : ${_quoteDetail.treatment != null && _treatment.any((t) => t.id == _quoteDetail.treatment)
                    ? _treatment.firstWhere((t) => t.id == _quoteDetail.treatment).nameTr ?? "---"
                    : "---"}',
                  fontSize: 24.sp,
                ),
              ),
              Container(
                padding:const EdgeInsets.all(10).r ,
                child: CustomText(text:'Subtreatment : ${_quoteDetail.treatment != null &&_treatment.any((t) => t.id == _quoteDetail.treatment)
                    ? _treatment.firstWhere((t) => t.id == _quoteDetail.treatment).subTreatment.map((sub) => sub.nameTr ?? '')
                    .join(', ') : '---'}',
                  fontSize: 24.sp,
                ),
              ),
              Container(
                  padding:const EdgeInsets.all(10).r ,
                  child: CustomText(text: ' Phone Number : ${(_quoteDetail.phoneNumber==null)?'yok':_quoteDetail.phoneNumber}', fontSize: 24.sp)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 71).r,
                    width: 100.w,
                    child: CustomButton(
                      type: ButtonType.darkTheme,
                      text: 'Confirm',
                      function: () {
                        showConfirmDialog(widget.id);
                      },
                    )),
                  Container(
                      margin: const EdgeInsets.only(top: 71).r,
                      width: 100.w,
                      child: CustomButton(
                        type: ButtonType.redTheme,
                        text: 'Delete',
                        function: () {
                          showDeleteDialog(widget.id);
                        },
                      )),
                ],
              )
            ],
          ),
        ) : const Center(child:  Text("Hata")) ,
      ),
    );
  }

  void showConfirmDialog( int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Onay'),
        content: const Text('Bir teklif formunu onaylarsanız, sistem otomatik olarak sipariş ve kullanıcı oluşturacak. Bu teklif formunu onaylamak istediğinizden emin misiniz?'),
        actions: <Widget>[
          TextButton(
            child: const Text('İptal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Onayla'),
            onPressed: () async {
              Navigator.of(context).pop();
              await   _service.updateDetaill(id);
            },
          ),
        ],
      ),
    );
  }
  void showDeleteDialog(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Onay'),
        content: Text('Kayıt silinecek. Emin misin?'),
        actions: <Widget>[
          TextButton(
            child: Text('İptal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Onayla'),
            onPressed: () {
              Navigator.of(context).pop();
              _service.deleteQuote(id);
            },
          ),
        ],
      ),
    );
  }

}
