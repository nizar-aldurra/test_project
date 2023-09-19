class Media {
  String srcUrl='';
  String? srcIcon;
  String? srcThum;
  String fullPath='';
  String mediaType='';
  String mimeType='';
  int size=0;
  int width=0;
  int height=0;
  Media({
    required this.srcUrl,
    this.srcIcon,
    this.srcThum,
    required this.fullPath,
    required this.mediaType,
    required this.mimeType,
    required this.size,
    required this.width,
    required this.height,
  });

  Media.fromMap(Map<String, dynamic> map){
    srcUrl = map['src_url'];
    srcIcon = map['src_icon'];
    srcThum= map['src_thum'];
    mediaType = map['media_type'];
    mimeType = map['mime_type'];
    width = map['width'];
    height = map['height'];
    size = map['size'];
  }

  @override
  String toString() {
    return 'Media { srcUrl: $srcUrl';
  }
}