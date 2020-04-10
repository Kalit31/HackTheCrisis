class BusinessDetails {
  String aID;
  String enterpriseName;
  String socialCategory;
  String gender;
  String pH;
  String organisationType;
  String plantLocation;
  String address;
  String state;
  String district;
  String pINCode;
  String commmenceDate;
  String majorActivity;
  String enterpriseType;
  String nIC5DigitCode;
  String totalEmp;
  String investmentCost;
  String dicName;
  String registrationDate;
  String lGDistCode;

  BusinessDetails(
      {this.aID,
      this.enterpriseName,
      this.socialCategory,
      this.gender,
      this.pH,
      this.organisationType,
      this.plantLocation,
      this.address,
      this.state,
      this.district,
      this.pINCode,
      this.commmenceDate,
      this.majorActivity,
      this.enterpriseType,
      this.nIC5DigitCode,
      this.totalEmp,
      this.investmentCost,
      this.dicName,
      this.registrationDate,
      this.lGDistCode});

  BusinessDetails.fromJson(Map<String, dynamic> json) {
    aID = json['AID'];
    enterpriseName = json['EnterpriseName'];
    socialCategory = json['SocialCategory'];
    gender = json['Gender'];
    pH = json['PH'];
    organisationType = json['OrganisationType'];
    plantLocation = json['PlantLocation'];
    address = json['Address'];
    state = json['State'];
    district = json['District'];
    pINCode = json['PINCode'];
    commmenceDate = json['CommmenceDate'];
    majorActivity = json['MajorActivity'];
    enterpriseType = json['EnterpriseType'];
    nIC5DigitCode = json['NIC5DigitCode'];
    totalEmp = json['TotalEmp'];
    investmentCost = json['InvestmentCost'];
    dicName = json['Dic_Name'];
    registrationDate = json['RegistrationDate'];
    lGDistCode = json['LG_Dist_Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AID'] = this.aID;
    data['EnterpriseName'] = this.enterpriseName;
    data['SocialCategory'] = this.socialCategory;
    data['Gender'] = this.gender;
    data['PH'] = this.pH;
    data['OrganisationType'] = this.organisationType;
    data['PlantLocation'] = this.plantLocation;
    data['Address'] = this.address;
    data['State'] = this.state;
    data['District'] = this.district;
    data['PINCode'] = this.pINCode;
    data['CommmenceDate'] = this.commmenceDate;
    data['MajorActivity'] = this.majorActivity;
    data['EnterpriseType'] = this.enterpriseType;
    data['NIC5DigitCode'] = this.nIC5DigitCode;
    data['TotalEmp'] = this.totalEmp;
    data['InvestmentCost'] = this.investmentCost;
    data['Dic_Name'] = this.dicName;
    data['RegistrationDate'] = this.registrationDate;
    data['LG_Dist_Code'] = this.lGDistCode;
    return data;
  }
}
