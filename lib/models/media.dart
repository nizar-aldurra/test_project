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

  Map<String, dynamic> toMap() {
    Map<String,dynamic> map={
      'src_url': srcUrl,
      'media_type': mediaType,
      'mime_type': mimeType,
      'size': size,
    };
    if(srcIcon!=null||srcIcon!.isNotEmpty){
      map['src_icon'] = srcIcon;
    }
    if(srcThum!=null||srcThum!.isNotEmpty){
      map['src_thum'] = srcThum;
    }
    if(mediaType == 'Video'){
      map['width'] = width;
      map['height'] = height;
    }
    return map;
  }
  @override
  String toString() {
    return 'Media { srcUrl: $srcUrl';
  }
}