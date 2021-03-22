(function( $ ){

	function page(){
		var reSortColors = function($table) {
			$('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
			$('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
		};
		$('table.paginated').each(function() {
			var pagesu = 10;			// 페이지 번호 갯수
			var currentPage = 0;
			var numPerPage = 10;		// 목록의 수
			var $table = $(this);
			
			var numRows = $table.find('tbody tr').length;		// length로 원래 리스트의 전체길이구함
			var numPages = Math.ceil(numRows / numPerPage);		// Math.ceil를 이용하여 반올림
			
			// 리스트가 없으면 종료
			if (numPages==0) return;
			
			// pager 라는 클래스의 div 엘리먼트 작성
			var $pager = $('<td align="center" class="remo" colspan="10"><div class="pager"></div></td>');
			
			var nowp = currentPage;
			var endp = nowp + 10;
			
			// 페이지를 클릭하면 다시 셋팅
			$table.bind('repaginate', function() {				
				// 기본적으로 모두 감춘다, ((현재페이지 + 1) * 현재페이지) 까지 보여준다
				$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
				$(".remo").html("");
				
				if (numPages > 1) {			// 한페이지 이상이면
					// 현재 5 페이지 이하이면
					if (currentPage < 5 && (numPages - currentPage) >= 5) {
						nowp = 0;					// 1 부터 
						endp = pagesu;				// 10 까지
					} else {
						nowp = currentPage - 5;		// 6 넘어가면 2 부터 찍고
						endp = nowp + pagesu;		// 10 까지
						pi = 1;
					}
					// 10 페이지가 안되면
					if (numPages < endp) {
						endp = numPages;			// 마지막페이지를 갯수 만큼
						nowp = numPages - pagesu;	// 시작페이지를 갯수 -10
					}
					// 시작이 음수 or 0 이면
					if (nowp < 1) { 
						nowp = 0;					// 1페이지부터 시작
					}
				} else {					// 한페이지 이하이면
					nowp = 0;						// 한번만 페이징 생성
					endp = numPages;
				}
				
				// [처음]
				$('<span class="page-number">[처음]</span><span>&nbsp;&nbsp;&nbsp;</span>').bind('click', {newPage: page},function(event) {
					currentPage = 0;
					$table.trigger('repaginate');
					$($(".page-number")[2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
			    // [이전]
				$('<span>&nbsp;&nbsp;&nbsp;</span><span class="page-number">[이전]</span><span>&nbsp;&nbsp;&nbsp;</span>').bind('click', {newPage: page},function(event) {
					if(currentPage == 0) return;
					currentPage = currentPage-1;
					$table.trigger('repaginate');
					$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
				// [1,2,3,4,5,6,7,8]
				for (var page = nowp ; page < endp; page++) {
					$('<span class="page-number" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
						currentPage = event.data['newPage'];
						$table.trigger('repaginate');
						$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
				}
			    // [다음]
				$('<span>&nbsp;&nbsp;&nbsp;</span><span class="page-number">[다음]</span><span>&nbsp;&nbsp;&nbsp;</span>').bind('click', {newPage: page},function(event) {
					if(currentPage == numPages-1) return;
					currentPage = currentPage+1;
					$table.trigger('repaginate'); 
					$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
			    // [끝]
				$('<span>&nbsp;&nbsp;&nbsp;</span><span class="page-number">[끝]</span>').bind('click', {newPage: page},function(event) {
					currentPage = numPages-1;
					$table.trigger('repaginate');
					$($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
				
				$($(".page-number")[2]).addClass('active');
				reSortColors($table);
			});
			$pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');
			$pager.appendTo($table);
			$table.trigger('repaginate');
		});
	}
	
	$(function(){
		page();		// table pagination
	});
})( jQuery );