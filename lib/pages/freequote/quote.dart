import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/freequote/quote_service.dart';
import 'package:gohealthination/pages/freequote/quotedetail.dart';
import 'package:gohealthination/shared/custom_text.dart';

import 'models/freequotemodel.dart';

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  final QuoteService _service = QuoteService();
  List<Result> _quotes =[];
  bool? isLoading;

  Color color1 = const Color(0xff3e2093);
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

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: isLoading==null ? const Center(child: CircularProgressIndicator()) :
    isLoading == true ? ListView.builder(
    itemCount: _quotes.length,
    itemBuilder: (context, index) => Card(
      elevation: 3,
      color:  Colors.white70,
      shape: RoundedRectangleBorder(
      //  side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(height: ScreenUtil().setHeight(100), alignment: Alignment.center,
        child: ListTile(
         // leading: Image.asset('assets/kullan/ders.png'),
          trailing:
          Icon(Icons.arrow_forward, color:  color1 ),
          onTap: ()  {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        QuoteDetail(_quotes[index].id!)));

          },
          title: CustomText(text:"${_quotes[index].id}. ${_quotes[index].firstName} ${_quotes[index].lastName}",fontSize: 26.sp),
          subtitle: CustomText(text:_quotes[index].email!,fontSize: 20.sp),
        ),
      ),
    )): const Center(child:  CustomText(text:"Hata")) ,

    );
  }
}
