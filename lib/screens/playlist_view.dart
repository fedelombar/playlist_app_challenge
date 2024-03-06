import 'package:flutter/material.dart';
import 'package:playlist_app/models/playlist_content_model.dart';
import 'package:playlist_app/widgets/playlist_view/organisms/custom_app_bar_play_view.dart';
import 'package:playlist_app/common/organisms/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:playlist_app/models/playlist.dart';
import 'package:playlist_app/navigators/app_navigator.dart';

import '../controllers/playlist_controller.dart';
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
  late List<PlaylistContent> _contentItems;
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
    final items = await playlistContentController.loadPlaylistContent();
    setState(() {
      _contentItems = items;
      _itemOrder = List.generate(
          _contentItems.length, (index) => index); // Initialize item order
    });
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

  void _onSaveOrder() {
    // Logic to save the new order
    // After saving, hide the Save button
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
            child: ContentCardOrganism(
              imagePath: content.imagePath,
              date: content.date,
              likes: content.likes.toString(),
              tags: content.tags,
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
              likes: content.likes.toString(),
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
          if (_showSaveButton)
            Positioned(
              bottom: 10, // Adjust based on the bottomNavBar height and desired spacing
              left: 0,
              right: 0,
              child: Center( // Center the button horizontally
                child: InkWell(
                  onTap: _onSaveOrder,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Colors.deepPurple, Colors.purple],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
