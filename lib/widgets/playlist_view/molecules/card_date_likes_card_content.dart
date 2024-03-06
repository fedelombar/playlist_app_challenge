import 'package:flutter/material.dart';

import '../atoms/image_content_card.dart';

class DateLikesMolecule extends StatelessWidget {
  final String date;
  final String likes;

  const DateLikesMolecule({Key? key, required this.date, required this.likes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconTextAtomContentCard(icon: Icons.calendar_today, text: date),
        IconTextAtomContentCard(icon: Icons.favorite, text: likes),
      ],
    );
  }
}

// Description Tags Molecule
class DescriptionTagsMolecule extends StatelessWidget {
  final String description;
  final List<String> tags;

  const DescriptionTagsMolecule({Key? key, required this.description, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(description, style: TextStyle(fontWeight: FontWeight.bold)),
        Row(children: tags.map((tag) => TagTextAtomContentCard(text: tag)).toList()),
      ],
    );
  }
}
