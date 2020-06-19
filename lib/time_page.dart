import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryprovider/time_notifier.dart';
class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    print('@@@@ ${context.read<TimeNotifier>().dateTime}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Consumer/Selector'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  context.read<TimeNotifier>().updateTime();
                });
              },
              child: Text('update Time1 & Time2'),
            ),
            SizedBox(height: 16,),
            RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('update Time1'),
            ),
            Text('Time1：${DateTime.now()}'),
            SizedBox(height: 16,),
            RaisedButton(
              onPressed: () => context.read<TimeNotifier>().updateTime(),
              child: Text('update Time2'),
            ),
            Consumer<TimeNotifier>(
              builder: (context, timeNotifier, widget) {
                return Text('Time2：${timeNotifier.dateTime}');
              },
            ),
            SizedBox(height: 8,),
            Selector<TimeNotifier, int>(
              builder: (_, second, __) {
                return Text(
                  '点击【update Time2】时，每2秒刷新一次：'
                      +'\nsecond：${second * 2}'
                      +'\ntime: ${context.read<TimeNotifier>().dateTime}',
                );
              },
              selector: (context, timeNotifier) => timeNotifier.second,
            ),
//            MyConsumerWidget(),
          ],
        ),
      ),
    );
  }
}

