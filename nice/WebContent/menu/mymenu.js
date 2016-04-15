/*
 * MenuBar只负责生成<div>，不会实现功能。
 * MenuBar的add()方法：bar.add("menu1", "item1", "http://www.qdmmy6.com/");
 * MenuBar的menus属性是一个数组（其时它是一个Map），每个元素对应一个menu。
 * 数组中的元素还是一个数组，这个数组中的元素是MenuItem对象。
 * add()方法首先查找menus["menu1"]元素（即名为"menu1"的菜单）是否存在，
 * 如果存在，使用"item1"与"http://www.qdmmy6.com/"创建MenuItem对象。然后把MenuItem对象添加到menus["menu1"]中去。
 * 如果不存在，先创建menus["menu1"]，在把MenuItem添加进去。
 */
function Q6MenuBar(objName, barName) {
	this.obj = objName;
	this.barName = barName;
	this.config = {
        topHeight:null,
        bottomHeight:null,
		width:null,
		radioButton:true,
		imgDir:"img/"
    };
	this.icon = {jiaIcon:"jia.png",jianIcon:"jian.png"};
	this.colorStyle = 2;
	this.colors = [];
	this.colors[0] = {
		menuBgColor:"rgb(246,133,1)",
		menuBorderColor:"rgb(236,171,87)",
		itemBgColor:"rgb(38,38,38)",
		itemBorderColor:"rgb(100,100,100)",
		itemBgMoveColor:"rgb(32,145,177)",
		itemBorderMoveColor:"rgb(119,171,113)",
		itemMoveColor:"rgb(255,255,255)",
		itemColor:"rgb(255,255,255)",
		menuBarColor:"rgb(255,255,255)",
		menuContentColor:"rgb(255,255,255)"
	};
	this.colors[2] = {
		itemBgMoveColor:"rgb(246,133,1)",
		itemBorderMoveColor:"rgb(236,171,87)",
		menuBgColor:"rgb(78,78,78)",//38
		menuBorderColor:"rgb(102,102,102)",//100
		itemBgColor:"rgb(32,145,177)",
		itemBorderColor:"rgb(119,171,113)",
		itemMoveColor:"rgb(255,255,255)",
		itemColor:"rgb(255,255,255)",
		menuBarColor:"rgb(255,255,255)",
		menuContentColor:"rgb(255,255,255)"
	};
	this.colors[4] = {
		menuBgColor:"black",
		menuBorderColor:"gray",
		itemBgColor:"yellow",
		itemBorderColor:"yellow",
		itemBgMoveColor:"red",
		itemBorderMoveColor:"gray",
		itemMoveColor:"#FFFFFF",
		itemColor:"gray",
		menuBarColor:"white",
		menuContentColor:"gray"
	};
	this.font = {
	};
	this.menus = [];
	//<div class="title" name="title"><span class="titleText">' + barName + '</span></div><div>
}
Q6MenuBar.prototype.add = function(menuName, menuItemName, url, frameName) {
	if (!this.menus[menuName]) {
		this.menus[menuName] = [];
	}
	var len = this.menus[menuName].length;
	this.menus[menuName][len] = new MenuItem(menuItemName, url, frameName);

	// MenuItem类
	function MenuItem(menuItemName, url, frameName) {
		this.menuItemName = menuItemName;
		this.url = url;
		this.frameName = frameName;
	}
}
Q6MenuBar.prototype.toString = function() {
	var str = '<div style="border:1px solid' + this.colors[this.colorStyle].menuBorderColor + ';color:' + this.colors[this.colorStyle].menuBarColor + ';" class = "menuBar" name="menuBar" onClick="' + this.obj + '.showMenu(event, this)">\n';
	str += '<div style="background-color:' + this.colors[this.colorStyle].menuBgColor + ';" class="barTitle" name="barTitle"><span class="barTitleText">' + this.barName + '</span></div>\n';
	for(var menuName in this.menus) {
		str += this.menu2Str(menuName);
	}
	str += '<div style="background-color:' + this.colors[this.colorStyle].menuBgColor + ';" name="barBottom" class="barBottom">';
	str += '</div>';
	return str;
}

Q6MenuBar.prototype.menu2Str = function(menuName){
	var icon = this.config.imgDir + this.icon.jiaIcon;
	var str = '<div name="menu">\n';
	str += '<div style="background-color:' + this.colors[this.colorStyle].menuBgColor + ';border-right-color:' + this.colors[this.colorStyle].menuBorderColor + ';border-bottom-color:' + this.colors[this.colorStyle].menuBorderColor + ';" name="menuTitle" class="menuTitle"><span name="menuTitleIcon" class="menuTitleIcon"><img src="' + icon + '"/></span><span class="menuTitleText">' + menuName + '</span></div>\n';
	str += '<div style="color:' + this.colors[this.colorStyle].menuContentColor + ';" class="menuContent"  name="menuContent">\n';
	for(var i = 0; i < this.menus[menuName].length; i++) {
		str += this.item2Str(this.menus[menuName][i]);
	}
	str += '</div>\n</div>\n';
	return str;
}

Q6MenuBar.prototype.item2Str = function(menuItem){
	return '<div style="border:1px solid ' + this.colors[this.colorStyle].itemBorderColor + ';background-color:' + this.colors[this.colorStyle].itemBgColor + '; color:' + this.colors[this.colorStyle].itemColor + ';" class="menuItem" onMouseMove="' + this.obj + '.itemMouseMove(this)" onMouseOut="' + this.obj + '.itemMouseOut(this)" onClick="skip(\'' + menuItem.url + '\', \'' + menuItem.frameName + '\')">' + menuItem.menuItemName + '</div>\n';
}

function skip(url, frameName) {
	if(parent[frameName]) {
		parent[frameName].location.href=url;
	} else {
		location.href=url;
	}
}


Q6MenuBar.prototype.getCurrMenu = function(res) {
	tagName = res.tagName;
	name = res.getAttribute("name");
	while(tagName != "DIV" || name != "menu") {
		res = res.parentNode;
		if(!res) {
			return null;
		}
		tagName = res.tagName;
		name = res.getAttribute("name");
		if(tagName == "DIV" && name == "menuContent") {
			return null;
		}
	}
	return res;
}

Q6MenuBar.prototype.attr = function(ele, attrName) {
	if(ele.getAttribute)  {
		return ele.getAttribute(attrName);
	}
	return null;
}

Q6MenuBar.prototype.showMenu = function(evt, menuBar) {
	var e = evt ? evt : window.event;
	var res = e.srcElement || e.target;
	var menu = this.getCurrMenu(res);//获取当前被点击的menu
	if(!menu) return;
	this.openMenu(menuBar, menu);
}

// 打米或关闭menu
Q6MenuBar.prototype.openMenu = function(menuBar, menu) {
	var childs = menu.childNodes;
	for(var i = 0; i < childs.length; i++) {
		if(this.attr(childs[i], "name") == 'menuContent') {
			var display = childs[i].style.display;
			if(!display || display=='none') {
				if (this.config.radioButton) {
					this.closeMenu(menuBar);//关闭所有menu
				}
				childs[i].style.display='block';//打米当前menu
				this.changeImg(menu, false);//更换当前menu图标
			} else {
				if (this.config.radioButton) {
					this.closeMenu(menuBar);//关闭所有menu
				}
				childs[i].style.display='none';
				this.changeImg(menu, true);
			}
		}
	}
}

// 更换图片
Q6MenuBar.prototype.changeImg = function (menu, flag) {
	var img = menu.getElementsByTagName("img")[0];
	var jiaIcon = this.config.imgDir + this.icon.jiaIcon;
	var jianIcon = this.config.imgDir + this.icon.jianIcon;
	img.src = flag ? jiaIcon : jianIcon;
}

// 关闭所有menu
Q6MenuBar.prototype.closeMenu = function(menuBar) {
	var menus = menuBar.childNodes;
	//获取menuBar中所有menu
	for(var i=0; i < menus.length; i++) {
		if(this.attr(menus[i], 'name') != 'menu') continue;
		var childs = menus[i].childNodes;
		//获取当前menu中所有content
		for(var j = 0; j < childs.length; j++) {
			if(this.attr(childs[j], 'name') != 'menuContent') continue;
			childs[j].style.display='none';
		}
		this.changeImg(menus[i], true);
	}
}

Q6MenuBar.prototype.itemMouseMove = function(e) {
	e.style.border = "1px solid " + this.colors[this.colorStyle].itemBorderMoveColor;
	e.style.backgroundColor = this.colors[this.colorStyle].itemBgMoveColor;
	e.style.color = this.colors[this.colorStyle].itemMoveColor;
	e.style.fontWeight = "bold";
}

Q6MenuBar.prototype.itemMouseOut = function(e) {
	e.style.border = "1px solid " + this.colors[this.colorStyle].itemBorderColor;
	e.style.backgroundColor = this.colors[this.colorStyle].itemBgColor;
	e.style.color = this.colors[this.colorStyle].itemColor;
	e.style.fontWeight = "";
}
