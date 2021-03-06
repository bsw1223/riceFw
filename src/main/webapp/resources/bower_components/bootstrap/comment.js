/**
 * 
 */

console.log("reply Module...");

var replyService =(function(){
	function add(reply, callback, error){
		console.log("add reply...");
		
		$.ajax({
			type : 'post',
			url : '/comt/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	function getList(param,callback,error){
		var boNum = param.boNum;
		var page = param.page || 1;
		var amount = param.amount || 10;
		
		$.getJSON("/comt/pages/"+boNum+"/"+page+"/"+amount+".json", 
				function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		})
	}
	function remove(comtNum, callback, error){
		$.ajax({
			type: 'delete',
			url: '/comt/'+comtNum,
			success : function(deleteResult, status, xhr){
				if (callback){
					callback(deleteResult);
					alert("삭제되었습니다.");
				}
			},
			error : function(xhr, status,er){
				if(error){
					error(er);
				}
			}
		})
	}
	function update(reply, callback, error){
		
		console.log("comtNum: "+reply.comtNum);
		
		$.ajax({
			type: 'put',
			url: '/comt/'+reply.comtNum,
			data: JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function get(comtNum, callback, error){
		$.get("/comt/"+comtNum+".json", function(result){
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
		var today = new Date();
		var gap = today.getTime()-timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh>9?'':'0')+hh,":",(mi>9?'':'0')+mi,":",(ss>9?'':'0')+dd].join('');
		}
	};
	return{
		add:add,
		getList: getList,
		remove: remove,
		update: update,
		get: get,
		displayTime: displayTime
	};
})();