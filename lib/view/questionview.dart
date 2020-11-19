import 'package:flutter/material.dart';
import 'package:flutter_mcqapp/bean/QueAns.dart';
import 'package:flutter_mcqapp/bean/question.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_mcqapp/view/Result.dart';
class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> with SingleTickerProviderStateMixin {
  List<questionmodel> Que = List<questionmodel>();
  Animation animation ;
  AnimationController animationController;
  int b=0;


  @override
  void initState() {

   animationController=AnimationController(duration: const Duration(seconds: 5),vsync: this)
   ..addStatusListener((status) {
     if (status==AnimationStatus.completed) {
       print("hell");
       noattempt++;
       if(index<Que.length-1){
         setState(() {
           print("hellfgh");
           index++;

           resetanim();
           startanim();
         });
       }
       else{
         Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
             Result(attempt: attempt,notattempt: noattempt,)

         ));
       }
     }
     startanim();

   });
   animation=Tween(begin:0.0,end:1.0).animate(animationController);
     Que=getQue();
    // TODO: implement initState
    super.initState();
  }
  startanim(){
    animationController.forward();

  }
  stopanim(){
    animationController.stop();
  }
  resetanim(){
    animationController.reset();
  }
  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  int index=0,noattempt=0,attempt=0,point=0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column( children: [
          SizedBox(height: 30,),
           Row(children: [
            SizedBox(width: 10,),
            Text("${index+1}/${Que.length}",style: TextStyle(fontSize: 22),),
            Text("Question"),
            Spacer(),
            Text("${point}",style: TextStyle(fontSize: 22),),
            Text("Points",),
            SizedBox(width: 10,),


          ],
          ),
          SizedBox(height: 30,),
          Text("${Que[index].getQuestion()}",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 10,),
          Container(child: LinearProgressIndicator(

            value: animation.value,
          ),),

          Container(

            width: MediaQuery.of(context).size.width,
            height:280 ,

              child:CachedNetworkImage(imageUrl:Que[index].getImgurl(),width: 120,height: 70,)),
             SizedBox(height: 60,),



             Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
               GestureDetector(
                 onTap:(){
                 if(Que[index].getAnswer()==Que[index].getOpt1()){
                   setState(() {
                     point+=20;

                     attempt++;


                       b++;
                     if(b>Que.length-1){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                           Result(attempt: attempt,notattempt: noattempt,)

                       ));
                     }
                     index++;

                     resetanim();
                     startanim();
                   });}
                 else{
                   setState(() {
                     point-=5;

                     attempt++;
                      b++;

                     if(b>Que.length-1){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                           Result(attempt: attempt,notattempt: noattempt,)

                       ));
                     }
                     index++;

                     resetanim();
                     startanim();
                   });

                 }

                 } ,
                 child: Container(
                   alignment: Alignment.center,
                   width: MediaQuery.of(context).size.width /2-5,
                   height: 42,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.blue,

                   ),
                   child: Text("${Que[index].getOpt1()}" ,style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.bold,
                   ),

                 ),),
               ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap:(){


                    if(Que[index].getAnswer()==Que[index].getOpt2()){
                      setState(() {
                        point+=20;

                        b++;
                        if(b>Que.length-1){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                              Result(attempt: attempt,notattempt: noattempt,)

                          ));
                        }
                        index++;
                        attempt++;
                        resetanim();
                        startanim();

                      });

                    }
                    else{setState(() {

                      point-=5;

                      b++;
                      if(b>Que.length-1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                            Result(attempt: attempt,notattempt: noattempt,)

                        ));
                      }
                      index++;
                      attempt++;
                      resetanim();
                      startanim();

                    });
                    }


                  } ,

                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width /2-5,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,

                    ),
                    child: Text("${Que[index].getOpt2()}" ,style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),

                    ),),
                ),
              ],
            ),
          SizedBox(height: MediaQuery.of(context).size.height/15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:(){
                  if(Que[index].getAnswer()==Que[index].getOpt3()){
                    setState(() {
                      point+=20;

                      b++;
                      if(b>Que.length-1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                            Result(attempt: attempt,notattempt: noattempt,)

                        ));
                      }
                      index++;
                      attempt++;
                      resetanim();
                      startanim();
                    });}
                  else{
                    setState(() {
                      point-=5;

                      b++;
                      if(b>Que.length-1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                            Result(attempt: attempt,notattempt: noattempt,)

                        ));
                      }
                      index++;
                      attempt++;
                      resetanim();
                      startanim();
                    });

                  }

                } ,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width /2-5,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,

                  ),
                  child: Text("${Que[index].getOpt3()}" ,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),

                  ),),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap:(){


                  if(Que[index].getAnswer()==Que[index].getOpt4()){
                    setState(() {
                      point+=20;
                      b++;
                      if(b>Que.length-1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                            Result(attempt: attempt,notattempt: noattempt,)

                        ));
                      }
                      index++;
                      attempt++;
                      resetanim();
                      startanim();

                    });

                  }
                  else{setState(() {

                    point-=5;
                    b++;
                    if(b>Que.length-1){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>
                          Result(attempt: attempt,notattempt: noattempt,)

                      ));
                    }
                    index++;
                    attempt++;
                    resetanim();
                    startanim();

                  });
                  }


                } ,

                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width /2-5,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,

                  ),
                  child: Text(Que[index].getOpt4() ,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),

                  ),),
              ),
            ],
          ),

        ],
        ),
      ),
    );
  }
}
