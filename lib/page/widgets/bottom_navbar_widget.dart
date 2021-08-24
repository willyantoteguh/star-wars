part of 'widgets.dart';

class BottomNavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  BottomNavbarWidget({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      //     color: blackColor),
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: Icon(
                Icons.home_filled,
                color: (selectedIndex == 0) ? primaryColor : greyColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 83),
              child: Icon(
                Icons.favorite,
                color: (selectedIndex == 1) ? primaryColor : greyColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: Icon(
                Icons.people,
                color: (selectedIndex == 2) ? primaryColor : greyColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
