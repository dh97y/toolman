var prefix = "/sys/teach/student";
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
	$.ajax({
		cache : true,
		type : "POST",
		url : prefix + "/update",
		data : $('#signupForm').serialize(),// 你的formid
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
			stuId : {
				required : true
			},
			email : {
				required : true,
				email : true
			},
			status : {
				required : true
			},
			sex : {
				required : true
			}
			// agree : "required"
		},
		messages : {
			classesId : {
				required : icon + "请选择班级"
			},
			name : {
				required : icon + "请输入姓名"
			},
			stuId : {
				required : icon + "请输入学号",
				minlength : icon + "学号必须九个字符以上",
				remote : icon + "学号已经存在"
			},
			status : {
				required : icon + "请选择状态"
			},
			sex : {
				required : icon + "请选择性别"
			},
			email : icon + "请输入您的E-mail"
		}
	})
}

function loadClasses(){
	var html = "";
	$.ajax({
		url : '/sys/teach/classes/list',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].id + '">' + data[i].name + '</option>'
			}
			$(".chosen-select").append(html);
			$(".chosen-select").chosen({
				maxHeight : 200
			});
			//点击事件
			$('.chosen-select').on('change', function(e, params) {
				console.log(params.selected);
				var opt = {
					query : {
						type : params.selected,
					}
				}
				$('#exampleTable').bootstrapTable('refresh', opt);
			});
		}
	});
}