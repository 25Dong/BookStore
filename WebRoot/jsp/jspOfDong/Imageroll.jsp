<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大屏广告</title>
</head>
<body>
<!-- 大屏广告 start -->
		<div id="jnImageroll">
				<s:if test="#session.advertise.size==5">
				<a href="#nogo" id="JS_imgWrap">
				<s:iterator value="#session.advertise" var="a">
				<img src="<%=request.getContextPath()%>/upload/<s:property value="adPhoto"/>" /> 
				</s:iterator>
				</a>
				<div>
				<a href="#"><em><s:property value="#session.advertise.get(0).content"/></em><em>全场119元起</em></a>
				<a href="###2"><em><s:property value="#session.advertise.get(1).content"/></em><em>全场357元起</em></a>
				<a href="###3"><em><s:property value="#session.advertise.get(2).content"/></em><em>全场89元</em></a>
				<a href="###4"><em><s:property value="#session.advertise.get(3).content"/></em><em>全场3.1折起</em></a>
				<a href="###5" class="last"><em><s:property value="#session.advertise.get(4).content"/></em><em>全场4.1折起</em></a>
			</div>
			</s:if>
			<s:else>
				<a href="#nogo" id="JS_imgWrap">
				<img src="<%=request.getContextPath()%>/images/imagesOfDong/ads/1.jpg" alt="相约情人节"/>
				<img src="<%=request.getContextPath()%>/images/imagesOfDong/ads/2.jpg" alt="新款上线"/>
				<img src="<%=request.getContextPath()%>/images/imagesOfDong/ads/3.jpg" alt="愤怒小鸟特卖"/>
				<img src="<%=request.getContextPath()%>/images/imagesOfDong/ads/4.jpg" alt="男鞋促销第一波"/>
				<img src="<%=request.getContextPath()%>/images/imagesOfDong/ads/5.jpg" alt="春季新品发布"/>
			</a>
			<div>
				<a href="#"><em>相约情人节</em><em>全场119元起</em></a>
				<a href="###2"><em>新款上线</em><em>全场357元起</em></a>
				<a href="###3"><em>愤怒小鸟特卖</em><em>全场89元</em></a>
				<a href="###4"><em>男鞋促销第一波</em><em>全场3.1折起</em></a>
				<a href="###5" class="last"><em>春季新品发布</em><em>全场4.1折起</em></a>
			</div>
			</s:else>
			
		</div>
		<!-- 大屏广告 end -->
		<!-- 最新动态 start -->
		<div id="jnNotice">
			<div id="jnMiaosha">
				<a href="#nogo" class="JS_css3"><img style="width: 230;height: 177px" src="<%=request.getContextPath()%>/images/imagesOfDong/ad1.jpg" alt="广告"  /></a>
			</div>
			<div id="jnNoticeInfo">
				<h2 title="最新动态">最新动态</h2>
				<ul>
					<marquee behavior="alternate"  scrollamount="2"><li><a href="###1" class="tooltip" title="[活动] 50万图书满100减50">[活动]50万图书满100减50</a></li> </marquee>
					<li><a href="###1" class="tooltip" title="[活动] 30万图书满100减40">[活动] 30万图书满100减40</a></li>
					<li><a href="###2" class="tooltip" title="[活动] 10万图书满50减20">[活动] 10万图书满50减20</a></li>
					<li><a href="###3" class="tooltip" title="[活动] 万本免费图书">[活动] 万本免费图书</a></li>
					<li><a href="###4" class="tooltip" title="[活动] 2016年网络高分书单">[活动] 2016年网络高分书单</a></li>
					<li><a href="###5" class="tooltip" title="[活动] 2017春季高分书单">[活动] 2017春季高分书单</a></li>
					<li><a href="###6" class="tooltip" title="[活动] 2017上半年热销书单">[活动] 2017上半年热销书单</a></li>
				</ul>
				<br class="clear" />
			</div>
		</div>
		<!-- 最新动态 end -->
</body>
</html>