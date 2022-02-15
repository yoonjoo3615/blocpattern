import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlocWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlockWidgetState();

}

class _BlockWidgetState extends State<BlocWidget> {

  CountBloc countBloc;




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: CountView(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed:(){
                //call bloc logic here instead of method
                //register bloc event here
              },
              icon: Icon(Icons.add)),

          IconButton(
              onPressed:(){
                //call bloc logic here instead of method
                //register bloc event here
              },
              icon: Icon(Icons.remove)),

        ],
      ),,

    );
  }

  //Control lifecycle of Widget
  // With Provider this part gets easier.
  //When the Widget is disposed, bloc should be disposed.
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
  }
  @override
  void dispose() {
    super.dispose();
    countBloc.dispose();
  }
}

//Seperate updating View
class CountView extends StatelessWidget {
  CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Countview_Bloc Pattern");
    return Center(
      child:StreamBuilder(
        //Streambuilder instead of other widget
        stream: countBloc.count,
        initialData: 0,
        builder: (BuildContext contex, AsyncSnapshot<int> snapshot) {
          if(snapshot.hasData){
            return Text(
              snapshot.data.toString(),
              style: TextStyle(fontSize: 88),
            );
          };

          return CircularProgressIndicator();
        },

      ),
    );
  }




}