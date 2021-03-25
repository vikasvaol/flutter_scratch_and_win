import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: import images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/rupee.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

  //TODO: get an array

  List<String> itemArray;
  int luckyNumber;
  int maxattempt;
  var message="";

  //TODO: init array with 25 elements
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
    maxattempt=0;
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });
  }

  //TODO: deifne a get Image method
  AssetImage getImage(int index) {
    if (itemArray[index] == "empty") {
      return circle;
    } else if (itemArray[index] == "lucky") {
      return lucky;
    } else if (itemArray[index] == "unlucky") {
      return unlucky;
    }
  }

  //TODO: play Game method
  playGame(int index) {
    if(maxattempt<5){
    if (index == luckyNumber) {
      setState(() {
        itemArray[index] = "lucky";
        this.message="You are Lucky. The game is finished. Please Reset the game.";
        maxattempt=6;
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
        maxattempt++;
      });
    }
    }
    else{
      setState(() {
        this.message="You reached your maximum limit.Please reset your game";
      });
        
    }
  }

  //TODO: showall
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
    
  }
  //TODO: Reset All

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      maxattempt=0;
      this.message="";
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scracth win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(onPressed: (){
              this.showAll();
            },
            color: Colors.pink,
            padding: EdgeInsets.all(20.0),
            child: Text('Show All',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),),
            ),
            
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(onPressed: (){
              this.resetGame();
            },
            color: Colors.pink,
            padding: EdgeInsets.all(20.0),
            child: Text('Reset',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),),
            ),
            
          ),
          Container(
            //margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(top: 5),
            child: Text(
              this.message,
              style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
              
            ),
          ),
           Container(
            //margin: EdgeInsets.all(10.0),
            
            padding: EdgeInsets.fromLTRB(50.0, 0, 0, 0),
            child: Text('By Vikas V-Thinkspace',
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.deepOrange),
              
              
              
              
            ),
          ),
        ],
      ),
    );
  }
}
