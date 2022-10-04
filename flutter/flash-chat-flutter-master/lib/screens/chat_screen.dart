import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'Chat Screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  String messageText;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  /* void getMessages() async {
    final messages = await _firestore.collection('messages').getDocuments();
    for (var message in messages.documents) {
      print(message.data);
    }
  } */

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    messagesStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('messages').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data.documents;
                        Widget alignedMessageWidget;
                        List<Align> alignedMessageWidgets = [];
                        for (var message in messages) {
                          String text = message.data['text'];
                          String sender = message.data['sender'];
                          final messageWidget = Text('$text from $sender');

                          if (loggedInUser.email == sender) {
                            alignedMessageWidget = Align(
                              alignment: Alignment.topRight,
                              child: messageWidget,
                            );
                          } else {
                            alignedMessageWidget = Align(
                                alignment: Alignment.topLeft,
                                child: messageWidget);
                          }

                          alignedMessageWidgets.add(alignedMessageWidget);
                        }
                        return Column(children: alignedMessageWidgets);
                      } else {
                        return Text('LOADING');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    messageText = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 255, 255),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your text',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _firestore.collection('messages').add({
                    'sender': loggedInUser.email,
                    'text': messageText,
                  });
                },
                child: Text(
                  'Send',
                  style: kSendButtonTextStyle,
                ),
              ),
            ],
          )
        ],
      )
          /* Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('messages').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final messages = snapshot.data.documents;
                          List<Text> messageWidgets = [];
                          for (var message in messages) {
                            String text = message.data['text'];
                            String sender = message.data['sender'];
                            final messageWidget = Text('$text from $sender');
                            messageWidgets.add(messageWidget);
                          }
                          return Column(children: messageWidgets);
                        } else {
                          return Text('LOADING');
                        }
                      }),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'sender': loggedInUser.email,
                        'text': messageText,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ), */

          ),
    );
  }
}
