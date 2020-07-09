$(function() {
	getMenuTreeData();
	validateRule();
});
$.validator.setDefaults({
	submitHandler : function() {
		// getAllSelectNodes();
		update();
	}
});
function loadMenuTree(menuTree) {
	$('#menuTree').jstree({
		"plugins" : [ "wholerow", "checkbox" ],
		'core' : {
			'data' : menuTree
		},
		"checkbox" : {
			//"keep_selected_style" : false,
			//"undetermined" : true
			//"three_state" : false,
			//"cascade" : ' up'
		}
	});
	$('#menuTree').jstree('open_all');
}

function getMenuTreeData() {
	var id = $('#id').val();
	$.ajax({
		type : "GET",
		url : "/sys/teach/classes/tree/" + id,
		success : function(data) {
			loadMenuTree(data);
		}
	});
}
function update() {
	var classes = $('#signupForm').serialize();
	$.ajax({
		cache : true,
		type : "POST",
		url : "/sys/teach/classes/update",
		data : classes,
		async : false,
		error : function(request) {
			alert("Connection error");
		},
		success : function(r) {
			if (r.code == 0) {
				parent.layer.msg(r.msg);
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);

			} else {
				parent.layer.msg(r.msg);
			}

		}
	});
}
function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入班级名"
			}
		}
	});
}

var openStudent = function(){
	var id = $('#id').val();
	layer.open({
		type:2,
		title:"选择人员",
		area : [ '300px', '450px' ],
		content: "/sys/teach/classes/treeView/" + id
	})
}

function loadStudent(stuIds, stuNames){
	$("#stuIds").val(stuIds);
	$("#stuNames").val(stuNames);
}

var openTeacher = function(){
	var id = $('#id').val();
	layer.open({
		type:2,
		title:"选择人员",
		area : [ '300px', '450px' ],
		content: "/sys/dept/treeView_teacher/" + id
	})
}

function loadTeacher(teachIds, teachNames){
	$("#teachIds").val(teachIds);
	$("#teachNames").val(teachNames);
}
