class Book {
  String? id;
  String? title;
  String? description;
  String? ownerName;
  double? price;
  String? phoneNumber;
  String? photoUrl;
  String? location;
  String? userId;
  int? postedTimestamp;
  String? category;
  bool? isExchange;

  Book(
      {this.title,
      this.description,
      this.location,
      this.price,
      this.phoneNumber,
      this.photoUrl,
      this.userId,
      this.postedTimestamp,
      this.ownerName,
      this.category,
      this.isExchange,
      this.id});

  Book.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    location = json['location'];
    ownerName = json['ownerName'];
    price = json['price'];
    phoneNumber = json['phone_number'];
    photoUrl = json['photo_url'];
    userId = json['userId'];
    postedTimestamp = json['postedTimestamp'];
    category = json['category'];
    isExchange = json['isExchange'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['price'] = price;
    data['phone_number'] = phoneNumber;
    data['photo_url'] = photoUrl;
    data['userId'] = userId;
    data['postedTimestamp'] = postedTimestamp;
    data['ownerName'] = ownerName;
    data['category'] = category;
    data['isExchange'] = isExchange;
    return data;
  }
}
