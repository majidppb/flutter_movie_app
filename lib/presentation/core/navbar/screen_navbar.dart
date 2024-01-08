import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/core/colors.dart';

// Default : ScreenHome
// Value is updated in go router StatefulShellRoute page builder,
// this is to keep the value updated even when launched through links
final ValueNotifier<int> navBarIndex = ValueNotifier(0);

class BottomNavigationPage extends StatelessWidget {
  final StatefulNavigationShell child;

  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navBarIndex.value,
        onTap: (newIndex) {
          child.goBranch(
            newIndex,
            initialLocation: newIndex == child.currentIndex,
          );
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_rounded),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions_rounded),
            label: 'Fast Laughs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_rounded),
            label: 'Library',
          ),
        ],
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
    );
  }
}
