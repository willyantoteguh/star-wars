part of '../pages.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackColor,
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            color: whiteColor.withOpacity(0.3),
            padding: EdgeInsets.symmetric(horizontal: margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: margin),
                ListTile(
                  leading: CircleAvatar(
                      radius: 40, backgroundImage: NetworkImage(user.photoURL)),
                  title: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Hello ",
                            style: boldTextFont,
                            children: [
                              TextSpan(
                                  text: user.displayName, style: userTextFont),
                            ]),
                      ),
                      SizedBox(width: 8),
                      FaIcon(FontAwesomeIcons.handPeace, color: primaryColor)
                    ],
                  ),
                  subtitle: Text("Choose your favorite star wars artist"),
                ),
                SizedBox(height: 20),
                Text('Best Artist', style: boldTextFont.copyWith(fontSize: 18)),
                SizedBox(height: 20),
                Container(
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    height: 180,
                    width: double.infinity,
                    child: BlocBuilder<PeopleBloc, PeopleState>(
                        builder: (_, state) {
                      if (state is PeopleLoaded) {
                        List<People> listPeople = state.people.sublist(0, 6);

                        return (state == null)
                            ? Container(color: primaryColor)
                            : Flexible(
                                flex: 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listPeople.length,
                                    itemBuilder: (_, i) {
                                      final people = listPeople[i];

                                      return Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  (people == state.people.first)
                                                      ? 5
                                                      : 0,
                                              right: margin),
                                          child: PeopleCard(people, onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailPeopleWidget(
                                                            people: people)));
                                          }));
                                    }));
                      } else {
                        return SizedBox(child: loadingIndicator);
                      }
                    })),
                SizedBox(height: 20),
                Text('Top Related Artist',
                    style: boldTextFont.copyWith(fontSize: 18)),
                SizedBox(
                  height: 20,
                ),
                Container(child:
                    BlocBuilder<PeopleBloc, PeopleState>(builder: (_, state) {
                  if (state is PeopleLoaded) {
                    List<People> listPeople = state.people;

                    return (state == null)
                        ? Container(color: primaryColor)
                        : Flexible(
                            flex: 0,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 0,
                                      childAspectRatio: 0.60),
                              itemCount: listPeople.length,
                              itemBuilder: (_, i) {
                                final people = listPeople[i];

                                return Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color: silverColor,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(people.name),
                                      Text(people.height),
                                      Text(people.skinColor),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                  } else {
                    return SizedBox(child: loadingIndicator);
                  }
                })),
                SizedBox(height: 520),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
