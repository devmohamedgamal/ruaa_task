import 'image.dart';

class AdsModel {
	int? id;
	String? name;
	String? desc;
	String? firstImage;
	List<Image>? images;
	String? price;
	String? createdAt;

	AdsModel({
		this.id, 
		this.name, 
		this.desc, 
		this.firstImage, 
		this.images, 
		this.price, 
		this.createdAt, 
	});

	factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				desc: json['desc'] as String?,
				firstImage: json['first_image'] as String?,
				images: (json['images'] as List<dynamic>?)
						?.map((e) => Image.fromJson(e as Map<String, dynamic>))
						.toList(),
				price: json['price'] as String?,
				createdAt: json['created_at'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'desc': desc,
				'first_image': firstImage,
				'images': images?.map((e) => e.toJson()).toList(),
				'price': price,
				'created_at': createdAt,
			};
}
