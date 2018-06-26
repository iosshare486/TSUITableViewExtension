# TSUITableViewExtension
### 功能描述：
> 给tableView添加<font color = #ff4474>`空数据提示图`</font>，支持文字+图片+按钮的多重组合

## 接入
指定source后
	
	
<font color = #ff4474>`pod 'TSUITableViewExtension'`</font>
	
##使用
###准备工作
    //实现协议方法（可选）
    
	extension ViewController:MJ_TableView_EmptyView_Protocol{
	    //提供一个空数据情况下的提示图
	    func provideEmptyView() -> UIView! {
	        //利用自带默认MJ_TableView_Empty_DefaultView，创建一个图片+文字样式的view
	        let emptyView = MJ_TableView_Empty_DefaultView.createEmpty(withImage: "DZ", contentStr: "暂无数据哦！")
	        return emptyView
	    }
    
       //提供一个网络请求失败时的提示图
	    func provideLostNetConnectView() -> UIView! {
	        //利用默认MJ_TableView_Empty_DefaultView，创建一个网络请求失败的提示图，图片+文字+按钮样式，回调中可以处理按钮事件
	        let emptyView = MJ_TableView_Empty_DefaultView.createLostNetConnect(withImage: "WGUserAddressCenterUnSelecter", contentStr: "网络请求失败，请稍后再试！", btnTitle: "点我刷新") {
	            print("刷新页面")
	        }
	        return emptyView
	    }
    
	}
	
	
	
### 提示图展示的发起
	   //数据源为空
	   dataSource = NSArray()
	   //必须触发刷新方法
		myTableView.reloadData()
![](https://ohduoklem.qnssl.com/TS_wushuju.jpeg)
		
		//网络请求失败，数据源为空
		dataSource = NSArray()
		//必须赋值tableView_empty_style属性为 “L”，默认为“E”，E是empty，空数据；L是lostNetConnection，网络请求失败，如果赋值过此属性，需要在适当的时候掌握好 E 与 L的赋值
		
		myTableView.tableView_empty_style = "L"
	   //必须触发刷新方法
		myTableView.reloadData()
		
![](https://ohduoklem.qnssl.com/TS_wuwang.jpeg)

       //支持自定义视图,网络请求失败提示图的协议实现与其相同
       func provideEmptyView() -> UIView! {
	        let emptyView = UIView()
	        emptyView.backgroundColor = .red
	        return emptyView
        
       }
       
      