import 'package:alice/library/icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FontAwesomeGalleryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FontAwesomeGalleryHomeState();
}

class FontAwesomeGalleryHomeState extends State<FontAwesomeGalleryHome> {
  var _searchTerm = "";
  var _isSearching = false;


  @override
  Widget build(BuildContext context) {
    final filteredIcons = icons.where((icon) {
      return _searchTerm.isEmpty || icon.title.toLowerCase().contains(_searchTerm.toLowerCase());
    }).toList();
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: _isSearching ? _searchBar(context) : _titleBar(),
      body: GridView.builder(
        itemCount: filteredIcons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 3 : 3,
        ),
        itemBuilder: (context, index) {
          final icon = filteredIcons[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Hero(
                          tag: icon,
                          child: FaIcon(
                            icon.iconData,
                            size: 100,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(tag: icon, child: FaIcon(icon.iconData)),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(icon.title),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _titleBar() {
    return AppBar(
      title: Text("Font Awesome 画廊"),
      actions: [
        IconButton(
            icon: FaIcon(FontAwesomeIcons.search),
            onPressed: () {
              ModalRoute.of(context).addLocalHistoryEntry(
                LocalHistoryEntry(
                  onRemove: () {
                    setState(() {
                      _searchTerm = "";
                      _isSearching = false;
                    });
                  },
                ),
              );

              setState(() {
                _isSearching = true;
              });
            })
      ],
    );
  }

  AppBar _searchBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () {
          setState(
                () {
              Navigator.pop(context);
              _isSearching = false;
              _searchTerm = "";
            },
          );
        },
      ),
      title: TextField(
        onChanged: (text) => setState(() => _searchTerm = text),
        autofocus: true,
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}