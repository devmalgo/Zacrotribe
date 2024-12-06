import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SingleAirdropItemHeaderDelegate extends SliverPersistentHeaderDelegate {

  final String title;
  final String category;
  final String imgUrl;
  final String date;
  final double topPadding;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  const SingleAirdropItemHeaderDelegate({
    required this.title,
    required this.category,
    required this.imgUrl,
    required this.date,
    required this.topPadding,
    required this.maxExtent,
    required this.minExtent,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final screenWidth = MediaQuery.of(context).size.width;
    const animationDuration = Duration(milliseconds: 200);

    final showCategoryDate = shrinkOffset < 100;

    final calcForTileAnimation = (maxExtent - shrinkOffset - topPadding - 56 - 100) / 100;

    final titleAnimationValue = calcForTileAnimation > 1.0 ? 1.0 : calcForTileAnimation < 0.0 ? 0.0 : calcForTileAnimation;

    final calcForTopBarAnimation = (maxExtent - shrinkOffset - topPadding - 56) / 50;

    final topBarAnimationValue = calcForTopBarAnimation > 1.0 ? 1.0 : calcForTileAnimation < 0.0 ? 0.0 : calcForTileAnimation;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(imgUrl, fit: BoxFit.cover,),

        Positioned(
          bottom: 0,
          child: Container(
            height: maxExtent / 2,
            width: screenWidth,
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black45,
                  Colors.black12
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: AnimatedOpacity(
            opacity: titleAnimationValue,
            duration: animationDuration,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: animationDuration,
                    height: showCategoryDate ? 10 : 0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),),
                  ),
                  AnimatedContainer(
                    duration: animationDuration,
                    height: showCategoryDate ? 15 : 0,
                  ),
                  AnimatedSwitcher(
                    duration: animationDuration,
                    child: showCategoryDate
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Published on $date", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),),
                            const SizedBox(width: 120,),
                            const SizedBox(
                              width: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time_filled, size: 16, color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text("2 Min", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),)
                                ],
                              ),
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: AnimatedContainer(
            duration: animationDuration,
            height: 46 + topPadding,
            color: Colors.white.withOpacity(1 - topBarAnimationValue),
            width: screenWidth,
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.of(context).pop();
                }, icon: Image.asset('assets/icons/ic_back_arrow.png', height: 24, width: 24,),),
                const Spacer(),
                IconButton(onPressed: () {_showBottomSheet(context);}, icon: Image.asset('assets/icons/ic_more.png', height: 24, width: 24,),),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {},
                leading: Image.asset('assets/icons/ic_share.png', height: 24, width: 24,),
                title: const Text("Share", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                subtitle: const Text("You can share or send files through a platform."),
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset('assets/icons/ic_bookmark.png', height: 24, width: 24,),
                title: const Text("Bookmarks", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                subtitle: const Text("You can save or send files through a platform."),
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset('assets/icons/ic_document.png', height: 24, width: 24,),
                title: const Text("Browse", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                subtitle: const Text("You can share or send files through a platform."),
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset('assets/icons/ic_report.png', height: 24, width: 24,),
                title: const Text("Report", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                subtitle: const Text("You can share or send files through a platform."),
              ),
            ],
          ),
        );
      },
    );
  }

}