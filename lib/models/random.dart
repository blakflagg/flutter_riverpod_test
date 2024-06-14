class Random {
  final List data;

  Random(this.data);
  factory Random.fromJson(Map<int, dynamic> json) {
    return Random(json[0]);
  }
}
