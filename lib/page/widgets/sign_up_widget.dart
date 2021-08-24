part of 'widgets.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackColor,
      child: SafeArea(
        child: Scaffold(
            body: Container(
          color: whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Center(child: Image.asset("assets/images/logo.png", height: 80)),
              Spacer(),
              RichText(
                text: TextSpan(
                    text: 'Hi There,\nWelcome Back\n',
                    style: boldTextFont.copyWith(
                        color: whiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(
                          text: 'Sign In to your account to continue',
                          style: regularTextFontWhite.copyWith(fontSize: 14))
                    ]),
              ),
              Spacer(),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: silverColor,
                      onPrimary: blackColor,
                      minimumSize: Size(double.infinity, 55)),
                  icon: FaIcon(FontAwesomeIcons.mailBulk, color: whiteColor),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);

                    provider.signInGoogle();
                  },
                  label: Text('Sign In with Email')),
              SizedBox(height: 8),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: blackColor,
                      onPrimary: whiteColor,
                      minimumSize: Size(double.infinity, 55)),
                  icon: FaIcon(FontAwesomeIcons.google, color: primaryColor),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);

                    provider.signInGoogle();
                  },
                  label: Text('Sign In with Google')),
              // SizedBox(height: h80),
              SizedBox(height: 40),
              Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: regularTextFont,
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              style: regularTextFont.copyWith(
                                  decoration: TextDecoration.underline))
                        ])),
              ),
              Spacer(),
            ],
          ),
        )),
      ),
    );
  }
}
