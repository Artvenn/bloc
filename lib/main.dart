import 'package:flutter/material.dart';

import 'bloc/bloc.dart';
import 'bloc/events.dart';
import 'bloc/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int sw = 5;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );   
  }

}

class HomePage extends StatefulWidget {
  int counter = 0;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  } 
 

}

class _HomePageState extends State<HomePage> {
  TextEditingController operand1 = TextEditingController();
  TextEditingController operand2 = TextEditingController(); 

  final Bloc _bloc = Bloc();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.red,
        toolbarOpacity: 1,
        title: const Text('Home page'),
      ), 
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<CalcState>(
                initialData: const LoadedState(0),
                stream: _bloc.stream,
                builder: (BuildContext context,  AsyncSnapshot<CalcState> state) {
                  if (state.data is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.data is LoadedState) {
                    return Text('${(state.data as LoadedState).result}');
                  } else if (state is NotLoadedState) {
                    return Text('error: ${(state.data as NotLoadedState).message})');
                  } else {
                    return const Text('unexpected state');
                  }
                },
              ),
              
              TextField(controller: operand1),
              
              TextField(controller: operand2),
              const SizedBox(height: 10,),
              MaterialButton(
                child: const Text('-'),
                elevation: 5,
                onPressed: () {          
                  _bloc.sink.add(Sub(int.parse(operand1.text), int.parse(operand2.text)));      
                },
                color: Colors.blue,
              ),
              const SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {
                  _bloc.sink.add(Sum(int.parse(operand1.text), int.parse(operand2.text)));      
                },
                color: Colors.blue,
                child: const Text('+'),
              ),
            ],
          ) 
        )
      )
    );
  }
}