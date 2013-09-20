$(function () {
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();

	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: ''
		},
		editable: true,
		buttonText: {
       		prev: '&lt;',
       		next: '&gt;',
       		prevYear: '&lt; Jahr', // <<
		    nextYear: 'Jahr &gt;', // >>
		    today:    'Heute',
		    month:    'Monat',
		    week:     'Woche',
		    day:      'Tag'
		},
		monthNames: 	['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli',
						'August', 'September', 'Oktober', 'November', 'Dezember'],

		monthNamesShort: ['Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez'],
		dayNames: ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag'],
		dayNamesShort: ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'],
	});
});