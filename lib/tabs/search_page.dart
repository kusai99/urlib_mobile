import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:face_net_authentication/pages/widgets/book_card.dart';
import 'package:face_net_authentication/pages/models/books.dart';

import '../styles/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final searchController = TextEditingController();

  bool isSearching = false;
  List<Book> searchList = List.empty(growable: true);
  String _searchText = "";
  _SearchPageState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          isSearching = true;
          _searchText = searchController.text;
          _buildSearchList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isSearching = false;
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.addListener(_setActiveTabIndex);

    // void _setActiveTabIndex() {
    //  int _activeTabIndex = _tabController.index;
    // }
  }

  void init() {
    searchList = bookList;
  }

  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Book> _buildList() {
    return bookList;
  }

  List<Book> _buildSearchList() {
    if (_searchText.isEmpty) {
      return searchList = bookList;
    } else {
      searchList = bookList
          .where((element) =>
              element.title.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      // print('${searchList.length}');
      return searchList;
    }
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // final tabIndex = _tabController.of
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[clrbrowndark, clrbrownlight])),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(h * 0.20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                            width: w,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: <Color>[
                                  clrbrowndark,
                                  clrbrownlight
                                ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'Search for Books',
                                    style: TextStyle(
                                        color: Colors.grey[100],
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.03,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 20),
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.25),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffb59279), width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),

                                      contentPadding:
                                          EdgeInsets.all(15), // Added this
                                    ),
                                  ),
                                ),
                                TabBar(
                                    controller: _tabController,
                                    tabs: const <Widget>[
                                      Tab(
                                        text: "Book Title",
                                      ),
                                      Tab(
                                        text: "Explore Genres",
                                      ),
                                    ])
                              ],
                            )),
                      ],
                    ),
                    // Container(
                    // child: Text(find(searchController.text)),
                    // )
                  ],
                )),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return BookCard(searchList[index]);
                },
              ),
              Text('GENRES'),
            ],
          ),
        );
      }),
    );
  }
}
