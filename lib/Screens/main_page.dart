import 'package:flutter/material.dart';
import 'package:lecture_03/Models/football_club.dart';
import 'package:lecture_03/Screens/image_details_page.dart';

class MainPage extends StatefulWidget {
  
  const MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final List<FootballClub> fcList = <FootballClub>[];

  @override
  Widget build(BuildContext context) {
    if(fcList.isEmpty) {
      fcList.add(FootballClub(name: 'Заря', logo: 'resources/images/zarya.png'));
      fcList.add(FootballClub(name: 'Шахтер', logo: 'resources/images/shakter.png'));
      fcList.add(FootballClub(name: 'Динамо', logo: 'resources/images/dynamo.png'));
      fcList.add(FootballClub(name: 'СК Днепр-1', logo: 'resources/images/dnepr.png'));
      fcList.add(FootballClub(name: 'ФК Александрия', logo: 'resources/images/alexandriya.png'));
      fcList.add(FootballClub(name: 'Десна', logo: 'resources/images/desna.png'));
      fcList.add(FootballClub(name: 'Карпаты', logo: 'resources/images/karpaty.png'));
      fcList.add(FootballClub(name: 'Колос', logo: 'resources/images/kolos.jpeg'));
      fcList.add(FootballClub(name: 'ФК Львов', logo: 'resources/images/lvov.png'));
      fcList.add(FootballClub(name: 'Ворскла', logo: 'resources/images/vorskla.png'));
      fcList.add(FootballClub(name: 'Мариуполь', logo: 'resources/images/mariupol.png'));
      fcList.add(FootballClub(name: 'Олимпик', logo: 'resources/images/olimpic.png'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'IndieFlower'
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () {
              _addNewClub();
            },
          )
        ],
      ),
      body: Container(
        child: mainGridView(),
      ),
    );
  }

  Widget mainGridView() {



    return GridView.builder(
      itemCount: fcList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return footballClub(fcList[index]);
      },
    );
  }

  Widget footballClub(FootballClub club) {
    return Card(
      child: Hero(
          tag: club.name,
          child: Material(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) => ImageDetailsPage(assetPath: club.logo, location: club.location)
                ));
              },
              child: GridTile(
                child: club.location == 'local' ? Image.asset(club.logo) : Image.network(club.logo),
                footer: Container(
                  color: Colors.black45,
                  child: ListTile(
                    leading: Text(
                      club.name, 
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }

  void _addNewClub() {
    fcList.insert(0, FootballClub(name: 'Juventus', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Juventus_FC_2017_logo.svg/126px-Juventus_FC_2017_logo.svg.png', location: 'network'));   
    setState(() {
      
    });
  }
}