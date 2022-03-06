import 'package:flutter/material.dart';
import 'package:calorie_tracker_app/src/model/scoped/food_list_model.dart';
import 'package:calorie_tracker_app/src/model/food_track_task.dart';
import 'package:calorie_tracker_app/component/colorpicker/color_picker_builder.dart';
import 'package:calorie_tracker_app/component/iconpicker/icon_picker_builder.dart';
import 'package:calorie_tracker_app/main.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodScreen extends StatefulWidget {
  AddFoodScreen();

  @override
  State<StatefulWidget> createState() {
    return _AddFoodScreenState();
  }
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  late String newFood;
  Color foodColor = Colors.black;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late IconData foodIcon;
  bool _isBack = true;
  bool _isCart = true;
  bool isButtonTapped = false;

  @override
  void initState() {
    super.initState();
    newFood = '';
    foodIcon = Icons.food_bank;
  }

  void onClickBackButton(BuildContext context) {
    print("Back Button");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EnterFoodPage()));
  }

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HOME SCREEN BODY"),
          RaisedButton(
            onPressed: () {
              if (!isButtonTapped) {
                setState(() {
                  isButtonTapped = true;
                });
              }
            },
            child: Text(isButtonTapped ? "BUTTON TAPPED" : "BUTTON NOT TAPPED"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.pink.shade300])),
          ),
          title: Text(
            "Calorie Tracker App",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: _isBack
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    onClickBackButton(context);
                  },
                )
              : Container(),
        ),
        body: new Column(
          children: <Widget>[
            new ListTile(
                leading: const Icon(Icons.food_bank),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Food Name",
                  ),
                )),
            new ListTile(
                leading: const Icon(Icons.food_bank),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Calories",
                  ),
                )),
            new ListTile(
                leading: const Icon(Icons.food_bank),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Carb amount(g):",
                  ),
                )),
            new ListTile(
                leading: const Icon(Icons.food_bank),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Fat amount(g):",
                  ),
                )),
            new ListTile(
                leading: const Icon(Icons.food_bank),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Protein amount(g):",
                  ),
                )),
            ElevatedButton(
              // style: buttonStyle,
              onPressed: () {},
              child: Text("Add Food"),
            )
          ],
        ));
  }
}
