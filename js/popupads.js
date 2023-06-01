// JavaScript Document
//浮動廣告圖片
var floatAdImg = "https://picsum.photos/800/500";


//浮動廣告
document.writeln("<div id=\"floatAd\" style=\" position:fixed !important; position:absolute; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight)); z-index: 2147483647; left: 50%; margin-left: -400px !important; top: 50%; margin-top: -240px !important; background:url("+floatAdImg+") no-repeat; width:800px; height:500px; cursor:pointer; display:none; \">");
document.writeln("<div onclick=\"closeFAd();\" style=\" width:26px; height:26px; float:right;\"></div>");
document.writeln("<div style=\"width:800px; height:500px; float:right;\" onclick=\"open_online();\"></div>");
document.writeln("</div>");

//關閉浮動廣告
function closeFAd()
{
 document.getElementById('floatAd').style.display = 'none';
}
//開啟浮動廣告
function showFAd()
{
 document.getElementById('floatAd').style.display = 'block';
}

//開啟視窗  秒僅執行一次
setTimeout(showFAd,100);
