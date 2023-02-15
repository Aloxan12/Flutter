import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBlocWithBloC(),
      child: MaterialApp(title: 'Flutter', home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBlocWithBloC _bloc = BlocProvider.of<ColorBlocWithBloC>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc with flutter bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBlocWithBloC, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            color: currentColor,
            width: 100,
            height: 100,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.add(RedColorEvent());
            },
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.add(GreenColorEvent());
            },
          ),
        ],
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   ColorBloc _bloc = ColorBloc();
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BloC with Stream'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: _bloc.outputStateStream,
//           initialData: Colors.red,
//           builder: (context, snapshot) {
//             return AnimatedContainer(
//               height: 100,
//               width: 100,
//               color: snapshot.data,
//               duration: Duration(milliseconds: 500),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: (){
//               _bloc.inputEventSink.add(ColorEvent.evetn_red);
//             },
//             backgroundColor: Colors.red,
//           ),
//           SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: (){
//               _bloc.inputEventSink.add(ColorEvent.evetn_green);
//             },
//             backgroundColor: Colors.green,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CounterApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return CounterAppState();
//   }
// }
//
// class CounterAppState extends State<CounterApp> {
//   double _count = 50;
//
//   @override
//   void incrementCount() {
//     setState(() {
//       _count += 1;
//     });
//   }
//
//   void decrementCount() {
//     if(_count > 0){
//       setState(() {
//         _count -= 1;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.indigoAccent,
//         appBar: AppBar(
//           title: Text(
//             'Counter',
//           ),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         'Tap "-" to decrement',
//                         style: TextStyle(fontSize: 28, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     margin: const EdgeInsets.all(16.0),
//                     width: 195,
//                     decoration: new BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: Colors.grey,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.all(12.0),
//                             textStyle: const TextStyle(fontSize: 20),
//                           ),
//                           onPressed: decrementCount,
//                           child: const Text('-'),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, right: 20,),
//                           child:Text(
//                             '${_count.round()}',
//                             style: TextStyle(fontSize: 20, color: Colors.white),
//                           ),
//                         ),
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: Colors.grey,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.all(12.0),
//                             textStyle: const TextStyle(fontSize: 20),
//                           ),
//                           onPressed: incrementCount,
//                           child: const Text('+'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         'Tap "+" to increment',
//                         style: TextStyle(fontSize: 28, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }

// class AssetImageApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'IndieFlower'),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Add assets'),
//         ),
//         body: Center(
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               Image(
//                 image: AssetImage('assets/images/bg.png'),
//               ),
//               Image.asset('assets/icons/done.png'),
//               Positioned(
//                 top: 36,
//                 left: 90,
//                 child: Text(
//                   'My custom font',
//                   style: TextStyle(
//                       fontSize: 30,
//                       // fontFamily: 'IndieFlower',
//                       color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyFirstApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyFirstAppState();
//   }
// }
//
// class _MyFirstAppState extends State<MyFirstApp> {
//   bool _loading = false;
//   double _progressValue = 0.0;
//
//   @override
//   void initSate() {
//     // _loading = false;
//     // _progressValue = 0.0;
//     super.initState();
//   }
//
//   void _updateProgress() {
//     const oneSec = const Duration(seconds: 1);
//     Timer.periodic(oneSec, (Timer t) {
//       setState(() {
//         _progressValue += 0.2;
//         if (_progressValue >= 1.0) {
//           _loading = false;
//           t.cancel();
//           _progressValue = 0.0;
//           return;
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.indigo,
//         appBar: AppBar(
//           title: Text('My first app'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//             padding: EdgeInsets.all(16),
//             child: _loading
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       LinearProgressIndicator(value: _progressValue),
//                       Text(
//                         '${(_progressValue * 100).round()}%',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ],
//                   )
//                 : Text(
//                     'Press button to download',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _loading = !_loading;
//               _updateProgress();
//             });
//           },
//           child: Icon(Icons.close),
//         ),
//       ),
//     );
//   }
// }
