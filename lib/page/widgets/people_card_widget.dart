part of 'widgets.dart';

class PeopleCard extends StatelessWidget {
  final People people; //parameter
  final Function onTap;

  PeopleCard(this.people, {this.onTap}); //onTap opsional dgn tambahan {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 140,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: blackColor,
            // image: DecorationImage(
            //     image: NetworkImage(),
            //     fit: BoxFit.cover)
            ),
            
        child: Container(
          height: 140,
          width: 180,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.61),
                  Colors.black.withOpacity(0)
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                people.name,
                style: regularTextFont.copyWith(fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
                  Text(
                people.height,
                style: regularTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                people.hairColor,
                style: regularTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
