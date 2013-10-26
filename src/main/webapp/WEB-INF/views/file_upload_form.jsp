<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Spring MVC Multiple File Upload</title>
<script
src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileTable tr').children().length - 1;
        $('#fileTable').append(
                '<tr><td>'+
                '   <input type="file" name="files['+ fileIndex +']" />'+
                '</td></tr>');
    });
     
});
</script>
</head>
<body>

<!-- uploadify -->
<script src="/main-web/resources/js/fileupload/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/main-web/resources/css/uploadify.css">
<h1>Uploadify Demo</h1>
	<form:form modelAttribute="uploadForm" enctype="multipart/form-data">
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true">
	</form:form>

	<script type="text/javascript">		
		$(function() {
			$('#file_upload').uploadify({
				'formData'     : {
					'timestamp' : '0012121212',
					'token'     : 'md5'
				},
				'swf'      : '/main-web/resources/swf/uploadify.swf',
				'uploader' : 'http://localhost:8080/main-web/save'
			});
		});
	</script>
<!-- end uploadify -->

<!-- upload file blue -->
<h2>Upload file with blue</h2>
<input id="fileupload" type="file" name="files[]" data-url="/main-web/save" multiple>
<div id="progress">
    <div class="bar" style="width: 0%;"></div>
</div>
<script src="/main-web/resources/js/fileupload/blue/jquery.ui.widget.js"></script>
<script src="/main-web/resources/js/fileupload/blue/jquery.iframe-transport.js"></script>
<script src="/main-web/resources/js/fileupload/blue/jquery.fileupload.js"></script>
<script>
$(function () {
    $('#fileupload').fileupload({
        dataType: 'text/html',
        add: function (e, data) {
        	data.context = $('<p/>').text('Uploading...').appendTo(document.body);
            data.submit();
        },
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo(document.body);
            });
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            );
        }
    });
});
</script>
<style>
.bar {
    height: 18px;
    background: green;
}
</style>

<!-- end upload file blue -->


<h1>Spring Multiple File Upload example</h1>
 
<form:form method="post" action="save.html"
        modelAttribute="uploadForm" enctype="multipart/form-data">
 
    <p>Select files to upload. Press Add button to add more file inputs.</p>
 
    <input id="addFile" type="button" value="Add File" />
    <table id="fileTable">
        <tr>
            <td><input name="files[0]" type="file" /></td>
        </tr>
        <tr>
            <td><input name="files[1]" type="file" /></td>
        </tr>
    </table>
    <br/><input type="submit" value="Upload" />
</form:form>
</body>
</html>