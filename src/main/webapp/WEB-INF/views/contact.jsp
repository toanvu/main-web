<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="de"> <!--<![endif]-->
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Kontakte  | Edunet24.de</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=1280">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


        <link rel="stylesheet" href="resources/css/bootstrap.css">
        <link rel="stylesheet" href="resources/css/screen.css">
        <link rel="stylesheet" href="resources/css/edunet.css">
        <script src="resources/js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="resources/js/edunet.js"></script>
        
    </head>
    <body>

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
		  			<li class="nav-button">
		  				<a href="neue-gruppennachricht.html"><img src="resources/img/account-icons/edit.png"> Gruppennachricht schreiben</a>
		  			</li>
					<li><a href="./"><img src="resources/img/account-icons/home16.png"> Startseite</a></li>
					<li class="active"><a href="contact"><img src="resources/img/account-icons/user-plus.png"> Neue Kontakte</a></li>
				    <li><a href="neue-nachrichten.html"><img src="resources/img/account-icons/mail.png"> Nachrichten</a></li>
				    <li><a href="contactlist"><img src="resources/img/account-icons/address-book.png"> Adressbuch</a></li>
				    <li><a href="kalender.html"><img src="resources/img/account-icons/calendar16.png"> Kalender</a></li>
				    <li><a href="setting"><img src="resources/img/account-icons/wrench-screwdriver.png"> Einstellungen</a></li>
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

	  	<section class="main-content new-contacts-wrapper calc-width">
	  		<header class="section-header">
	  			<h3>Neue Kontakte hinzufügen</h3>
	  		</header>
	  		<ul class="nav nav-tabs contact-tabs" id="contact-tab">
			  <li class="active">
			  	<a href="#Alle" onclick="resetCssClass()"><img src="resources/img/account-icons/address-book.png"> Alle</a>
			  </li>
			  <li><a href="#Lehrer" onclick="resetCssClass()"><img src="resources/img/account-icons/address-book.png"> Lehrer</a></li>
			  <li><a href="#Eltern" onclick="resetCssClass()"><img src="resources/img/account-icons/address-book.png"> Eltern</a></li>
			  <li><a href="#Sonstige" onclick="resetCssClass()"><img src="resources/img/account-icons/address-book.png"> Sonstige</a></li>
			</ul>

			<div class="tab-content new-contacts wrapper-2">
			  <div class="tab-pane active" id="Alle">
				  <header class="new-contacts-header">
					<form class="form-inline" action="/main-web/contactSearchUser" method="POST">
					  <div class="form-group">
					    <label for="inputSearch" class="col-lg-2 col-xs-2">Nachname</label>
					    <div class="col-lg-4 col-xs-4">
					    <input type="text" class="form-control" name="slastname">
					    </div>
					    <label for="inputSearch" class="col-lg-2 col-xs-2">Vorname</label>
					    <div class="col-lg-4 col-xs-4">
					    <input type="text" class="form-control" name="sfirstname">
					    </div>
					  </div>
					  <button type="submit" class="btn btn-default">Suchen</button>
					</form>
				  </header>
				  <div class="table-header">
					  <table class="table table-condensed">
					        <thead>
					          <tr>
					            <th width="87px"></th>
					            <th width="120px">Nachname</th>
					            <th width="120px">Vorname</th>
					            <th width="100px">Status</th>
					            <th></th>
					          </tr>
					        </thead>
					  </table>
				  </div>
				  <div class="new-contacts-list wrapper-3">
					<table class="table table-condensed">
				        <tbody>
				        <c:forEach items="${allUsers}" var="user">
								<tr class="userList${user.getLastname().toUpperCase().charAt(0)}" >
									<td width="87px"><img src="resources/img/avatar-small.png"></td>
									<td width="120px">${user.getLastname()}</td>
									<td width="120px">${user.getFirstname()}</td>
									<c:choose>
										<c:when test="${user.getUsertype() == 'other'}">
											<td width="100px">Sonstige</td>
										</c:when>
										<c:when test="${user.getUsertype() == 'teacher'}">
											<td width="100px">Lehrer</td>
										</c:when>
										<c:otherwise>
											<td width="100px">Eltern</td>
										</c:otherwise>
									</c:choose>
									<td>
									<c:choose>
										<c:when test="${listContactUsers.contains(user)}">
											<span class="btn btn-default">Kontakt ist im Adressbuch</span>
										</c:when>
										<c:when test="${listCReUserResponse.contains(user)}">
											<span class="btn btn-success">Anfrage gesendet</span>
										</c:when>
										<c:when test="${listCReUserRequest.contains(user)}">
<!-- 											<input type="hidden" name="actionValue" value="" /> -->
<!-- 											<input type="hidden" name="page" value="contact" /> -->
											<a class="btn btn-primary" style="width:98px;!important"
												href="/main-web/contactlist/replycrequest?userRequestId=${user.getId()}&actionValue=accept&page=contact">Bestätigen</a>
											<a class="btn btn-default" style="width:98px;!important"
												href="/main-web/contactlist/replycrequest?userRequestId=${user.getId()}&actionValue=reject&page=contact">Ablehnen</a>
										</c:when>
										<c:otherwise>
											<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#add-Kontakt" onclick="addContact('${user.getFullName()}', '${user.getId()}')">Kontakt hinzufügen</button>
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
						</c:forEach>
				        </tbody>
				      </table>
				  </div>

			  </div>
			  <div class="tab-pane" id="Lehrer">
				  <header class="new-contacts-header">
					<form class="form-inline" role="form">
					  <div class="form-group">
					    <label for="inputSearch" class="col-lg-2 col-xs-2">Suchen</label>
					    <div class="col-lg-10 col-xs-10">
					    <input type="text" class="form-control" id="inputSearch">
					    </div>
					  </div>
					  <button type="submit" class="btn btn-default">Suchen</button>
					</form>
				  </header>
				  <div class="table-header">
					  <table class="table table-condensed">
					        <thead>
					          <tr>
					            <th width="87px"></th>
					            <th width="120px">Nachname</th>
					            <th width="120px">Vorname</th>
					            <th width="100px">Status</th>
					            <th></th>
					          </tr>
					        </thead>
					  </table>
				  </div>
				  <div class="new-contacts-list wrapper-3">
					<table class="table table-condensed">
				        <tbody>
				          <c:forEach items="${allUsers}" var="user">
								<c:choose>
								<c:when test="${user.getUsertype() == 'teacher'}">
								<tr class="userList${user.getLastname().toUpperCase().charAt(0)}" >
									<td width="87px"><img src="resources/img/avatar-small.png"></td>
									<td width="120px">${user.getLastname()}</td>
									<td width="120px">${user.getFirstname()}</td>
									<td width="100px">Lehrer</td>
									<td>
									<c:choose>
										<c:when test="${listContactUsers.contains(user)}">
											<span class="btn btn-default">Kontakt ist im Adressbuch</span>
										</c:when>
										<c:when test="${listCRequestUsers.contains(user)}">
											<span class="btn btn-success">Anfrage gesendet</span>
										</c:when>
										<c:otherwise>
											<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#add-Kontakt" onclick="addContact('${user.getFullName()}', '${user.getId()}')">Kontakt hinzufügen</button>
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								</c:when>
								</c:choose>
						</c:forEach>
				        </tbody>
				      </table>
				  </div>


			  </div>
			  <div class="tab-pane" id="Eltern">
				  <header class="new-contacts-header">
					<form class="form-inline" role="form">
					  <div class="form-group">
					    <label for="inputSearch" class="col-lg-2 col-xs-2">Suchen</label>
					    <div class="col-lg-10 col-xs-10">
					    <input type="text" class="form-control" id="inputSearch">
					    </div>
					  </div>
					  <button type="submit" class="btn btn-default">Suchen</button>
					</form>
				  </header>
				  <div class="table-header">
					  <table class="table table-condensed">
					        <thead>
					          <tr>
					            <th width="87px"></th>
					            <th width="120px">Nachname</th>
					            <th width="120px">Vorname</th>
					            <th width="100px">Status</th>
					            <th></th>
					          </tr>
					        </thead>
					  </table>
				  </div>
				  <div class="new-contacts-list wrapper-3">
					<table class="table table-condensed">
				        <tbody>
				           <c:forEach items="${allUsers}" var="user">
								<c:choose>
									<c:when test="${user.getUsertype() == 'parent'}">
										<tr class="userList${user.getLastname().toUpperCase().charAt(0)}" >
											<td width="87px"><img src="resources/img/avatar-small.png"></td>
											<td width="120px">${user.getLastname()}</td>
											<td width="120px">${user.getFirstname()}</td>
											<td width="100px">Eltern</td>
											<td>
											<c:choose>
												<c:when test="${listContactUsers.contains(user)}">
													<span class="btn btn-default">Kontakt ist im Adressbuch</span>
												</c:when>
												<c:when test="${listCRequestUsers.contains(user)}">
													<span class="btn btn-success">Anfrage gesendet</span>
												</c:when>
												<c:otherwise>
													<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#add-Kontakt" onclick="addContact('${user.getFullName()}', '${user.getId()}')">Kontakt hinzufügen</button>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</c:when>
								</c:choose>
						</c:forEach>
				        </tbody>
				      </table>
				  </div>
			  </div>
			  <div class="tab-pane" id="Sonstige">
				  <header class="new-contacts-header">
					<form class="form-inline" role="form">
					  <div class="form-group">
					    <label for="inputSearch" class="col-lg-2 col-xs-2">Suchen</label>
					    <div class="col-lg-10 col-xs-10">
					    <input type="text" class="form-control" id="inputSearch">
					    </div>
					  </div>
					  <button type="submit" class="btn btn-default">Suchen</button>
					</form>
				  </header>
				  <div class="table-header">
					  <table class="table table-condensed">
					        <thead>
					          <tr>
					            <th width="87px"></th>
					            <th width="120px">Nachname</th>
					            <th width="120px">Vorname</th>
					            <th width="100px">Status</th>
					            <th></th>
					          </tr>
					        </thead>
					  </table>
				  </div>
				  <div class="new-contacts-list wrapper-3">
					<table class="table table-condensed">
				        <tbody>
				           <c:forEach items="${allUsers}" var="user">
								<c:choose>
									<c:when test="${user.getUsertype() == 'other'}">
										<tr class="userList${user.getLastname().toUpperCase().charAt(0)}" >
											<td width="87px"><img src="resources/img/avatar-small.png"></td>
											<td width="120px">${user.getLastname()}</td>
											<td width="120px">${user.getFirstname()}</td>
											<td width="100px">Sonstiges</td>
											<td>
											<c:choose>
												<c:when test="${listContactUsers.contains(user)}">
													<span class="btn btn-default">Kontakt ist im Adressbuch</span>
												</c:when>
												<c:when test="${listCRequestUsers.contains(user)}">
													<span class="btn btn-success">Anfrage gesendet</span>
												</c:when>
												<c:otherwise>
													<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#add-Kontakt" onclick="addContact('${user.getFullName()}', '${user.getId()}')">Kontakt hinzufügen</button>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</c:when>
								</c:choose>
						</c:forEach>
				        </tbody>
				      </table>
				  </div>
			  </div>
			</div>

			<aside class="kontakt-hinzufuegen-alphabet">
	         	<ul>
		         	<li><a href="#A" onclick="displayUserList('A')">A</a></li>
		         	<li><a href="#B" onclick="displayUserList('B')">B</a></li>
		         	<li><a href="#C" onclick="displayUserList('C')">C</a></li>
		         	<li><a href="#D" onclick="displayUserList('D')">D</a></li>
		         	<li><a href="#E" onclick="displayUserList('E')">E</a></li>
		         	<li><a href="#F" onclick="displayUserList('F')">F</a></li>
		         	<li><a href="#G" onclick="displayUserList('G')">G</a></li>
		         	<li><a href="#H" onclick="displayUserList('H')">H</a></li>
		         	<li><a href="#I" onclick="displayUserList('I')">I</a></li>
		         	<li><a href="#J" onclick="displayUserList('J')">J</a></li>
		         	<li><a href="#K" onclick="displayUserList('K')">K</a></li>
		         	<li><a href="#L" onclick="displayUserList('L')">L</a></li>
		         	<li><a href="#M" onclick="displayUserList('M')">M</a></li>
		         	<li><a href="#N" onclick="displayUserList('N')">N</a></li>
		         	<li><a href="#O" onclick="displayUserList('O')">O</a></li>
		         	<li><a href="#P" onclick="displayUserList('P')">P</a></li>
		         	<li><a href="#Q" onclick="displayUserList('Q')">Q</a></li>
		         	<li><a href="#R" onclick="displayUserList('R')">R</a></li>
		         	<li><a href="#S" onclick="displayUserList('S')">S</a></li>
		         	<li><a href="#T" onclick="displayUserList('T')">T</a></li>
		         	<li><a href="#U" onclick="displayUserList('U')">U</a></li>
		         	<li><a href="#V" onclick="displayUserList('V')">V</a></li>
		         	<li><a href="#W" onclick="displayUserList('W')">W</a></li>
		         	<li><a href="#X" onclick="displayUserList('X')">X</a></li>
		         	<li><a href="#Y" onclick="displayUserList('Y')">Y</a></li>
		         	<li><a href="#Z" onclick="displayUserList('Z')">Z</a></li>
	         	</ul>
         	</aside>

		  	<footer class="meta-footer shadow-footer calc-width">
		  		<span>&copy 2013 Edunet24.de</span>
		  		<ul class="pull-right">
			  		<li><a data-toggle="modal" href="#Nutzungsbedingungen">Nutzungsbedingungen </a></li>
			  		<li><a data-toggle="modal" href="#Datenschutz">Datenschutz </a></li>
			  		<li><a data-toggle="modal" href="#Impressum">Impressum </a></li>
		  		</ul>
		  	</footer>
	  	</section>

    </div>

	<form:form action="/main-web/contactAddCrequest" method="POST">
	  <div class="modal fade" id="add-Kontakt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	        	<button type="button" class="close  tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" aria-hidden="true">&times;</button>
	          <h4 class="modal-title">Kontaktanfrage senden</h4>
	        </div>
	        <div class="modal-body">
	          <div class="row" style="margin-bottom: 20px;">
		          <div class="col-lg-1 col-xs-1">
			          <img src="resources/img/avatar-small.png">
		          </div>
		          <div class="col-lg-11 col-xs-11">
			          <h5 id="userResponseName"></h5>
		          </div>
	          </div>
	          <textarea name="requestMes" rows="4" class="form-control" placeholder="Nachricht eingeben"></textarea>
	          <input type="hidden" name="userResponseId" id="userResponseId"/>
	        </div>
	        <div class="modal-footer">
<!-- 			  <input type="submit" value="senden"/> -->
	          <button type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
	          <button type="submit" class="btn btn-success">Senden</button>
	        </div>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	  </div><!-- /.modal -->
	</form:form>


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
				    <span class="icon-prev tooltip-toggle" data-toggle="tooltip" title="Zurück" data-placement="top"></span>
				  </a>
				  <a class="right carousel-control" href="#carousel-instruction" data-slide="next">
				    <span class="icon-next tooltip-toggle" data-toggle="tooltip" title="Weiter" data-placement="top"></span>
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


  <div class="modal fade" id="Nutzungsbedingungen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close  tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" aria-hidden="true">&times;</button>
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
        	<button type="button" class="close  tooltip-toggle" aria-hidden="true"  data-toggle="tooltip" title="Schließen" data-dismiss="modal" aria-hidden="true">&times;</button>
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
	<script>window.jQuery || document.write('<script src="resources/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/neu-2013.min.js"></script>
	<script type="text/javascript">
	$('#contact-tab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show');
	});
	</script>
</body>
</html>
