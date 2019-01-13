/**
 * 扩展validatebox,新建一个我们自己的验证规则
 * 添加如下模板
 * $.extend($.fn.validatebox.defaults.rules, {
	    minLength: {
			validator: function(value, param){
				return value.length >= param[0];
			},
			message: '' //返回消息
	    }});
    添加验证两次密码不一致功能 eqPwd
 * 添加验证用户名是否存在 checkOnlyName
 */

$.extend($.fn.validatebox.defaults.rules, {
    eqPwd: {
    	//value是输入的值，param是方法的参数
		validator: function(value, param){
			return value == param[0];
		},
		message: '两次密码不一致'
    },
    checkOnlyName:{
    	//value是输入的值，param是方法的参数
    	validator:function(value,param){
    		//调用验证用户名是否存在封装好的方法 checkOnlyName
    		var check_flag = checkOnlyName(value,param[0]);
    		if(check_flag == true){
    			return false;
    		}else{
    			return true;
    		}
    	},
		message:'用户名已存在'
    }
});
//添加验证用户名是否存在封装好的方法 checkOnlyName
function checkOnlyName(value,url){
	var flag;
	$.ajax({
		url:url,
		data: {
			name:value
		},
		async: false, 
		dataType:'json',
		success:function(result){	
			flag = result.success;
		}
	});
	return flag;
}
