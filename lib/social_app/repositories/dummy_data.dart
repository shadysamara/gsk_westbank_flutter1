import 'package:flutter_application_1/social_app/models/post_model.dart';

List<PostModel> posts = [
  PostModel(
      content: "this is my first post",
      image:
          'https://images.unsplash.com/photo-1521575107034-e0fa0b594529?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9zdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      postUserModel: users[0]),
  PostModel(
      content: "I Love coding",
      isFavourite: true,
      image:
          'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cG9zdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      postUserModel: users[1]),
  PostModel(
      content: "my beautiful house",
      image:
          'https://images.unsplash.com/photo-1466096115517-bceecbfb6fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG9zdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      postUserModel: users[0]),
  PostModel(
      content: "lovely plant",
      image:
          'https://images.unsplash.com/photo-1487700160041-babef9c3cb55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBvc3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      postUserModel: users[2]),
  PostModel(
      content: "i love colors",
      isFavourite: true,
      image:
          'https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvc3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      postUserModel: users[2]),
  PostModel(
      content: "hello from the cafe",
      image:
          'https://plus.unsplash.com/premium_photo-1661661591757-89ebfe7b357a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9zdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      postUserModel: users[3])
];
List<PostUserModel> users = [
  PostUserModel(
      name: 'Omar Ali',
      image:
          'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  PostUserModel(
      name: 'Hasan shaker',
      image:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  PostUserModel(
      name: 'Hani hassan',
      image:
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  PostUserModel(
      name: 'Fatma waleed',
      image:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
];
