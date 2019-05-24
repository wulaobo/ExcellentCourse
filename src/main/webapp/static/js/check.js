$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
  $("#login_form").validate({
	    rules: {
	      username: {
	        required: true,
	        minlength: 2
	      },
	      password: {
	        required: true,
	        minlength: 2
	      },
	    },
	    messages: {
	      username: {
	        required: "请输入用户名",
	        minlength: "用户名长度不能小于 2 个字母"
	      },
	      password: {
	        required: "请输入密码",
	        minlength: "密码长度不能小于 2 个字母"
	      },
	    }
	});
  
  $("#register_form").validate({
	   rules: {
	      username: {
	        required: true,
	        minlength: 2
	      },
	      password: {
	        required: true,
	        minlength: 2
	      },
	      email:{
	    	  required:true,
	    	  email:true
	      }
	    },
	    messages: {
	      username: {
	        required: "请输入用户名",
	        minlength: "用户名长度不能小于 2 个字母"
	      },
	      password: {
	        required: "请输入密码",
	        minlength: "密码长度不能小于 2 个字母"
	      },
	      email: "请输入一个正确的邮箱",
	    }
  });
});