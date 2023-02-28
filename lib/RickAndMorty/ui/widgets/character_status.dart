import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LiveStatus { alive, dead, unknown }

class CharacterStatus extends StatelessWidget {
  final LiveStatus liveState;

  const CharacterStatus({Key? key, required this.liveState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          size: 11,
          color: liveState == LiveStatus.alive
              ? Colors.lightGreenAccent[400]
              : liveState == LiveStatus.dead
                  ? Colors.red
                  : Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          liveState == LiveStatus.alive
              ? 'Alive'
              : liveState == LiveStatus.dead
                  ? 'Dead'
                  : 'Unknown',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
