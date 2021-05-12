import 'dart:html';
import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'mybutton.dart';

// Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TO DO if it looks as you expected.

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

// Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {


  @override
  Widget build(BuildContext context) {
    MyButton btn1 = MyButton();
    MyButton btn2 = MyButton();

    if ( storyBrain.getChoice1().length > 0) {
      btn1.visible = true;
      btn1.color = Colors.red;
      btn1.text = storyBrain.getChoice1();
    } else {
      btn1.visible = false;
      btn1.color = Colors.transparent;
      btn1.text = '';
    }

    if ( storyBrain.getChoice2().length > 0) {
      btn2.visible = true;
      btn2.color = Colors.blue;
      btn2.text = storyBrain.getChoice2();
    } else {
      btn2.visible = false;
      btn2.color = Colors.transparent;
      btn2.text = '';
    }


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'), fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // Step 1 - Add background.png to this Container as a background image.
          // https://stackoverflow.com/a/63087275
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      // Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                      storyBrain.getStory(),
                      // 'Story text will go here.',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: btn1.visible,
                    child: FlatButton(
                      onPressed: () {
                        //Choice 1 made by user.
                        // Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      color: btn1.color,
                      child: Text(
                        // Step 13 - Use the storyBrain to get the text for choice 1.
                        btn1.text,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 2,
                  // Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                  // Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                  child: Visibility(
                    visible: btn2.visible,
                    child: FlatButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        // Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      color: btn2.color,
                      child: Text(
                        // Step 14 - Use the storyBrain to get the text for choice 2.
                        btn2.text,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
