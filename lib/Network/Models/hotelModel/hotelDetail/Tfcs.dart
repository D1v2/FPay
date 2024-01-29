class Tfcs {
  Tfcs({
      this.bf, 
      this.taf, 
      this.cmu, 
      this.tf, 
      this.nf,});

  Tfcs.fromJson(dynamic json) {
    bf = json['BF'];
    taf = json['TAF'];
    cmu = json['CMU'];
    tf = json['TF'];
    nf = json['NF'];
  }
  double? bf;
  double? taf;
  double? cmu;
  double? tf;
  double? nf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BF'] = bf;
    map['TAF'] = taf;
    map['CMU'] = cmu;
    map['TF'] = tf;
    map['NF'] = nf;
    return map;
  }

}