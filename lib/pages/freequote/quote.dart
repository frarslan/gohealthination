import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/freequote/models/treatmentwidemodel.dart' as treatment;
import 'package:gohealthination/pages/freequote/models/freequotemodel.dart';
import 'package:gohealthination/pages/freequote/quote_service.dart';
import 'package:gohealthination/pages/freequote/quotedetail.dart';
import 'package:gohealthination/shared/custom_text.dart';
import 'package:intl/intl.dart';

import 'models/freequotemodel.dart';

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  final QuoteService _service = QuoteService();
    List<treatment.Result> _treatment = [];
    List<Result> _quotes = [];
  bool? isLoading;

  Color color1 = const Color(0xff7367f0);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);

  @override
  void initState() {
    super.initState();
    _service.bringQuotes().then((value){
      if(_service != null && value?.results != null)  {
        setState(() {
          _quotes=value!.results!;
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
    return  Scaffold(
       body: isLoading==null ? const Center(child: CircularProgressIndicator()) :
    isLoading == true ? ListView.builder(
    itemCount: _quotes.length,
    itemBuilder: (context, index) => Card(
      elevation: 5,
      color:  Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(height: 140.h,
        child: ListTile(
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
                        QuoteDetail(_quotes[index].id!)));

          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text:"${_quotes[index].firstName} ${_quotes[index].lastName}",fontSize: 26.sp,fontWeight: FontWeight.bold,),
              CustomText(text: _quotes[index].treatment != null && _treatment.any((t) => t.id == _quotes[index].treatment)
                    ? _treatment.firstWhere((t) => t.id == _quotes[index].treatment).nameTr ?? "---"
                    : "---",
                fontSize: 20.sp,color: Colors.black38,
              ),
              Container(width: 160.w,
                alignment: Alignment.center,
                decoration:   BoxDecoration(
                shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.circular(10).r,

                color: Colors.red
              ),
                child: CustomText(text:DateFormat.yMMMEd('tr_TR')
                    .format(DateTime.parse(_quotes[index].createdAt!)),fontSize: 20.sp, color: Colors.white),
              ),
            ],
          ),
        //  subtitle:
        ),
      ),
    )): const Center(child:  CustomText(text:"Hata")) ,

    );
  }
}
