import 'package:destini_story_app/util/story_brain.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // Story Brain Object
  StoryBrain util = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 12,
            child: Center(
              child: Text(
                util.getStory(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () => setState(() {
                util.nextStory(1);
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(util.getChoice1()),
            ),
          ),
          const SizedBox(height: 20.0),
          Visibility(
            visible: util.shouldButtonBeVisible(),
            child: Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () => setState(() {
                  util.nextStory(2);
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(util.getChoice2()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
