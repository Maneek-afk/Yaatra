import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Side_menu.dart';
import 'package:flutter/material.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 204, 241),
      appBar:  PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: MyAppBar()),
      drawer:  SideMenu(),
      body: Stack(
        children: [
          
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  
                  SizedBox(height: 20),
                  _buildAboutUsSection(context),
                  SizedBox(height: 20),
                  _buildOurVisionSection(context),
                  SizedBox(height: 20),
                  _buildOurValuesSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
     
    );
  }

  

  Widget _buildAboutUsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Us',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 20),
        Text(
          'We are a team of passionate individuals who are dedicated to providing the best bus services in the city. Our mission is to make public transportation more accessible, efficient, and reliable for all.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildOurVisionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Vision',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 20),
        Text(
          'We envision a future where public transportation is not only convenient but also sustainable. We aim to achieve this by continuously improving our services, adopting eco-friendly practices, and promoting a culture of safety and respect.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildOurValuesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Values',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 20),
        Text(
          '1. Customer Satisfaction: We prioritize the needs and preferences of our customers.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 10),
        Text(
          '2. Innovation: We are always looking for new ways to improve our services and stay ahead of the competition.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 10),
        Text(
          '3. Integrity: We maintain high ethical standards and are committed to transparency in all our business dealings.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
