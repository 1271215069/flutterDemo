import 'package:flutter/material.dart'; //  引入flutter基础样式
import 'package:flutter_swiper/flutter_swiper.dart'; // 引入swiper组件
import '../util/percentageUnit.dart';






class PageIndex extends StatefulWidget {
  @override
  _PageIndexState createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x99f5f5f5),
      child: Column(
        children: <Widget>[
          ImgBanner(),
          NoticeList()
        ],
      )
    );
  }
}



// 轮播图模块
class ImgBanner extends StatefulWidget {
  @override
  _ImgBannerState createState() => _ImgBannerState();
}

class _ImgBannerState extends State<ImgBanner> {
  @override
  Widget build(BuildContext context) {
    mapType();
    return Container(
      height: 250,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
					return new Image.network(bannerList[index],fit: BoxFit.cover,);
        },
        itemCount: bannerList.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
  List<String> bannerList=[
    'https://resource.caishengu.cn/image/dengguangxiu.jpg',
    'https://resource.caishengu.cn/image/zhonghualongzhu.jpg',
    'https://resource.caishengu.cn/image/shangjingu.jpg',
    'https://resource.caishengu.cn/image/longzhu.jpg'
  ];

  mapType () {
    Map mapOne = {
      'ppp': 19,
      'yyy': 45
    };
    Map mapTwo = mapOne.map((k, v){
      // print(k, v, 'v');
      return MapEntry(v, k);
    });
  }
}



// 新闻列表模块
class NoticeList extends StatefulWidget {
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
	List formList;
	initState() {
		super.initState();
		formList = [
				{"title": '上金谷形象大使薛兆男小朋友再次成为宁海新闻热点', "date": "2020-07-01", "readNum": '229'},
				{"title": '输掉比赛的还算不错点', "date": "2020-07-01", "readNum": '429'},
				{"title": '阿京华时报卡是白金卡成为宁海新闻热点', "date": "2020-07-01", "readNum": '59'},
		];
	}
  @override
  Widget build(BuildContext context) {
		SizeConfig().init(context); // 初始化百分比单位
		List <Widget> tiles = []; // 先建一个数组用于存放循环生成的widget
		for (var item in formList) {
			tiles.add(
				Column(
					children: <Widget>[
						Row(
							children: <Widget>[
								Container(
									child: Text(
										item['title'],
										//文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
										overflow: TextOverflow.ellipsis, // 设置超出屏幕之后的显示规则(省略号)
									),
								),
							] 
						),
						Row(
							// mainAxisSize: MainAxisSize.max,
							// mainAxisAlignment: MainAxisAlignment.end,
							crossAxisAlignment: CrossAxisAlignment.end,
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Container(
									child: Text(
										item['date']
									),
								),
								Text(
									'阅读:' + item['readNum']
								)
							],
						)
					],
				)
			);
		}
				
		return Container(
			width: SizeConfig.blockSizeHorizontal * 90,
			margin: const EdgeInsets.all(20.0),
			decoration: new BoxDecoration( // 注：decoration会与外部color产生冲突
				borderRadius: new BorderRadius.all(Radius.circular(6)), // 圆角属性
				color:  Color(0xffffffff),
			),
			child: Column(
				children: <Widget>[
					Container(
						padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
						child: Row(
							children: <Widget>[
								Icon(IconData(0xe610,fontFamily: 'iconfont')),
								Text('景区动态')
							],
						),
					),

					Container(
						padding: const EdgeInsets.all(10.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.end,
						// mainAxisAlignment: MainAxisAlignment.start,
							children: tiles
						),
					)
				],
			),
		);
				
  }
}

