import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_progect/data/models/character.dart';
import 'package:flutter_first_progect/ui/pages/character_detail_page.dart';
import 'package:flutter_first_progect/ui/widgets/character_status.dart';

class CustomListTile extends StatelessWidget {
  final Results character;

  const CustomListTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => CharacterDetailPage(character: character))));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: MediaQuery.of(context).size.height / 7,
          color: const Color.fromRGBO(86, 86, 86, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: character.image,
                placeholder: ((context, url) => const CircularProgressIndicator(
                  color: Colors.grey,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Text(
                        character.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CharacterStatus(
                        liveState: character.status == 'Alive'
                            ? LiveStatus.alive
                            : character.status == 'Dead'
                            ? LiveStatus.dead
                            : LiveStatus.unknown),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Species:',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                character.species,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender:',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                character.gender,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
