var menuIds;
$(function() {
	getMenuTreeData();
	validateRule();
});
$.validator.setDefaults({
	submitHandler : function() {
		// getAllSelectNodes();
		save();
	}
});

// function getAllSelectNodes() {
// 	var ref = $('#menuTree').jstree(true); // 获得整个树
//
// 	menuIds = ref.get_selected(); // 获得所有选中节点的，返回值为数组
//
// 	$("#menuTree").find(".jstree-undetermined").each(function(i, element) {
// 		menuIds.push($(element).closest('.jstree-node').attr("id"));
// 	});
// }
function getMenuTreeData() {
	$.ajax({
		type : "GET",
		url : "/sys/teach/classes/tree",
		success : function(menuTree) {
			loadMenuTree(menuTree);
		}
	});
}
function loadMenuTree(menuTree) {
	$('#menuTree').jstree({
		'core' : {
			'data' : menuTree
		},
		"checkbox" : {
			"three_state" : true,
		},
		"plugins" : [ "wholerow", "checkbox" ]
	});
	//$('#menuTree').jstree("open_all");

}

function save() {
	// $('#menuIds').val(menuIds);
	var classes = $('#signupForm').serialize();
	$.ajax({
		cache : true,
		type : "POST",
		url : "/sys/teach/classes/save",
		data : classes,
		async : false,
		error : function(request) {
			alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引

				parent.layer.close(index);

			} else {
				parent.layer.msg(data.msg);
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
	layer.open({
		type:2,
		title:"选择人员",
		area : [ '300px', '450px' ],
		content: "/sys/teach/classes/treeView"
	})
}

function loadStudent(stuIds, stuNames){
	$("#stuIds").val(stuIds);
	$("#stuNames").val(stuNames);
}

var openTeacher = function(){
	layer.open({
		type:2,
		title:"选择人员",
		area : [ '300px', '450px' ],
		content: "/sys/dept/treeView_teacher"
	})
}

function loadTeacher(teachIds, teachNames){
	$("#teachIds").val(teachIds);
	$("#teachNames").val(teachNames);
}
