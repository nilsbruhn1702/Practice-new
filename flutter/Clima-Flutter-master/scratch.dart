import 'dart:io';

void main() {
  performTasks();
  print('doing sth else');
}

void performTasks() async {
  task1();
  print('doing shit');
  String resultTask2 =
      await task2(); //er hält hier das Programm solange an, bis er das Ergebnis hat
  task3(resultTask2);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2) {
  String result = 'task 3 data';
  print('Task 3 complete $task2');
}
