import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //injecting ProviderScope
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
           home:  MyHome()
    );
  }
}
//create provider using stateprovider
//passing int type of  variable
//whatever we write usingn stateProvider that become stateful so counter variablke become stateful

final counter=StateProvider<int>((ref){
  return 0;
});
//creating consumer class extgending consumer widget
class MyHome extends ConsumerWidget{
  @override
  //ref=object
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
var value=ref.watch(counter);//setting the value as value of counter
return Scaffold(
  body: Center(
    child: Text(
      'Count:$value',
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  ),
  floatingActionButton: Padding(
    padding: EdgeInsets.only(left:30),
    child:Row(
      crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //adding ref.read to access the value
          //ref.read() is a method provided by Riverpod's WidgetRef object.
          FloatingActionButton(onPressed: ()=>ref.read(counter.state).state++,
          child:Icon(Icons.add),
    ),
    Expanded(child: Container()),
    FloatingActionButton(onPressed: ()=>ref.read(counter.state).state--,
    child:Icon(Icons.remove),
    ),
          Expanded(child: Container()),
          FloatingActionButton(onPressed: ()=>ref.read(counter.state).state=00,
            child:Icon(Icons.restore),
          ),

        ],
    
  ),
  ),
);
  }

}