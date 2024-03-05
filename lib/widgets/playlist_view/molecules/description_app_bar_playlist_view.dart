import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:playlist_app/widgets/playlist_view/atoms/edit_button.dart';
import 'package:playlist_app/widgets/playlist_view/atoms/more_button.dart';

class DescriptionAppBar extends StatelessWidget {
  final String title;
  final int videosQuantity;
  final String time;

  const DescriptionAppBar({
    Key? key,
    required this.title,
    required this.videosQuantity,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtitleText = '$videosQuantity videos | $time';

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // Allow the title and subtitle to wrap if they overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          subtitleText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      EditButton(),
                      SizedBox(width: 10),
                      MoreButton(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Icon(IconlyLight.lock, color: Colors.white, size: 20),
                  SizedBox(width: 5),
                  Text(
                    'Private',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(IconlyLight.show, color: Colors.white, size: 20),
                  SizedBox(width: 5),
                  Text(
                    '5.2K',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
