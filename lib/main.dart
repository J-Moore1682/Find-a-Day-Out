import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

String searchValue = '';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Day Out Planner',
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
            title: const Text('Home Page', style: TextStyle(color: Colors.black),),
            centerTitle: true,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Select Your City...', style: TextStyle(fontSize: 30),),

            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DropDownWidget(),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SearchButton(),
            ],
          )
        ],
      )
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = 'London';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: Colors.green,
      icon: const Icon(Icons.arrow_drop_down_circle),
      elevation: 8,
      style: const TextStyle(color: Colors.black, fontSize: 40.0),
      alignment: Alignment.center,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          searchValue = dropdownValue;
        });
      },
      items: <String>['London', 'Liverpool', 'Birmingham']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          alignment: Alignment.center,
        );
      }).toList(),
    );
  }
}

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage())
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Text('Search', style: TextStyle(fontSize: 25)),
              )
            ]
        )
    );
  }
}


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Search Results'),
      ),
      body: Center(
        child:
        _buildList()
      ),
    );
  }
}


ListTile _tile(String name, String location, double rating,){
  return ListTile(
    title: Text(name, style: const TextStyle(fontSize: 30)),
    subtitle: Text(location, style: const TextStyle(fontSize: 20)),
    trailing: Column( children: <Widget>[(Icon(Icons.star, size: 30,)), Text(rating.toString(), style: const TextStyle(fontSize: 20),)]), //Text(rating.toString(), style: const TextStyle(fontSize: 25)),
  );
}

Widget _buildList(){
  return ListView(
    children: [
      if (searchValue == 'London')...[
        _tile('Natural History Museum', 'Cromwell Rd, South Kensington, London SW7 5BD', 4.7),
        _tile('Science Museum', 'Exhibition Rd, South Kensington, London SW7 2DD', 4.5),
        _tile('SEA LIFE Centre', 'Riverside Building, County Hall, Westminster Bridge Rd, London SE1 7PB', 4.3),
        _tile('Imperial War Museum', 'Lambeth Rd, London SE1 6HZ', 4.7),
        _tile('London Eye', 'Riverside Building, County Hall, London SE1 7PB', 4.5),
        _tile('The Dungeons London', "The Queen's Walk, London SE1 7PB", 4.3),
        _tile('Madame Tussauds', 'Marylebone Rd, London NW1 5LR', 4.4),
        _tile('The National Gallery', 'Trafalgar Square, London WC2N 5DN', 4.7),
        _tile('ZSL London Zoo', 'Outer Cir, London NW1 4RY', 4.3),
        _tile('Tate Modern', 'Bankside, London SE1 9TG', 4.5),]
      else if (searchValue == 'Liverpool')...[
        _tile('World Museum', 'William Brown St, Liverpool L3 8EN', 4.6),
        _tile('Liverpool Cathedral', 'St James Mt, Liverpool L1 7AZ', 4.8),
        _tile('The Beatles Story', 'Britannia Vaults, Royal Albert Dock, Liverpool L3 4AD', 4.5),
        _tile('Museum of Liverpool', 'Pier Head, Mann Island, Liverpool L3 1DG', 4.6),
        _tile('Knowsley Safari', 'Prescot L34 4AN', 4.6)]
      else if (searchValue == 'Birmingham')...[
          _tile('Cadbury World', 'Linden Rd, Birmingham B30 1JR', 4.3),
          _tile('National SEA LIFE Centre Birmingham', "Eleven Brindley Place, The Water's Edge, Birmingham B1 2HL", 4.3),
          _tile('Dudley Zoo and Castle', 'Castle Hill, Dudley DY1 4QF', 4.4),
          _tile('LEGOLAND Discovery Centre', 'LEGOLAND Discovery Centre, Arena, King Edwards Rd, Birmingham B1 2AA', 4.1),
          _tile('Ghetto Golf Birmingham', 'The Custard Factory, Gibb St, Deritend, Birmingham B9 4AA', 4.6),
          _tile('The Big Play Barn', "Ash End House Children's Farm Middleton Lane, Tamworth B78 2BL", 4.6),]
    ],
  );
}
