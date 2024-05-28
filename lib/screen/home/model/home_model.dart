class HomeModel
{
    String? chapter,title,meaning,url;
    int? id;
    List? shloka =[];
    List? english =[];
    HomeModel({this.id, this.title, this.meaning, this.url, this.shloka,this.english,this.chapter});

    factory HomeModel.mapToModel(Map m1)
    {
      return HomeModel(id: m1['id'],meaning: m1['meaning'],title: m1['title'],url: m1['url'],shloka: m1['shloka'],english: m1['English'],chapter: m1['chapter']);
    }
}
