import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Selection Screen',
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<int> selectedTileIndices = Set<int>();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen'),
      ),
      body: ListView.separated(
        itemCount: 5,
          itemBuilder: (context,index){
          return ListTile(
            tileColor: selectedTileIndices.contains(index) ? Colors.blue : null,
            onTap: (){
              setState(() {
                if (selectedTileIndices.contains(index)) {
                  selectedTileIndices.remove(index);
                  count --;
                } else {
                  selectedTileIndices.add(index);
                  count++;
                }
              });
            },
            title: Text('Item ${index+1}'),
          );

      }, separatorBuilder: (BuildContext context, int index) { return const Divider(height: 4); },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return  AlertDialog(
              title:  const Text('Selected items'),
              content:  Text('Number of selected items : $count'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Close'))
              ],
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



