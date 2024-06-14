import 'package:flutter/material.dart';

class InfoTagsWidget extends StatelessWidget {
  final String title;
  final List<String> tags;

  const InfoTagsWidget({
    Key? key,
    required this.title,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 5),
            Wrap(
              runSpacing: 5,
              spacing: 5,
              alignment: WrapAlignment.start,
              children: tags.map((tag){
                return tag.isNotEmpty ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tag.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ):const SizedBox.shrink();
              }
              ).toList(),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}