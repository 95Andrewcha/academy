<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <body>
    <div id='calendar'></div>
</body>
  
<script>
function openpopup(){
	var url ="schedulepopup";
	var name ="schedulepopup";
	var option =" width= 600, height=600";
	window.open(url, name, option);
}
 const date = new Date();
 const year = date.getFullYear();
 const month = ('0' + (date.getMonth() + 1)).slice(-2);
 const day = ('0' + date.getDate()).slice(-2);
 const dateStr = year + '-' + month + '-' + day;
 
 document.addEventListener('DOMContentLoaded', function () {
     $(function () {
         var request = $.ajax({
             url: "schedule_info",
             method: "GET",
             dataType: "json", 
             contentType: 'application/json; charset=utf-8'
         });

         request.done(function (data) {
             var calendarEl = document.getElementById('calendar');
             var calendar = new FullCalendar.Calendar(calendarEl, {
                 initialDate: dateStr,
                 initialView: 'dayGridMonth',
                 customButtons: { 
                     myCustomButton: { 
                         text: '일정입력', 
                         click: function(event) { 
                        	 openpopup(event); 
                         } 
                     } 
             },
                 headerToolbar: {
                     left: 'prev,next today',
                     center: 'title',
                     right: 'myCustomButton,dayGridMonth,listWeek'
                 },
                 editable: true,
                 droppable: true,
              
                 drop: function (arg) {
                     // is the "remove after drop" checkbox checked?
                     if (document.getElementById('drop-remove').checked) {
                         // if so, remove the element from the "Draggable Events" list
                         arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                     }
                 },
                 events: data
             });
             calendar.render();
         });
         request.fail(function( jqXHR, textStatus ) {
             alert( "Request failed: " + textStatus );
         });
     });

 });
    </script>