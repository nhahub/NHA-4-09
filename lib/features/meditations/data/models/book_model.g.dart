// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
  kind: json['kind'] as String?,
  id: json['id'] as String?,
  etag: json['etag'] as String?,
  selfLink: json['selfLink'] as String?,
  volumeInfo: json['volumeInfo'] == null
      ? null
      : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
  saleInfo: json['saleInfo'] == null
      ? null
      : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
  accessInfo: json['accessInfo'] == null
      ? null
      : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
  'kind': instance.kind,
  'id': instance.id,
  'etag': instance.etag,
  'selfLink': instance.selfLink,
  'volumeInfo': instance.volumeInfo?.toJson(),
  'saleInfo': instance.saleInfo?.toJson(),
  'accessInfo': instance.accessInfo?.toJson(),
};

BooksResponse _$BooksResponseFromJson(Map<String, dynamic> json) =>
    BooksResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BooksResponseToJson(BooksResponse instance) =>
    <String, dynamic>{'items': instance.items?.map((e) => e.toJson()).toList()};

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publisher: json['publisher'] as String?,
  publishedDate: json['publishedDate'] as String?,
  description: json['description'] as String?,
  industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
      ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
      .toList(),
  readingModes: json['readingModes'] == null
      ? null
      : ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
  pageCount: (json['pageCount'] as num?)?.toInt(),
  printType: json['printType'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
  maturityRating: json['maturityRating'] as String?,
  imageLinks: json['imageLinks'] == null
      ? null
      : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
  language: json['language'] as String?,
  previewLink: json['previewLink'] as String?,
  infoLink: json['infoLink'] as String?,
  canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
);

Map<String, dynamic> _$VolumeInfoToJson(VolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers
          ?.map((e) => e.toJson())
          .toList(),
      'readingModes': instance.readingModes?.toJson(),
      'pageCount': instance.pageCount,
      'printType': instance.printType,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'ratingsCount': instance.ratingsCount,
      'maturityRating': instance.maturityRating,
      'imageLinks': instance.imageLinks?.toJson(),
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
    };

IndustryIdentifier _$IndustryIdentifierFromJson(Map<String, dynamic> json) =>
    IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );

Map<String, dynamic> _$IndustryIdentifierToJson(IndustryIdentifier instance) =>
    <String, dynamic>{'type': instance.type, 'identifier': instance.identifier};

ReadingModes _$ReadingModesFromJson(Map<String, dynamic> json) =>
    ReadingModes(text: json['text'] as bool?, image: json['image'] as bool?);

Map<String, dynamic> _$ReadingModesToJson(ReadingModes instance) =>
    <String, dynamic>{'text': instance.text, 'image': instance.image};

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) => ImageLinks(
  smallThumbnail: json['smallThumbnail'] as String?,
  thumbnail: json['thumbnail'] as String?,
);

Map<String, dynamic> _$ImageLinksToJson(ImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };

SaleInfo _$SaleInfoFromJson(Map<String, dynamic> json) => SaleInfo(
  country: json['country'] as String?,
  saleability: json['saleability'] as String?,
  isEbook: json['isEbook'] as bool?,
  listPrice: json['listPrice'] == null
      ? null
      : Price.fromJson(json['listPrice'] as Map<String, dynamic>),
  retailPrice: json['retailPrice'] == null
      ? null
      : Price.fromJson(json['retailPrice'] as Map<String, dynamic>),
  buyLink: json['buyLink'] as String?,
  offers: (json['offers'] as List<dynamic>?)
      ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SaleInfoToJson(SaleInfo instance) => <String, dynamic>{
  'country': instance.country,
  'saleability': instance.saleability,
  'isEbook': instance.isEbook,
  'listPrice': instance.listPrice?.toJson(),
  'retailPrice': instance.retailPrice?.toJson(),
  'buyLink': instance.buyLink,
  'offers': instance.offers?.map((e) => e.toJson()).toList(),
};

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
  amount: (json['amount'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String?,
);

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
  'amount': instance.amount,
  'currencyCode': instance.currencyCode,
};

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
  finskyOfferType: (json['finskyOfferType'] as num?)?.toInt(),
  listPrice: json['listPrice'] == null
      ? null
      : PriceMicros.fromJson(json['listPrice'] as Map<String, dynamic>),
  retailPrice: json['retailPrice'] == null
      ? null
      : PriceMicros.fromJson(json['retailPrice'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
  'finskyOfferType': instance.finskyOfferType,
  'listPrice': instance.listPrice?.toJson(),
  'retailPrice': instance.retailPrice?.toJson(),
};

PriceMicros _$PriceMicrosFromJson(Map<String, dynamic> json) => PriceMicros(
  amountInMicros: (json['amountInMicros'] as num?)?.toInt(),
  currencyCode: json['currencyCode'] as String?,
);

Map<String, dynamic> _$PriceMicrosToJson(PriceMicros instance) =>
    <String, dynamic>{
      'amountInMicros': instance.amountInMicros,
      'currencyCode': instance.currencyCode,
    };

AccessInfo _$AccessInfoFromJson(Map<String, dynamic> json) => AccessInfo(
  country: json['country'] as String?,
  viewability: json['viewability'] as String?,
  embeddable: json['embeddable'] as bool?,
  publicDomain: json['publicDomain'] as bool?,
  textToSpeechPermission: json['textToSpeechPermission'] as String?,
  epub: json['epub'] == null
      ? null
      : Epub.fromJson(json['epub'] as Map<String, dynamic>),
  pdf: json['pdf'] == null
      ? null
      : Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
  webReaderLink: json['webReaderLink'] as String?,
  accessViewStatus: json['accessViewStatus'] as String?,
  quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
);

Map<String, dynamic> _$AccessInfoToJson(AccessInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'viewability': instance.viewability,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'epub': instance.epub?.toJson(),
      'pdf': instance.pdf?.toJson(),
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };

Epub _$EpubFromJson(Map<String, dynamic> json) => Epub(
  isAvailable: json['isAvailable'] as bool?,
  acsTokenLink: json['acsTokenLink'] as String?,
);

Map<String, dynamic> _$EpubToJson(Epub instance) => <String, dynamic>{
  'isAvailable': instance.isAvailable,
  'acsTokenLink': instance.acsTokenLink,
};

Pdf _$PdfFromJson(Map<String, dynamic> json) =>
    Pdf(isAvailable: json['isAvailable'] as bool?);

Map<String, dynamic> _$PdfToJson(Pdf instance) => <String, dynamic>{
  'isAvailable': instance.isAvailable,
};
