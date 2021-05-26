import 'package:flutter/material.dart';
import 'package:news_app/features/display_news/models/NewsModel.dart';
import 'package:news_app/features/display_news/presentation/provider.dart';
import 'package:provider/provider.dart';

class DisplayNewsUI extends StatefulWidget {
  @override
  _DisplayNewsUIState createState() => _DisplayNewsUIState();
}

class _DisplayNewsUIState extends State<DisplayNewsUI> {
  Widget mobileView() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Text(
                  "Hey there, here is the latest news about Apple",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              Consumer<DisplayNewsProvider>(
                  builder: (context, provider, child) =>
                      FutureBuilder<NewsModel>(
                          future: provider.getNews(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                itemCount: snapshot.data!.articles.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 192,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 16,
                                                  color: Colors.black
                                                      .withOpacity(0.16),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(snapshot
                                                          .data!
                                                          .articles[index]
                                                          .imageUrl)
                                                      .image)),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          snapshot.data!.articles[index]
                                              .datePublished
                                              .toIso8601String(),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          snapshot.data!.articles[index].title,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          snapshot.data!.articles[index]
                                              .description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 480) {
          return mobileView();
        } else
          return desktopView();
      },
    );
  }
}
