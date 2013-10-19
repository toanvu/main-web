<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="de"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Kalender  | Edunet24.de</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=1280">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


        <link rel="stylesheet" href="resources/css/bootstrap.css">
        <link rel="stylesheet" href="resources/css/screen.css">
        <link rel="stylesheet" href="resources/css/fullcalendar.css">
        <script src="resources/js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>

	<nav class="navbar navbar-default navbar-static-top" role="navigation" id="head-bar">
	  <a class="navbar-brand" href="#"><img src="resources/img/logo.png"></a>
	  <a href="#" class="btn btn-danger pull-right">Abmelden</a>
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
		  			<li class="nav-button">
		  				<a href="neue-gruppennachricht.html"><img src="resources/img/account-icons/edit.png"> Gruppennachricht schreiben</a>
		  			</li>
					<li><a href="index.html"><img src="resources/img/account-icons/home16.png"> Startseite</a></li>
					<li><a href="kontakte-hinzufuegen.html"><img src="resources/img/account-icons/user-plus.png"> Neue Kontakte</a></li>
				    <li><a href="neue-nachrichten.html"><img src="resources/img/account-icons/mail.png"> Nachrichten</a></li>
				    <li><a href="kontakte.html"><img src="resources/img/account-icons/address-book.png"> Adressbuch</a></li>
				    <li class="active"><a href="kalender.html"><img src="resources/img/account-icons/calendar16.png"> Kalender</a></li>
				    <li><a href="einstellungen.html"><img src="resources/img/account-icons/wrench-screwdriver.png"> Einstellungen</a></li>
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
				<a href="#" class="btn btn-success btn-large btn-block" id="anleitungsvideo-button">
					<i class="icon-facetime-video"></i>  Anleitungsvideo
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
						Lehrer
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-1">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-1-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-1-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-eltern">
					<div class="panel-heading">
						Eltern
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-2">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-2-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-2-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-sonstige">
					<div class="panel-heading">
						Sonstige
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-3">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-3-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-3-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-gruppen">
					<div class="panel-heading">
						Gruppen
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>
						<div class="tooltip fade left tooltip-extra-4">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner tooltip-extra-4-inner">Ausklappen</div>
							<div class="tooltip-inner tooltip-extra-4-inner hide">Zuklappen</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						</div>
					</div>
				</div>

	  		</div>

	  	</section>

	  	<section class="main-content calc-width calendar-content">
	  		<header class="section-header">
	  			<h3>Kalender</h3>
	  		</header>

	  		<div id="calendar" class="calc-width">
		  		<button type="submit" class="btn btn-primary add-event" data-toggle="modal" data-target="#add-Event">
		  			<i class="icon-plus"></i>    Termin erstellen</button>
	  		</div>

<!--

		  	<footer class="meta-footer calc-width">
		  		<span>&copy 2013 Edunet24.de</span>
		  		<ul class="pull-right">
			  		<li><a data-toggle="modal" href="#Nutzungsbedingungen">Nutzungsbedingungen </a></li>
			  		<li><a data-toggle="modal" href="#Datenschutz">Datenschutz </a></li>
			  		<li><a data-toggle="modal" href="#Impressum">Impressum </a></li>
		  		</ul>
		  	</footer>
-->
	  	</section>

    </div>



	<section class="instruction-videos hide" id="Instructions">
		<button type="button" class="close introduction-video-button tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-placement="left">&times;</button>
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
				  <a class="left carousel-control" href="#carousel-instruction" data-slide="prev">
				    <span class="icon-prev tooltip-toggle" data-toggle="tooltip" title="Zurück" data-placement="top">
				     <img src="resources/img/arrow-left-small.png" alt="zurück"></span>
				  </a>
				  <a class="right carousel-control" href="#carousel-instruction" data-slide="next">
				    <span class="icon-next tooltip-toggle" data-toggle="tooltip" title="Weiter" data-placement="top">
				    <img src="resources/img/arrow-right-small.png" alt="vor"></span>
				  </a>
				</div>
			</div>


			<div class="col-lg-6 col-xs-6 col-lg-offset-1 col-xs-offset-1 main-video">
				<div class="thumbnail">
						<img src="http://placehold.it/700x325" alt="">
						<h5>Nachricht schreiben</h5>
						<p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. </p>
					</div>
			</div>
		</div>
	</section>

  <div class="modal fade" id="add-Event" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close  tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" aria-hidden="true" data-placement="left">&times;</button>
          <h4 class="modal-title">Neuen Termin erstellen</h4>
        </div>
        <form class="form-horizontal" action="calendar" method="POST">
        <div class="modal-body">
			  <div class="form-group">
			    <label for="inputEmail1" class="col-lg-2 col-xs-2 control-label">Datum</label>
			    <div class="col-lg-6 col-xs-6">
			      <input type="date" class="form-control" id="inputEmail1" name="date">
			    </div>
			  </div>
			  <textarea class="form-control" rows="4" placeholder="Termin eingeben" name="title"></textarea>
			
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
        	<button type="submit" class="btn btn-success">Erstellen</button>
        </div>
        </form>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->



  <div class="modal fade" id="Nutzungsbedingungen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Nutzungsbedingungen</h4>
        </div>
        <div class="modal-body">
          Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur blandit tempus porttitor. Donec id elit non mi porta gravida at eget metus. </br> </br>


Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus. </br> </br>



Donec id elit non mi porta gravida at eget metus. Curabitur blandit tempus porttitor. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. </br> </br>


        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

    <div class="modal fade" id="Datenschutz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Datenschutz</h4>
        </div>
        <div class="modal-body">
          Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur blandit tempus porttitor. Donec id elit non mi porta gravida at eget metus. </br> </br>


Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus. </br> </br>



Donec id elit non mi porta gravida at eget metus. Curabitur blandit tempus porttitor. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. </br> </br>


        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


    <div class="modal fade" id="Impressum" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" data-placement="left" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Impressum</h4>
        </div>
        <div class="modal-body">
          Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Curabitur blandit tempus porttitor. Donec id elit non mi porta gravida at eget metus. </br> </br>


Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus. </br> </br>



Donec id elit non mi porta gravida at eget metus. Curabitur blandit tempus porttitor. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. </br> </br>


        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->



	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/neu-2013.min.js"></script>
	<script src="resources/js/vendor/fullcalendar.min.js"></script>
	<script src="resources/js/calender.js"></script>
</body>
</html>
