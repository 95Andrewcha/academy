<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="${contextPath}/resources/common/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${contextPath}/resources/common/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>   
<!-- Table Start -->
<div class="container-fluid pt-4 px-4">
	<div class="row g-4">

		<div class="col-sm-12 col-xl-6">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">자료등록</h6>
				<table class="table table-bordered">
					<form>

						<div class="mb-3 mt-3">
							<label for="bno" class="form-label">제목</label> <input type="text"
								class="form-control update" id="title" name="title">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">구분</label> <select
								class="form-select w-100" id="floatingSelect"
								aria-label="Floating label select example">
								<option selected>반을 선택하세요</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>


						<div class="mb-3">
							<label for="formFileMultiple" class="form-label">Multiple
								files input example</label> <input class="form-control" type="file"
								id="formFileMultiple" multiple>
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea class="form-control update" id="textAreaContent"
								name="content"></textarea>
						</div>
						<!-- Smart Editor -->
						<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							    oAppRef: oEditors,
							    elPlaceHolder: "textAreaContent",
							    sSkinURI: "${contextPath}/resources/common/se2/SmartEditor2Skin.html",
							    fCreator: "createSEditor2"
							});
							 
							//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
							function submitContents(elClickedObj) {
							    // 에디터의 내용이 textarea에 적용된다.
							    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
							 
							    // 에디터의 내용에 대한 값 검증은 이곳에서
							    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
							  
							    try {
							        elClickedObj.form.submit();
							    } catch(e) {
							     
							    }
							}
							 
							// textArea에 이미지 첨부
							function pasteHTML(filepath){
							    var sHTML = '<img src="<%=request.getContextPath()%>
														/C:/Users/ae656/git/academy/port_/src/main/webapp/resources/common/se2/upload/'
																	+ filepath + '">';
															oEditors.getById["textAreaContent"].exec(
																	"PASTE_HTML", [ sHTML ]);
														}

						</script>

					</form>
				</table>
			</div>
		</div>


	</div>
	<div class="my-2 text-end">
		<button class="btn btn-primary" id="t_update">수정하기</button>
		<button class="btn btn-primary">삭제</button>
		<button class="btn btn-primary">닫기</button>
	</div>
</div>
<!-- Table End -->
 