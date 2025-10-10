class ReportFile {
  ReportFile({
    required this.fileName,
    required this.bytes,
    required this.contentType,
  });

  final String fileName;
  final List<int> bytes;
  final String contentType;
}
