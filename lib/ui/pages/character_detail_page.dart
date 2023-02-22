import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_progect/data/models/character.dart';
import 'package:flutter_first_progect/ui/widgets/character_status.dart';

class CharacterDetailPage extends StatelessWidget {
  final Results character;

  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 20),
          CachedNetworkImage(
            imageUrl: character.image,
            placeholder: ((context, url) => const CircularProgressIndicator(
                  color: Colors.grey,
                )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CharacterStatus(
                  liveState: character.status == 'Alive'
                      ? LiveStatus.alive
                      : character.status == 'Dead'
                          ? LiveStatus.dead
                          : LiveStatus.unknown),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...buildText('Gender:', character.gender),
              ...buildText('Count of episode', character.episode.length.toString()),
            ],
          ),
        ]),
      ),
    );
  }

  List<Widget> buildText(String text, String value){
    return [
      Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        value,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      const SizedBox(
        height: 2,
      ),
    ];
  }
}
