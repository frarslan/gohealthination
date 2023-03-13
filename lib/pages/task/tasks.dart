import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/task/task_service.dart';
import 'package:gohealthination/shared/custom_text.dart';
import 'package:intl/intl.dart';

import 'models/tasksmodel.dart';
import 'models/collaboratorsmodel.dart' as colla;

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {

  final TasksService _service = TasksService();
  List<Result> _tasks =[];
  List<colla.Result> _tasksColla =[];
  bool? isLoading;

  Color color1 = const Color(0xff7367f0);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);


  @override
  void initState() {
    super.initState();
    _service.bringTasks().then((value){
      if(_service != null && value!= null)  {
        setState(() {
          _tasks=value;
          isLoading=true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
    _service.bringCollaborators().then((value){
      if(_service != null && value!= null)  {
        setState(() {
          _tasksColla=value;
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
    return Scaffold(
      body: isLoading==null ? const Center(child: CircularProgressIndicator()) :
      isLoading == true ? ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) => Card(
            elevation: 5,
            color:  Colors.white,
            shape: RoundedRectangleBorder(
              //     side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(height: 240.h, alignment: Alignment.center,
              child: ListTile(
                 onTap: ()  {
                 /* Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              PatientDetail(_patients[index].id!)));*/
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text:"${_tasks[index].title} ",fontSize: 30.sp),
                            Icon((_tasks[index].isCompleted==true) ? Icons.check :Icons.lens_outlined ,color:(_tasks[index].isCompleted==true) ? Colors.green : color1,size: 30, ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(5).r,
                        child: CustomText(text:"${_tasks[index].description}",fontSize: 20.sp,color: Colors.black38,maxLines: 5,)),
                    Container(width: 160.w,
                      margin: EdgeInsets.all(15).r,
                      child: CustomText(text:"Process : ${(_tasks[index].order==null)?'--':_tasks[index].order} ",fontSize: 20.sp,color: Colors.red)),
                    Container(
                      margin: EdgeInsets.all(15).r,
                      height: 50.h,
                      child:Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _tasks[index].collaborators.length,
                              itemBuilder: (context, indexa) {
                                List<Widget> collaboratorTexts = buildCollaboratorTexts(index);
                                return SizedBox(
                                  width: 70.w,
                                  height: 40.h,
                                  child: Center(
                                    child: collaboratorTexts[indexa],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(5).r,
                              child: CustomText(text:DateFormat.MMMMd('tr_TR')
                                  .format(DateTime.parse(_tasks[index].dueDate!)),fontSize: 20.sp,color: Colors.black38,maxLines: 2,)),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          )
      ): const Center(child:  CustomText(text:"Hata")) ,

    );
  }
  List<Widget> buildCollaboratorTexts(int index) {
    List<int> collaboratorSubIds = _tasks[index].collaborators;
    List<String> collaboratorFullNames = [];

    for (var subId in collaboratorSubIds) {
      for (var item in _tasksColla) {
        if (item.id == subId) {
          collaboratorFullNames.add(item.fullName!);
          break;
        }
      }
    }

    List<Widget> collaboratorTexts = collaboratorFullNames.map((fullName) => Text(
      fullName,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,color: Colors.black38
      ),
      maxLines: 3,
    )).toList();

    return collaboratorTexts;
  }
}
