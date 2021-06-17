<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>Eat And Joy</title> 
    	
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/productView/css/styles.css" rel="stylesheet" />
        
        <!-- Page CSS -->
        <link href="/resources/productAll/css/styles2.css" rel="stylesheet" />
        
        <!-- Footer CSS -->
        <link href="/resources/productAll/css/footer.css" rel="stylesheet" />
        
        <!-- Font Awesome 5  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap');
		</style>
        
    </head>
    <body>
        
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 my-3">
                <div class="row justify-content-center">
                    <div class="col-5 coverImg">
                    <!-- Img -->
                    </div>
                    <div class="col-5">
                        
                        <h1 class="display-5 fw-bolder"><c:out value="${product.PName}" /></h1>
                        <div class="fs-5 mb-5">                       
                            <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.PPrice}" />원</span>
                        </div>
                        <div class= "p-box">
                        <p class="lead"><c:out value="${product.PDesc}" /></p>
                        </div>
                        <div class="d-flex">
                        	<!-- 수량 -->
                            
						    <div class="quantity buttons_added">
								<input type="button" value="-" class="minus">
								<input type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="">
								<input type="button" value="+" class="plus">
							</div>
                            <!-- 수량끝 -->
                            
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                              	 카트에 넣기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <div class = "table-warp">
        	<div class = "table-inner">
	        	<table class="table table-hover" >
	                 <thead class = "reply_header">
	                     <tr>
	                         <th style = "width : 10%">번호</th>
	                         <th style = "width : 50%">제목</th>
	                         <th style = "width : 15%">작성자</th>
	                         <th style = "width : 15%">작성일</th>
	                         <th style = "width : 10%">조회수</th>
	                     </tr>
	                 </thead>
	                 <tbody class = "reply_body">
	                 
	                 </tbody>
	                 
                  </table>
                  
                  <button id="addReplyBtn" class="btn btn-outline-warning float-right">후기 작성</button>
                  
                  <div class = "paging">
                  
                  </div>
                  
              </div> 
       	</div>
       	
       	<!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">후기 작성</h4>
                    </div>
                    <div class="modal-body">
                      <div class = "form-group">
                      	<label>제목</label>
                      	<input class="form-control" name="rTitle" value="New Reply!">
                      </div>
                      <div class = "form-group">
                      	<label>내용</label>
                      	<input class="form-control" name="rContent" value="New Reply!">
                      </div>
                      <div class = "form-group">
                      	<label>작성자</label>
                      	<input class="form-control" name="rWriter" value="New Replyer!">
                      </div>
                      
                    </div>
                    <div class="modal-footer">
                    	<button id= "modalModBtn" type="button" class="btn btn-warning">수정</button>
                        <button id= "modalRemoveBtn" type="button" class="btn btn-danger">제거</button>
                        <button id= "modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
                        <button id= "modalCloseBtn" type="button" class="btn btn btn-dark" data-dismiss="modal">닫기</button>
                        
                        
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
        <%@include file="includesProduct/footer.jsp" %>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/productView/js/scripts.js"></script>
        <!-- Reply JS Module -->
        <script src="/resources/productView/js/reply.js"></script>
        
        <script data-require="jquery@3.1.1" data-semver="3.1.1" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        
        <!-- 아이템 수량 증감 -->
        <script>
        function wcqib_refresh_quantity_increments() {
		    jQuery("div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)").each(function(a, b) {
		        var c = jQuery(b);
		        c.addClass("buttons_added"), c.children().first().before('<input type="button" value="-" class="minus" />'), c.children().last().after('<input type="button" value="+" class="plus" />')
		    })
		}
		String.prototype.getDecimals || (String.prototype.getDecimals = function() {
		    var a = this,
		        b = ("" + a).match(/(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/);
		    return b ? Math.max(0, (b[1] ? b[1].length : 0) - (b[2] ? +b[2] : 0)) : 0
		}), jQuery(document).ready(function() {
		    wcqib_refresh_quantity_increments()
		}), jQuery(document).on("updated_wc_div", function() {
		    wcqib_refresh_quantity_increments()
		}), jQuery(document).on("click", ".plus, .minus", function() {
		    var a = jQuery(this).closest(".quantity").find(".qty"),
		        b = parseFloat(a.val()),
		        c = parseFloat(a.attr("max")),
		        d = parseFloat(a.attr("min")),
		        e = a.attr("step");
		    b && "" !== b && "NaN" !== b || (b = 0), "" !== c && "NaN" !== c || (c = ""), "" !== d && "NaN" !== d || (d = 0), "any" !== e && "" !== e && void 0 !== e && "NaN" !== parseFloat(e) || (e = 1), jQuery(this).is(".plus") ? c && b >= c ? a.val(c) : a.val((b + parseFloat(e)).toFixed(e.getDecimals())) : d && b <= d ? a.val(d) : b > 0 && a.val((b - parseFloat(e)).toFixed(e.getDecimals())), a.trigger("change")
		});
		</script>
		
		<!-- 이미지 불러오기 -->
		<script type="text/javascript">
		var uploadPath= '<c:out value="${img.uploadPath}" />';
		var uuid ='<c:out value="${img.uuid}" />';
		var fileName ='<c:out value="${img.fileName}" />';
		console.log("fileName : " + fileName);
		console.log("uploadPath : " + uploadPath);
		
		//////////////////////////////////////////////////////////////////////////////
		
		fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		   
		console.log("fileCallPath :" + fileCallPath);
		var fileCallFirstPath = fileCallPath.split("s_")[0].replaceAll("%", "%5C");
		console.log("first : " + fileCallFirstPath.substring(0, fileCallFirstPath.length-5));
		 var realfileCallPath = fileCallFirstPath.substring(0, fileCallFirstPath.length-5) + "%2Fs_" +fileCallPath.split("s_")[1];
		
		console.log("realfileCallPath : " + realfileCallPath);
		
		showImage(realfileCallPath);
		
		function showImage(fileCallPath){
			var str="";
			str +="<img src='/display?fileName="+fileCallPath+"' class = 'mainImg'>";
			$(".coverImg").html(str);
		}
		
		</script>
		
		<!-- 후기 페이징 리스트 불러오기  -->
		<script type="text/javascript">
			$(document).ready(function () {
				
				var pidValue = '<c:out value="${product.PId}" />';
				var replyTR = $(".reply_body")
				console.log("pId : " + pidValue);
				
				showReplies(1);
				
				function showReplies(page){
					replyService.getList({pId:pidValue, page: page|| 1}, function(replyCnt, list){
						
						console.log("replyCnt : " + replyCnt);
						console.log("list : " + list);
						
						if(page == -1){
							pageNum = Math.ceil(replyCnt/10.0);
							showReplies(pageNum);
							return;
						}
						
						var str = "";
						
						console.log("댓글 개수 : " + list.length);
						
						if(list == null || list.length == 0){
							replyTR.html("");
							console.log("reply 없음");
							return;
						}
						
						for( var i = 0, len = list.length || 0; i<len; i++){
							str +="<tr data-rId='"+list[i].rid+"'>";
							str +="<td>" +(replyCnt-i)+ "</td>";
							str +="<td>" +list[i].rtitle+ "</td>";
							str +="<td>" +list[i].rwriter+ "</td>";
							str +="<td>"+replyService.displayTime(list[i].rregDate)+"</td>";
							console.log(list[i].rregDate);
							str +="<td>" +list[i].rhit+ "</td>";
							str +="</tr>";
						}
						
						replyTR.html(str);
						
						
						showReplyPage(replyCnt);
						
						
					}); // function ends
					
				}// showReplies ends
				
				//모달박스 동작
				var modal = $(".modal");
				var modalInputTitle = modal.find("input[name='rTitle']");
				var modalInputContent = modal.find("input[name='rContent']");
				var modalInputWriter = modal.find("input[name='rWriter']");
				
				var modalModBtn = $("#modalModBtn");
				var modalRemoveBtn = $("#modalRemoveBtn");
				var modalRegisterBtn = $("#modalRegisterBtn");
				var modalCloseBtn = $("#modalCloseBtn");
				
				$("#addReplyBtn").on("click", function(e){
					modal.find("input").val("");
					modalInputWriter.closest("div").hide();
					modal.find("button[id = 'modalModBtn']").hide();
					modal.find("button[id = 'modalRemoveBtn']").hide();
					
					$(".modal").modal("show");
				});
				
				//close button starts
				modalCloseBtn.on("click", function(e){
					
					modal.modal("hide");
					
				});
				
				//register button starts
				modalRegisterBtn.on("click", function(e){
					
					modal.find(modalInputWriter).val("replyer");
					
					var reply = {
							rtitle: modalInputTitle.val(),
							rwriter: modalInputWriter.val(),
							rcontent: modalInputTitle.val(),
							pid:pidValue
					};
					
					replyService.add(reply, function(result){
						alert(result);
						
						modal.find("input").val("");
						modal.modal("hide");
						
						showReplies(-1);
					
					
					});
					
				});	// Register button ends.
				
				// look-up button starts
				$(".reply_body").on("click", "tr", function(e){
					
					var rId = $(this).data("rid");
					
					console.log(rId);
					
					replyService.get(rId, function(reply){
						
						modalInputTitle.val(reply.rtitle);
						modalInputContent.val(reply.rcontent);
						modalInputWriter.val(reply.rwriter);
						modal.data("rId", reply.rid);
						
						modal.find("button[id !='modalCloseBtn']").hide();
						modalModBtn.show();
						modalRemoveBtn.show();
						
						$(".modal").modal("show");
						
					});
					
				});// look-up button ends
				
				//modify button starts
				modalModBtn.on("click", function(e){
					
					var reply = {rid:modal.data("rId"), rtitle:modalInputTitle.val(), rcontent:modalInputContent.val()};
					replyService.update(reply, function(result){
						
						alert(result);
						modal.modal("hide");
						showReplies(pageNum);
					});
					
				});//modify button ends
				
				//remove button starts
				modalRemoveBtn.on("click", function(e){
					var rId = modal.data("rId");
					console.log(rId);
					replyService.remove(rId, function(result){
						
						alert(result);
						modal.modal("hide");
						showReplies(pageNum);
					});
				});//remove button ends
				
				//Pagination starts
				var pageNum = 1;
				var replyPaging = $(".paging");
				
				function showReplyPage(replyCnt){
					
					var endNum = Math.ceil(pageNum / 10.0) *10;
					var startNum = endNum - 9;
					
					var prev = startNum != 1;
					var next = false;
					
					if(endNum * 10 >= replyCnt){
						endNum = Math.ceil(replyCnt/10.0);
					}
					
					if(endNum * 10 < replyCnt){
						next = true;
					}
					
					var str = "<ul class='pagination pull-left'>";
					
					if(prev){
						str+= "<li class='page-item'><a class ='page-link' href='"+(startNum-1)+"'>이전</a></li>";
					}
					
					for(var i = startNum; i <=endNum; i++){
						var active = pageNum == i? "active":"";
						
						str+= "<li class='page-item "+active+" '><a class ='page-link' href='"+i+"'>"+i+"</a></li>";
					}
					
					if(next){
						str+= "<li class='page-item'><a class ='page-link' href='"+(endNum+1)+"'>다음</a></li>";
					}
					
					str += "</ul></div>";
					
					console.log(str);
					
					replyPaging.html(str);
				}
				
				replyPaging.on("click", "li a", function(e){
					e.preventDefault();
					
					console.log("page click");
					
					var targetPageNum = $(this).attr("href");
					
					console.log("targetPageNum : " + targetPageNum);
					
					pageNum = targetPageNum;
					
					showReplies(pageNum);
				
				});///Pagination ends
				
				
			
			});//				
		
		</script> 
		
    </body>
</html>
