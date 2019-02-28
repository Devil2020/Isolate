import 'dart:io';
import 'dart:async';
import 'dart:isolate';
main(List<String> args) {
 //LoadFunc1();
 //print("Finish second");
 /*LoadFunc2();
 print("Finish Third");
 Stream X=LoadFunction3Stream(20);
 X.listen((x){
   print(x);
 });*/

 /*StreamController controller=new StreamController();
 controller.sink.add("event");
 controller.stream.listen((x){
   print(x);
 });
 controller.sink.add("Mohammed morse");
 controller.sink.add("Mohammed morse");
 controller.sink.add("Mohammed morse");
 controller.sink.add("Mohammed morse");*/
 ReceivePort Reciver=ReceivePort();
Isolate.spawn(RunIsolate,Reciver.sendPort);
 Reciver.listen((dynamic Data){
   print(Data);
 });
}
LoadFunction3Stream(int Range) async*{
    for(int x=0;x<Range;x++){
      yield x;
    }
}
LoadFunc2(){
  Stream S=Stream<int>.periodic(Duration(seconds:10),(x)=>x);
  S.listen((x){
    print(x);
  });
}
bool Play(){
  Future.delayed(Duration(seconds:10),()=>print("Done play"));
  return false;
}
LoadFunc1() async{
 await Future.delayed(Duration(seconds:30),()=>print("Execute 1"));
  print("Finist first"+Isolate.current.toString());
}
RunIsolate(SendPort send){
  sleep(Duration(seconds: 20));
  print("Isolate Finish ${Isolate.current.toString()}");
  send.send("Done ya Zmele");
}
