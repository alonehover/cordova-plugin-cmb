# tff-plugin-cmb
cmb cordova plugin

cordova iOS 版本是高版本的话需要在xcode中把 `Resources -> SecreteKeyBoard` 拖到 `Images.xcassets`里面 ，不然键盘是透明的，plugin.xml里没找到相关的配置，暂时只能手动了

#### install

```
ionic plugin add http://git.tff.bz/ant.pu/tff-plugin-cmb.git --variable PRIVATE_KEY=[value]

android 还需要修改 res -> values -> cmbkb_strings.xml 里的 cmbkb_publickey 值为 PRIVATE_KEY, 后续打算使用hook或者配置实现

```