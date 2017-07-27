# tff-plugin-cmb
cmb cordova plugin

cordova iOS 版本是高版本的话需要在xcode中把 `Resources -> SecreteKeyBoard` 拖到 `Images.xcassets`里面 ，不然键盘是透明的，plugin.xml里没找到相关的配置，暂时只能手动了

#### install

```
ionic plugin add https://github.com/alonehover/cordova-plugin-cmb.git --variable PRIVATE_KEY=[value]

android 还需要修改 res -> values -> cmbkb_strings.xml 里的 cmbkb_publickey 值为 PRIVATE_KEY, 后续打算使用hook或者配置实现

```

#### use

````
window.TffCMB.pay({
    url: [招行一网通h5支付页面地址, 字符串],
    jsonRequestData: [需要传的参数, json对象]
}, function(msg){
    if(msg === "success"){
        // do something
    }
}, function(err){
    if(err === "fail"){
        // do something
    }
});
````
