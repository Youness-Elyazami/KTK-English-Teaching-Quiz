import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int _selectedIndex = 0;
 
  final List<Widget> _sectionContents = [
    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'TKT',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
              fontFamily: 'LeagueSpartan',
            ),
          ),
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,  
            text: TextSpan(
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'LeagueSpartan',
                  color: Colors.black),
              children: [
                TextSpan(
                    text:
                        'Are you an aspiring English language educator looking to consolidate and refine your teaching skills and expand your teaching knowledge?\n'),
                TextSpan(
                    text: 'Meet KTK (Key Teaching Knowledge)',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        ', your ultimate practice app of English language teaching theory and methodology. Rehearse your teaching knowledge with the essential themes and issues related to '),
                TextSpan(
                    text: 'TEFL/TESOL',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold)),
                TextSpan(text: '.\n\n'),
                TextSpan(
                    text: 'TKT',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        ' is your comprehensive companion designed to support and elevate your teaching journey. Whether you\'re a seasoned instructor or just starting out, our app offers a wide range of questions to broaden your '),
                TextSpan(
                    text: 'EFL/ESL',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold)),
                TextSpan(text: ' perspectives.'),
              ],
            ),
          ),
        ],
      ),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Help Us Improve',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
            fontFamily: 'LeagueSpartan',
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Please, help us improve the app by emailing your concerns to:",
          style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan'),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              'assets/new.png',  
              height: 24,
              width: 24,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'yobahmad@gmail.com',
                style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/facebook.png',  
              height: 24,
              width: 24,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'https://www.facebook.com/profile.php?id=100002042885144',
                style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan'),
              ),
            ),
          ],
        ),
      ],
    ),
    Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Acknowledgments',
      style: TextStyle(
        fontSize: 20,  
        fontWeight: FontWeight.bold,
        color: Colors.teal,
        fontFamily: 'LeagueSpartan',
      ),
    ),
    SizedBox(height: 8),  
    Text(
      'The contents of the app so far come from the Moroccan Ministry of Education official teacher exams (2016-2023) with slight adaptations.',
      style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),  
    ),
    SizedBox(height: 8), 
    Text(
      'I would like to thank every dedicated student from the Department of English at ENS (Ecole Normale Supérieure, Rabat) and from elsewhere who have contributed to the creation of this app.',
      style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),  
    ),
    SizedBox(height: 8), 
    Text(
      'Big thanks also to:',
      style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),  
    ),
    SizedBox(height: 8),
   
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- Youness El Yazami Adli',
          style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),  
        ),
        Text(
          '- Rhita T.',  
          style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),
        ),
        Text(
          '- Bettaoui Niima',  
          style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),
        ),
      ],
    ),
  ],
),

  ];

  // Method to change the selected index when an icon is clicked
  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Content layered under the top image
          Column(
            children: [
              // Green section, shorter than the white section
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Color(0xFF94D1BE),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              'About Us',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'LeagueSpartan',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // Positioned white rectangle overlapping green and white sections
          Positioned(
            top: 210,
            left: 40,
            right: 40,
            child: Container(
              height: 570,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Icon bar at the top with underlines
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => _onIconTapped(0),
                          child: Column(
                            children: [
                              Icon(Icons.info,
                                  color: _selectedIndex == 0
                                      ? Colors.teal
                                      : Colors.grey),
                              SizedBox(height: 5),
                              Container(
                                height: 2,
                                width: 60,
                                color: _selectedIndex == 0
                                    ? Colors.teal
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onIconTapped(1),
                          child: Column(
                            children: [
                              Icon(Icons.help_outline,
                                  color: _selectedIndex == 1
                                      ? Colors.teal
                                      : Colors.grey),
                              SizedBox(height: 5),
                              Container(
                                height: 2,
                                width: 60,
                                color: _selectedIndex == 1
                                    ? Colors.teal
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onIconTapped(2),
                          child: Column(
                            children: [
                              Icon(Icons.star_outline,
                                  color: _selectedIndex == 2
                                      ? Colors.teal
                                      : Colors.grey),
                              SizedBox(height: 5),
                              Container(
                                height: 2,
                                width: 60,
                                color: _selectedIndex == 2
                                    ? Colors.teal
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer between icon bar and content
                  SizedBox(height: 20),

                  // Dynamic section content based on the selected icon
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: _sectionContents[_selectedIndex],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Positioned logo on top of all content
          Positioned(
            top: 80, // Adjust the top position as needed
            left: 20, // Adjust the left position as needed
            right: 20, // Adjust the right position as needed
            child: Image.asset(
              'assets/darkab.png', // Ensure your image is in this path
              height: 130, // Adjust the height of the logo as needed
              fit: BoxFit.contain, // Maintain aspect ratio
            ),
          ),
        ],
      ),
    );
  }
}
