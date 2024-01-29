class Taf {
  Taf({
      this.mf, 
      this.sbp, 
      this.snp, 
      this.mft, 
      this.sgp,});

  Taf.fromJson(dynamic json) {
    mf = json['MF'];
    sbp = json['SBP'];
    snp = json['SNP'];
    mft = json['MFT'];
    sgp = json['SGP'];
  }
  double? mf;
  double? sbp;
  double? snp;
  double? mft;
  double? sgp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MF'] = mf;
    map['SBP'] = sbp;
    map['SNP'] = snp;
    map['MFT'] = mft;
    map['SGP'] = sgp;
    return map;
  }

}