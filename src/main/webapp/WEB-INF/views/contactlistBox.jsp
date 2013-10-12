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
<title>Kontakte | Edunet24.de</title>
<meta name="description" content="">
<meta name="viewport" content="width=1280">
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/screen.css">
<script src="resources/js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>

	<div class="wrapper">

		<section class="main-content calc-width">
			<header class="section-header">
				<h3>Kontakte</h3>
			</header>
			<ul class="nav nav-tabs contact-tabs" id="contact-tab">
				<li class="active"><a href="#Anfragen"> <img
						src="resources/img/account-icons/user-plus.png">
						Kontaktanfragen <span class="badge">${allCRequestsUserResponse.size()}</span>
				</a></li>
				<li><a href="#Lehrer"><img
						src="resources/img/account-icons/address-book.png"> Lehrer</a></li>
				<li><a href="#Eltern"><img
						src="resources/img/account-icons/address-book.png"> Eltern</a></li>
				<li><a href="#Sonstige"><img
						src="resources/img/account-icons/address-book.png"> Sonstige</a></li>
			</ul>

			<div class="tab-content contact-content">
				<div class="tab-pane active" id="Anfragen">

					<div class="new-contact-item">
						<c:choose>
							<c:when test="${allCRequestsUserResponse.size() > 0}">
								<c:forEach items="${allCRequestsUserResponse}" var="crequest">
									<div class="row">
										<div class="col-lg-1 col-xs-1">
											<img src="resources/img/avatar-big.png"
												class="img-responsive">
										</div>
										<div class="col-lg-4 col-xs-4">
											<h4>${crequest.getRequest().getFullName()}</h4>
											<c:choose>
												<c:when
													test="${crequest.getRequest().getUsertype() == 'other'}">
													<span>Sonstige</span>
												</c:when>
												<c:when
													test="${crequest.getRequest().getUsertype() == 'teacher'}">
													<span>Lehrer</span>
												</c:when>
												<c:otherwise>
													<span>Eltern</span>
												</c:otherwise>
											</c:choose>
										</div>

										<c:choose>
											<c:when test="${crequest.getStatus() == 'open'}">
												<input type="hidden" name="userRequestId"
													value="${crequest.getRequest().getId()}" />
												<!-- 												<input type="hidden" name="actionValue" value="" /> -->
												<!-- 												<input type="hidden" name="page" value="contactlist" /> -->
												<div class="col-lg-2 col-xs-2">
													<!-- 													<button class="btn btn-primary" type="submit">Annehmen</button> -->
													<a class="btn btn-primary"
														href="/main-web/contactlist/replycrequest?userRequestId=${crequest.getRequest().getId()}&actionValue=accept&page=contactlist">Best�tigen</a>
												</div>
												<div class="col-lg-2 col-xs-2">
													<a class="btn btn-default"
														href="/main-web/contactlist/replycrequest?userRequestId=${crequest.getRequest().getId()}&actionValue=reject&page=contactlist">Ablehnen</a>
													<!-- 													<button class="btn btn-default" type="submit">Ablehnen</button> -->
												</div>

											</c:when>
											<c:otherwise>
												<div class="col-lg-2 col-xs-2">${crequest.getStatus()}</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="row">
										<div class="col-lg-7 col-xs-7">
											<p>${crequest.getMessage()}</p>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="col-lg-4 col-xs-4">
									<h4>Es existiert keine Kontaktanfrage</h4>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="tab-pane" id="Lehrer">
					<div class="adress-book">
						<div class="contact-list-wrapper">
							<div class="contact-list wrapper-2">
								<div class="contact-item">
									<c:forEach items="${allContactUsers}" var="user">
										<c:choose>
											<c:when test="${user.getUsertype() == 'teacher'}">
												<div class="row">
													<div class="col-lg-2 col-xs-2">
														<img src="resources/img/avatar-big.png"
															class="img-responsive">
													</div>

													<div class="col-lg-4 col-xs-4">
														<span>${user.getFullName()}</span>
													</div>
													<div class="col-lg-4 col-xs-4">
														<button class="btn btn-default" type="submit">Nachricht
															schreiben</button>
													</div>
												</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
							<div class="write-all">
								<button class="btn btn-primary" type="submit">
									<img src="resources/img/account-icons/mail-pencil.png">
									Nachricht an alle Lehrer
								</button>
							</div>
						</div>
						<div class="kontakte-alphabet">
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
						</div>
						<div class="contact-details calc-width-2">
							<header>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-xs">Kontakt
										bearbeiten</button>
									<button type="button" class="btn btn-default btn-xs">Kontakt
										l�schen</button>
								</div>
							</header>
							<div class="row contact-name">
								<div class="col-lg-3 col-xs-3">
									<img src="resources/img/avatar-big.png">
								</div>
								<div class="col-lg-9 col-xs-9">
									<h2>Franz Mustermann</h2>
								</div>
							</div>
							<div class="row contact-mail">
								<div class="col-lg-3 col-xs-3">
									<strong>E-Mail</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<a href="#">mustermann@musterweb.de</a>
								</div>
							</div>
							<div class="row contact-phone">
								<div class="col-lg-3 col-xs-3">
									<strong>Telefon</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<a>012456 3458012</a>
								</div>
							</div>
							<div class="row contact-note">
								<div class="col-lg-3 col-xs-3">
									<strong>Notizen</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<span> Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Cras mattis consectetur purus sit amet
										fermentum. Sed posuere consectetur est at lobortis. Fusce
										dapibus, tellus ac cursus commodo, tortor mauris condimentum
										nibh, ut fermentum massa justo sit amet risus. </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="Eltern">
					<div class="adress-book">
						<div class="contact-list-wrapper">
							<div class="contact-list wrapper-2">
								<div class="contact-item">
									<c:forEach items="${allContactUsers}" var="user">
										<c:choose>
											<c:when test="${user.getUsertype() == 'parent'}">
												<div class="row">
													<div class="col-lg-2 col-xs-2">
														<img src="resources/img/avatar-big.png"
															class="img-responsive">
													</div>

													<div class="col-lg-4 col-xs-4">
														<span>${user.getFullName()}</span>
													</div>
													<div class="col-lg-4 col-xs-4">
														<button class="btn btn-default" type="submit">Nachricht
															schreiben</button>
													</div>
												</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
							<div class="write-all">
								<button class="btn btn-primary" type="submit">
									<img src="resources/img/account-icons/mail-pencil.png">
									Nachricht an alle Eltern
								</button>
							</div>
						</div>
						<div class="kontakte-alphabet">
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
						</div>
						<div class="contact-details calc-width-2">
							<header>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-xs">Kontakt
										bearbeiten</button>
									<button type="button" class="btn btn-default btn-xs">Kontakt
										l�schen</button>
								</div>
							</header>
							<div class="row contact-name">
								<div class="col-lg-3 col-xs-3">
									<img src="resources/img/avatar-big.png">
								</div>
								<div class="col-lg-9 col-xs-9">
									<h2>Franz Mustermann</h2>
								</div>
							</div>
							<div class="row contact-mail">
								<div class="col-lg-3 col-xs-3">
									<strong>E-Mail</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<a href="#">mustermann@musterweb.de</a>
								</div>
							</div>
							<div class="row contact-phone">
								<div class="col-lg-3 col-xs-3">
									<strong>Telefon</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<a>012456 3458012</a>
								</div>
							</div>
							<div class="row contact-note">
								<div class="col-lg-3 col-xs-3">
									<strong>Notizen</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<span> Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Cras mattis consectetur purus sit amet
										fermentum. Sed posuere consectetur est at lobortis. Fusce
										dapibus, tellus ac cursus commodo, tortor mauris condimentum
										nibh, ut fermentum massa justo sit amet risus. </span>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="tab-pane" id="Sonstige">
					<div class="adress-book">
						<div class="contact-list-wrapper">
							<div class="contact-list wrapper-2">
								<div class="contact-item">
									<c:forEach items="${allContactUsers}" var="user">
										<c:choose>
											<c:when test="${user.getUsertype() == 'other'}">
												<div class="row">
													<div class="col-lg-2 col-xs-2">
														<img src="resources/img/avatar-big.png"
															class="img-responsive">
													</div>

													<div class="col-lg-4 col-xs-4">
														<span>${user.getFullName()}</span>
													</div>
													<div class="col-lg-4 col-xs-4">
														<button class="btn btn-default" type="submit">Nachricht
															schreiben</button>
													</div>
												</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
							<div class="write-all">
								<button class="btn btn-primary" type="submit">
									<img src="resources/img/account-icons/mail-pencil.png">
									Nachricht an alle Sonstigen
								</button>
							</div>
						</div>
						<div class="kontakte-alphabet">
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
						</div>
						<div class="contact-details calc-width-2">
							<header>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-xs">Kontakt
										bearbeiten</button>
									<button type="button" class="btn btn-default btn-xs">Kontakt
										l�schen</button>
								</div>
							</header>
							<div class="row contact-name">
								<div class="col-lg-3 col-xs-3">
									<img src="resources/img/avatar-big.png">
								</div>
								<div class="col-lg-9 col-xs-9">
									<h2>Franz Mustermann</h2>
								</div>
							</div>
							<div class="row contact-mail">
								<div class="col-lg-3 col-xs-3">
									<strong>E-Mail</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<a href="#">mustermann@musterweb.de</a>
								</div>
							</div>
							<div class="row contact-phone">
								<div class="col-lg-3 col-xs-3">
									<strong>Telefon</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<a>012456 3458012</a>
								</div>
							</div>
							<div class="row contact-note">
								<div class="col-lg-3 col-xs-3">
									<strong>Notizen</strong>
								</div>
								<div class="col-lg-9 col-xs-9">
									<span> Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Cras mattis consectetur purus sit amet
										fermentum. Sed posuere consectetur est at lobortis. Fusce
										dapibus, tellus ac cursus commodo, tortor mauris condimentum
										nibh, ut fermentum massa justo sit amet risus. </span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<footer class="meta-footer calc-width">
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

	<div class="modal fade" id="Nutzungsbedingungen" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close  tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schlie�en"
						data-dismiss="modal" aria-hidden="true">&times;</button>
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
					<button type="button" class="close  tooltip-toggle"
						aria-hidden="true" data-toggle="tooltip" title="Schlie�en"
						data-dismiss="modal" aria-hidden="true">&times;</button>
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
						aria-hidden="true" data-toggle="tooltip" title="Schlie�en"
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
	<script>
		$('#contact-tab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
</body>
</html>