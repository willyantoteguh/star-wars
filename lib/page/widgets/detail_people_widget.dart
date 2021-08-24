part of 'widgets.dart';

class DetailPeopleWidget extends StatelessWidget {
  final People people;

  DetailPeopleWidget({@required this.people});

  @override
  Widget build(BuildContext context) {
    People _people;

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(),
          SafeArea(child: Container()),
          ListView(
            children: <Widget>[
              buildColumn(context)
            ],
          )
        ],
      )),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
              children: <Widget>[
                headerDetail(context),
                Container(
                  margin: EdgeInsets.fromLTRB(margin, 16, margin, 6),
                  child: Text(
                    people.name,
                    textAlign: TextAlign.center,
                    style: regularTextFont.copyWith(fontSize: 24),
                  ),
                ),
                Text(
                  people.homeworld,
                  style: greyTextFont.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: margin,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                        left: margin,
                        bottom: 12,
                      ),
                      child: Text("Detail Artist",
                          style: userTextFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w900))),
                ),
                listBioDetail(),
                SizedBox(height: margin)
              ],
            );
  }

  Stack headerDetail(BuildContext context) {
    return Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 270,
                        ),
                        Container(
                          height: 271,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(0, 1),
                                  end: Alignment(0, 0.06),
                                  colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ])),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: margin),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.04)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                );
  }

  Padding listBioDetail() {
    return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: margin, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Eye Color: ",
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            people.eyeColor.toUpperCase(),
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Height: ",
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            people.height.toUpperCase(),
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Gender: ",
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            people.gender.toUpperCase(),
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Birthday: ",
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            people.birthYear.toUpperCase(),
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
  }
}
