import 'package:flutter/material.dart';
import 'package:meditation_app_flutterfinalproject/topic.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app_flutterfinalproject/topic_provider.dart';

class TopicDetailScreen extends StatefulWidget {
  final int index;
  TopicDetailScreen({required this.index});

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  late TextEditingController _imageController;
  late TextEditingController _titleController;
  late TextEditingController _colorController;
  late TextEditingController _textColorController;

  @override
  void initState() {
    super.initState();
    final topic = Provider.of<TopicProvider>(context, listen: false).topics[widget.index];
    _imageController = TextEditingController(text: topic.image);
    _titleController = TextEditingController(text: topic.title);
    _colorController = TextEditingController(text: topic.color);
    _textColorController = TextEditingController(text: topic.textColor);
  }

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Topic'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              topicProvider.deleteTopic(widget.index as int);
              Navigator.pop(context);
            },
          ),
        ],
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
                final updatedTopic = Topic(
                  image: _imageController.text,
                  title: _titleController.text,
                  color: _colorController.text,
                  textColor: _textColorController.text,
                );
                topicProvider.updateTopic(widget.index as int, updatedTopic);
                Navigator.pop(context);
              },
              child: Text('Update Topic'),
            ),
          ],
        ),
      ),
    );
  }
}
