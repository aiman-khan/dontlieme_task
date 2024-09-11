import 'package:cached_network_image/cached_network_image.dart';
import 'package:dontlieme_task/common/extensions/num.dart';
import 'package:dontlieme_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesGridGallery extends StatelessWidget {
  final List<String> imageUrls;

  const ImagesGridGallery({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gridImages = imageUrls.length > 2 ? imageUrls.sublist(2) : [];

    return SizedBox(
      height: 400.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  color: R.colors.green,
                ),
              ),
            ],
          ),
          10.hb,
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrls.isNotEmpty ? imageUrls[0] : '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              10.wb,
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrls.length > 1 ? imageUrls[1] : '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.hb,
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gridImages.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: gridImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
