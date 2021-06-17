/**
 * 
 */

console.log("reply Module.............");

var replyService = (function(){
	
	function add(reply, callback, error){
		console.log("reply..........");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	 }
	
	
	function getList(param, callback, error){
		var pId = param.pId;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + pId + "/" + page + ".json",
				function(data){
			if(callback){
				//callback(data);
				callback(data.replyCnt, data.list);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function remove(rId, callback, error){		
		$.ajax({
			type : 'delete',
			url : '/replies/' + rId,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	function update(reply, callback, error){
		
		console.log("rid :" + reply.rid);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rid,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function get(rId, callback, error){
		
		$.get("/replies/" + rId + ".json", function(result) {
			
			if(callback){
				callback(result);
			}
			
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		
		var dateObj = new Date(timeValue);
		
		var str = "";
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() +1;
		var dd = dateObj.getDate();
		
		return [yy, '-', (mm>9 ? '' : '0') + mm, '-', (dd > 9? '' : '0') + dd].join('');
	}
	
	return{
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	};	
})();