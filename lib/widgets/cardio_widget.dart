import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class CardTimer extends StatefulWidget {
  const CardTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<CardTimer> createState() => _CardTimerState();
}

class _CardTimerState extends State<CardTimer> {
  int beat = 0;

  void changeStatus() {
    print("Timer");
    beat = Random().nextInt(41) + 80;
    setState(() {});
  }

  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      changeStatus();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return CardioCard(
      beat: "$beat",
      beat_max: "120",
      beat_min: "60",
      beat_avg: "80",
    );
  }
}

class CardioCard extends StatelessWidget {
  final String beat;
  final String beat_min;
  final String beat_max;
  final String beat_avg;
  const CardioCard({
    Key? key,
    required this.beat,
    required this.beat_min,
    required this.beat_max,
    required this.beat_avg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                SizedBox(
                  child: HeartBeat(
                    beat: beat,
                  ),
                  height: 110,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  beat,
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Min: $beat_min'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Max: $beat_max'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('AVG: $beat_avg'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeartBeat extends StatefulWidget {
  final beat;
  const HeartBeat({
    Key? key,
    this.beat,
  }) : super(key: key);

  @override
  State<HeartBeat> createState() => _HeartBeatState();
}

class _HeartBeatState extends State<HeartBeat> with TickerProviderStateMixin {
  AnimationController? motionController;
  Animation? motionAnimation;
  double initialSize = 120;
  double size = 100;
  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
      lowerBound: 0.8,
    );

    motionAnimation = CurvedAnimation(
      parent: motionController!,
      curve: Curves.ease,
    );

    motionController!.forward();
    print("Animar");
    motionController!.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //motionController!.forward();
        }
      });
    });

    motionController!.addListener(() {
      setState(() {
        print(motionController!.value);
        size = motionController!.value * initialSize;
      });
    });
    // motionController.repeat();
  }

  @override
  void dispose() {
    if (motionController != null) {
      motionController!.dispose();
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    //if (oldWidget.beat != widget.beat) {
    print("Elemento Cambio");
    motionController!.forward();
    //}
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      size: size,
      color: Colors.red.shade200,
    );
  }
}
