import 'package:flutter/material.dart';
import 'package:meditation_app_flutterfinalproject/topic.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app_flutterfinalproject/topic_provider.dart';

class AddTopicScreen extends StatefulWidget {
  @override
  _AddTopicScreenState createState() => _AddTopicScreenState();
}

class _AddTopicScreenState extends State<AddTopicScreen> {
  final _imageController = TextEditingController();
  final _titleController = TextEditingController();
  final _colorController = TextEditingController();
  final _textColorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Topic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image Path'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _colorController,
              decoration: InputDecoration(labelText: 'Color'),
            ),
            TextField(
              controller: _textColorController,
              decoration: InputDecoration(labelText: 'Text Color'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final topic = Topic(
                  image: _imageController.text,
                  title: _titleController.text,
                  color: _colorController.text,
                  textColor: _textColorController.text,
                );
                topicProvider.addTopic(topic);
                Navigator.pop(context);
              },
              child: Text('Add Topic'),
            ),
          ],
        ),
      ),
    );
  }
}
