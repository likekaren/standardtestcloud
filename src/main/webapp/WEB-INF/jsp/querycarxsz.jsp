<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="${baseurl}/css/jquery.grid.css" />
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}css/skin_/table.css" />
<title>查询标准列表</title>
</head>
<body> 
<div id="main">
		<!-- html的静态布局 -->
		<form id="standardlistqueryForm">
			<!-- 查询条件 -->
			<TABLE class="table_search">
				<TBODY>
				
					<TR>
					
						<TD class="left">号牌号码：</td>
						<td><INPUT type="text" name="carxszCustom.cid"  style="width:120px; height=100px"/></TD>
						<TD class="left">所有人：</TD>
						<td><INPUT type="text" name="carxszCustom.cuser" style="width:120px; height=100px"/></TD>

						
			
						</select>
						</TD>
						<td>
							<div class="search-button">
								<input class="button" onclick="querystandardlist()" type="button"
									value="搜索一下" />
							</div>
						
					
				</TBODY>
			</TABLE>
			<!-- 查询列表 -->
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
				<div class="table">
					<div class="opt ue-clear">
				<!-- 		<span class="sortarea"> <span class="sort"> <label>排序：</label>
								<span class="name"> <i class="icon"></i> <span
									class="text">名称</span>
							</span>
						</span> <i class="list"></i> <i class="card"></i>
						</span>  -->
						
						<!-- <span class="optarea"> <a href="javascript:addgoods();"
							class="add"> <i class="icon"></i> <span class="text">添加</span> -->
							
							
								<!-- </a> <a href="javascript:;" class="delete"> <i class="icon"></i> <span
						class="text">删除</span> -->
					<!-- 	</a> <a href="javascript:;" class="statistics"> <i class="icon"></i>
								<span class="text">统计</span>
						</a> <a href="javascript:;" class="config"> <i class="icon"></i> <span
								class="text">配置</span>
						</a> -->
						</span>
					</div>
				</div>
				<!-- <table id="standardlist"></table> -->

				<TBODY>
					<TR>
						<TD>
							<table id="standardlist"></table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>	
			
			<form id="goodsdeleteform"
			action="${baseurl}standardtest/deletexsz.action" method="post">
			<input type="hidden" id="delete_id" name="id" />
		</form>
</body>
<script type="text/javascript">
	//datagrid列定义
	var columns_v = [ [
			{
				field : 'cid',//对应json中的key
				title : '号码牌号',
				width : 70
			},
			{
				field : 'cuser',//对应json中的key
				title : '所有人',
				width : 50
			},
			{
				field : 'ctype',//对应json中的key
				title : '车辆类型',
				width : 60
			},
			{
				field : 'address',//对应json中的key
				title : '地址',
				width : 220
			},
			{
				field : 'useproperty',//对应json中的key
				title : '使用性质',
				width : 60
			},
			{
				field : 'brandtype',//对应json中的key
				title : '品牌型号',
				width : 150
			},
			{
				field : 'sbid',//对应json中的key
				title : '车辆识别代号',
				width : 140
			},
			{
				field : 'fdjid',//对应json中的key
				title : '发动机号码',
				width : 70
			},
			{
				field : 'rtime',//对应json中的key
				title : '注册日期',
				width : 62
			},
			{
				field : 'fztime',//对应json中的key
				title : '发证日期',
				width : 62
			},
			{
				field : 'filenum',//对应json中的key
				title : '档案编号',
				width : 90
			},
			{
				field : 'hdzrs',//对应json中的key
				title : '核定载人数',
				width : 70
			},
			{
				field : 'zzl',//对应json中的key
				title : '总质量',
				width : 50
			},
			{
				field : 'zbzl',//对应json中的key
				title : '整备质量',
				width : 60
			},
			{
				field : 'hdzzl',//对应json中的key
				title : '核定载质量',
				width : 65
			},
			{
				field : 'wgcc',//对应json中的key
				title : '外廓尺寸',
				width : 130
			},
			{
				field : 'zqyzl',//对应json中的key
				title : '准牵引质量',
				width : 70
			},
			{
				field : 'note',//对应json中的key
				title : '备注',
				width : 60
			},
			{
				field : 'testrecord',//对应json中的key
				title : '检验记录',
				width : 60
			},
			{
				field : 'opt1',
				title : '删除',
				width : 105,
				formatter : function(value, row, index) {
					return "<a href=javascript:deletexsz('" + row.id
							+ "')>删除</a>";
				}
			} ,{
				field : 'opt2',
				title : '修改',
				width : 105,
				formatter : function(value, row, index) {
					return "<a href=javascript:editxsz('" + row.id
							+ "')>修改</a>";
				}
			},
			] ];

	//datagrid 加载数据
	$(function() {
		$('#standardlist').datagrid({
			title : '车辆信息查询',//数据列表标题
			nowrap : true,//单元格中的数据不换行，如果为true表示不换行，不换行情况下数据加载性能高，如果为false就是换行，换行数据加载性能不高
			striped : true,//条纹显示效果
			url : '${baseurl}standardtest/querycarxsz_result.action',//加载数据的连接，引连接请求过来是json数据
			idField : 'id',//此字段很重要，数据结果集的唯一约束(重要)，如果写错影响 获取当前选中行的方法执行
			loadMsg : '',
			columns : columns_v,
			pagination : true,//是否显示分页
			rownumbers : true,//是否显示行号
			pageList : [ 18, 30, 45 ],
		});
	});

	//查询方法
	function querystandardlist() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#standardlistqueryForm").serializeJson();
		$('#standardlist').datagrid('load', formdata);
	}

	//删除方法
	function deletexsz(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认删除吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在goodsdeleteform中
					$("#delete_id").val(id);
					//使用ajax的from提交执行删除
					//goodsdeleteform：form的id，goodsdel_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('goodsdeleteform', goodsdel_callback, null,
							"json");
				});
	}
	//删除商品的回调
	function goodsdel_callback(data) {
		message_alert(data);
		//刷新 页面
		//在提交成功后重新加载 datagrid
		//取出提交结果
		var type = data.resultInfo.type;
		if (type == 1) {
			//成功结果
			//重新加载 datagrid
			setTimeout("querygoods()", 1000);
		}
	}
	//添加商品
	function addgoods() {
		createmodalwindow("添加商品信息", 850, 350,
				'${baseurl}goodssystem/addgoods2.action');
	}
	//修改商品信息
	function editxsz(id) {
		//打开修改窗口
		createmodalwindow("修改车辆信息", 900,350,
				'${baseurl}standardtest/editxsz.action?id=' + id);
	}
</script>

</html>