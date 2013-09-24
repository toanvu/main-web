<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="de"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Neue Nachrichten  | Edunet24.de</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=1280">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


        <link rel="stylesheet" href="/main-web/resources/css/bootstrap.css">
        <link rel="stylesheet" href="/main-web/resources/css/screen.css">
        <script src="/main-web/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="/main-web/resources/js/vendor/jquery-1.10.2.min.js"></script>
        <script src="/main-web/resources/js/jquery.url.js"></script>
        <script src="/main-web/resources/js/jQuery.atmosphere.js"></script>
        <script src="/main-web/resources/js/edunet-ws.js"></script>        
    </head>
    <body>
	
		<!--  websocket test -->

	<input type="button" value="POST to server..." onclick="post()" />

	<div class="controlPanel">
		<div id="cp-1" class="cpitem">
			<img src="/main-web/resources/img/logo.png" />
		</div>
	</div>
	
	<!--  edunet context -->
        <style>
        	.edunet-context{ display: none;}
        </style>
        <div id="edunet-context-userId" class="edunet-context">${currentUser.getId()}</div>
        <div id="edunet-context-currentGroupId" class="edunet-context">${currentGroupId)}</div>
        <div id="edunet-context-toChannels" class="edunet-context"></div>
        <!--  edunet context --> 

	<script src="/main-web/resources/js/jquery-1.6.4.min.js" type="text/javascript"></script>
	<script src="/main-web/resources/js/edunet-ws.js" type="text/javascript"></script>


	<!--  websocket test -->

	<nav class="navbar navbar-default navbar-static-top" role="navigation" id="head-bar">
	  <a class="navbar-brand" href="#"><img src="/main-web/resources/img/logo.png"></a>
	  <a href="#" class="btn btn-danger pull-right">Abmelden</a>
  	</nav>

  	<div class="wrapper">

	<section class="meine-funktionen">
	  		<header class="section-header">
	  			<h3>Meine Funktionen</h3>
	  		</header>
	  		<nav class="hauptmenu">
	  			<ul class="nav nav-pills nav-stacked">
		  			<li class="nav-button">
		  				<a href="neue-gruppennachricht.html"><img src="/main-web/resources/img/account-icons/edit.png"> Gruppennachricht schreiben</a>
		  			</li>
					<li class="active">
						<a href="index.html"><img src="/main-web/resources/img/account-icons/home16.png"> Startseite</a>
					</li>
				    <li><a href="#"><img src="/main-web/resources/img/account-icons/mail.png"> Nachrichten</a></li>
				    <li><a href="#"><img src="/main-web/resources/img/account-icons/address-book.png"> Kontakte</a></li>
				    <li><a href="#"><img src="/main-web/resources/img/account-icons/user-plus.png"> Kontakt hinzufügen</a></li>
				    <li><a href="#"><img src="/main-web/resources/img/account-icons/calendar16.png"> Kalender</a></li>
				    <li><a href="#"><img src="/main-web/resources/img/account-icons/wrench-screwdriver.png"> Einstellungen</a></li>
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
				<a href="#" class="btn btn-warning btn-large btn-block" id="anleitungsvideo-button">Anleitungsvideo</a>
			</div>
	  	</section>


	  	<section class="alle-unterhaltungen">
	  		<header class="section-header">
	  			<h3>Alle Unterhaltungen</h3>
	  		</header>
	  		<div class="nachrichten-wrapper">
		  		<div class="panel panel-default panel-lehrer" id="message_group_teacher">
					<div class="panel-heading">
						Lehrer
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>

					</div>
					<div class="panel-body">
						<div class="list-group">
						  <c:forEach items="${teacherGroup}" var="group">
						 	<a href="/main-web/chat/show?groupId=${group.getId()}&userId=${currentUser.getId()}" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png">							  	 
							  	 <c:if test="${group.getMessengers().get(0).getId() == currentUser.getId()}">
							  	 		${group.getMessengers().get(1).getUsername()}
							  	 </c:if>
							  	 <c:if test="${group.getMessengers().get(0).getId() != currentUser.getId()}">
							  	 		${group.getMessengers().get(0).getUsername()}
							  	 </c:if>
							  <span class="badge">2</span>
						  </a>
						 </c:forEach>	
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-eltern" id="message_group_parent">
					<div class="panel-heading">
						Eltern
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						</div>
					</div>
				</div>

				<div class="panel panel-default panel-sonstige" id="message_group_other">
					<div class="panel-heading">
						Sonstige
						<a class="pull-right toggle-height-button">
							<span class="caret"></span>
						</a>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
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
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="#" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">2</span>
						  </a>
						  <a href="#" class="list-group-item new-message-received">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann <span class="badge">1</span>
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						  <a href="#" class="list-group-item">
							  <img src="/main-web/resources/img/account-icons/mail.png"> Franz Mustermann
						  </a>
						</div>
					</div>
				</div>

	  		</div>

	  	</section>

	  	<section class="main-content neue-nachrichten">
	  		<header class="nachrichten-header">
	  			<h3>Nachrichten</h3>
	  			<div class="btn-group pull-right">
	  			  <button type="button" class="btn">Person hinzufügen</button>
				  <button type="button" class="btn">Nachricht Einstellungen</button>
				  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" role="menu">
				    <li><a href="#">Unterhaltung verlassen</a></li>
				    <li><a href="#">Unterhaltung löschen</a></li>
				  </ul>
				</div>
	  		</header>

	  		<div class="content">
	  			<c:forEach items="${chatContent}" var="message">
					<div class="message-item">
			  			<div class="row">
				  			<div class="col-lg-1 col-xs-1">
				  				<img src="/main-web/resources/img/avatar-big.png" class="img-responsive">
				  			</div>
				  			<div class="col-lg-11 col-xs-11">
				  				<header class="message-header">
					  				<h3>${message.getOwner().getUsername()}</h3>
					  				<ul class="pull-right">
						  				<li><a href="#"><img src="/main-web/resources/img/account-icons/translate16.png"> Nachricht übersetzen</a></li>
						  				<li><a href="#"><img src="/main-web/resources/img/account-icons/mail-forward.png"> Weiterleiten</a></li>
						  				<li><a href="#"><img src="/main-web/resources/img/account-icons/bin.png"> Löschen</a></li>
					  				</ul>
				  				</header>
				  				<div class="message-body">
					  				<p>${message.getText()}</p>
				  				</div>
				  			</div>
			  			</div>
			  		</div>
				</c:forEach>	
	  		
	  		
		  		


		  		

		  	<footer class="message-write-footer">
			  	<div class="message-toolbar">
			  		<ul class="pull-left">
			  			<li><a href="#"><img src="/main-web/resources/img/account-icons/paper-plane.png"> Senden</a></li>
			  			<li><a href="#"><img src="/main-web/resources/img/account-icons/attachment16.png"> Anhang</a></li>
			  		</ul>
			  		<ul class="pull-right">
			  			<li><a href="#"><img src="/main-web/resources/img/account-icons/translate16.png"> Senden</a></li>
			  			<li><a href="#"><img src="/main-web/resources/img/account-icons/keyboard16.png"> Tastatur</a></li>
			  		</ul>
			  	</div>

			  	<div  class="message-write-area">
				  	<textarea placeholder=""></textarea>
			  	</div>
		  	</footer>
		  	<footer class="meta-footer">
		  		<span>&copy 2013 Edunet24.de</span>
		  		<ul class="pull-right">
			  		<li><a data-toggle="modal" href="#Nutzungsbedingungen">Nutzungsbedingungen </a></li>
			  		<li><a data-toggle="modal" href="#Datenschutz">Datenschutz </a></li>
			  		<li><a data-toggle="modal" href="#Impressum">Impressum </a></li>
		  		</ul>
		  	</footer>
	  	</section>

    </div>






  <div class="modal fade" id="Nutzungsbedingungen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
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
	<script>window.jQuery || document.write('<script src="/main-web/resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
	<script src="/main-web/resources/js/vendor/bootstrap.min.js"></script>
	<script src="/main-web/resources/js/neu-2013.min.js"></script>
</body>
</html>
