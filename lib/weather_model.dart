// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  late Location location;
  late Current current;

  Weather.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }
}

class Location {
  late String name;
  late String region;
  late String country;
  late double lat;
  late double lon;
  late String tzID;
  late int localTimeEpoch;
  late String localTime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzID,
    required this.localTimeEpoch,
    required this.localTime,
  });

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzID = json['tz_id'];
    localTimeEpoch = json['localtime_epoch'];
    localTime = json['localtime'];
  }
}

class Current {
  late String lastUpdated;
  late int tempC;
  late int isDay;
  late Condition condition;
  late double windKPH;
  late int humidity;
  late int cloud;
  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windKPH,
    required this.humidity,
    required this.cloud,
  });
  Current.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windKPH = json['wind_kph'];
    humidity = json['humidity'];
    cloud = json['cloud'];
  }
}

class Condition {
  late String text;
  Condition({
    required this.text,
  });

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
}
