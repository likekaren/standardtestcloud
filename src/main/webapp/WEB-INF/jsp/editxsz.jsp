<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<title>修改</title>
<script type="text/javascript">

	function goodssave() {
		jquerySubByFId('goodsform', goodssave_callback, null, "json");
	}
	
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function goodssave_callback(data) {

		message_alert(data);
		//如果成功自动关闭
		if (data.resultInfo.type == "1") {
			// 设置延迟关闭
			setTimeout("close()",1000);
		}
	}
	
	//回显页面
	function close(){
		if(parent.parent.parent){
			parent.location = '${baseurl}standardtest/querycarxsz.action';
		}
	}
	
</script>
</head>
<body>
	<form id="goodsform" action="${baseurl}standardtest/editxszsubmit.action?id=${carjszCustom.id}"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="carxszCustom.id" value="${carxszCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>号牌号码:</td>
					<td><input class="easyui-textbox" type="text" 
						name="carxszCustom.cid" value="${carxszCustom.cid}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>车辆类型:</td>
					<td><input class="easyui-textbox" type="text" 
						name="carxszCustom.ctype" value="${carxszCustom.ctype}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>所有人:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.cuser" value="${carxszCustom.cuser}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>住址:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.address" value="${carxszCustom.address}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>使用性质:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.useproperty" value="${carxszCustom.useproperty}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>品牌型号:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.brandtype" value="${carxszCustom.brandtype}"
						style="height: 35px;"></input></td>
					
				</tr>
				<tr>
					<td>车辆识别代号:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.sbid" value="${carxszCustom.sbid}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>发动机号码:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.fdjid" value="${carxszCustom.fdjid}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					
					<td>注册日期:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.rtime" value="${carxszCustom.rtime}"
						style="height: 35px;"></input>
					
				</tr>
				<tr>
					<td>发证日期:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.fztime" value="${carxszCustom.fztime}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>档案编号:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.filenum" value="${carxszCustom.filenum}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>核定载人数:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.hdzrs" value="${carxszCustom.hdzrs}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>总质量:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.zzl" value="${carxszCustom.zzl}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>整备质量:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.zbzl" value="${carxszCustom.zbzl}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>核定载质量:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.hdzzl" value="${carxszCustom.hdzzl}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>外廓尺寸:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.wgcc" value="${carxszCustom.wgcc}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>准牵引总质量:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.zqyzl" value="${carxszCustom.zqyzl}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.note" value="${carxszCustom.note}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>检验记录:</td>
					<td><input class="easyui-textbox" type="text"  
						name="carxszCustom.testrecord" value="${carxszCustom.testrecord}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="goodssave()">保存</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>