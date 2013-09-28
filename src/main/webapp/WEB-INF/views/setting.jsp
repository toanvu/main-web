<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="de">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Einstellungen | Edunet24.de</title>
<meta name="description" content="">
<meta name="viewport" content="width=1280">
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/screen.css">
<script src="resources/js/vendor/modernizr-2.6.2.min.js"></script>
<script type="text/javascript">
	function checkPassword() {
		password1 = document.getElementById("newPassword1").value;
		password2 = document.getElementById("newPassword2").value;
		if (password1 != password2) {
			document.getElementById("errChangePW2").value = "Die angegebene Passworte sind nicht gleich";
			alert(document.getElementById("errChangePW2"));
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top" role="navigation"
		id="head-bar"> <a class="navbar-brand" href="#"><img
		src="resources/img/logo.png"></a> <a href=/main-web/logout
		class="btn btn-danger pull-right">Abmelden
		(${currentUser.getUsername()})</a>
	<ul class="languages pull-right">
		<li>Sprache:</li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="Deutsch"><img
				src="resources/img/flag_de.png" alt="Flagge Deutschland"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="Englisch"><img
				src="resources/img/flag_gb.png" alt="Flagge England"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="Franzˆsisch"><img
				src="resources/img/flag_hr.png" alt="Flagge Frankreich"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="Italienisch"><img
				src="resources/img/flag_ie.png" alt="Flagge Ireland"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="Spanisch"><img
				src="resources/img/flag_es.png" alt="Flagge Spanien"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="T¸rkisch"><img
				src="resources/img/flag_tr.png" alt="Flagge T¸rkei"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip"
			data-placement="bottom" title="Vietnamesisch"><img
				src="resources/img/flag_vn.png" alt="Flagge Vietnam"></a></li>
	</ul>
	</nav>

	<div class="wrapper">

		<section class="meine-funktionen"> <header
			class="section-header">
		<h3>Meine Funktionen</h3>
		</header> <nav class="hauptmenu">
		<ul class="nav nav-pills nav-stacked">
			<li class="nav-button"><a href="neue-gruppennachricht.html"><img
					src="resources/img/account-icons/edit.png"> Gruppennachricht
					schreiben</a></li>
			<li><a href=""><img
					src="resources/img/account-icons/home16.png"> Startseite</a></li>
			<li><a href="contact"><img
					src="resources/img/account-icons/user-plus.png"> Neue
					Kontakte</a></li>
			<li><a href="neue-nachrichten.html"><img
					src="resources/img/account-icons/mail.png"> Nachrichten</a></li>
			<li><a href="contactlist"><img
					src="resources/img/account-icons/address-book.png">
					Adressbuch</a></li>
			<li><a href="kalender.html"><img
					src="resources/img/account-icons/calendar16.png"> Kalender</a></li>
			<li class="active"><a href="setting"><img
					src="resources/img/account-icons/wrench-screwdriver.png">
					Einstellungen</a></li>
		</ul>
		</nav>

		<div class="calendar">
			<table class="sidebar-calendar">
				<thead>
					<tr>
						<th colspan="7">
							<div class="btn-group">
								<button type="button"><</button>
								<button type="button">Februar 2013</button>
								<button type="button">></button>
							</div>
						</th>
					</tr>
					<tr>
						<th>So</th>
						<th>Mo</th>
						<th>Di</th>
						<th>Mi</th>
						<th>Do</th>
						<th>Fr</th>
						<th>Sa</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="muted">29</td>
						<td class="muted">30</td>
						<td class="muted">31</td>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
					</tr>
					<tr>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>10</td>
						<td>11</td>
					</tr>
					<tr>
						<td>12</td>
						<td>13</td>
						<td>14</td>
						<td>15</td>
						<td>16</td>
						<td>17</td>
						<td>18</td>
					</tr>
					<tr>
						<td>19</td>
						<td><strong>20</strong></td>
						<td>21</td>
						<td>22</td>
						<td>23</td>
						<td>24</td>
						<td>25</td>
					</tr>
					<tr>
						<td>26</td>
						<td>27</td>
						<td>28</td>
						<td>29</td>
						<td class="muted">1</td>
						<td class="muted">2</td>
						<td class="muted">3</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="introduction-video-button text-center">
			<a href="#" class="btn btn-success btn-large btn-block"
				id="anleitungsvideo-button"> <i class="icon-facetime-video"></i>
				Anleitungsvideo
			</a>
		</div>
		</section>


		<section class="alle-unterhaltungen"> <header
			class="section-header">
		<h3>Einstellungen</h3>
		</header>
		<div class="nachrichten-wrapper einstellungs-menu">
			<ul class="nav nav-pills nav-stacked" id="Einstellungsnav">
				<li class="active"><a href="#Profilbild" data-toggle="tab">Profilbild
						‰ndern</a></li>
				<li><a href="#Benachrichtigungen" data-toggle="tab">Benachrichtigungen
						‰ndern</a></li>
				<li><a href="#Passwort" data-toggle="tab">Passwort ‰ndern</a></li>
				<li><a href="#Status" data-toggle="tab">Status umbenennen</a></li>
				<li><a href="#Schule" data-toggle="tab">Schule ‰ndern</a></li>
			</ul>
		</div>

		</section>

		<section class="main-content neue-nachrichten calc-width"> <header
			class="einstellungen-header calc-width"> </header>

		<div class="einstellungen calc-width">
			<div class="tab-content">
				<div class="tab-pane active" id="Profilbild">
					<form class="form-horizontal" role="form">
						<h4>Profilbild ‰ndern</h4>
						<div class="form-group avatar-img">
							<label for="inputPasswort1"
								class="col-lg-2 col-xs-2 control-label"> <img
								src="resources/img/avatar-superbig.png" class="img-responsive">
							</label>
							<div class="col-lg-2 col-xs-2">
								<button type="submit" class="btn btn-default btn-block">Ver‰ndern</button>
								<button type="submit" class="btn btn-success btn-block">‹bernehmen</button>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane" id="Benachrichtigungen">
					
					<form:form class="form-inline" action="/main-web/changeNewstype"
						method="POST" modelAttribute="currentUser">
						<h4>Benachrichtigungen einrichten</h4>
						<p>Bitte benachrichtigen Sie mich beim Eingang neuer
							Nachrichten per:</p>
						<div class="form-group">
							<label for="inputSchoolName" class="col-lg-4 col-xs-4 control-label"> <form:checkbox
									id="optionsRadios1" value="email" path="newstype" /> E-Mail
							</label>

							<div class="col-lg-10 col-xs-10">
								<form:input type="email" class="form-control"
									id="inputSchoolName" path="email" />
							</div>
						</div>
						<br />
						<div class="form-group">
							<label for="inputSchoolName" class="col-lg-4 col-xs-4 control-label"> <form:checkbox
									id="optionsRadios2" value="sms" path="newstype" /> SMS
							</label>
							<div class="col-lg-10 col-xs-10">
								<input type="tel" class="form-control" id="inputUserName" name="telefon">
							</div>
						</div>
						<br />
						<button type="submit" class="btn btn-success">‹bernehmen</button>
					</form:form>
				</div>
				<div class="tab-pane" id="Passwort">
					<form class="form-horizontal" action="/main-web/changePassword"
						method="POST" onSubmit="return checkPassword();">
						<h4>Passwort ‰ndern</h4>
						<div class="form-group">
							<label for="inputPasswort1"
								class="col-lg-2 col-xs-2 control-label"
								style="padding-top: 7px;">Aktuelles Passwort:</label>
							<div class="col-lg-4 col-xs-4">
								<input type="password" class="form-control" id="inputPasswort1"
									name="oldPassword">
							</div>
							<div class="has-error">
								<span>${errMes1}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswort2"
								class="col-lg-2 col-xs-2 control-label"
								style="padding-top: 7px;">Neues Passwort:</label>
							<div class="col-lg-4 col-xs-4">
								<input type="password" class="form-control" id="newPassword1"
									name="newPassword1">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswort3"
								class="col-lg-2 col-xs-2 control-label">Neues Passwort
								wiederholen:</label>
							<div class="col-lg-4 col-xs-4">
								<input type="password" class="form-control" id="newPassword2"
									name="newPassword2">
							</div>
							<div class="has-error">
								<span id="errChangePW2"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-xs-offset-2 col-lg-4 col-xs-4">
								<button type="submit" class="btn btn-success">‹bernehmen</button>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane" id="Status">
					<form:form class="form-horizontal" action="/main-web/changeStatus"
						modelAttribute="currentUser" method="POST">
						<h4>Status umbenennen</h4>
						<div class="form-group">
							<label for="inputStatus1" class="col-lg-2 col-xs-2 control-label"
								style="padding-top: 7px;">Ihr aktueller Status:</label> <label
								for="inputStatus1" class="col-lg-4 col-xs-4 control-label"
								style="padding-top: 7px;"> <!-- 					      <input type="text" class="form-control" id="inputStatus1"> -->
								<c:choose>
									<c:when test="${currentUser.getUsertype() == 'other'}">
										<span>Sonstige</span>
									</c:when>
									<c:when test="${currentUser.getUsertype() == 'teacher'}">
										<span>Lehrer</span>
									</c:when>
									<c:otherwise>
										<span>Eltern</span>
									</c:otherwise>
								</c:choose>
							</label>
						</div>
						<div class="form-group">
							<label for="inputStatus2" class="col-lg-2 col-xs-2 control-label"
								style="padding-top: 7px;">Neuer Status:</label>
							<div class="col-lg-4 col-xs-4">

								<form:select path="usertype" id="usertypeOptions"
									class="form-control">
									<form:option value="teacher">Lehrer</form:option>
									<form:option value="parent">Eltern</form:option>
									<form:option value="other">Sonstige</form:option>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-xs-offset-2 col-lg-4 col-xs-4">
								<button type="submit" class="btn btn-success">‹bernehmen</button>
							</div>
						</div>
					</form:form>
				</div>
				<div class="tab-pane" id="Schule">
					<form class="form-horizontal" action="/main-web/changeSchoolId"
						method="POST">
						<h4>Schule ‰ndern</h4>
						<div class="form-group">
							<label for="inputStatus1" class="col-lg-2 col-xs-2 control-label"
								style="padding-top: 7px;">Ihr aktuelle Schule:</label>
							<div class="col-lg-4 col-xs-4">
								<input type="text" class="form-control" id="inputStatus1"
									placeholder="Grundschule Suthwiesenstraﬂe">
							</div>
						</div>
						<div class="form-group">
							<label for="inputStatus2" class="col-lg-2 col-xs-2 control-label">Neue
								Schule w‰hlen:</label>
							<div class="col-lg-4 col-xs-4">
								<a data-toggle="modal" href="#school-modal"
									class="btn btn-default btn-block">Schule ausw‰hlen</a>
							</div>
						</div>
						<div class="form-group">
							<label for="inputStatus2" class="col-lg-2 col-xs-2 control-label"
								style="padding-top: 7px;">Neue Schule:</label>
							<div class="col-lg-4 col-xs-4">
								<input type="text" class="form-control" id="inputStatus2"
									name="schoolId">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-xs-offset-2 col-lg-4 col-xs-4">
								<button type="submit" class="btn btn-success">‹bernehmen</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<footer class="meta-footer  calc-width"> <span>&copy
			2013 Edunet24.de</span>
		<ul class="pull-right">
			<li><a data-toggle="modal" href="#Nutzungsbedingungen">Nutzungsbedingungen
			</a></li>
			<li><a data-toggle="modal" href="#Datenschutz">Datenschutz </a></li>
			<li><a data-toggle="modal" href="#Impressum">Impressum </a></li>
		</ul>
		</footer> </section>

	</div>




	<section class="instruction-videos hide" id="Instructions">
	<button type="button"
		class="close introduction-video-button tooltip-toggle"
		aria-hidden="true" data-toggle="tooltip" title="Schlieﬂen"
		data-placement="left">&times;</button>
	<div class="row">
		<div class="col-lg-5 col-xs-5">
			<div id="carousel-instruction" class="carousel slide">
				<div class="carousel-inner">
					<div class="item active">
						<div class="row">
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="thumbnail">
									<img src="http://placehold.it/250x140" alt="">
									<h5>Nachricht schreiben</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-instruction"
					data-slide="prev"> <span class="icon-prev tooltip-toggle"
					data-toggle="tooltip" title="Zur¸ck" data-placement="top"> <img
						src="resources/img/arrow-left-small.png" alt="zur¸ck"></span>
				</a> <a class="right carousel-control" href="#carousel-instruction"
					data-slide="next"> <span class="icon-next tooltip-toggle"
					data-toggle="tooltip" title="Weiter" data-placement="top"> <img
						src="resources/img/arrow-right-small.png" alt="vor"></span>
				</a>
			</div>
		</div>


		<div
			class="col-lg-6 col-xs-6 col-lg-offset-1 col-xs-offset-1 main-video">
			<div class="thumbnail">
				<img src="http://placehold.it/700x325" alt="">
				<h5>Nachricht schreiben</h5>
				<p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
				</p>
			</div>
		</div>
	</div>
	</section>


	<div id="school-modal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schlieﬂen"
						data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
					<h4 id="myModalLabel">Schule ausw‰hlen</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="inputSchoolName"
								class="col-lg-4 col-xs-4 control-label">Postleitzahl der
								Schule</label>
							<div class="col-lg-5 col-xs-5">
								<input type="number" class="form-control" id="inputSchoolName">
							</div>
							<div class="col-lg-3 col-xs-3">
								<button type="submit" class="btn btn-primary btn-block"
									value="Suchen">Suchen</button>
							</div>
						</div>

					</form>

					<table class="table table-condensed">
						<thead>
							<tr>
								<th>#</th>
								<th>Name der Schule</th>
								<th>W‰hlen</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>01</td>
								<td>Grundschule Suthwiesenstraﬂe</td>
								<td><button class="btn btn-small btn-default btn-block">Ausw‰hlen</button></td>
							</tr>
							<tr>
								<td>02</td>
								<td>Grundschule Suthwiesenstraﬂe</td>
								<td><button class="btn btn-small btn-default btn-block">Ausw‰hlen</button></td>
							</tr>
							<tr>
								<td>03</td>
								<td>Grundschule Suthwiesenstraﬂe</td>
								<td><button class="btn btn-small btn-default btn-block">Ausw‰hlen</button></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<div class="modal fade" id="Nutzungsbedingungen" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schlieﬂen"
						data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Nutzungsbedingungen</h4>
				</div>
				<div class="modal-body">
					Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
					eget lacinia odio sem nec elit. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Curabitur blandit tempus
					porttitor. Donec id elit non mi porta gravida at eget metus. </br> </br>


					Donec sed odio dui. Cum sociis natoque penatibus et magnis dis
					parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac
					cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
					justo sit amet risus. Donec id elit non mi porta gravida at eget
					metus. </br> </br> Donec id elit non mi porta gravida at eget metus.
					Curabitur blandit tempus porttitor. Cras mattis consectetur purus
					sit amet fermentum. Nullam quis risus eget urna mollis ornare vel
					eu leo. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac
					cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
					justo sit amet risus. </br> </br>


				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="Datenschutz" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schlieﬂen"
						data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Datenschutz</h4>
				</div>
				<div class="modal-body">
					Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
					eget lacinia odio sem nec elit. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Curabitur blandit tempus
					porttitor. Donec id elit non mi porta gravida at eget metus. </br> </br>


					Donec sed odio dui. Cum sociis natoque penatibus et magnis dis
					parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac
					cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
					justo sit amet risus. Donec id elit non mi porta gravida at eget
					metus. </br> </br> Donec id elit non mi porta gravida at eget metus.
					Curabitur blandit tempus porttitor. Cras mattis consectetur purus
					sit amet fermentum. Nullam quis risus eget urna mollis ornare vel
					eu leo. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac
					cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
					justo sit amet risus. </br> </br>


				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<div class="modal fade" id="Impressum" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schlieﬂen"
						data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Impressum</h4>
				</div>
				<div class="modal-body">
					Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
					eget lacinia odio sem nec elit. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Curabitur blandit tempus
					porttitor. Donec id elit non mi porta gravida at eget metus. </br> </br>


					Donec sed odio dui. Cum sociis natoque penatibus et magnis dis
					parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac
					cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
					justo sit amet risus. Donec id elit non mi porta gravida at eget
					metus. </br> </br> Donec id elit non mi porta gravida at eget metus.
					Curabitur blandit tempus porttitor. Cras mattis consectetur purus
					sit amet fermentum. Nullam quis risus eget urna mollis ornare vel
					eu leo. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac
					cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
					justo sit amet risus. </br> </br>


				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->





	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
	</script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/neu-2013.min.js"></script>
</body>
</html>
