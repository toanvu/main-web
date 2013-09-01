//Initial load of page
$(document).ready(sizeContent);

//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeight = $("html").height() - $("#head-bar").height() + "px";
    $(".wrapper").css("height", newHeight);
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


