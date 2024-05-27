class HomeModel
{
    int? id;
    String? title,name,url,shloka;

    HomeModel({this.id, this.title, this.name, this.url, this.shloka});

    factory HomeModel.mapToModel(Map m1)
    {
      return HomeModel(id: m1['id'],name: m1['name'],title: m1['title'],url: m1['url'],shloka: m1['shloka']);
    }
}