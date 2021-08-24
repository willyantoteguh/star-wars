part of '../pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        actions: [
          TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text(
                'Logout',
                style: boldTextFont,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: whiteColor.withOpacity(0.3),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              CircleAvatar(
                  radius: 40, backgroundImage: NetworkImage(user.photoURL)),
              SizedBox(
                height: 10,
              ),
              Text(
                user.displayName,
                style: userTextFont,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user.email,
                style: userTextFont,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
