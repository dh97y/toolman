var prefix = "/sys/teach/homework";
$().ready(function() {
	// loadClasses();
	validateRule();
	// $("#signupForm").validate();
});

$.validator.setDefaults({
	submitHandler : function() {
		update();
	}
});
function update() {
	var formData = new FormData($("#signupForm")[0]);
	$.ajax({
		cache : true,
		type : "POST",
		url : prefix + "/update",
		data : formData,
		processData: false, //因为data值是FormData对象，不需要对数据做处理。
		contentType: false,
		async : false,
		error : function(request) {
			alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg(data.msg);
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
			classesId: {
				required : true
			},
			name : {
				required : true
			},
			status : {
				required : true
			}
			// agree : "required"
		},
		messages : {
			classesId : {
				required : icon + "请选择班级"
			},
			name : {
				required : icon + "请输入作业名称"
			},
			status : {
				required : icon + "请选择状态"
			},
		}
	})
}
