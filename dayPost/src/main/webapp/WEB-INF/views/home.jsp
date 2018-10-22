<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<body>
<style></style>

<hr>

	<div class="contain">
		<ul>
			<li class="postcnt"><b>0</b>건</li>
		</ul>
		<ul>
			<li> <a href="#writing" class="button has-icon" id="wrtbtn">글쓰기</a> </li>
			<li> <a href="#list" class="button has-icon" id="addlist">목록</a> </li>
			<li> <a href="#todo" class="button has-icon" id="listup">할일</a> </li>
		</ul>
		<%-- 리스트 흩날리기 --%>
		<div class="lists"></div>

		<%-- 글작성 폼 --%>
		<div class='camo'>
		<form name="wrtForm" id='wrtForm' method="post">
		<table id='post'>
			<tr>
			<th></th>
				<td>
					<select class="dropbox borderset" name="hdctg">
						<option name="Diary" value="일기">일기</option>
						<option name="Post" value="포스팅">포스팅</option>
						<option name="Info" value="정보">정보</option>
						<option name="Tasty" value="맛집">맛집 </option>
					</select>
				</td>
				<!-- <td><a href="#" onclick="wrtoff();">X</a></td> -->
			</tr>
			<tr>
				<th class="post_th">제목</th>
				<td><input type="text" name="potitle" id="potitle" class="post_title borderset w300 h30"></td>
				
			</tr>
			<tr>
				<th class="post_th">내용</th>
				<td><textarea name="contents" class="contents borderset w300 h150" placeholder="끄적끄적" ></textarea></td>
			</tr>
			<tr>
				<th></th>
				<!-- <td></td> -->
				<td><a href="#submit" id="postbtn" class="button has-icon" onclick="main.submit();">등록</a></td>
			</tr>
		</table>
		</form>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	main.init();
	
});
var main = (function(){
	
	return{
		init : function(){
			var htmstr = '';
			console.log("init실행.");
			ajax.post('/di/selectPostList.day', {}, main.postcnt);
		}
		,postcnt : function(data){
			if(data.result && data.result != ''){
				//var pcnt = validVal(data.result.listcnt) ? data.result.listcnt : 0;
				var pcnt = data.result.listcnt ? data.result.listcnt : 0;
				
				$('.postcnt b').text(pcnt.toLocaleString());
				list.set(data.result.resultlist, $('.lists'))
			}
		}
		,todoList : function(data){

		}
		,submit : function(){
			console.log('실행');
			document.wrtForm.action = '/di/insertPost.day';
			wrtForm.submit();
		}
	}
})();

$(document).on('click','#wrtbtn',function(e){
	//e.preventDefault();
	//var wrtb = document.getElementById('wrtbtn'),
	//	wrts = document.getElementsByClassName('wrt');
	
	if($('.camo').hasClass('camo')){
		$('.camo').addClass('active');
		$('.camo').removeClass('camo');
	}else{
		$('.active').addClass('camo');
		$('.active').removeClass('active');
	}
	return false;
});

</script>

</body>
</html>
