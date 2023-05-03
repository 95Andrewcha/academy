/**
직접 만든 캘린더 라이브러리
 */

class Calendar {
	constructor() {
		this.prev = $('.prev');
		this.next = $('.next');
		this.calendar = $('.calendar');
		this.curDate = new Date();
	}
	
	// 캘린더 초기화
	init() {
		this.render();
	}

	// 캘린더 렌더링
	render() {
		var year = this.curDate.getFullYear();
		var month = this.curDate.getMonth();
		
		var prevEndDate = new Date(year, month, 0);
		var prevDate = prevEndDate.getDate();
		var prevDay = prevEndDate.getDay();
		console.log('prevDate',prevDate);
		console.log('prevDay',prevDay);
		for(var i=prevDate; i>=prevDate-prevDay; i--) {
			console.log(i);
		}
		
		var curEndDate = new Date(year, month + 1, 0);
		var curDate = curEndDate.getDate();
		var curDay = curEndDate.getDay();
		
		for(var i=1; i<=curDate; i++) {
			console.log(i);
		}

		for(var i=1; i<7-curDay; i++) {
			console.log(i);
		}
	}
	
	click1() {
		var curMonth = this.curDate.getMonth();
		console.log(curMonth, '월');
		this.curDate.setMonth(curMonth - 1);
		this.render();
	}
}
















