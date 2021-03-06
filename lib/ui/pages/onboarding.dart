part of 'pages.dart';

class Onboard extends StatelessWidget {
  static const String routeName = "/onboard";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin{
  int currentPage = 0;

  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onboard1", "Welcome to YouPlanner", "Whats going to happen tomorrow?"),
                    onBoardPage("onboard2", "Work Happens", "Make sure to take notes and get to know when work happens."),
                    onBoardPage("onboard3", "Assign your video plans", "Task and assign your video ideas for a better workflow."),
                  ],
                  onPageChanged: (value)=>{setCurrentPage(value)},
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              )
            ],
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/path1.png'),
                  fit: BoxFit.fill
                )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Register())
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 9),
                          blurRadius: 20,
                          spreadRadius: 3
                        )]
                      ),
                      child: Text("Get Started", style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ),

                  SizedBox(height: 30,),

                  InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Login()));

                  },
                  child: Text("Login", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),)
                )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  AnimatedContainer getIndicator(int pageNo){
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage == pageNo) ? Colors.black : Colors.grey
      ),
    );
  }
  Column onBoardPage(String img, String title, String desc){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$img.png')
            )
          ),
        ),

        SizedBox(
          height: 50,
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title, 
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),
          )
        ),

        SizedBox(
          height: 10,
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            desc, 
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey
            ),
            textAlign: TextAlign.center,
          )
        ),

        // Container(
        //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        //   child: Text(
        //     'Lorem ipsum dummy text lol u gud boi so nice. nice is a word that makes people happy',
        //     style: TextStyle(
        //       fontSize: 16,
        //       color: Colors.grey
        //     ),textAlign: TextAlign.center,
        //   ),
        // )

      ],
    );
  }

  setCurrentPage(int value){
    currentPage = value;
    setState(() {
      
    });
  }
  // openLoginPage(){
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  // }
}