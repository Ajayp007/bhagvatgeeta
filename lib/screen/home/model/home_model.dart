class HomeModel
{
    String? title,meaning,url,shloka,english,id;

    HomeModel({this.id, this.title, this.meaning, this.url, this.shloka,this.english});

    factory HomeModel.mapToModel(Map m1)
    {
      return HomeModel(id: m1['id'],meaning: m1['meaning'],title: m1['title'],url: m1['url'],shloka: m1['sholka'],english: m1['english']);
    }
}