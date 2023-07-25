class History {
  late String history;
  late double result;
  History({
    required this.history,
    required this.result,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      History(history: json['history'], result: json['result']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['history'] = history!;
    data['result'] = result;
    return data;
  }
}
