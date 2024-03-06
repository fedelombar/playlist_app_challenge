import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:playlist_app/models/playlist_content_model.dart';
import 'package:playlist_app/widgets/playlist_view/organisms/custom_app_bar_play_view.dart';
import 'package:playlist_app/common/organisms/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:playlist_app/models/playlist.dart';
import 'package:playlist_app/navigators/app_navigator.dart';

import '../controllers/playlist_controller.dart';
import '../widgets/playlist_view/atoms/save_button.dart';
import '../widgets/playlist_view/organisms/content_card_playlist_view.dart';

class PlaylistView extends StatefulWidget {
  final Playlist playlist;
  final AppNavigator appNavigator;

  const PlaylistView(
      {Key? key, required this.playlist, required this.appNavigator})
      : super(key: key);

  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  List<PlaylistContent> _contentItems = [];
  late List<int> _itemOrder; // Track the order of items
  bool _isDragging = false;
  bool _showSaveButton = false; // Show save button when dragging starts

  @override
  void initState() {
    super.initState();
    _loadContentItems();
  }

  Future<void> _loadContentItems() async {
    final playlistContentController = PlaylistContentController();
    // Attempt to load the saved order
    _itemOrder = await playlistContentController.loadOrder();
    // Load the playlist content
    final items = await playlistContentController.loadPlaylistContent();

    // Check if we have a saved order that matches the items list length
    if (_itemOrder.isNotEmpty && _itemOrder.length == items.length) {
      // Reorder items according to saved order
      List<PlaylistContent> reorderedItems = List.generate(_itemOrder.length, (index) => items[_itemOrder[index]]);
      setState(() {
        _contentItems = reorderedItems;
      });
    } else {
      // No saved order or mismatch, use default order
      setState(() {
        _contentItems = items;
        _itemOrder = List.generate(items.length, (index) => index);
      });
    }
  }

  void _onDragStarted() {
    setState(() {
      _isDragging = true;
      _showSaveButton = true;
    });
  }

  void _onDragCompleted() {
    setState(() {
      _isDragging = false;
    });
    // TODO: Save the new order logic here
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = _itemOrder.removeAt(oldIndex);
      _itemOrder.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, item);
    });
  }

  void _onSaveOrder() async {
    await PlaylistContentController().saveOrder(_itemOrder);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order saved successfully!')),
    );
    setState(() {
      _showSaveButton = false;
    });
  }

  Widget _buildContentGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: (1 / 1.64),
      ),
      itemCount: _contentItems.length,
      itemBuilder: (context, index) {
        final contentIndex = _itemOrder[index];
        final content = _contentItems[contentIndex];
        return LongPressDraggable<int>(
          data: contentIndex,
          onDragStarted: _onDragStarted,
          onDragEnd: (details) => _onDragCompleted(),
          feedback: Material(
            elevation: 4.0,
            type: MaterialType.transparency,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Container(
                  width: 166,
                  height: 273,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.2), // Semi-transparent white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.asset(
                          content.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.black.withOpacity(0.2), // Semi-transparent black
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content.description,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: content.tags.map((tag) => Text(
                                '#$tag ',
                                style: TextStyle(color: Colors.white),
                              )).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          childWhenDragging: Container(),
          child: DragTarget<int>(
            onWillAccept: (data) => true,
            onAccept: (data) {
              _onReorder(data, contentIndex);
            },
            builder: (context, candidateData, rejectedData) =>
                ContentCardOrganism(
                  imagePath: content.imagePath,
                  date: content.date,
                  likes: content.likes,
                  description: content.description,
                  tags: content.tags,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              CustomAppBarPlaylistView(playlist: widget.playlist),
              SliverPadding(
                padding: const EdgeInsets.all(5),
                sliver: SliverToBoxAdapter(
                  child: _buildContentGrid(),
                ),
              ),
            ],
          ),
          // Conditionally show the SaveButtonWidget
          if (_showSaveButton) SaveButtonWidget(onSaveOrder: _onSaveOrder),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {},
        onCenterItemTapped: () {},
        appNavigator: widget.appNavigator,
      ),
    );
  }

}
