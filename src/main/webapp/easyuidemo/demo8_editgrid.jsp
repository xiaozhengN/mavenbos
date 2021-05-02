<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 先引入 jquery的 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 引入 easyui的js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<!-- 引入国际化 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入 默认样式 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css"/>
<!-- 引入 icon图标 css  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css"/>
<script type="text/javascript">
	$(function(){
		$('#grid').datagrid({
			// 工具栏
			toolbar : [
				{
					id : 'edit',
					text: '开始编辑第2行',
					iconCls : 'icon-edit',
					handler : function(){
						$('#grid').datagrid('beginEdit',1);// 索引1 代表第二行
					}
				},
				{
					id : 'save',
					text: '保存',
					iconCls : 'icon-save',
					handler : function(){
						$('#grid').datagrid('endEdit',1);// 索引1 代表第二行
					}
				},
				{
					id : 'cancel',
					text: '取消',
					iconCls : 'icon-cancel',
					handler : function(){
						$('#grid').datagrid('cancelEdit',1);// 索引1 代表第二行
					}
				}
				,
				{
					id : 'insert',
					text: '插入一行',
					iconCls : 'icon-add',
					handler : function(){
						$('#grid').datagrid('insertRow',{
							index : 0 , // 在第一行进行插入
							row : {}
						});
					}
				}
			],
			// 表头 （列信息）
			columns : [[
				{
					field : 'code',
					title : '编号',
					width : 200
				},
				{
					field : 'name',
					title : '商品名称',
					width : 200,
					editor: {
						type:'validatebox', // 编辑器类型
						options: { // 编辑器属性
							required:true
						}
					}
				},
				{
					field : 'price',
					title : '商品价格',
					width : 200
				}
			]],
			// 远程数据
			url : 'data.json',
			// 其它属性
			rownumbers:true,
			pagination:true,
			onAfterEdit : function(rowIndex, rowData, changes){
				alert('编辑完成');
			}
		});
	});
</script>
</head>
<body>
<h1>使用JavaScript 定义datagrid</h1>
<table id="grid"></table>
</body>
</html>