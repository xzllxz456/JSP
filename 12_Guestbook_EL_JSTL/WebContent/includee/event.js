	function update_go(frm) {
		frm.action = "update.jsp"; //수정작업할 화면
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "delete.jsp"; //삭제작업할 화면
		frm.submit();
	}