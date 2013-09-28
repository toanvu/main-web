//Initial load of page
$(document).ready(sizeContent);

//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeight = $("html").height() - $("#head-bar").height() + "px";
    var newHeight2 = $("html").height() - $("#head-bar").height() - $(".section-header").height() - $(".contact-tabs").height() - $(".meta-footer").height() + "px";
    var newHeight3 = $("html").height() - $("#head-bar").height() - $(".section-header").height() - $(".contact-tabs").height() - $(".new-contacts-header").height() - $(".meta-footer").height() + "px";
    var newWidth = $("body").width() - $(".meine-funktionen").width() - $(".alle-unterhaltungen").width() + "px";
    var newWidth2 = $("body").width() - $(".meine-funktionen").width() - $(".alle-unterhaltungen").width() - $(".contact-list-wrapper").width() - $(".kontakte-alphabet").width() + "px";
    $(".wrapper").css("height", newHeight);
    $(".wrapper-2").css("height", newHeight2);
    $(".wrapper-3").css("height", newHeight3);
    $(".calc-width").css("width", newWidth);
    $(".calc-width-2").css("width", newWidth2);
}






$(document).ready(function() {

	var toggleheightbutton1 = $(".panel-lehrer a.toggle-height-button");
	var panelbody1 = $(".panel-lehrer .panel-body");
	var toggleheightbutton2 = $(".panel-eltern a.toggle-height-button");
	var panelbody2 = $(".panel-eltern .panel-body");
	var toggleheightbutton3 = $(".panel-sonstige a.toggle-height-button");
	var panelbody3 = $(".panel-sonstige .panel-body");
	var toggleheightbutton4 = $(".panel-gruppen a.toggle-height-button");
	var panelbody4 = $(".panel-gruppen .panel-body");
	var tooltip1 = $(".tooltip-extra-1");
	var tooltipinner1 = $(".tooltip-extra-1-inner");
	var tooltip2 = $(".tooltip-extra-2");
	var tooltipinner2 = $(".tooltip-extra-2-inner");
	var tooltip3 = $(".tooltip-extra-3");
	var tooltipinner3 = $(".tooltip-extra-3-inner");
	var tooltip4 = $(".tooltip-extra-4");
	var tooltipinner4 = $(".tooltip-extra-4-inner");

	toggleheightbutton1.click(function() {
		panelbody1.toggleClass("toggle-height");
		toggleheightbutton1.toggleClass("toggle-height");
		tooltipinner1.toggleClass("hide");
	});

	toggleheightbutton1.hover(function() {
		tooltip1.toggleClass("in");
	});

	toggleheightbutton2.click(function() {
		panelbody2.toggleClass("toggle-height");
		toggleheightbutton2.toggleClass("toggle-height");
		tooltipinner2.toggleClass("hide");
	});

	toggleheightbutton2.hover(function() {
		tooltip2.toggleClass("in");
	});

	toggleheightbutton3.click(function() {
		panelbody3.toggleClass("toggle-height");
		toggleheightbutton3.toggleClass("toggle-height");
		tooltipinner3.toggleClass("hide");
	});

	toggleheightbutton3.hover(function() {
		tooltip3.toggleClass("in");
	});

	toggleheightbutton4.click(function() {
		panelbody4.toggleClass("toggle-height");
		tooltipinner4.toggleClass("hide");
	});

	toggleheightbutton4.hover(function() {
		tooltip4.toggleClass("in");
	});



	var videobutton = $(".introduction-video-button");
	var instruction = $("#Instructions");

	videobutton.click(function() {
		instruction.toggleClass("hide");
	});


	var nachbutton = $(".nachschlagen-button");
	var nachschlagen = $("#Nachschlagen");

	nachbutton.click(function() {
		nachschlagen.toggleClass("hide");
	});

	var anhangbutton = $(".anhang-button");
	var anhang = $("#Anhang");

	anhangbutton.click(function() {
		anhang.toggleClass("hide");
	});

	var filesbutton = $(".files-overview-button");
	var files = $("#Dateien");

	filesbutton.click(function() {
		files.toggleClass("hide");
	});



	var tooltips = $(".tooltip-toggle");
	tooltips.tooltip();

});




