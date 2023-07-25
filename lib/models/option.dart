class Option {
  double val;
  int op;

  Option({
    required this.val,
    required this.op,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    val: json["val"]?.toDouble(),
    op: json["op"],
  );

  Map<String, dynamic> toJson() => {
    "val": val,
    "op": op,
  };
}