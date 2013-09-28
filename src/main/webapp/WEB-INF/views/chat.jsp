<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="de">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Neue Nachrichten | Edunet24.de</title>
<meta name="description" content="">
<meta name="viewport" content="width=1280">
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<style type="text/css">
			.edunet-context {
				display: none;
			}
		</style>
<link rel="stylesheet" href="/main-web/resources/css/bootstrap.css">
<link rel="stylesheet" href="/main-web/resources/css/screen.css">
<script src="/main-web/resources/js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>


	<!--  websocket test -->


	<!--  edunet context -->
		
	<div id="edunet-context-userId" class="edunet-context">${currentUser.getId()}</div>
	<div id="edunet-context-username" class="edunet-context">${currentUser.getUsername()}</div>
	<div id="edunet-context-currentGroupId" class="edunet-context">${currentGroup.getId()}</div>
	<div id="edunet-context-toChannels" class="edunet-context">${toChannels}</div>
	<!--  edunet context -->

	<script src="/main-web/resources/js/jquery-1.6.4.min.js"
		type="text/javascript"></script>
	<script src="/main-web/resources/js/jQuery.atmosphere.js"
		type="text/javascript"></script>
	<script src="/main-web/resources/js/jquery.url.js"
		type="text/javascript"></script>
	<script src="/main-web/resources/js/edunet-ws.js"
		type="text/javascript"></script>


	<!--  websocket test -->



	<nav class="navbar navbar-default navbar-static-top" role="navigation" id="head-bar">
	  <a class="navbar-brand" href="#"><img src="resources/img/logo.png"></a>
	  <a href=/main-web/logout class="btn btn-danger pull-right">Abmelden (${currentUser.getUsername()})</a>
	  <ul class="languages pull-right">
    	<li>Sprache:</li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Deutsch"><img src="resources/img/flag_de.png" alt="Flagge Deutschland"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Englisch"><img src="resources/img/flag_gb.png" alt="Flagge England"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Französisch"><img src="resources/img/flag_hr.png" alt="Flagge Frankreich"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Italienisch"><img src="resources/img/flag_ie.png" alt="Flagge Ireland"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Spanisch"><img src="resources/img/flag_es.png" alt="Flagge Spanien"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Türkisch"><img src="resources/img/flag_tr.png" alt="Flagge Türkei"></a></li>
		<li><a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="Vietnamesisch"><img src="resources/img/flag_vn.png" alt="Flagge Vietnam"></a></li>
     </ul>
  	</nav>

	<div class="wrapper">

		<section class="meine-funktionen">
			<header class="section-header">
				<h3>Meine Funktionen</h3>
			</header>
			<nav class="hauptmenu">
				<ul class="nav nav-pills nav-stacked">
					<li class="nav-button"><a href="neue-gruppennachricht.html"><img
							src="/main-web/resources/img/account-icons/edit.png"> Gruppennachricht
							schreiben</a></li>
					<li><a href="index.html"><img
							src="/main-web/resources/img/account-icons/home16.png"> Startseite</a></li>
					<li><a href="kontakte-hinzufuegen.html"><img
							src="/main-web/resources/img/account-icons/user-plus.png"> Neue Kontakte</a></li>
					<li class="active"><a href="neue-nachrichten.html"><img
							src="/main-web/resources/img/account-icons/mail.png"> Nachrichten</a></li>
					<li><a href="kontakte.html"><img
							src="/main-web/resources/img/account-icons/address-book.png"> Adressbuch</a></li>
					<li><a href="kalender.html"><img
							src="/main-web/resources/img/account-icons/calendar16.png"> Kalender</a></li>
					<li><a href="einstellungen.html"><img
							src="/main-web/resources/img/account-icons/wrench-screwdriver.png">
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


		<section class="alle-unterhaltungen">
			<header class="section-header">
				<h3>Alle Unterhaltungen</h3>
			</header>
			<div class="nachrichten-wrapper">
				<div class="panel panel-default panel-lehrer">
					<div class="panel-heading">
						Lehrer <a class="pull-right toggle-height-button"> <span
							class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-1">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-1-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-1-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group" id="teacherGroup">
							<!-- list teacher group chat -->
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-eltern">
					<div class="panel-heading">
						Eltern <a class="pull-right toggle-height-button"> <span
							class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-2">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-2-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-2-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<!-- list parent groupchat -->
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-sonstige">
					<div class="panel-heading">
						Sonstige <a class="pull-right toggle-height-button"> <span
							class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-3">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-3-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-3-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<!-- list other group chat -->
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-gruppen">
					<div class="panel-heading">
						Gruppen <a class="pull-right toggle-height-button"> <span
							class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-4">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-4-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-4-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<a href="#" class="list-group-item new-message-received"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span
								class="badge">2</span>
							</a> <a href="#" class="list-group-item new-message-received"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span
								class="badge">1</span>
							</a> <a href="#" class="list-group-item"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
							</a> <a href="#" class="list-group-item"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
							</a> <a href="#" class="list-group-item"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
							</a> <a href="#" class="list-group-item"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
							</a> <a href="#" class="list-group-item"> <img
								src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
							</a>
						</div>
					</div>
				</div>

			</div>

		</section>

		<section class="main-content neue-nachrichten calc-width">
			<header class="nachrichten-header  calc-width">
				<h3>Nachrichten</h3>
				<div class="btn-group pull-right">
					<button type="button" class="btn" data-toggle="modal"
						data-target="#Kontakte">
						<i class="icon-plus"></i> Person hinzufügen
					</button>
					<button type="button" class="btn dropdown-toggle"
						data-toggle="dropdown">
						<i class="icon-gears"></i> Nachricht Einstellungen <span
							class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a data-toggle="modal" href="#Unterhaltung-verlassen"><i
								class="icon-signout"></i> Unterhaltung verlassen</a></li>
						<li><a data-toggle="modal" href="#Unterhaltung-loeschen"><i
								class="icon-trash"></i> Unterhaltung löschen</a></li>
					</ul>
				</div>
			</header>

			<div class="content" id="chatContent">
		</div>
				<footer class="message-write-footer calc-width" id="chatInput">
					<div class="message-toolbar">
						<ul class="pull-left">
							<li><a href="#"><img
									src="/main-web/resources/img/account-icons/keyboard16.png"> Tastatur</a></li>
							<li><a href="#" class="nachschlagen-button"><img
									src="/main-web/resources/img/account-icons/translate16.png"> Nachschlagen</a></li>
						</ul>
						<ul class="pull-right">
							<li><a href="#" class="anhang-button"><img
									src="/main-web/resources/img/account-icons/attachment16.png">Anhang</a></li>
							<li><a data-toggle="modal" href="#Senden" onclick="post()"><img
									src="/main-web/resources/img/account-icons/paper-plane.png"> Senden</a></li>
						</ul>
					</div>

					<div class="message-write-area">
						<textarea placeholder="" id="toSendMessage"></textarea>
					</div>
				</footer>
				<footer class="meta-footer  calc-width">
					<span>&copy 2013 Edunet24.de</span>
					<ul class="pull-right">
						<li><a data-toggle="modal" href="#Nutzungsbedingungen">Nutzungsbedingungen
						</a></li>
						<li><a data-toggle="modal" href="#Datenschutz">Datenschutz
						</a></li>
						<li><a data-toggle="modal" href="#Impressum">Impressum </a></li>
					</ul>
				</footer>
		</section>

	</div>


	<section class="nachschlagen hide" id="Nachschlagen">
		<h3>Nachschlagen</h3>
		<button type="button" class="close nachschlagen-button tooltip-toggle"
			data-toggle="tooltip" title="Schließen" data-dismiss="modal"
			data-placement="left" aria-hidden="true">&times;</button>
		<div class="message-translate">
			<header>
				<form class="form-inline" role="form">
					<div class="form-group">
						<label for="exampleInputEmail2">Von</label> <select>
							<option>Deutsch</option>
							<option>Englisch</option>
							<option>Französisch</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail2">Nach</label> <select>
							<option>Deutsch</option>
							<option>Englisch</option>
							<option>Französisch</option>
						</select>
					</div>
					<button type="submit" class="btn btn-success">Übersetzen</button>
				</form>
			</header>
			<textarea rows="5" class="form-control"></textarea>
			<textarea rows="5" class="form-control"></textarea>
			</table>
		</div>
	</section>

	<section class="anhang hide" id="Anhang">
		<h3>Fotos und Dokumente hinzufügen</h3>
		<div class="add-file">
			<header>
				<p>Sie können maximal 10 Dateien hinzufügen.</p>
				<button class="anhang-button btn btn-success">Fertig</button>
				<button class="anhang-button btn btn-default">Abbrechen</button>
			</header>
			<div class="file-container">
				<div class="file-item">
					<button type="button" class="close tooltip-toggle"
						data-toggle="tooltip" title="Entfernen" data-placement="top">&times;</button>
					<img src="/main-web/resources/img/desktop.jpg" class="img-responsive"> <span>desktop.jpg</span>
				</div>
				<div class="file-item">
					<button type="button" class="close" data-toggle="tooltip"
						title="Entfernen" data-dismiss="modal" data-placement="left"
						aria-hidden="true">&times;</button>
					<img src="/main-web/resources/img/doc.png" class="img-responsive"> <span>desktop.doc</span>
				</div>
				<div class="file-item">
					<button type="button" class="close tooltip-toggle"
						data-toggle="tooltip" title="Entfernen" data-placement="top">&times;</button>
					<img src="/main-web/resources/img/desktop.jpg" class="img-responsive"> <span>desktop.jpg</span>
				</div>
				<div class="file-item">
					<button type="button" class="close tooltip-toggle"
						data-toggle="tooltip" title="Entfernen" data-placement="top">&times;</button>
					<img src="/main-web/resources/img/desktop.jpg" class="img-responsive"> <span>desktop.jpg</span>
				</div>
				<div class="file-item">
					<button type="button" class="close tooltip-toggle"
						data-toggle="tooltip" title="Entfernen" data-placement="top">&times;</button>
					<img src="/main-web/resources/img/desktop.jpg" class="img-responsive"> <span>desktop.jpg</span>
				</div>
				<div class="file-item">
					<button type="button" class="close tooltip-toggle"
						data-toggle="tooltip" title="Entfernen" data-placement="top">&times;</button>
					<img src="/main-web/resources/img/desktop.jpg" class="img-responsive"> <span>desktop.jpg</span>
				</div>
				<div class="file-item">
					<button type="button" class="close tooltip-toggle"
						data-toggle="tooltip" title="Entfernen" data-placement="top">&times;</button>
					<img src="/main-web/resources/img/desktop.jpg" class="img-responsive"> <span>desktop.jpg</span>
				</div>
				<div class="add-new-file">
					<i class="icon-plus"></i> <span>Hinzufügen</span>
				</div>
			</div>
		</div>
	</section>




	<section class="instruction-videos hide" id="Instructions">
		<button type="button"
			class="close introduction-video-button tooltip-toggle"
			aria-hidden="true" data-toggle="tooltip" title="Schließen"
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
						data-toggle="tooltip" title="Zurück" data-placement="top">
							<img src="/main-web/resources/img/arrow-left-small.png" alt="zurück">
					</span>
					</a> <a class="right carousel-control" href="#carousel-instruction"
						data-slide="next"> <span class="icon-next tooltip-toggle"
						data-toggle="tooltip" title="Weiter" data-placement="top">
							<img src="/main-web/resources/img/arrow-right-small.png" alt="vor">
					</span>
					</a>
				</div>
			</div>


			<div
				class="col-lg-6 col-xs-6 col-lg-offset-1 col-xs-offset-1 main-video">
				<div class="thumbnail">
					<img src="http://placehold.it/700x325" alt="">
					<h5>Nachricht schreiben</h5>
					<p>Morbi leo risus, porta ac consectetur ac, vestibulum at
						eros.</p>
				</div>
			</div>
		</div>
	</section>

	



	<div class="modal fade" id="Unterhaltung-verlassen" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close  tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
						data-dismiss="modal" aria-hidden="true" data-placement="left">&times;</button>
					<h4 class="modal-title">Unterhaltung verlassen</h4>
				</div>
				<div class="modal-body">Duis mollis, est non commodo luctus,
					nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras
					justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur
					blandit tempus porttitor. Donec id elit non mi porta gravida at
					eget metus.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
					<button class="btn btn-success" type="submit">Unterhaltung
						verlassen</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



	<div class="modal fade" id="Unterhaltung-loeschen" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close  tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
						data-dismiss="modal" aria-hidden="true" data-placement="left">&times;</button>
					<h4 class="modal-title">Unterhaltung löschen</h4>
				</div>
				<div class="modal-body">Duis mollis, est non commodo luctus,
					nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras
					justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur
					blandit tempus porttitor. Donec id elit non mi porta gravida at
					eget metus.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
					<button class="btn btn-success" type="submit">Unterhaltung
						löschen</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->







	<div class="modal fade kontakte-modal" id="Kontakte" tabindex="-1"
		role="dialog" aria-labelledby="Kontakte" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
						data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Personen hinzufügen</h4>
				</div>
				<div class="modal-description">
					<p>Nullam quis risus eget urna mollis ornare vel eu leo. Donec
						ullamcorper nulla non metus auctor fringilla. Vivamus sagittis
						lacus vel augue laoreet rutrum.
				</div>
				<div class="modal-body">
					<div class="kontakt-kategorie">
						<ul>
							<li><a href="#" class="active"><img
									src="/main-web/resources/img/account-icons/address-book.png"> Alle</a></li>
							<li><a href="#"><img
									src="/main-web/resources/img/account-icons/address-book.png"> Lehrer</a></li>
							<li><a href="#"><img
									src="/main-web/resources/img/account-icons/address-book.png"> Eltern</a></li>
							<li><a href="#"><img
									src="/main-web/resources/img/account-icons/address-book.png"> Sonstige</a></li>
						</ul>
					</div>
					<div class="kontakt-namen-wrapper">
						<div class="kontakt-suchen">
							<label>Suchen</label> <input type="text">
						</div>
						<div class="kontakt-namen">
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
							<section class="kontakt-item">
								<img src="/main-web/resources/img/avatar-big.png"> Mustermann Franz
								<button type="button" class="btn btn-primary">Hinzufügen</button>
							</section>
						</div>
					</div>
					<aside class="kontakt-alphabet">
						<ul>
							<li><a href="#A">A</a></li>
							<li><a href="#B">B</a></li>
							<li><a href="#C">C</a></li>
							<li><a href="#D">D</a></li>
							<li><a href="#E">E</a></li>
							<li><a href="#F">F</a></li>
							<li><a href="#G">G</a></li>
							<li><a href="#H">H</a></li>
							<li><a href="#I">I</a></li>
							<li><a href="#J">J</a></li>
							<li><a href="#K">K</a></li>
							<li><a href="#L">L</a></li>
							<li><a href="#M">M</a></li>
							<li><a href="#N">N</a></li>
							<li><a href="#O">O</a></li>
							<li><a href="#P">P</a></li>
							<li><a href="#Q">Q</a></li>
							<li><a href="#R">R</a></li>
							<li><a href="#S">S</a></li>
							<li><a href="#T">T</a></li>
							<li><a href="#U">U</a></li>
							<li><a href="#V">V</a></li>
							<li><a href="#W">W</a></li>
							<li><a href="#X">X</a></li>
							<li><a href="#Y">Y</a></li>
							<li><a href="#Z">Z</a></li>
						</ul>
					</aside>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
					<button type="button" class="btn btn-success">Fertig</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<div class="modal fade" id="Senden" tabindex="-1" role="dialog"
		aria-labelledby="Senden" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
						data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Nachricht senden</h4>
				</div>
				<div class="modal-body">
					<p>Sie haben das Hinzufügen von Dateien noch nicht
						abgeschlossen. Wollen Sie diese Nachricht mit den Dateien trotzdem
						senden?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
					<button type="button" class="btn btn-success">Senden</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<div class="modal fade" id="Nutzungsbedingungen" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
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
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
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
						aria-hidden="true" data-toggle="tooltip" title="Schließen"
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





	<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
	<script src="/main-web/resources/js/vendor/bootstrap.min.js"></script>
	<script src="/main-web/resources/js/neu-2013.min.js"></script>
</body>
</html>
