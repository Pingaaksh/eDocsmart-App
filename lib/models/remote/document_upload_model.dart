class DocumentUploadModel {
  Map<String, dynamic>? textData;
  Map<String, dynamic>? tableData;

  DocumentUploadModel({this.textData, this.tableData});

  // Deserialize from JSON
  DocumentUploadModel.fromJson(Map<String, dynamic> json) {
    textData = json['text_data'] != null ? Map<String, dynamic>.from(json['text_data']) : null;
    tableData = json['table_data'] != null
        ? Map<String, dynamic>.from(json['table_data'] as Map)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.textData != null) {
      data['text_data'] = this.textData;
    }
    if (this.tableData != null) {
      data['table_data'] = this.tableData;
    }
    return data;
  }
}
