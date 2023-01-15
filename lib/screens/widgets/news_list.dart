import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reddit_news/screens/full_info_page.dart';

class NewsList extends StatefulWidget {
  final int newsLength;
  final List newsData;
  const NewsList({super.key, required this.newsLength, required this.newsData});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: widget.newsLength,
                  itemBuilder: (context, index) {
                    var data = widget.newsData[index]['data'];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullInfoPage(
                              title: data['title'],
                              fullText: data['selftext'],
                              ups: data['ups'],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          const Divider(color: Colors.red),
                          const SizedBox(height: 20),
                          Text(
                            data['title'] ?? 'loading..',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          CachedNetworkImage(
                            width: double.infinity,
                            height: 200,
                            imageUrl: data['thumbnail'],
                            errorWidget: (context, url, error) => Image.asset('assets/no_image.jpg'),
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                  physics: const AlwaysScrollableScrollPhysics(),
                );
  }
}