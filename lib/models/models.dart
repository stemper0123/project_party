import 'dart:convert';

List<Party> partyFromJson(String str) =>
    List<Party>.from(json.decode(str).map((x) => Party.fromJson(x)));

String partyToJson(List<Party> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



List<Party> testParties = [
  Party(
    partyId: '0eb9d01b-f02e-47f8-89c6-c12f65aa3a55',
    name: 'Titel21',
    time: DateTime(2023, 02, 22, 06, 30, 00),
    description: 'Beschreibung21',
    pictureSource:
        'https://img.freepik.com/vektoren-kostenlos/schattenbild-eines-partypublikums_1048-9714.jpg?w=2000',
    flyerSource:
        'https://img.freepik.com/vektoren-kostenlos/schattenbild-eines-partypublikums_1048-9714.jpg?w=2000',
    locationName: 'Sclub',
    adress: 'undefined',
    city: 'Fulda',
    partyPositionX: 50.5558095,
    partyPositionY: 9.6808449,
    musikart: null,
    cost: 20,
    minAge: 18,
    createdBy: 'srkFMDli8JeRmAuoX8ZD04RZVKV2',
    genres:
        'ClubSounds,Techno,Hardstyle,Pop,House,10er,Classic,00er,80er,Drum and Bass',
    distanceInMeters: 0,
  ),
  Party(
    partyId: '3b3da6df-7e43-4c1d-beb5-e115ba572a8e',
    name: 'Titel',
    time: DateTime(2023, 02, 22, 08, 30, 00),
    description: 'Beschreibung',
    pictureSource:
        'https://img.freepik.com/vektoren-kostenlos/schattenbild-eines-partypublikums_1048-9714.jpg?w=2000',
    flyerSource:
        'https://img.freepik.com/vektoren-kostenlos/schattenbild-eines-partypublikums_1048-9714.jpg?w=2000',
    locationName: 'Sclub',
    adress: 'undefined',
    city: 'Fulda',
    partyPositionX: 50.5471378,
    partyPositionY: 9.6760143,
    musikart: null,
    cost: 20,
    minAge: 18,
    createdBy: '0',
    genres: 'ClubSounds,Hardstyle,House,10er,Classic,00er,80er,Drum and Bass',
    distanceInMeters: 1022.0938930462103,
  )
];

List<List<Party>> listOfTestParties = [
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
  testParties,
];
class Party {
  Party({
    required this.partyId,
    required this.name,
    required this.time,
    required this.description,
    required this.pictureSource,
    required this.flyerSource,
    required this.locationName,
    required this.adress,
    required this.city,
    required this.partyPositionX,
    required this.partyPositionY,
    this.musikart,
    required this.cost,
    required this.minAge,
    required this.createdBy,
    this.genres,
    required this.distanceInMeters,
  });

  String partyId;
  String name;
  DateTime time;
  String description;
  String pictureSource;
  String flyerSource;
  String locationName;
  String adress;
  String city;
  double partyPositionX;
  double partyPositionY;
  dynamic musikart;
  int cost;
  int minAge;
  String createdBy;
  String? genres;
  double distanceInMeters;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        partyId: json["party_id"],
        name: json["Name"],
        time: DateTime.parse(json["Time"]),
        description: json["Description"],
        pictureSource: json["PictureSource"],
        flyerSource: json["FlyerSource"],
        locationName: json["LocationName"],
        adress: json["Address"],
        city: json["City"],
        partyPositionX: json["PartyPositionX"]?.toDouble(),
        partyPositionY: json["PartyPositionY"]?.toDouble(),
        musikart: json["Musikart"],
        cost: json["Cost"],
        minAge: json["MinAge"],
        createdBy: json["CreatedBy"],
        genres: json["genres"],
        distanceInMeters: json["distance_in_meters"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "party_id": partyId,
        "Name": name,
        "Time": time.toIso8601String(),
        "Description": description,
        "PictureSource": pictureSource,
        "FlyerSource": flyerSource,
        "LocationName": locationName,
        "Address": adress,
        "City": city,
        "PartyPositionX": partyPositionX,
        "PartyPositionY": partyPositionY,
        "Musikart": musikart,
        "Cost": cost,
        "MinAge": minAge,
        "CreatedBy": createdBy,
        "genres": genres,
        "distance_in_meters": distanceInMeters,
      };
}
