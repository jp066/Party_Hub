import 'package:flutter/material.dart';
import 'package:sos_central/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  static List previousSearchs = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Search Bar
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Pesquisa",
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            suffixIcon: searchController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(Icons.cancel_sharp),
                                    onPressed: () {
                                      searchController.clear();
                                    },
                                  ),
                          ),
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          onEditingComplete: () {
                            previousSearchs.add(searchController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              context: context,
                              builder: (context) =>
                                  _custombottomSheetFilter(context),
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.filter_alt,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              // Previous Searches
              Container(
                color: Colors.black,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: previousSearchs.length,
                  itemBuilder: (context, index) => previousSearchsItem(index),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              // Search Suggestions
              Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        searchSuggestionsTiem("suchi"),
                        searchSuggestionsTiem("sandwich"),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        searchSuggestionsTiem("seafood"),
                        searchSuggestionsTiem("fried rice"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  previousSearchsItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            setState(() {});
            previousSearchs.removeAt(index);
          },
          child: Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                previousSearchs[index],
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }

  searchSuggestionsTiem(String text) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.black),
      ),
    );
  }

  _custombottomSheetFilter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Add a Filter",
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text("Done"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}