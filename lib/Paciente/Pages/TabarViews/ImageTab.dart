import 'package:flutter/material.dart';

class WoundPhotoModel {
  final String id;
  final String imageUrl;
  final String date;

  const WoundPhotoModel({
    required this.id,
    required this.imageUrl,
    required this.date,
  });
}

class WoundPhotoCard extends StatelessWidget {
  final WoundPhotoModel photo;
  final VoidCallback? onTap;

  const WoundPhotoCard({super.key, required this.photo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: photo.imageUrl.isNotEmpty
                    ? Image.network(
                        photo.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            photo.date,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ImageTab extends StatelessWidget {
  final List<WoundPhotoModel> photos;

  const ImageTab({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${photos.length} fotos',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              itemCount: photos.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 90.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return WoundPhotoCard(photo: photos[index], onTap: () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
