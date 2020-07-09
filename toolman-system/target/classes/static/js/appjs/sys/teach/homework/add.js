var prefix = "/sys/teach/homework";
$().ready(function() {
	loadClasses();
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});
function save() {
	var formData = new FormData($("#signupForm")[0]);
	$.ajax({
		cache : true,
		type : "POST",
		url : prefix + "/add",
		// data : $('#signupForm').serialize(),
		data: formData,
		processData: false, //因为data值是FormData对象，不需要对数据做处理。
		contentType: false,
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);

			} else {
				parent.layer.alert(data.msg)
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
