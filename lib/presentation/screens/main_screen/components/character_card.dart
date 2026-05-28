import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Card(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          title: Text(
            '${character.name}  ${character.gender}',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '${character.affiliation}',
            style: const TextStyle(color: Colors.white),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(character.image ?? ''),
          ),
        ),
      ),
    );
  }
}
