function MM_openBrWindow(theURL,winName,features) { //v2.0
window.open(theURL,winName,features);
}
function mOvr(src,clrOver) { if (!src.contains(event.fromElement)) { src.style.cursor = 'hand'; src.bgColor = clrOver; }}function mOut(src,clrIn){ if (!src.contains(event.toElement)) { src.style.cursor = 'default'; src.bgColor = clrIn; }} function mClk(src) { if(event.srcElement.tagName=='TD'){src.children.tags('A')[0].click();} }
function mClk2(src) { if(event.srcElement.tagName=='TR'){src.children.tags('A')[0].click();} }
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function mover(src,color){src.style.backgroundColor=color}
function mout(src,color){src.style.backgroundColor=color}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
if (restore) selObj.selectedIndex=0;
}
// -->
function MM_findObj(n, d) { //v4.01
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_showHideLayers() { //v6.0
var i,p,v,obj,args=MM_showHideLayers.arguments;
for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
obj.visibility=v; }
}

function chance(obj,id)
{
var p = obj.parentNode.getElementsByTagName("td");
var p1 = document.getElementById(id).getElementsByTagName("div");
for(i=0;i<p.length;i++)
{
if(obj==p[i])
{
p[i].className = "tab_index1";
p1[i].className = "show";	
}
else
{	p[i].className = "tab_index2";
p1[i].className = "hidden";					
}
}
}
//用于头部导航鼠标移上去的高亮效果
function menu_hover(id){
var num = document.getElementById(id).getElementsByTagName("li");
for(i=0;i<num.length;i++){
num[i].onmouseover = function(){
var clsname = this.className;
this.className="hover_"+clsname;
}
num[i].onmouseout = function(){
var clsname = this.className;
this.className = clsname.substring(6);
}
}
}


function menuIcon(id)   
{  
var allElements = document.getElementById(id).getElementsByTagName("li");    
for (var i=0; i < allElements.length; i++)   
{   
allElements[i].onmouseover = mouseGoesOver;   
allElements[i].onmouseout = mouseGoesOut;   
}   
}   
function mouseGoesOver()   
{   
originalClassNameString = this.className;   
this.className += "On";   
}   
function mouseGoesOut()   
{   
this.className = originalClassNameString;   
}

//ddTab 开始
//只为onmouseover事件

var ddtabmenu={
	disabletablinks: false, ////Disable hyperlinks in 1st level tabs with sub contents (true or false)?
	currentpageurl: window.location.href.replace("http://"+window.location.hostname, "").replace(/^\//, ""), //get current page url 

definemenu:function(tabid, dselected){
	this[tabid+"-menuitems"]=null
	this.addEvent(window, function(){ddtabmenu.init(tabid, dselected)}, "load")
},

showsubmenu:function(tabid, targetitem){
	var menuitems=this[tabid+"-menuitems"]
 for (i=0; i<menuitems.length; i++){
		menuitems[i].className=""
		if (typeof menuitems[i].hasSubContent!="undefined")
			document.getElementById(menuitems[i].getAttribute("rel")).style.display="none"
	}
	targetitem.className="current"
	if (typeof targetitem.hasSubContent!="undefined")
		document.getElementById(targetitem.getAttribute("rel")).style.display="block"
},

isSelected:function(menuurl){
	var menuurl=menuurl.replace("http://"+menuurl.hostname, "").replace(/^\//, "")
	return (ddtabmenu.currentpageurl==menuurl)
},

addEvent:function(target, functionref, tasktype){ //assign a function to execute to an event handler (ie: onunload)
	var tasktype=(window.addEventListener)? tasktype : "on"+tasktype
	if (target.addEventListener)
		target.addEventListener(tasktype, functionref, false)
	else if (target.attachEvent)
		target.attachEvent(tasktype, functionref)
},

init:function(tabid, dselected){
	var menuitems=document.getElementById(tabid).getElementsByTagName("a")
	this[tabid+"-menuitems"]=menuitems
	for (var x=0; x<menuitems.length; x++){
		if (menuitems[x].getAttribute("rel")){
			this[tabid+"-menuitems"][x].hasSubContent=true
			if (ddtabmenu.disabletablinks)
				menuitems[x].onclick=function(){return false}
		}
		else //for items without a submenu, add onMouseout effect
			menuitems[x].onmouseout=function(){this.className=""}
		menuitems[x].onmouseover=function(){ddtabmenu.showsubmenu(tabid, this)}
		if (dselected=="auto" && typeof setalready=="undefined" && this.isSelected(menuitems[x].href)){
			ddtabmenu.showsubmenu(tabid, menuitems[x])
			var setalready=true
		}
		else if (parseInt(dselected)==x)
			ddtabmenu.showsubmenu(tabid, menuitems[x])
	}
}
}
//ddTab 结束


//dropdowncontent 开始
//init：("anchorID", "positionString", glideduration, "revealBehavior") 位置：("left-bottom", "right-bottom", "left-top", or "right-top") 关闭：<a href="javascript:dropdowncontent.hidediv('SC1')">关闭</a>

var dropdowncontent={
disableanchorlink: false, //设置是否click产生链接
hidedivmouseout: [true, 200], //设置激发产生的层显示的默认时间：[hide_div_onmouseover ？miliseconds_before_hiding]
ajaxloadingmsg: "载入链接中……", //ajax页面的时候的载入文字
ajaxbustcache: true, //是否缓存

getposOffset:function(what, offsettype){
return (what.offsetParent)? what[offsettype]+this.getposOffset(what.offsetParent, offsettype) : what[offsettype]
},

isContained:function(m, e){
var e=window.event || e
var c=e.relatedTarget || ((e.type=="mouseover")? e.fromElement : e.toElement)
while (c && c!=m)try {c=c.parentNode} catch(e){c=m}
if (c==m)
return true
else
return false
},

show:function(anchorobj, subobj, e){
if (!this.isContained(anchorobj, e) || (e && e.type=="click")){
var e=window.event || e
if (e.type=="click" && subobj.style.visibility=="visible"){
subobj.style.visibility="hidden"
return
}
var horizontaloffset=(subobj.dropposition[0]=="left")? -(subobj.offsetWidth-anchorobj.offsetWidth) : 0 //calculate user added horizontal offset
var verticaloffset=(subobj.dropposition[1]=="top")? -subobj.offsetHeight : anchorobj.offsetHeight //calculate user added vertical offset
subobj.style.left=this.getposOffset(anchorobj, "offsetLeft") + horizontaloffset + "px"
subobj.style.top=this.getposOffset(anchorobj, "offsetTop")+verticaloffset+"px"
subobj.style.clip=(subobj.dropposition[1]=="top")? "rect(auto auto auto 0)" : "rect(0 auto 0 0)" //hide drop down box initially via clipping
subobj.style.visibility="visible"
subobj.startTime=new Date().getTime()
subobj.contentheight=parseInt(subobj.offsetHeight)
if (typeof window["hidetimer_"+subobj.id]!="undefined") //clear timer that hides drop down box?
clearTimeout(window["hidetimer_"+subobj.id])
this.slideengine(subobj, (subobj.dropposition[1]=="top")? "up" : "down")
}
},

curveincrement:function(percent){
return (1-Math.cos(percent*Math.PI)) / 2 //return cos curve based value from a percentage input
},

slideengine:function(obj, direction){
var elapsed=new Date().getTime()-obj.startTime //get time animation has run
if (elapsed<obj.glidetime){ //if time run is less than specified length
var distancepercent=(direction=="down")? this.curveincrement(elapsed/obj.glidetime) : 1-this.curveincrement(elapsed/obj.glidetime)
var currentclip=(distancepercent*obj.contentheight)+"px"
obj.style.clip=(direction=="down")? "rect(0 auto "+currentclip+" 0)" : "rect("+currentclip+" auto auto 0)"
window["glidetimer_"+obj.id]=setTimeout(function(){dropdowncontent.slideengine(obj, direction)}, 10)
}
else{ //if animation finished
obj.style.clip="rect(0 auto auto 0)"
}
},

hide:function(activeobj, subobj, e){
if (!dropdowncontent.isContained(activeobj, e)){
window["hidetimer_"+subobj.id]=setTimeout(function(){
subobj.style.visibility="hidden"
subobj.style.left=subobj.style.top=0
clearTimeout(window["glidetimer_"+subobj.id])
}, dropdowncontent.hidedivmouseout[1])
}
},

hidediv:function(subobjid){
document.getElementById(subobjid).style.visibility="hidden"
},

ajaxconnect:function(pageurl, divId){
var page_request = false
var bustcacheparameter=""
if (window.XMLHttpRequest) // if Mozilla, IE7, Safari etc
page_request = new XMLHttpRequest()
else if (window.ActiveXObject){ // if IE6 or below
try {
page_request = new ActiveXObject("Msxml2.XMLHTTP")
} 
catch (e){
try{
page_request = new ActiveXObject("Microsoft.XMLHTTP")
}
catch (e){}
}
}
else
return false
document.getElementById(divId).innerHTML=this.ajaxloadingmsg //Display "fetching page message"
page_request.onreadystatechange=function(){dropdowncontent.loadpage(page_request, divId)}
if (this.ajaxbustcache) //if bust caching of external page
bustcacheparameter=(pageurl.indexOf("?")!=-1)? "&"+new Date().getTime() : "?"+new Date().getTime()
page_request.open('GET', pageurl+bustcacheparameter, true)
page_request.send(null)
},

loadpage:function(page_request, divId){
if (page_request.readyState == 4 && (page_request.status==200 || window.location.href.indexOf("http")==-1)){
document.getElementById(divId).innerHTML=page_request.responseText
}
},

init:function(anchorid, pos, glidetime, revealbehavior){
var anchorobj=document.getElementById(anchorid)
var subobj=document.getElementById(anchorobj.getAttribute("rel"))
var subobjsource=anchorobj.getAttribute("rev")
if (subobjsource!=null && subobjsource!="")
this.ajaxconnect(subobjsource, anchorobj.getAttribute("rel"))
subobj.dropposition=pos.split("-")
subobj.glidetime=glidetime || 1000
subobj.style.left=subobj.style.top=0
if (typeof revealbehavior=="undefined" || revealbehavior=="mouseover"){
anchorobj.onmouseover=function(e){dropdowncontent.show(this, subobj, e)}
anchorobj.onmouseout=function(e){dropdowncontent.hide(subobj, subobj, e)}
if (this.disableanchorlink) anchorobj.onclick=function(){return false}
}
else
anchorobj.onclick=function(e){dropdowncontent.show(this, subobj, e); return false}
if (this.hidedivmouseout[0]==true) //hide drop down DIV when mouse rolls out of it?
subobj.onmouseout=function(e){dropdowncontent.hide(this, subobj, e)}
}
}
//dropdowncontent 结束

//用于首页头条文字切换
function show_intro(pre,pree,n,select_n,css) {
for (i = 1; i <= n; i++) {
var intro = document.getElementById(pre + i);
var cha = document.getElementById(pree + i);
intro.style.display = "none";
cha.className=css + "1";
if (i == select_n) {
intro.style.display = "block";
cha.className=css;
}
}
}
var tn = 1;
var tims_running = 0;
function change_headline(n){
show_intro('focus_text','focus_but',4,n,'on');
tn = n;
}
function mouse_on(n){
tims_running = 0;
change_headline(n);
}
function mouse_out(){
tims_running = 1;
}
function run()
{
if(tims_running == 1){
change_headline(tn);
tn++;
}
if(tn>=5)
{
tn = 1;
}
}
function startrun()
{
tims_running = 1;
tims = window.setInterval("run()",3000);
}
//用于头部导航鼠标移上去的高亮效果
function menuIcon(id)   
{  
var allElements = document.getElementById(id).getElementsByTagName("li");    
for (var i=0; i < allElements.length; i++)   
{   
allElements[i].onmouseover = mouseGoesOver;   
allElements[i].onmouseout = mouseGoesOut;   
}   
}   
function mouseGoesOver()   
{   
originalClassNameString = this.className;   
this.className += "On";   
}   
function mouseGoesOut()   
{   
this.className = originalClassNameString;   
}
//用于头部导航行情中心下拉菜单和某些广告
function MM_findObj(n, d) { //v4.01
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_showHideLayers() { //v6.0
var i,p,v,obj,args=MM_showHideLayers.arguments;
for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
obj.visibility=v; }
}
//用于内容随机切换
function tabContent(id,eName){
var id= document.getElementById(id);
var p = id.getElementsByTagName(eName);
for(i=0;i<p.length;i++){
hi_now = new Date();
if(i ==hi_now.getSeconds() % p.length){
p[i].className+=(p[i].className.length>0? " ": "") + "hidden";
}
else{
p[i].className=p[i].className.replace(new RegExp("( ?|^)hidden\\b"),"");
}
}
}
//用于内容向上滚动,有停顿
/**startmarquee(一次滚动高度,速度,停留时间,元素ID);**/
function startmarquee(lh,speed,delay,obj){
var t;
var p=false;
var o=document.getElementById(obj);
o.innerHTML+=o.innerHTML;
o.onmouseover=function(){p=true}
o.onmouseout=function(){p=false}
o.scrollTop = 0;
function start(){
t=setInterval(scrolling,speed);
if(!p) o.scrollTop += 1;
}
function scrolling(){
if(o.scrollTop%lh!=0){
o.scrollTop += 1;
if(o.scrollTop>=o.scrollHeight/2) o.scrollTop = 0;
}else{
clearInterval(t);
setTimeout(start,delay);
}
}
setTimeout(start,delay);
}
//用于图片无间隙向上滚动
var pcScroll=
{
"speed":30,
"init":function(mid,mid1,mid2)
{
this.moveid=document.getElementById(mid);
this.moveid1=document.getElementById(mid1);
this.moveid2=document.getElementById(mid2);
this.moveid2.innerHTML=this.moveid1.innerHTML;
},
"marquee":function (){ 
if(pcScroll.moveid2.offsetTop-pcScroll.moveid.scrollTop<=0)//当滚动至demo1与demo2交界时 
pcScroll.moveid.scrollTop-=pcScroll.moveid1.offsetHeight  //demo跳到最顶端 
else{ 
pcScroll.moveid.scrollTop++ 
} 
},
"startmove":function()
{
var MyMar=setInterval(pcScroll.marquee,30)
this.moveid.onmouseover=function() {clearInterval(MyMar)}
this.moveid.onmouseout=function() {MyMar=setInterval(pcScroll.marquee,30)}
}	
};

//用于新的报价搜索 2008-11-11

function searchByKeyword(){
var conditions = new Array();
var keyword = document.searchBykey.key1.value;
if(keyword != null && keyword != "") conditions.push("keyword:(" + keyword + ")");
document.searchBykeyForm.queryStr.value = conditions.join(" ");
//alert(document.advanceSearchForm.queryStr.value);
document.searchBykeyForm.submit();
}

function searchProduct(smallTypeId, filterItemCount, priceRangeCount) {
var conditions = new Array();
//0. 检查如果选择了价格区间，是否同时选择了地区
var area = document.conditionForm.area;
var areaId = area.options[area.selectedIndex].value;
var priceSelected = false;
if(priceRangeCount > 0) {
if(document.conditionForm.price.value != null && document.conditionForm.price.value != "") {
priceSelected = true;
}
}
if(priceSelected && areaId == "") {
alert('您已经选择了价格区间，请再选择地区才能进行查询!'); return;
}
//1. 拼凑queryStr
//1.1 smallType(required)
conditions.push("smallType:" + smallTypeId);
//1.2 brand
var brandSelected = false;
if(document.conditionForm.brand.value != null && document.conditionForm.brand.value != "" ) {
brandSelected = true;
}
if(brandSelected) {
var fieldBrand = "品牌:(";
fieldBrand += document.conditionForm.brand.value;
fieldBrand += ")";
conditions.push(fieldBrand);
}
//1.3 price & area
if(priceSelected && areaId != "") {
var fieldPrice = "price_" + areaId + ":";
if(document.conditionForm.price.value != null && document.conditionForm.price.value != "") {
var values = document.conditionForm.price.value.split("-");
fieldPrice += "[" + values[0] + " TO " + values[1] + "]";
}
conditions.push(fieldPrice);
//conditions.push("area:(" + areaId + ")");
}
if(priceSelected)
document.advanceSearchForm.areaId.value = areaId;
else
document.advanceSearchForm.areaId.value = 100
//1.4 filter items
for(var i = 0; i < filterItemCount; i++) {
var kw = document.getElementById("keywordItem" + i).value;
if(kw == "") continue;
var itemSelected = false;
var item = eval("document.conditionForm.item" + i);
if(item.length != undefined) { //多于1个选项
for(var j = 0; j < item.length; j++) {
if(item[j].checked) {
itemSelected = true;
break;
}
}
} else { //只有1个选项
if(item.checked) itemSelected = true;
}
if(itemSelected) {
var valueType;
if(item.length != undefined) { //多于1个选项
valueType = item[0].value.split("-").length;
} else { //只有1个选项
valueType = item.value.split("-").length;
}
var fieldItem;
if(valueType == 1) { //single value
fieldItem = kw + ":(";
var cnt = 0;
if(item.length != undefined) { //多于1个选项
for(var j = 0; j < item.length; j++) {
if(item[j].checked) {
if(cnt > 0) fieldItem += " OR ";
fieldItem += item[j].value;
cnt++;
}
}
} else {
if(item.checked) fieldItem += item.value;
}
fieldItem += ")";
} else { //range value
//fieldItem = kw + ":";
fieldItem = kw + ":(";
var cnt = 0;
if(item.length != undefined) { //多于1个选项
for(var j = 0; j < item.length; j++) {
if(item[j].checked) {
if(cnt > 0) fieldItem += " OR ";
var values = item[j].value.split("-");
fieldItem += "[" + values[0] + " TO " + values[1] + "]";
cnt++;
}
}
} else {
if(item.checked) {
var values = item.value.split("-");
fieldItem += "[" + values[0] + " TO " + values[1] + "]";
}
}
fieldItem += ")";
}
conditions.push(fieldItem);
}
}
//1.5 keyword
/*var keyword = document.conditionForm.keyword.value;
if(keyword != null && keyword != "") conditions.push("keyword:(" + keyword + ")");*/
//2. 提交
document.advanceSearchForm.queryStr.value = conditions.join(" ");
//alert(document.advanceSearchForm.queryStr.value);
document.advanceSearchForm.submit();
}