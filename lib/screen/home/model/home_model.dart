class HomeModel
{
    String? chapter,title,meaning,url,tEnglish,sanskrit,translate,eChapter;
    int? id;
    List? shloka =[];
    List? english =[];
    HomeModel({this.id, this.title, this.meaning, this.url, this.shloka,this.english,this.chapter,this.eChapter,this.sanskrit,this.tEnglish,this.translate});

    factory HomeModel.mapToModel(Map m1)
    {
      return HomeModel(eChapter: m1['chapter 2'],sanskrit:m1['sanskrit'] ,tEnglish: m1['title 2'],translate:m1['translate'] ,id: m1['id'],meaning: m1['meaning'],title: m1['title'],url: m1['url'],shloka: m1['shloka'],english: m1['english'],chapter: m1['chapter']);
    }
}
