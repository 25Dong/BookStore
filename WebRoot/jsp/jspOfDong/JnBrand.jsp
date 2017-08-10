<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示图书</title>
</head>
<body>
	<!-- 品牌活动 start -->
	<div id="jnBrand">
		<div id="jnBrandTab">
			<h2 title="图书" style="color: white;">
				<i class="fa fa-bookmark-o"></i>&nbsp;图书
			</h2>
			<ul>
				<li><a title="分类" href="#">图书类别：</a></li>
				<li><a title="热门小说"
					href="showCategory_Book.action?book.category=<s:property value="'热门小说'"/>">热门小说</a></li>
				<li><a title="人物传记"
					href="showCategory_Book.action?book.category=<s:property value="'人物传记'"/>">人物传记</a></li>
				<li><a title="中国文学"
					href="showCategory_Book.action?book.category=<s:property value="'中国文学'"/>">中国文学</a></li>
				<li><a title="外国文学"
					href="showCategory_Book.action?book.category=<s:property value="'外国文学'"/>">外国文学</a></li>
			</ul>
		</div>
		<div id="jnBrandContent">
			<div id="jnBrandList">
				<div>
					<s:if test="list.size==0">
						<div id="findEmpty">
							<h2>抱歉！没有查找到相应的图书。</h2>
						</div>
					</s:if>
					<table width="790">
						<s:set var="index" value="0"></s:set>
						<s:iterator value="list" var="b" status="bookstat">
							<s:if test="#index%3==0">
								<tr>
							</s:if>

							<td style="padding: 10px"  width="790/3px">
								<div id="bookInfo">
									<div class="picture">
										<img
											src="<%=request.getContextPath()%>/upload/<s:property value="photoname"/>" />
									</div>
									<hr />
									<div class="content">
										<table class="table">
											<tbody>
												<tr style="font-size:13pt;">
													<td>书名：</td>
													<td><s:property value="name" /></td>
												</tr>
												<tr>
													<td>价格</td>
													<td style="color:red;font-size: 12pt;">￥：<s:property
															value="price" /></td>
												</tr>
												<tr>
													<td>销量：</td>
													<td><s:property value="bookSales" /></td>
												</tr>
												<tr>
													<td>类型：</td>
													<td><s:property value="category" /></td>
												</tr>
											</tbody>
										</table>
										<a id="addCarA"
											href="<%=request.getContextPath()%>/add_Car?bookid=${b.id}"><i
											class="fa fa-heart-o"></i>加入购物车</a> <a id="bookInfoA"
											href="<%=request.getContextPath()%>/listbyid_Book?id=<s:property value="id"/>"><i
											class="fa fa-bookmark-o"></i>查看详情</a>
									</div>
								</div>
							</td>
							<s:elseif test="#index%3==2||#bookstat.last">
								</tr>
							</s:elseif>
							<s:set var="index" value="#index+1" />
						</s:iterator>
					</table>
					<s:if test="bookFlag==0">
						<table border="0" cellspacing="0" cellpadding="0" width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a href="list_Book.action?currPage=1">[首页]</a>&nbsp;&nbsp;
       										<a
												href="list_Book.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
   									    </s:if> <s:if test="currPage != totalPage">
											<a href="list_Book?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
      										<a
												href="list_Book?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
      									 </s:if>
								</span></td>
							</tr>
						</table>
					</s:if>
					<s:elseif test="bookFlag==2">
						<table border="0" cellspacing="0" cellpadding="0" width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a
												href="showCategory_Book.action?currPage=1&book.category=<s:property value="list.get(0).category"/>">[首页]</a>&nbsp;&nbsp;
      										<a
												href="showCategory_Book.action?currPage=<s:property value="currPage-1"/>&book.category=<s:property value="list.get(0).category"/>">[上一页]</a>&nbsp;&nbsp;
      									</s:if> <s:if test="currPage != totalPage">
											<a
												href="showCategory_Book?currPage=<s:property value="currPage+1"/>&book.category=<s:property value="list.get(0).category"/>">[下一页]</a>&nbsp;&nbsp;
      				 						<a
												href="showCategory_Book?currPage=<s:property value="totalPage"/>&book.category=<s:property value="list.get(0).category"/>">[尾页]</a>&nbsp;&nbsp;
       									</s:if>
								</span></td>
							</tr>
						</table>
					</s:elseif>
					<s:elseif test="bookFlag==3">
						<table border="0" cellspacing="0" cellpadding="0" width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a
												href="FindLikeBK_Book.action?currPage=1&book.name=<s:property value="#session.likeBookName"/>">[首页]</a>&nbsp;&nbsp;
       										<a
												href="FindLikeBK_Book.action?currPage=<s:property value="currPage-1"/>&book.name=<s:property value="#session.likeBookName"/>">[上一页]</a>&nbsp;&nbsp;
       									</s:if> <s:if test="currPage != totalPage">
											<a
												href="FindLikeBK_Book.action?currPage=<s:property value="currPage+1"/>&book.name=<s:property value="#session.likeBookName"/>">[下一页]</a>&nbsp;&nbsp;
       										<a
												href="FindLikeBK_Book.action?currPage=<s:property value="totalPage"/>&book.name=<s:property value="#session.likeBookName"/>">[尾页]</a>&nbsp;&nbsp;
       									</s:if>
								</span></td>
							</tr>
						</table>
					</s:elseif>
					<s:elseif test="bookFlag==4">
						<table border="0" cellspacing="0" cellpadding="0" width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a href="bookSales_Book.action?currPage=1">[首页]</a>&nbsp;&nbsp;
     									  	<a
												href="bookSales_Book.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
     								  		</s:if> <s:if test="currPage != totalPage">
											<a
												href="bookSales_Book.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
       									    <a
												href="bookSales_Book.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
      								 </s:if>
								</span></td>
							</tr>
						</table>
					</s:elseif>
					<s:elseif test="bookFlag==5">
						<table border="0" cellspacing="0" cellpadding="0" width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a href="PriceIncrease_Book.action?currPage=1">[首页]</a>&nbsp;&nbsp;
     										<a
												href="PriceIncrease_Book.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
     									</s:if> <s:if test="currPage != totalPage">
											<a
												href="PriceIncrease_Book.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
       										<a
												href="PriceIncrease_Book.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
      									</s:if>
								</span></td>
							</tr>
						</table>
					</s:elseif>
					<s:elseif test="bookFlag==6">
						<table border="0" cellspacing="0" cellpadding="0" width="700">
							<tr>
								<td align="center"><span>第<s:property
											value="currPage" />/<s:property value="totalPage" />页
								</span>&nbsp;&nbsp; <span>总记录<s:property value="totalCount" /></span>
									<span> <s:if test="currPage != 1">
											<a href="PriceDecrease_Book.action?currPage=1">[首页]</a>&nbsp;&nbsp;
     									  	<a
												href="PriceDecrease_Book.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
     								  	</s:if> <s:if test="currPage != totalPage">
											<a
												href="PriceDecrease_Book.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
       									    <a
												href="PriceDecrease_Book.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
      									</s:if>
								</span></td>
							</tr>
						</table>
					</s:elseif>
				</div>
			</div>
		</div>
	</div>
	<!-- 品牌活动 end -->
</body>
</html>