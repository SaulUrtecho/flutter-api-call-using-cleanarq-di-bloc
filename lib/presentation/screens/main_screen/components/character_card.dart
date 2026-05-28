import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/details_screen/character_details_screen.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: _CardContent(character),
    );
  }
}

class _CardContent extends StatelessWidget {
  final CharacterEntity character;

  const _CardContent(this.character);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(id: character.id ?? 0),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(character.image ?? ''),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${character.name} ${character.gender}'),
                  Text(character.affiliation ?? ''),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined, color: Colors.brown),
            ],
          ),
        ),
      ),
    );
  }
}
