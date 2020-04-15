import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion=0;
  int score=0;
  var questions=[
  {"title":"Q1","answers":[
      {"answer":"answer 11","correct":false},
      {"answer":"answer 12","correct":true},
      {"answer":"answer 13","correct":false},
    ]
  },
  {"title":"Q2","answers":[
      {"answer":"answer 21","correct":false},
      {"answer":"answer 22","correct":true},
      {"answer":"answer 23","correct":true},
    ]
  },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: (currentQuestion>=questions.length)?Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(score.toString(),style: TextStyle(fontSize: 22,color: Colors.deepOrange),),
            RaisedButton(
              color: Colors.deepOrange,
              onPressed: (){
                setState(() {
                  this.score = 0;
                  this.currentQuestion = 0;
                });
              },
                child:Text("Reset...")

            )
          ],
        )
      ):
      ListView(
        children: <Widget>[
          ListTile(
            title: Center(child: Text("${questions[currentQuestion]['title']}/2")),
          ),
            ...(questions[currentQuestion]['answers'] as List<Map<String,Object>>).map((answer){
              return ListTile(
                title:RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: (){
                    setState(() {
                      ++currentQuestion;
                      if(answer['correct']==true)
                      ++score;
                    });
                  },
                  child:Text(answer['answer']),
                )

              );


    }),
        ],

      )
    );
  }
}
