<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/back_page/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>babasport-edit</title>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 品牌管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='v_list.shtml';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="${pageContext.request.contextPath }/control/updateBrand.bhtml" method="post" enctype="multipart/form-data">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						品牌名称:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="name" value="${brand.name }" maxlength="100"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上传商品图片(90x150尺寸):</td>
						<td width="80%" class="pn-fcontent">
						注:该尺寸图片必须为90x150。
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h"></td>
						<td width="80%" class="pn-fcontent">
						<img width="100" height="100" id="allImgUrlId" src="${brand.imgUrl }"/>
						<input type="hidden" name="imgUrl" id="pathId" value="${pathId }"/>
						<input id="uploadPicId" type="file" name="filePic"  />
						<input id="hididId" type="hidden" name="id" value="${brand.id }"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						品牌描述:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="description" maxlength="80" value="${brand.description }" size="60"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						排序:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="sort" maxlength="80" value="${brand.sort }"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否可用:</td><td width="80%" class="pn-fcontent">
						<c:if test="${brand.isDisplay=='0' }">
							<input type="radio" name="isDisplay" value="1" checked="checked"/>可用
							<input type="radio" name="isDisplay" value="0"/>不可用	
						</c:if>
						<c:if test="${brand.isDisplay=='1' }">
							<input type="radio" name="isDisplay" value="1" />可用
							<input type="radio" name="isDisplay" value="0" checked="checked"/>不可用	
						</c:if>
						<c:if test="${brand.isDisplay=='3' }">
							<input type="radio" name="isDisplay" value="1" />可用
							<input type="radio" name="isDisplay" value="0" />不可用	
						</c:if>						

					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<script type="text/javascript">

	$("#uploadPicId").change(function(){
			//定义参数
		var options = {
			url :  "${pageContext.request.contextPath }/control/uploadPic.bhtml",
			dataType : "json",
			type : "post",
			success : function(data){
				//回调两个路径
				$("#pathId").val(data.path);
				$("#allImgUrlId").attr("src",data.url);
			}
		};
	//	对ID为jvForm的表单进行异步提交,options为上面定义的异步提交参数;
		$("#jvForm").ajaxSubmit(options);
	});

</script>
</body>
</html>