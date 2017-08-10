<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书本的详细信息</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cssOfDong/BookDetail.css">
</head>
<body>
	<div id="head">
		<div><%@include file="head2.jsp"%></div>
	</div>
	<div id="content">
		<div class="janeshop">
			<div><%@include file="Catalog.jsp"%></div>
			<!-- 左边商品分别的静态页面 -->
			<div id="bookinfo">
				<div style="float: left;">
					<img src="<%=request.getContextPath()%>/upload/<s:property value="book.photoname"/>"
						style="width: 200px" />
				</div>
				<div style="height: 320px;padding-left:450px;" class="content">
					<table class="table">
						<tbody>
							<tr>
								<td><h1 style="font-size: 15pt;">
										<s:property value="book.name" />
									</h1></td>
							</tr>
							<tr>
								<td>价格：</td>
								<td style="color: red;font-size:12pt;">￥：<s:property
										value="book.price" /></td>
							</tr>
							<tr>
								<td>作者：</td>
								<td><s:property value="book.author" /></td>
							</tr>
							<tr>
								<td>销量：</td>
								<td><s:property value="book.bookSales" /></td>
							</tr>
							<tr>
								<td>库存量：</td>
								<td><s:property value="book.bookAmount" /></td>
							</tr>
							<tr>
								<td>类型：</td>
								<td><s:property value="book.category" /></td>
							</tr>
							<tr>
								<td>出版社：</td>
								<td><s:property value="book.bookPrss" /></td>
							</tr>
							<tr>
								<td><a id="addCarA"
									href="<%=request.getContextPath()%>/add_Car?bookid=${book.id}">
										<i class="fa fa-heart-o"></i>加入购物车
								</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="bookIntroduction">
			<h1 style="font-size: 15pt;">书本简介：</h1>
			<p><s:property value="book.bookIntroduction" /></p>
			</div>
			<div id="comment">
				<h1 style="font-size: 15pt;">用户评论：</h1>
				<s:if test="list.size==0">
					<h1>暂时还没有用户评论！</h1>
				</s:if>
				<table style="width: 790px;border-color:#ddd;" border="1">
					<s:iterator value="list" var="c" status="commentstat">

						<tr bgcolor="#EEF4FA">
							<td>评论的用户名：</td>
							<td><s:property value="userName" /></td>
							<td>评论时间：</td>
							<td><s:property value="date" /></td>
							<td>评分等级：</td>
							<td><s:property value="level" /></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td>评论内容：</td>
							<td colspan="5"><s:property value="comment" /></td>
						</tr>
						<tr style="height: 10px;">
							<td colspan="6"></td>
						</tr>

					</s:iterator>
				</table>
				<table border="0" cellspacing="0" cellpadding="0" width="700">
					<tr>
						<td align="center"><span>第<s:property value="currPage" />/<s:property
									value="totalPage" />页
						</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span> <span>
								<s:if test="currPage != 1">
									<a href="listbyid_Book.action?currPage=1">[首页]</a>&nbsp;&nbsp;
     									  	 <a
										href="listbyid_Book.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
     								  		</s:if> <s:if test="currPage != totalPage">
									<a
										href="listbyid_Book.action?currPage=<s:property value="currPage+1"/>&id=<s:property value="#session.detailBookid"/>">[下一页]</a>&nbsp;&nbsp;
       									   <a
										href="listbyid_Book.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
      								 </s:if>
						</span></td>
					</tr>
				</table>

			</div>
			<div id="likeBook">
				<h1 style="font-size: 15pt;">相似图书：</h1>
				<table style="width: 790px;border-color:#ddd;" border="1">
					<s:set var="index" value="0"></s:set>
					<s:iterator value="books" var="b" status="bookstat">
						<s:if test="#index%6==0">
							<tr>
						</s:if>

						<td>
							<div>
								<div class="picture1">
									<img style="width: 132px;height: 192px;" src="<%=request.getContextPath()%>/upload/<s:property value="photoname"/>" />
								</div>
								<div class="content">
									<label >书名:<s:property value="name" /></label><br> <label>价格:<s:property
											value="price" /></label><br>
									<br> <a id="bookInfoA"
										href="<%=request.getContextPath()%>/listbyid_Book?id=<s:property value="id"/>"><i
										class="fa fa-bookmark-o"></i>查看详情</a>
								</div>
							</div>
						</td>
						<s:elseif test="#index%6==5||#bookstat.last">
							</tr>
						</s:elseif>
						<s:set var="index" value="#index+1" />
					</s:iterator>

				</table>
			</div>
		</div>
	</div>
	<div id="foot">
		<div><%@include file="foot.jsp"%></div>
	</div>
	<s:debug></s:debug>
</body>
</html>