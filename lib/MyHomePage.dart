
import 'package:flutter/material.dart';

import 'model/model.dart';
import 'package:floor_demo/dao/dog.dart';

import 'package:floor_demo/db/database.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DogDao dogDao;

  void _incrementCounter() {
    Dog dog = new Dog(2, 'Froyo', 1);

    dogDao.insertDog(dog);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Floor Demo'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: loadListFromDB,
              child: Text('Read Data From DB',
                  style: TextStyle(fontSize: 18.0)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> initDatabase() async {
    final database = await $FloorTestDatabase.databaseBuilder('app_database.db').build();

    dogDao = database.dogDao;
  }

  void loadListFromDB() async{
    List<Dog> dogList = await dogDao.findAllDogs();
    print(dogList.toString());
  }
}

