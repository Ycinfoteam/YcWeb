<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath %>">
    <meta charset="UTF-8">
    <title>源辰信息科技官网</title>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="max-age=7200" />
    <meta http-equiv="expires" Content="Fri, 01 Sep 2017 08:00:00 GMT">
    <meta name="Keywords" Content="源辰,源辰信息,源辰信息科技,源辰信息科技官网,源辰信息科技有限公司">
    <meta name="Description" Content="公司是由多名资深项目经理共同组建而成，主要技术骨干在国内外从事多年软件项目研发工作，有在大型软件公司担任多年项目经理的经验；紧跟国内外先进的主流技术，具有较强的软件开发管理和技术指导能力。公司的发展目标是成为领先的软件开发服务商和IT软件工程师的供应商，我们致力于融合先进管理理念和信息技术，为企业和学员创造价值。我们的宗旨是服务于学生，致力于企业。">
    <link rel="shortcut icon" href="images/logo.png">
    <title>源辰信息科技官网</title>
      <style type="text/css">
        .container{width: 960px;min-width:960px;margin: 0px auto;position: relative;}
        .hide{display: none;}
        .clear{clear: both;height: 40px}

//时间上面那个背景
        .scrubber {position: absolute;top: 29px;left: 0px;width: 47px;z-index: 999}
        .scrubber a{
            height: 26px;line-height: 26px;
            padding-right: 5px;font-size: 12px;
            color: #a5a5a5;text-decoration: none; display: block;
            border-right:2px solid #c8c8c8;
            border-right-color: rgba(200,200,200,.5);
            text-shadow: 0 1px 1px rgba(0,0,0,.3);
            text-align: right;
        }
        .scrubber a:hover,
        .scrubber a.cur{border-right-color: #7ebad0;color: #7ebad0;font-weight: bold;}
        .scrubber a:hover{text-decoration: underline;}
        .scrubber a.cur:hover{text-decoration: none;}
        
        .spine{display: block;width: 3px;height: 100%;background: #eee;}

        #scrubber  .s_month{display: none;}


        .content{min-height:1000px;padding-left: 160px;padding-top:50px;background:url(images/spine.png) repeat-y  121px 0;position: relative;}

        .c_year{
            height:30px;line-height: 30px;
            color: #a5a5a5;text-shadow: 0 1px 1px rgba(0,0,0,.3);font-weight: bold;font-size: 14px;
            position: relative;left:-90px;
            clear: both;
        }

        .c_item{width:370px;background: #eee;height: auto;margin: 20px 30px 0 0;position: relative;border-radius: 4px;color: #888;}
        .c_item_left{float: left;}
        .c_item_first{margin-top: -20px;}
        .c_item_right{float: right;}
        .c_item_right .c_i_icon_dot{left: -443px;}

        .c_i_icon_arrow{
            position: absolute;
            height: 0px;
            border-color: transparent #e2e2e2 transparent transparent;
            border-width: 10px 10px 10px 0;
            border-style: dashed solid dashed dashed;
            border-right-color: #eee;
            left: -10px;top: 20px;
        }
        .c_i_icon_dot{
            width: 11px;
            height: 11px;
            border-radius: 11px;
            position: absolute;
            left: -43px;top: 25px;   
            background: #fff;
        }
        .c_i_icon_dot_child{
            width: 7px;
            height: 7px;
            border-radius: 7px;
            position: absolute;
            left: 2px;top: 2px;   
            background: #b3dae9;
        }

        .c_i_head{padding: 15px 15px 0px 15px;}

        .c_i_head_title{height: 46px;line-height: 46px;font-size: 20px;padding: 0px 0px 10px 56px;position: relative;}
        .c_i_head_intro{
            margin-bottom: 10px;
            font-size: 24px;
            line-height: 22px;
            padding: 0 15px;
        }
        .c_i_head_title_icon{
            width: 46px;height: 46px;background-color: #b3dae9;border-radius: 8px;position: absolute;left: 0px;top: 0px;
            overflow: hidden;
            color:#fff;
            font-size: 27px;
            line-height: 23px;
        }
        .c_i_media{padding-bottom: 10px;height: 50px;overflow: hidden; font-size: 22px;}
        .c_i_footer{padding: 10px 15px;margin: 0px 15px;border-top: 1px solid #d6d6d6;font-size: 12px;color: #b2b2b2;}
        
        .c_i_footer_info{}
        .c_i_footer_info .ui_ico{
            width: 20px;
            height: 20px;
            vertical-align: middle;
            visibility: visible;
        }

        .c_i_footer a{color: #b2b2b2;text-decoration: none;padding-right: 10px;display: inline-block;height: 20px;}
        .c_i_footer a:hover{color: #6EB8D3;text-decoration: underline;}

        .ui_ico, .ui_icon {
            width: 15px;
            height: 15px;
            display: inline-block;
            background-repeat: no-repeat;
            font-size: 0;
            overflow: hidden;
        }
        .quote_after {
            vertical-align: bottom;
            background-image: url(images/timeline.png);
            background-position: -986px -102px;
            margin-left: 5px;
        }
        .quote_before{
            vertical-align: top;
            background-image: url(images/timeline.png);
            background-position: -986px -85px;
            margin-right: 5px;
        }
        .ico_zan {
            background-image: url(images/timeline.png);
            background-position: -883px -21px;
        }
        .ico_com {
            background-image: url(images/timeline.png);
            background-position: -897px -42px;
        }
        .kctx{
    width:1000px;
    height:auto;
    border: 1px solid #dadada;
    border-top: 4px solid #03447C;
    margin-top: 11px;
    background:white;
}
.kctx_title{

    width: 970px;
    margin: 0 auto;
    font-size: 12px;
    color: #B7B7B7;
    border-bottom: 1px solid #dbdbdb;
    padding: 15px 0 5px 0;
}
        
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" media="screen and (min-width: 1024px)" href="css/newcomputer.css">
    <link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 1024px)" href="css/pad.css">
    <link rel="stylesheet" media="screen and (max-width: 768px)" href="css/phone.css">

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.lazyload.js" type="text/javascript"></script>
    <script src="js/teacher.js" type="text/javascript"></script>
</head>
<body>
<div id="header">
    <div id="logo" class="site-logo">
        <div>
            <h1>源辰信息科技</h1>
            <h3>yuan chen info tech</h3>
        </div>
    </div>
    <ul id="nav">
        <!-- .html后缀是分发器 -->
		<li class="li1"><a href="index.html" target="_blank" >${title[0]}</a></li><h1 class="h1"></h1>
		<li class="li2"><a href="teacher.html" target="_blank">${title[1] }</a></li>
		<li class="li3"><a href="subject.html">${title[2] }</a></li>
		<li class="li4"><a href="studentProject.html">${title[3] }</a></li>
		<li class="li5"><a href="findWork.html">${title[4] }</a></li>
		<li class="li6"><a href="about.html">${title[5] }</a></li>
		<li class="li7"><a href="company.html">${title[6] }</a></li>
    </ul>
</div>

<div class="kctx"  style="width: 1100px;" >
   <div class="kctx_title">
        衡阳源辰IT培训学校 > 公司历史
    </div>
<div class="hide">
    <div id="tpl_scrubber_year">
        <a href="javascript:;" onclick="showYear({year},this)" class="s_year" id="scrubber_year_{year}">{year}
            {list}
        </a>
    </div>

    <div id="tpl_scrubber_month" >
           <a href="javascript:;" class="s_month {year}_month" onclick="showMonth({year},{month},this)" id="scrubber_month_{year}{month}" >{month}月</a>
    </div>

    <div id="tpl_content_year">

        <div class="c_year" id="content_year_{year}">{year}</div>
        {list}

    </div>

    <div id="tpl_content_month">

        <div class="c_item c_item_{leftOrRight} content_date_{year}{month} {isFirst}">

            <div class="c_i_icon_arrow"></div>
            <div class="c_i_icon_dot"><div class="c_i_icon_dot_child"></div></div>

            <div class="c_i_head">

                <div class="c_i_head_title">
                    <div class="c_i_head_title_icon">{lunar}</div>
                    {date}
                </div>
                <div class="c_i_head_intro">
                    <i class="ui_ico quote_before"></i>
                    {intro}
                    <i class="ui_ico quote_after"></i>
                </div>
            </div>
            <div class="c_i_media">
            <i class="ui_ico quote_before"></i>
                {media}
                    <i class="ui_ico quote_after"></i>
            </div>
           

        </div>

    </div>

</div>
<!--  网页内容 -->


    <div class="container">

        <div class="scrubber" id="scrubber" style="position:fixed; left:180px; top:120px"> <!-- 时序列表 -->
        </div>


        <div class="content" id="content"  style="width: 800px; margin-left: 30px;"> <!-- 内容 -->
        </div>
    </div>
</div>
<div id="footer">
    <div class="address">
        <p>
			<span>${footer[0] }</span>
			<span>${footer[1] }</span>
			<span>${footer[2] }</span>
		</p>
		<p>
			<span>${footer[3] }</span>
			<span>${footer[4] }</span>
		</p>
    </div>
</div>
 
    <script type="text/javascript" src="js/fx.js"></script>
     <script type="text/javascript" src="js/data.js"></script>
    <script type="text/javascript" src="js/GetLunarDay.js"></script>

    <script type="text/javascript" >

  var g = function(id){ return document.getElementById(id);}
var getBodyW = function(){ return document.body.offsetWidth; };
var getBodyH = function(){ return document.body.offsetHeight; };
var getElTop = function(el){ return el.offsetTop+170; };

//--------  模版内容输出

    //  分析归类数据
    var list = {};  //  { year: { month : [ item ,item ] } }

    data.sort(function(a,b){
        return new Date(a.date).getTime() > new Date(b.date).getTime();
    })

    //  格式化数据
    for (var i = data.length - 1; i >= 0; i--) {

        var date = new Date(data[i].date);
        var year  = date.getFullYear();
        var month = date.getMonth()+1;
        var lunar = GetLunarDateString( date );

        if( !list[year] ){ list[year] = {}; }
        if( !list[year][month] ){ list[year][month] = []; }

        var item = data[i];
        item.lunar = lunar[0]+'<br>&nbsp;&nbsp;&nbsp;'+lunar[1];
      //  item.like_format = item.like < 10000 ? item.like : ( item.like / 10000 ).toFixed(1) + '万';

        list[year][month].push( item );
    };


    //  最终html内容
    var html_scrubber = [];
    var html_content  = [];

    //  模版
    var tpl_scrubber_year = g('tpl_scrubber_year').innerHTML.replace(/^\s*/,'').replace(/\s*$/,'');
    var tpl_scrubber_month = g('tpl_scrubber_month').innerHTML.replace(/^\s*/,'').replace(/\s*$/,'');

    var tpl_content_year = g('tpl_content_year').innerHTML.replace(/^\s*/,'').replace(/\s*$/,'');
    var tpl_content_month = g('tpl_content_month').innerHTML.replace(/^\s*/,'').replace(/\s*$/,'');

    //  构建时序和内容html
    for (year in list) {

        var scrubber_month = [];
        var content_month = [];

        var isLeft = 0;

        for (month in list[year]) {
            scrubber_month.unshift(  tpl_scrubber_month.replace(/\{year\}/g,year).replace(/\{month\}/g,month) );

            for (var i = list[year][month].length - 1; i >= 0; i--) {
                var item = list[year][month][i];

                isLeft = isLeft ^ 1;
                content_month.unshift(
                    ( (i==0) ?  '<div class="clear c_month" id="c_month_'+year+'_'+month+'"></div>'   : '' ) + tpl_content_month.replace(/\{year\}/g,year).replace(/\{month\}/g,month)
                        .replace(/\{lunar\}/g,item.lunar)
                        .replace(/\{date\}/g,item.date)
                        .replace(/\{intro\}/g,item.intro)
                        .replace(/\{media\}/g,item.media)
                        .replace(/\{leftOrRight\}/g, isLeft ? 'left' : 'right')
                        .replace(/\{isFirst\}/g, i == 0 ? 'c_item_first' : '')
                    ) ;
            };

        };
        html_scrubber.unshift( tpl_scrubber_year.replace(/\{year\}/g,year).replace(/\{list\}/g,scrubber_month.join('') ) );

        html_content.unshift( tpl_content_year.replace(/\{year\}/g,year).replace(/\{list\}/g,content_month.join('') )  );
    };

    //  写入内容
    g('scrubber').innerHTML = '<a href="javascript:;" onclick="scrollTopTo(0)">现在</a>'+html_scrubber.join('')+'<a href="javascript:;" onclick="scrollTopTo(getBodyH())">出生</a>';
    g('content').innerHTML = html_content.join('')+ tpl_content_year.replace(/\{year\}/g,'出生').replace(/\{list\}/g,'')+'<div class="clear c_month" id="c_month_0_0"></div>'  ;



//--------  脚本处理

    //  动画卷动
    var  scrollTopTo = function( to ){
        var start =  document.body.scrollTop;
        fx( function( now , type ){  window.scroll(0,now); },start ,to );
    }


    //  展开时序
    var expandScrubber = function( year,elem ){

        var years  = document.getElementsByClassName('s_year');
        var months = document.getElementsByClassName('s_month');

        var year_months = document.getElementsByClassName(year+'_month');

        //  清理所有年份的 cur 样式
        for (var i = years.length - 1; i >= 0; i--) {
            years[i].className = 's_year';
        };
        
        //  隐藏所有的月份
        for (var i = months.length - 1; i >= 0; i--) {
            months[i].style.display = 'none';
        };

        //  展现当前年份下所有的月份
        for (var i = year_months.length - 1; i >= 0; i--) {
            year_months[i].style.display = 'block';
        };

        //  设置当前年份的 cur 样式
        elem.className = 's_year cur';
    }

    //  高亮月份
    var highlightMonth = function( year , month , elem ){
        
        var months = document.getElementsByClassName(year+'_month');
        for (var i = months.length - 1; i >= 0; i--) {
            months[i].className = months[i].className.replace('cur','');

        };
        elem.className = elem.className+' cur';
    }

    //  年份点击处理
    var showYear = function(year,elem){
        expandScrubber(year ,elem);
        var top = getElTop( g('content_year_'+year) );
        scrollTopTo( top );
        //  滚动到当前年份的位置
    }

    //  月份点击处理
    var showMonth = function( year , month ,elem ){
        var top = getElTop( document.getElementsByClassName('content_date_'+year+''+month)[0] );
        highlightMonth( year , month , elem );
        scrollTopTo( top );
    }


    //  根据窗口滚动条更新时序年份状态
    var updateScrubberOnTop = function( top ){

        var years  = g('content').getElementsByClassName('c_year');
        var tops = [];

        for (var i = 0; i <years.length ; i++) {
            tops.push( years[i].offsetTop );
        };

        for(var i = 1; i <tops.length ; i++){

            if( top > tops[i-1] && top < tops[i] ){

                var year = years[i-1].innerHTML;

                expandScrubber(year,g('scrubber_year_'+year));
                return ;
            }
        }

    }

    //  根据窗口滚动条更新时序月份状态
    var updateMonthOnTop = function( top ){

        var months  = g('content').getElementsByClassName('c_month');
        var tops = [];

        for (var i = 0; i <months.length ; i++) {
            tops.push( months[i].offsetTop );
        };

        for(var i = 1; i <tops.length ; i++){

            if( top > tops[i-1] && top < tops[i] ){

                var info  = months[i-1].id.split('_');
                var year  = info[2];
                var month = info[3];
                highlightMonth( year , month , g('scrubber_month_'+year+month) );

                return ;
            }
        }
    }

    //  滚动条事件处理; 定位时间
    window.onscroll = function(){
      var top = document.body.scrollTop ;
        if( top > 200){
            g('scrubber').style.position = 'fixed';
            g('scrubber').style.left = (getBodyW()-960)/2+ 'px';
            g('scrubber').style.top  = '60px';
        }else{
            g('scrubber').style.position = '';
            g('scrubber').style.left =     '';
            g('scrubber').style.top  =     '';
        }

        //  更新时序状态
        updateScrubberOnTop( top );
        updateMonthOnTop( top );
  
    }

    //  窗口改变事件处理; 保持时序列表的位置
    window.onresize = function(){
        window.onscroll();
    }
</script>
</body>
</html>