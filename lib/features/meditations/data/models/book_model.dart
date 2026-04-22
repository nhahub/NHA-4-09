import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookModel {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BooksResponse {
  final List<BookModel>? items;

  BooksResponse({this.items});

  factory BooksResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VolumeInfo {
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class IndustryIdentifier {
  final String? type;
  final String? identifier;

  IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryIdentifierToJson(this);
}

@JsonSerializable()
class ReadingModes {
  final bool? text;
  final bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}

@JsonSerializable()
class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final Price? listPrice;
  final Price? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}

@JsonSerializable()
class Price {
  final double? amount;
  final String? currencyCode;

  Price({this.amount, this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer {
  final int? finskyOfferType;
  final PriceMicros? listPrice;
  final PriceMicros? retailPrice;

  Offer({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}

@JsonSerializable()
class PriceMicros {
  final int? amountInMicros;
  final String? currencyCode;

  PriceMicros({this.amountInMicros, this.currencyCode});

  factory PriceMicros.fromJson(Map<String, dynamic> json) =>
      _$PriceMicrosFromJson(json);

  Map<String, dynamic> toJson() => _$PriceMicrosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Pdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);
}

@JsonSerializable()
class Epub {
  final bool? isAvailable;
  final String? acsTokenLink;

  Epub({this.isAvailable, this.acsTokenLink});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);
}

@JsonSerializable()
class Pdf {
  final bool? isAvailable;

  Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Map<String, dynamic> toJson() => _$PdfToJson(this);
}
