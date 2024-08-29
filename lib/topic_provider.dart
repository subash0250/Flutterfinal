import 'package:flutter/foundation.dart';
import 'package:meditation_app_flutterfinalproject/topic.dart';

class TopicProvider with ChangeNotifier {
  List<Topic> _topics = [];

  List<Topic> get topics => _topics;

  void addTopic(Topic topic) {
    _topics.add(topic);
    notifyListeners();
  }

  void updateTopic(int index, Topic topic) {
    _topics[index] = topic;
    notifyListeners();
  }

  void deleteTopic(int index) {
    _topics.removeAt(index);
    notifyListeners();
  }
}
