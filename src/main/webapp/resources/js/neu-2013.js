//Initial load of page
$(document).ready(sizeContent);

//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeight = $("html").height() - $("#head-bar").height() + "px";
    var newHeight2 = $("html").height() - $("#head-bar").height() - $(".section-header").height() - $(".contact-tabs").height() - $(".meta-footer").height() + "px";
    var newHeight3 = $("html").height() - $("#head-bar").height() - $(".section-header").height() - $(".contact-tabs").height() - $(".new-contacts-header").height() + "px";
    var newWidth = $("body").width() - $(".meine-funktionen").width() - $(".alle-unterhaltungen").width() + "px";
    var newWidth2 = $("body").width() - $(".meine-funktionen").width() - $(".alle-unterhaltungen").width() - $(".contact-list-wrapper").width() + "px";
    $(".wrapper").css("height", newHeight);
    $(".wrapper-2").css("height", newHeight2);
    $(".wrapper-3").css("height", newHeight2);
    $(".calc-width").css("width", newWidth);
    $(".calc-width-2").css("width", newWidth2);
}


var toggleheightbutton1 = $(".panel-lehrer a.toggle-height-button");
var panelbody1 = $(".panel-lehrer .panel-body");
var toggleheightbutton2 = $(".panel-eltern a.toggle-height-button");
var panelbody2 = $(".panel-eltern .panel-body");
var toggleheightbutton3 = $(".panel-sonstige a.toggle-height-button");
var panelbody3 = $(".panel-sonstige .panel-body");
var toggleheightbutton4 = $(".panel-gruppen a.toggle-height-button");
var panelbody4 = $(".panel-gruppen .panel-body");

toggleheightbutton1.click(function() {
	panelbody1.toggleClass("toggle-height");
	toggleheightbutton1.toggleClass("toggle-height");
});

toggleheightbutton2.click(function() {
	panelbody2.toggleClass("toggle-height");
	toggleheightbutton2.toggleClass("toggle-height");
});

toggleheightbutton3.click(function() {
	panelbody3.toggleClass("toggle-height");
	toggleheightbutton3.toggleClass("toggle-height");
});

toggleheightbutton4.click(function() {
	panelbody4.toggleClass("toggle-height");
	toggleheightbutton4.toggleClass("toggle-height");
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


var tooltips = $(".tooltip-toggle");
tooltips.tooltip();



