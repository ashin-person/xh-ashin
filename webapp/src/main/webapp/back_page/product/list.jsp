<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/back_page/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>babasport-list</title>
<script type="text/javascript">

function getTableForm() {
	return document.getElementById('tableForm');
}

function toShow(pageSize,pageNum,isDisplay,ids){
	if(Pn.checkedCount('ids')<=0) {
	alert("请至少选择一个!");
	return;
	}
	if(!confirm("确定上架吗?")) {
		return;
	}
	alert("ashin");
	var urlStr = '${pageContext.request.contextPath}/product/toUpProduct.bhtml?pageSize='+pageSize;
	urlStr = urlStr + '&pageNum='+pageNum;
	urlStr = urlStr + '&isDisplay='+isDisplay;
	urlStr = urlStr + '&ids='+ids;
	alert(urlStr);
	window.location.href=urlStr;
	
}

function optDelete() {
	if(Pn.checkedCount('ids')<=0) {
		alert("请至少选择一个!");
		return;
	}
	if(!confirm("确定上架吗?")) {
		return;
	}
	var f = getTableForm();
	f.action="o_delete.do";
	f.submit();
}
function changePageNo(){
	$("input[name='pageNo']").val(1);
}

</script>
</head>
<body onload="initWindow();">
<div class="box-positon">
	<div class="rpos">当前位置: 商品管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='${pageContext.request.contextPath}/product/toAddProduct.bhtml'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form action="${pageContext.request.contextPath}/product/searchProduct.bhtml" method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
名称: <input id="nameId" type="text" onkeyup="changePageNo()" value="${name }" name="name"/>
	<input id="brandHiddenID" type="hidden" value="${brandId }"/>
	<input id="totalNumHiddenId" type="hidden" value="${totalNum }"/>
	<input id="pageNumIdHiddenId" type="hidden" value="${pageSize }"/>
	<input id="pageFirstHiddenId" type="hidden" value="${pageNum }"/>
	<%-- <input id="isShowId" type="hidden" value="${isShow }"/> --%>
	
	<select id="selectBrandID" name="brandId">
	<!-- 	<option value="">请选择品牌</option> -->
	<!-- 	<option value="1">依琦莲</option>   
		<option value="2">凯速（KANSOON）</option> -->
	</select>
	<select id="isShowId" onchange="changePageNo()" name="isShow">
		<c:choose>
			<c:when test="${isShow!=null&&isShow=='1' }">
				<option value="">请选择</option>
				<option selected="selected" value="1">上架</option>
				<option  value="0">下架</option>	
			</c:when>
			<c:when test="${isShow!=null&&isShow=='0' }">
				<option value="">请选择</option>
				<option value="1">上架</option>
				<option selected="selected" value="0">下架</option>	
			</c:when>
			<c:otherwise>
				<option selected="selected" value="">请选择</option>
				<option value="1">上架</option>
				<option  value="0">下架</option>	
			</c:otherwise>
		</c:choose>


	</select>
	<input type="submit" class="query" value="查询"/>
</form>
<form method="post" id="tableForm">  
<input type="hidden" value="" name="pageNo"/>
<input type="hidden" value="" name="queryName"/>
<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>商品编号</th>
			<th>商品名称</th>
			<th>图片</th>
			<th width="4%">新品</th>
			<th width="4%">热卖</th>
			<th width="4%">推荐</th>
			<th width="4%">上下架</th>
			<th width="12%">操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:if test="${fs:length(productList)==0 }">
			<tr align="center">
				<td colspan="9">没有记录</td>
			</tr>
		</c:if>
		<c:forEach items="${productList }" var="product">
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="73"/></td>
			<td>${product.no }</td>
			<td align="center">${product.name }</td>
			<td align="center"><img width="50" height="50" src="${pageContext.request.contextPath }/res/img/pic/ppp0.jpg"/></td>
			<td align="center">
				<c:choose>
					<c:when test="${product.isNew=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
			<td align="center">
				<c:choose>
					  <c:when test="${product.isHot=='1' }">是</c:when>
			         <c:otherwise>否</c:otherwise>
				</c:choose>

			</td>
			<td align="center">
				<c:choose>
					<c:when test="${product.isCommend=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>				
				</c:choose>
			</td>
			<td align="center">
				<c:choose>
					<c:when test="${product.isShow=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
			<td align="center">
			<a href="#" class="pn-opt">查看</a> | <a href="#" class="pn-opt">修改</a> | <a href="#" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> | <a href="../sku/list.jsp" class="pn-opt">库存</a>
			</td>
		</tr>
		</c:forEach>

	</tbody>
</table>
<div id="fyDivId" class="page pb15"><span class="r inb_a page_b">
	
		<a id="firstPageId" ><font size="2">首页</a>
	
		<a id ="prePageId" ><font size="2">上一页</a>
	
		<a id="nextPageId" href="/product/list.do?&amp;isShow=0&amp;pageNo=2"><font size="2">下一页</font></a>
	
		<a href="/product/list.do?&amp;isShow=0&amp;pageNo=5"><font size="2">尾页</font></a>
	
		共<var>5</var>页 到第<input type="text" size="3" id="PAGENO"/>页 <input type="button" onclick="javascript:window.location.href = '/product/list.do?&amp;isShow=0&amp;pageNo=' + $('#PAGENO').val() " value="确定" class="hand btn60x20" id="skip"/>
	
</span></div>
<div style="margin-top:15px;"><input class="del-button" type="button" value="删除" onclick="optDelete();"/><input class="add" type="button" value="上架" onclick="toShow();"/><input class="del-button" type="button" value="下架" onclick="optDelete();"/></div>
</form>
</div>
<script type="text/javascript">

	$(function(){


		 $.ajax({
	      url: "${pageContext.request.contextPath }/control/getBrandName.bhtml",    //请求的url地址
	      dataType: "json",   //返回格式为json,这里可以自定义为其他的格式
	      data: { "selectBrandNameIDKey": "selectBrandNameIDValue" },    //需要传递到后台的参数值，必须以键值对的形式
	      type: "GET",   //请求方式，还可以是post
	      beforeSend: function() {
	        //请求前的处理
		
	      },
	      success: function(data,textstatus) {//data为后台传过来的数据，如：data = {"testdata":"haha"};, 通过 data.testdata得到value值，
	        //请求成功时处理
		
/* 		for(var i = 0;i<data.length;i++){
			alert(data[i]);
		} */
		var optsStr = "<option value=''>请选择品牌</option>";
		$(data).each(function(i){
			optsStr =optsStr+"<option value='"+data[i].id+"'>"+data[i].name+"</option>";
		});
	
		$("#selectBrandID").html(optsStr);
		var brandHiddenIDVal = $("#brandHiddenID").val();
		if(brandHiddenIDVal!=null&&brandHiddenIDVal!=""){
			var optV = "#selectBrandID option[value='"+brandHiddenIDVal+"']";
			$(optV).attr("selected","selected");
		}
		
		
		},
		
	    
	      error:function() {
	        //请求出错处理
	       alert("error");
	      }
	    });
	    		
	})
	
	function initWindow(){
	
		//parseInt(pageFirstHiddenVal)-5
				function setAUrl(pageFirst,pageSize,nameVal,isShowIDVal,selectBrandIDVal,eleId){
						var strUrl = "${pageContext.request.contextPath }/product/productList.bhtml?pageNum=";
					//	var pageFirst =(parseInt(pageFirstHiddenVal)-5) ;
						strUrl = strUrl + pageFirst; 
						strUrl = strUrl + "&pageSize=";
						strUrl = strUrl + pageSize;
						strUrl = strUrl + "&name=";
						strUrl = strUrl + nameVal;
						strUrl = strUrl + "&isShow=";
						strUrl = strUrl + isShowIDVal;
						strUrl = strUrl +"&brandId=";
						strUrl = strUrl +selectBrandIDVal;
						$(eleId).attr("href",strUrl);
				};
	    
	   			var $totalNum = $("#totalNumHiddenId");
				var pageFirstHiddenVal = $("#pageFirstHiddenId").val();
				var totalNumVal = $totalNum.val()/5;
				$("#pageNumId").html(Math.ceil(totalNumVal));//Math.ceil(totalNumVal)
				var pageSize = 5;
				var nameVal = $("#nameId").val();
				var selectBrandIDVal = $("#brandHiddenID").val();
			
				if(typeof(selectBrandIDVal)=="undefined"){
					selectBrandIDVal = "";
				}
				var isShowIDVal =$("#isShowId option:selected").val(); 
				var $nextPage = $("#nextPageId");
				for (var i = 0 ;i < totalNumVal ;i ++) {
					var $aEle = $("<a ></a>");
					$aEle.html(i+1);
					var strUrl = "${pageContext.request.contextPath }/product/productList.bhtml?pageNum=";
					var pageFirst = i*5;
					strUrl = strUrl + pageFirst; 
					strUrl = strUrl + "&pageSize=";
					strUrl = strUrl + pageSize;
					strUrl = strUrl + "&name=";
					strUrl = strUrl + nameVal;
					strUrl = strUrl + "&isShow=";
					strUrl = strUrl + isShowIDVal;
					strUrl = strUrl +"&brandId=";
					strUrl = strUrl +selectBrandIDVal;
	
					if(pageFirstHiddenVal==""||pageFirstHiddenVal==pageFirst){
				/* 		alert(pageFirstHiddenVal);
						alert(pageFirst); */
						$aEle.css("background-color","dodgerblue");
					}else{
						$aEle.attr("href",strUrl);
					}
					$nextPage.before($aEle);
				}


				if((Math.ceil(totalNumVal)-1)<(pageFirstHiddenVal/5+1)&&(pageFirstHiddenVal/5+1)<=(Math.ceil(totalNumVal))){
					$("#lastPageId").css("background-color","dodgerblue");
					$("#nextPageId").css("background-color","dodgerblue");
				}else{
					setAUrl(parseInt(totalNumVal)*5,pageSize,nameVal,isShowIDVal,selectBrandIDVal,"#lastPageId");
					setAUrl(parseInt(pageFirstHiddenVal)+5,pageSize,nameVal,isShowIDVal,selectBrandIDVal,"#nextPageId");
				}
				
				if(typeof($("#fyDivId a:contains('1')").attr("href"))=="undefined"){
					$("#firstPageId").css("background-color","dodgerblue");
					$("#prePageId").css("background-color","dodgerblue");
				}else{
					setAUrl(0,pageSize,nameVal,isShowIDVal,selectBrandIDVal,"#firstPageId");
					setAUrl(parseInt(pageFirstHiddenVal)-5,pageSize,nameVal,isShowIDVal,selectBrandIDVal,"#prePageId");
					
				}
	}

</script>

</body>
</html>