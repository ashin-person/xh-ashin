<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/back_page/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>babasport-list</title>
<script type="type="text/javascript"" src="${pageContext.request.contextPath }/res/js/jquery.js"></script>
<style type="text/"></style>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 品牌管理 - 列表</div>
	<form class="ropt">
		<input id="addPicId" class="add" type="button" value="添加" />
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form action="${pageContext.request.contextPath }/control/brand.bhtml" method="post" style="padding-top:5px;">
品牌名称: <input id="nameId" type="text" name="name" value="${name }"/>
是否有效：<select id="isDisplayId" name="isDisplay">
		<c:choose>
			<c:when test="${isDisplay=='1' }">
				<option value="3">--选择--</option>
				<option value="1" selected="selected">是</option>
				<option value="0">不是</option>
			</c:when>
			<c:when test="${isDisplay=='0' }">
				<option value="3">--选择--</option>
				<option value="1">是</option>
		    	<option value="0" selected="selected">不是</option>
			</c:when>
			<c:otherwise>
				<option value="3">--选择--</option>
				<option value="1">是</option>
		    	<option value="0">不是</option>
			</c:otherwise>
		</c:choose>
		
	</select>
	<input type="submit" class="query" value="查询"/>
</form>
<form id="jvFormId" action="${pageContext.request.contextPath }/control/batchDeleteBrands.bhtml" method="post">
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input id="selAllCheckBoxId" type="checkbox" "/></th>
			<th>品牌ID</th>
			<th>品牌名称</th>
			<th>品牌图片</th>
			<th>品牌描述</th>
			<th>排序</th>
			<th>是否可用</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${brandList }" var="brand">
		<tr bgcolor="#ffffff" onmouseout="this.bgColor='#ffffff'" onmouseover="this.bgColor='#eeeeee'">
			<td><input type="checkbox" value="${brand.id }" name="ids"/></td>
			<td align="center">${brand.id}</td>
			<td align="center">${brand.name}</td>
			<td align="center"><img width="40" height="40" src="${brand.imgUrl} "/></td>
			<td align="center">${brand.description }</td>
			<td align="center">${brand.sort }</td>
			<td align="center">
				<c:if test="${brand.isDisplay =='1'}">
					是
				</c:if>
				<c:if test="${brand.isDisplay =='0'}">
					否
				</c:if>
			</td>
			<td class="modifyCLS" align="center">
			<a class="pn-opt" href="javascript:void(0);" onclick="window.location.href='${pageContext.request.contextPath }/control/toEditControllor.bhtml?id=${brand.id}'">修改</a> | <a class="pn-opt" href="javascript:void(0);" onclick="if(!confirm('delete?')){return false;} window.location.href='${pageContext.request.contextPath }/control/delete.bhtml?id=${brand.id}&name=${name }&isDisplay=${isDisplay}'" >删除</a>
			</td>
			<%-- <input type="hidden" id="${brand.id}" value=""/> --%>
		</tr>
		
		</c:forEach>
		<input type="hidden" name="selName"/>
		<input type="hidden" name="selIsDisplay"/>
	</tbody>
</table>
</form>

<div id="fyDivId" class="page pb15"><span class="r inb_a page_b">
		<input type="hidden" value="${totalNum }" id="totalNumHiddenId"/>
		<input type="hidden" value="${pageFirst }" id="pageFirstHiddenId"/>
		<a id="firstPageId"><font size="2">首页</font></a>
		<a id="prePageId"><font size="2">上一页</font></a>
	<!-- 	<strong>1</strong> -->

		<a id="nextPageId"><font size="2">下一页</font></a>
	
		<a id="lastPageId"><font size="2">尾页</font></a>
	
		共<var id="pageNumId">5</var>页 到第<input type="text" size="3" id="pageNoId"/>页 <input id="gotoId" type="button"  value="确定" class="hand btn60x20" />
	
</span></div>
<div style="margin-top:15px;"><input class="del-button" type="button" value="删除" onclick="optDelete();"/></div>
</div>
<script type="text/javascript">
			function updateBrand(id){
				alert(id);
			}
			
			$("#selAllCheckBoxId").click(function(){
				var flag = $(this).is(":checked");
				if(flag){
					//alert("全选");
					$("input[type='checkbox'][name='ids']").attr("checked","checked");
				}else{
					$("input[type='checkbox'][name='ids']").removeAttr("checked");
				}
				
			});

			function optDelete(){
				var selCheBsNum = $("input[type='checkbox'][name='ids']:checked").size();
				//alert(selCheBsNum);
				if(selCheBsNum<1){
					alert("至少请选择一条记录");
					return ;
				}
				if(confirm("确认删除吗?")){
					var nameVal = $("#nameId").val();
					var isDisplayVal = $("#isDisplayId").val();
					$("input[type='hidden'][name='selName']").val(nameVal);
					$("input[type='hidden'][name='selIsDisplay']").val(isDisplayVal);
					$("#jvFormId").submit();
				}
				
			}
			
			$("#addPicId").click(function(){
				//alert("defesdjpoi");
				window.location.href="${pageContext.request.contextPath }/control/addPic.bhtml";
			});
			
				//parseInt(pageFirstHiddenVal)-5
			function setAUrl(pageFirst,pageSize,nameVal,isDisplayVal,eleId){
					var strUrl = "${pageContext.request.contextPath }/control/brand.bhtml?pageFirst=";
				//	var pageFirst =(parseInt(pageFirstHiddenVal)-5) ;
					strUrl = strUrl + pageFirst; 
					strUrl = strUrl + "&pageSize=";
					strUrl = strUrl + pageSize;
					strUrl = strUrl + "&name=";
					strUrl = strUrl + nameVal;
					strUrl = strUrl + "&isDisplay=";
					strUrl = strUrl + isDisplayVal;
					$(eleId).attr("href",strUrl);
			};
			
			$("#gotoId").click(function(){
				var pageNoVal = $("#pageNoId").val();
				var regExp =/^[1-9][0-9]{1,5}$/;
				var result = pageNoVal.match(regExp);
				
				var strUrl = "${pageContext.request.contextPath }/control/brand.bhtml?pageFirst=";
				var $totalNum = $("#totalNumHiddenId");
				var totalNumVal = $totalNum.val()/5;
				var pageNum = Math.ceil(totalNumVal);
				
				
				if(result==null||pageNoVal>pageNum){//匹配不成功
				  alert("输入非法");
				}else{
				  var pageSize = 5;
				  var nameVal = $("#nameId").val();
				  var isDisplayVal =$("#isDisplayId").val();
				  var pageFirst = (parseInt(pageNoVal)-1)*5;
				  strUrl = strUrl + pageFirst; 
				  strUrl = strUrl + "&pageSize=";
				  strUrl = strUrl + pageSize;
				  strUrl = strUrl + "&name=";
				  strUrl = strUrl + nameVal;
				  strUrl = strUrl + "&isDisplay=";
				  strUrl = strUrl + isDisplayVal; 	
				 // alert(strUrl);
				  window.location.href = strUrl;
				}
				
				
			//	window.location.href = "";
			});
			$(document).ready(function(){
				
				var $totalNum = $("#totalNumHiddenId");
				var pageFirstHiddenVal = $("#pageFirstHiddenId").val();
				var totalNumVal = $totalNum.val()/5;
				$("#pageNumId").html(Math.ceil(totalNumVal));//Math.ceil(totalNumVal)
				var pageSize = 5;
				var nameVal = $("#nameId").val();
				var isDisplayVal =$("#isDisplayId").val();
				var $nextPage = $("#nextPageId");
				for (var i = 0 ;i < totalNumVal ;i ++) {
					var $aEle = $("<a ></a>");
					$aEle.html(i+1);
					var strUrl = "${pageContext.request.contextPath }/control/brand.bhtml?pageFirst=";
					var pageFirst = i*5;
					strUrl = strUrl + pageFirst; 
					strUrl = strUrl + "&pageSize=";
					strUrl = strUrl + pageSize;
					strUrl = strUrl + "&name=";
					strUrl = strUrl + nameVal;
					strUrl = strUrl + "&isDisplay=";
					strUrl = strUrl + isDisplayVal;
					if(pageFirstHiddenVal==""||pageFirstHiddenVal==pageFirst){
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
					setAUrl(parseInt(totalNumVal)*5,pageSize,nameVal,isDisplayVal,"#lastPageId");
					setAUrl(parseInt(pageFirstHiddenVal)+5,pageSize,nameVal,isDisplayVal,"#nextPageId");
				}
				
				if(typeof($("#fyDivId a:contains('1')").attr("href"))=="undefined"){
					$("#firstPageId").css("background-color","dodgerblue");
					$("#prePageId").css("background-color","dodgerblue");
				}else{
					setAUrl(0,pageSize,nameVal,isDisplayVal,"#firstPageId");
					setAUrl(parseInt(pageFirstHiddenVal)-5,pageSize,nameVal,isDisplayVal,"#prePageId");
					
				}
				
			});
			

</script>
</body>
</html>