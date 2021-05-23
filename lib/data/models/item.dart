import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'json_interface.dart';

@immutable
class Item extends Equatable implements JsonInterface {
  Item({@required this.title, @required this.image});

  final String title;
  final String image;

  Map<String, dynamic> toJson() => {'title': this.title, 'image': this.image};

  factory Item.fromJson(Map json) => Item(
        title: _buildTitle(json['data']),
        image: _buildImage(json['links']),
      );

  static String _buildTitle(items) {
    String title;
    if (items != null) {
      if (items.length > 0) {
        items?.forEach((item) {
          title = item["title"];
        });
      }
    }
    return title;
  }
  static String _buildImage(items) {
    String image;
    if (items != null) {
      if (items.length > 0) {
        items?.forEach((item) {
          if(image == null) {
            image = item["href"];
          }
        });
      }
    }
    return image;
  }

  Item copyWith({
    String title,
    String image,
  }) =>
      Item(
        title: title ?? this.title,
        image: image ?? this.image,
      );

  @override
  String toString() {
    return 'Ally{title: $title, image: $image}';
  }

  @override
  List<Object> get props => [title, image];
}
