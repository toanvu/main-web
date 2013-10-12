$(function() {
    var e = new Date, t = e.getDate(), n = e.getMonth(), r = e.getFullYear();
    $("#calendar").fullCalendar({
        header: {
            left: "prev,next today",
            center: "title",
            right: ""
        },
        editable: !0,
        firstDay: 1,
        buttonText: {
            prev: "&lt;",
            next: "&gt;",
            prevYear: "&lt; Jahr",
            nextYear: "Jahr &gt;",
            today: "Heute",
            month: "Monat",
            week: "Woche",
            day: "Tag"
        },
        monthNames: [ "Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember" ],
        monthNamesShort: [ "Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez" ],
        dayNames: [ "Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag" ],
        dayNamesShort: [ "So", "Mo", "Di", "Mi", "Do", "Fr", "Sa" ]
    });
});