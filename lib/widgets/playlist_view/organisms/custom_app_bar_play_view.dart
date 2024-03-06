import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playlist_app/widgets/playlist_view/atoms/back_button.dart';

import '../../../models/playlist.dart';
import '../atoms/image_bg.dart';
import '../molecules/description_app_bar_playlist_view.dart';

class CustomAppBarPlaylistView extends StatelessWidget {
  final Playlist playlist;

  const CustomAppBarPlaylistView({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 275.0,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            ImageAppBarAtom(
              thumbnailUrl: playlist.thumbnailUrl ??
                  'assets/images/girl_playlist_view_bg.jpeg',
              applyBlur: true,
            ),
            // Position the DescriptionAppBar over the image
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DescriptionAppBar(
                  title: playlist.title ?? 'Playlist',
                  videosQuantity: playlist.videosQuantity ?? 0,
                  time: playlist.time ?? '00:00:00'),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      leadingWidth: 80.0,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(56.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            height: 56.0,
            width: 56.0,
            alignment: Alignment.center,
            child: CustomBackButton(),
          ),
        ),
      ),
    );
  }
}
