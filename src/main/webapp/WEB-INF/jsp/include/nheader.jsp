<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<header id="page-topbar">
	<div class="layout-width">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box horizontal-logo">
					<a href="index.html" class="logo logo-dark"> <span
						class="logo-sm"> <img
							src="/themes/creative/assets/images/logo-sm.png" alt=""
							height="22">
					</span> <span class="logo-lg"> <img
							src="/themes/creative/assets/images/logo-dark.png" alt=""
							height="17">
					</span>
					</a> <a href="index.html" class="logo logo-light"> <span
						class="logo-sm"> <img
							src="/themes/creative/assets/images/logo-sm.png" alt=""
							height="22">
					</span> <span class="logo-lg"> <img
							src="/themes/creative/assets/images/logo-light.png" alt=""
							height="17">
					</span>
					</a>
				</div>

				<button type="button"
					class="btn btn-sm px-3 fs-16 header-item vertical-menu-btn topnav-hamburger"
					id="topnav-hamburger-icon">
					<span class="hamburger-icon"> <span></span> <span></span> <span></span>
					</span>
				</button>

				<!-- App Search-->
				<form class="app-search d-none d-md-block">
					<div class="position-relative">
						<input type="text" class="form-control" placeholder="Search..."
							autocomplete="off" id="search-options" value=""> <span
							class="mdi mdi-magnify search-widget-icon"></span> <span
							class="mdi mdi-close-circle search-widget-icon search-widget-icon-close d-none"
							id="search-close-options"></span>
					</div>
					<div class="dropdown-menu dropdown-menu-lg" id="search-dropdown">
						<div data-simplebar style="max-height: 320px;">
							<!-- item-->
							<div class="dropdown-header">
								<h6 class="text-overflow text-muted mb-0 text-uppercase">Recent
									Searches</h6>
							</div>

							<div class="dropdown-item bg-transparent text-wrap">
								<a href="index.html"
									class="btn btn-soft-secondary btn-sm btn-rounded">how to
									setup <i class="mdi mdi-magnify ms-1"></i>
								</a> <a href="index.html"
									class="btn btn-soft-secondary btn-sm btn-rounded">buttons <i
									class="mdi mdi-magnify ms-1"></i></a>
							</div>
							<!-- item-->
							<div class="dropdown-header mt-2">
								<h6 class="text-overflow text-muted mb-1 text-uppercase">Pages</h6>
							</div>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i
								class="ri-bubble-chart-line align-middle fs-18 text-muted me-2"></i>
								<span>Analytics Dashboard</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="ri-lifebuoy-line align-middle fs-18 text-muted me-2"></i>
								<span>Help Center</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i
								class="ri-user-settings-line align-middle fs-18 text-muted me-2"></i>
								<span>My account settings</span>
							</a>

							<!-- item-->
							<div class="dropdown-header mt-2">
								<h6 class="text-overflow text-muted mb-2 text-uppercase">Members</h6>
							</div>

							<div class="notification-list">
								<!-- item -->
								<a href="javascript:void(0);"
									class="dropdown-item notify-item py-2">
									<div class="d-flex">
										<img src="/themes/creative/assets/images/users/avatar-2.jpg"
											class="me-3 rounded-circle avatar-xs" alt="user-pic">
										<div class="flex-1">
											<h6 class="m-0">Angela Bernier</h6>
											<span class="fs-11 mb-0 text-muted">Manager</span>
										</div>
									</div>
								</a>
								<!-- item -->
								<a href="javascript:void(0);"
									class="dropdown-item notify-item py-2">
									<div class="d-flex">
										<img src="/themes/creative/assets/images/users/avatar-3.jpg"
											class="me-3 rounded-circle avatar-xs" alt="user-pic">
										<div class="flex-1">
											<h6 class="m-0">David Grasso</h6>
											<span class="fs-11 mb-0 text-muted">Web Designer</span>
										</div>
									</div>
								</a>
								<!-- item -->
								<a href="javascript:void(0);"
									class="dropdown-item notify-item py-2">
									<div class="d-flex">
										<img src="/themes/creative/assets/images/users/avatar-5.jpg"
											class="me-3 rounded-circle avatar-xs" alt="user-pic">
										<div class="flex-1">
											<h6 class="m-0">Mike Bunch</h6>
											<span class="fs-11 mb-0 text-muted">React Developer</span>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="text-center pt-3 pb-1">
							<a href="pages-search-results.html"
								class="btn btn-primary btn-sm">View All Results <i
								class="ri-arrow-right-line ms-1"></i></a>
						</div>
					</div>
				</form>
			</div>

			<div class="d-flex align-items-center">

				<div class="dropdown d-md-none topbar-head-dropdown header-item">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
						id="page-header-search-dropdown" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="bx bx-search fs-22"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
						aria-labelledby="page-header-search-dropdown">
						<form class="p-3">
							<div class="form-group m-0">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search ..." aria-label="Recipient's username">
									<button class="btn btn-primary" type="submit">
										<i class="mdi mdi-magnify"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="dropdown ms-1 topbar-head-dropdown header-item">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<img id="header-lang-img"
							src="/themes/creative/assets/images/flags/us.svg"
							alt="Header Language" height="20" class="rounded">
					</button>
					<div class="dropdown-menu dropdown-menu-end">

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language py-2" data-lang="en"
							title="English"> <img
							src="/themes/creative/assets/images/flags/us.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">English</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="sp"
							title="Spanish"> <img
							src="/themes/creative/assets/images/flags/spain.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">Española</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="gr"
							title="German"> <img
							src="/themes/creative/assets/images/flags/germany.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">Deutsche</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="it"
							title="Italian"> <img
							src="/themes/creative/assets/images/flags/italy.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">Italiana</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="ru"
							title="Russian"> <img
							src="/themes/creative/assets/images/flags/russia.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">русский</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="ch"
							title="Chinese"> <img
							src="/themes/creative/assets/images/flags/china.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">中国人</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="fr"
							title="French"> <img
							src="/themes/creative/assets/images/flags/french.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">français</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);"
							class="dropdown-item notify-item language" data-lang="ar"
							title="Arabic"> <img
							src="/themes/creative/assets/images/flags/ae.svg"
							alt="user-image" class="me-2 rounded" height="18"> <span
							class="align-middle">Arabic</span>
						</a>
					</div>
				</div>

				<div class="dropdown topbar-head-dropdown ms-1 header-item">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<i class='bx bx-category-alt fs-22'></i>
					</button>
					<div class="dropdown-menu dropdown-menu-lg p-0 dropdown-menu-end">
						<div
							class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="m-0 fw-semibold fs-15">Web Apps</h6>
								</div>
								<div class="col-auto">
									<a href="#!" class="btn btn-sm btn-soft-info"> View All
										Apps <i class="ri-arrow-right-s-line align-middle"></i>
									</a>
								</div>
							</div>
						</div>

						<div class="p-2">
							<div class="row g-0">
								<div class="col">
									<a class="dropdown-icon-item" href="#!"> <img
										src="/themes/creative/assets/images/brands/github.png"
										alt="Github"> <span>GitHub</span>
									</a>
								</div>
								<div class="col">
									<a class="dropdown-icon-item" href="#!"> <img
										src="/themes/creative/assets/images/brands/bitbucket.png"
										alt="bitbucket"> <span>Bitbucket</span>
									</a>
								</div>
								<div class="col">
									<a class="dropdown-icon-item" href="#!"> <img
										src="/themes/creative/assets/images/brands/dribbble.png"
										alt="dribbble"> <span>Dribbble</span>
									</a>
								</div>
							</div>

							<div class="row g-0">
								<div class="col">
									<a class="dropdown-icon-item" href="#!"> <img
										src="/themes/creative/assets/images/brands/dropbox.png"
										alt="dropbox"> <span>Dropbox</span>
									</a>
								</div>
								<div class="col">
									<a class="dropdown-icon-item" href="#!"> <img
										src="/themes/creative/assets/images/brands/mail_chimp.png"
										alt="mail_chimp"> <span>Mail Chimp</span>
									</a>
								</div>
								<div class="col">
									<a class="dropdown-icon-item" href="#!"> <img
										src="/themes/creative/assets/images/brands/slack.png"
										alt="slack"> <span>Slack</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="dropdown topbar-head-dropdown ms-1 header-item">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
						id="page-header-cart-dropdown" data-bs-toggle="dropdown"
						data-bs-auto-close="outside" aria-haspopup="true"
						aria-expanded="false">
						<i class='bx bx-shopping-bag fs-22'></i> <span
							class="position-absolute topbar-badge cartitem-badge fs-10 translate-middle badge rounded-pill bg-info">5</span>
					</button>
					<div
						class="dropdown-menu dropdown-menu-xl dropdown-menu-end p-0 dropdown-menu-cart"
						aria-labelledby="page-header-cart-dropdown">
						<div
							class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="m-0 fs-16 fw-semibold">My Cart</h6>
								</div>
								<div class="col-auto">
									<span class="badge badge-soft-info fs-13"><span
										class="cartitem-badge">7</span> items</span>
								</div>
							</div>
						</div>
						<div data-simplebar style="max-height: 300px;">
							<div class="p-2">
								<div class="text-center empty-cart" id="empty-cart">
									<div class="avatar-md mx-auto my-3">
										<div
											class="avatar-title bg-soft-info text-info fs-36 rounded-circle">
											<i class='bx bx-cart'></i>
										</div>
									</div>
									<h5 class="mb-3">Your Cart is Empty!</h5>
									<a href="apps-ecommerce-products.html"
										class="btn btn-success w-md mb-3">Shop Now</a>
								</div>
								<div
									class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2">
									<div class="d-flex align-items-center">
										<img src="/themes/creative/assets/images/products/img-1.png"
											class="me-3 rounded-circle avatar-sm p-2 bg-light"
											alt="user-pic">
										<div class="flex-1">
											<h6 class="mt-0 mb-1 fs-14">
												<a href="apps-ecommerce-product-details.html"
													class="text-reset">Branded T-Shirts</a>
											</h6>
											<p class="mb-0 fs-12 text-muted">
												Quantity: <span>10 x $32</span>
											</p>
										</div>
										<div class="px-2">
											<h5 class="m-0 fw-normal">
												$<span class="cart-item-price">320</span>
											</h5>
										</div>
										<div class="ps-2">
											<button type="button"
												class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn">
												<i class="ri-close-fill fs-16"></i>
											</button>
										</div>
									</div>
								</div>

								<div
									class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2">
									<div class="d-flex align-items-center">
										<img src="/themes/creative/assets/images/products/img-2.png"
											class="me-3 rounded-circle avatar-sm p-2 bg-light"
											alt="user-pic">
										<div class="flex-1">
											<h6 class="mt-0 mb-1 fs-14">
												<a href="apps-ecommerce-product-details.html"
													class="text-reset">Bentwood Chair</a>
											</h6>
											<p class="mb-0 fs-12 text-muted">
												Quantity: <span>5 x $18</span>
											</p>
										</div>
										<div class="px-2">
											<h5 class="m-0 fw-normal">
												$<span class="cart-item-price">89</span>
											</h5>
										</div>
										<div class="ps-2">
											<button type="button"
												class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn">
												<i class="ri-close-fill fs-16"></i>
											</button>
										</div>
									</div>
								</div>

								<div
									class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2">
									<div class="d-flex align-items-center">
										<img src="/themes/creative/assets/images/products/img-3.png"
											class="me-3 rounded-circle avatar-sm p-2 bg-light"
											alt="user-pic">
										<div class="flex-1">
											<h6 class="mt-0 mb-1 fs-14">
												<a href="apps-ecommerce-product-details.html"
													class="text-reset"> Borosil Paper Cup</a>
											</h6>
											<p class="mb-0 fs-12 text-muted">
												Quantity: <span>3 x $250</span>
											</p>
										</div>
										<div class="px-2">
											<h5 class="m-0 fw-normal">
												$<span class="cart-item-price">750</span>
											</h5>
										</div>
										<div class="ps-2">
											<button type="button"
												class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn">
												<i class="ri-close-fill fs-16"></i>
											</button>
										</div>
									</div>
								</div>

								<div
									class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2">
									<div class="d-flex align-items-center">
										<img src="/themes/creative/assets/images/products/img-6.png"
											class="me-3 rounded-circle avatar-sm p-2 bg-light"
											alt="user-pic">
										<div class="flex-1">
											<h6 class="mt-0 mb-1 fs-14">
												<a href="apps-ecommerce-product-details.html"
													class="text-reset">Gray Styled T-Shirt</a>
											</h6>
											<p class="mb-0 fs-12 text-muted">
												Quantity: <span>1 x $1250</span>
											</p>
										</div>
										<div class="px-2">
											<h5 class="m-0 fw-normal">
												$ <span class="cart-item-price">1250</span>
											</h5>
										</div>
										<div class="ps-2">
											<button type="button"
												class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn">
												<i class="ri-close-fill fs-16"></i>
											</button>
										</div>
									</div>
								</div>

								<div
									class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2">
									<div class="d-flex align-items-center">
										<img src="/themes/creative/assets/images/products/img-5.png"
											class="me-3 rounded-circle avatar-sm p-2 bg-light"
											alt="user-pic">
										<div class="flex-1">
											<h6 class="mt-0 mb-1 fs-14">
												<a href="apps-ecommerce-product-details.html"
													class="text-reset">Stillbird Helmet</a>
											</h6>
											<p class="mb-0 fs-12 text-muted">
												Quantity: <span>2 x $495</span>
											</p>
										</div>
										<div class="px-2">
											<h5 class="m-0 fw-normal">
												$<span class="cart-item-price">990</span>
											</h5>
										</div>
										<div class="ps-2">
											<button type="button"
												class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn">
												<i class="ri-close-fill fs-16"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="p-3 border-bottom-0 border-start-0 border-end-0 border-dashed border"
							id="checkout-elem">
							<div
								class="d-flex justify-content-between align-items-center pb-3">
								<h5 class="m-0 text-muted">Total:</h5>
								<div class="px-2">
									<h5 class="m-0" id="cart-item-total">$1258.58</h5>
								</div>
							</div>

							<a href="apps-ecommerce-checkout.html"
								class="btn btn-success text-center w-100"> Checkout </a>
						</div>
					</div>
				</div>

				<div class="ms-1 header-item d-none d-sm-flex">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
						data-toggle="fullscreen">
						<i class='bx bx-fullscreen fs-22'></i>
					</button>
				</div>

				<div class="ms-1 header-item d-none d-sm-flex">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle light-dark-mode">
						<i class='bx bx-moon fs-22'></i>
					</button>
				</div>

				<div class="dropdown topbar-head-dropdown ms-1 header-item"
					id="notificationDropdown">
					<button type="button"
						class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
						id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
						data-bs-auto-close="outside" aria-haspopup="true"
						aria-expanded="false">
						<i class='bx bx-bell fs-22'></i> <span
							class="position-absolute topbar-badge fs-10 translate-middle badge rounded-pill bg-danger">3<span
							class="visually-hidden">unread messages</span></span>
					</button>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
						aria-labelledby="page-header-notifications-dropdown">

						<div class="dropdown-head bg-secondary bg-pattern rounded-top">
							<div class="p-3">
								<div class="row align-items-center">
									<div class="col">
										<h6 class="m-0 fs-16 fw-semibold text-white">
											Notifications</h6>
									</div>
									<div class="col-auto dropdown-tabs">
										<span class="badge badge-soft-light fs-13"> 4 New</span>
									</div>
								</div>
							</div>

							<div class="px-2 pt-2">
								<ul class="nav nav-tabs dropdown-tabs nav-tabs-custom"
									data-dropdown-tabs="true" id="notificationItemsTab"
									role="tablist">
									<li class="nav-item waves-effect waves-light"><a
										class="nav-link active" data-bs-toggle="tab"
										href="#all-noti-tab" role="tab" aria-selected="true"> All
											(4) </a></li>
									<li class="nav-item waves-effect waves-light"><a
										class="nav-link" data-bs-toggle="tab" href="#messages-tab"
										role="tab" aria-selected="false"> Messages </a></li>
									<li class="nav-item waves-effect waves-light"><a
										class="nav-link" data-bs-toggle="tab" href="#alerts-tab"
										role="tab" aria-selected="false"> Alerts </a></li>
								</ul>
							</div>

						</div>

						<div class="tab-content position-relative"
							id="notificationItemsTabContent">
							<div class="tab-pane fade show active py-2 ps-2"
								id="all-noti-tab" role="tabpanel">
								<div data-simplebar style="max-height: 300px;" class="pe-2">
									<div
										class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<div class="avatar-xs me-3">
												<span
													class="avatar-title bg-soft-info text-info rounded-circle fs-16">
													<i class="bx bx-badge-check"></i>
												</span>
											</div>
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-2 lh-base">
														Your <b>Elite</b> author Graphic Optimization <span
															class="text-secondary">reward</span> is ready!
													</h6>
												</a>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> Just 30
														sec ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="all-notification-check01"> <label
														class="form-check-label" for="all-notification-check01"></label>
												</div>
											</div>
										</div>
									</div>

									<div
										class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<img src="/themes/creative/assets/images/users/avatar-2.jpg"
												class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">Answered to your comment on the cash
														flow forecast's graph 🔔.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 48 min
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="all-notification-check02"> <label
														class="form-check-label" for="all-notification-check02"></label>
												</div>
											</div>
										</div>
									</div>

									<div
										class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<div class="avatar-xs me-3">
												<span
													class="avatar-title bg-soft-danger text-danger rounded-circle fs-16">
													<i class='bx bx-message-square-dots'></i>
												</span>
											</div>
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-2 fs-13 lh-base">
														You have received <b class="text-success">20</b> new
														messages in the conversation
													</h6>
												</a>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 2 hrs
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="all-notification-check03"> <label
														class="form-check-label" for="all-notification-check03"></label>
												</div>
											</div>
										</div>
									</div>

									<div
										class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<img src="/themes/creative/assets/images/users/avatar-8.jpg"
												class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Maureen Gibson</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">We talked about a project on linkedin.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 4 hrs
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="all-notification-check04"> <label
														class="form-check-label" for="all-notification-check04"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="my-3 text-center view-all">
										<button type="button"
											class="btn btn-soft-success waves-effect waves-light">
											View All Notifications <i
												class="ri-arrow-right-line align-middle"></i>
										</button>
									</div>
								</div>

							</div>

							<div class="tab-pane fade py-2 ps-2" id="messages-tab"
								role="tabpanel" aria-labelledby="messages-tab">
								<div data-simplebar style="max-height: 300px;" class="pe-2">
									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/themes/creative/assets/images/users/avatar-3.jpg"
												class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">James Lemire</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">We talked about a project on linkedin.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 30 min
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="messages-notification-check01"> <label
														class="form-check-label"
														for="messages-notification-check01"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/themes/creative/assets/images/users/avatar-2.jpg"
												class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">Answered to your comment on the cash
														flow forecast's graph 🔔.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 2 hrs
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="messages-notification-check02"> <label
														class="form-check-label"
														for="messages-notification-check02"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/themes/creative/assets/images/users/avatar-6.jpg"
												class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Kenneth Brown</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">Mentionned you in his comment on 📃
														invoice #12501.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 10 hrs
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="messages-notification-check03"> <label
														class="form-check-label"
														for="messages-notification-check03"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/themes/creative/assets/images/users/avatar-8.jpg"
												class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Maureen Gibson</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">We talked about a project on linkedin.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 3 days
														ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value=""
														id="messages-notification-check04"> <label
														class="form-check-label"
														for="messages-notification-check04"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="my-3 text-center view-all">
										<button type="button"
											class="btn btn-soft-success waves-effect waves-light">
											View All Messages <i class="ri-arrow-right-line align-middle"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="tab-pane fade p-4" id="alerts-tab" role="tabpanel"
								aria-labelledby="alerts-tab"></div>

							<div class="notification-actions" id="notification-actions">
								<div class="d-flex text-muted justify-content-center">
									Select
									<div id="select-content" class="text-body fw-semibold px-1">0</div>
									Result
									<button type="button" class="btn btn-link link-danger p-0 ms-3"
										data-bs-toggle="modal"
										data-bs-target="#removeNotificationModal">Remove</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="dropdown ms-sm-3 header-item topbar-user">
					<button type="button" class="btn" id="page-header-user-dropdown"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<span class="d-flex align-items-center"> <img
							class="rounded-circle header-profile-user"
							src="/themes/creative/assets/images/users/avatar-1.jpg"
							alt="Header Avatar"> <span class="text-start ms-xl-2">
								<span
								class="d-none d-xl-inline-block ms-1 fw-semibold user-name-text">Anna
									Adame</span> <span
								class="d-none d-xl-block ms-1 fs-12 text-muted user-name-sub-text">Founder</span>
						</span>
						</span>
					</button>
					<div class="dropdown-menu dropdown-menu-end">
						<!-- item-->
						<h6 class="dropdown-header">Welcome Anna!</h6>
						<a class="dropdown-item" href="pages-profile.html"><i
							class="mdi mdi-account-circle text-muted fs-16 align-middle me-1"></i>
							<span class="align-middle">Profile</span></a> <a
							class="dropdown-item" href="apps-chat.html"><i
							class="mdi mdi-message-text-outline text-muted fs-16 align-middle me-1"></i>
							<span class="align-middle">Messages</span></a> <a
							class="dropdown-item" href="apps-tasks-kanban.html"><i
							class="mdi mdi-calendar-check-outline text-muted fs-16 align-middle me-1"></i>
							<span class="align-middle">Taskboard</span></a> <a
							class="dropdown-item" href="pages-faqs.html"><i
							class="mdi mdi-lifebuoy text-muted fs-16 align-middle me-1"></i>
							<span class="align-middle">Help</span></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="pages-profile.html"><i
							class="mdi mdi-wallet text-muted fs-16 align-middle me-1"></i> <span
							class="align-middle">Balance : <b>$5971.67</b></span></a> <a
							class="dropdown-item" href="pages-profile-settings.html"><span
							class="badge bg-soft-success text-success mt-1 float-end">New</span><i
							class="mdi mdi-cog-outline text-muted fs-16 align-middle me-1"></i>
							<span class="align-middle">Settings</span></a> <a
							class="dropdown-item" href="auth-lockscreen-basic.html"><i
							class="mdi mdi-lock text-muted fs-16 align-middle me-1"></i> <span
							class="align-middle">Lock screen</span></a> <a class="dropdown-item"
							href="auth-logout-basic.html"><i
							class="mdi mdi-logout text-muted fs-16 align-middle me-1"></i> <span
							class="align-middle" data-key="t-logout">Logout</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>


<!-- removeNotificationModal -->
<div id="removeNotificationModal" class="modal fade zoomIn"
	tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" id="NotificationModalbtn-close"></button>
			</div>
			<div class="modal-body">
				<div class="mt-2 text-center">
					<lord-icon src="https://cdn.lordicon.com/gsqxdxog.json"
						trigger="loop" colors="primary:#495057,secondary:#f06548"
						style="width:100px;height:100px"></lord-icon>
					<div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
						<h4 class="fw-bold">Are you sure ?</h4>
						<p class="text-muted mx-4 mb-0">Are you sure you want to
							remove this Notification ?</p>
					</div>
				</div>
				<div class="d-flex gap-2 justify-content-center mt-4 mb-2">
					<button type="button" class="btn w-sm btn-light"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn w-sm btn-danger"
						id="delete-notification">Yes, Delete It!</button>
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- ========== App Menu ========== -->
<div class="app-menu navbar-menu">
	<!-- LOGO -->
	<div class="navbar-brand-box">
		<!-- Dark Logo-->
		<a href="index.html" class="logo logo-dark"> <span class="logo-sm">
				<img src="/themes/creative/assets/images/logo-sm.png" alt=""
				height="22">
		</span> <span class="logo-lg"> <img
				src="/themes/creative/assets/images/logo-dark.png" alt=""
				height="17">
		</span>
		</a>
		<!-- Light Logo-->
		<a href="index.html" class="logo logo-light"> <span
			class="logo-sm"> <img
				src="/themes/creative/assets/images/logo-sm.png" alt="" height="22">
		</span> <span class="logo-lg"> <img
				src="/themes/creative/assets/images/logo-light.png" alt=""
				height="17">
		</span>
		</a>
		<button type="button"
			class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover"
			id="vertical-hover">
			<i class="ri-record-circle-line"></i>
		</button>
	</div>

	<div id="scrollbar">
		<div class="container-fluid">
			<div id="two-column-menu"></div>
			<ul class="navbar-nav" id="navbar-nav">
				<li class="menu-title"><span data-key="t-menu">Menu</span></li>
				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarDashboards" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarDashboards"> <i
						class="ri-dashboard-2-line"></i> <span data-key="t-dashboards"><spring:message
								code="BzComposer.File" /></span>


				</a>
					<div class="collapse menu-dropdown" id="sidebarDashboards">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Dashboard?tabid=Dashboard"
								class="nav-link" data-key="t-analytics"> <spring:message
										code="BzComposer.Dashboard" />
							</a></li>
							<li class="nav-item"><a href="SalesBord?tabid=ShowList"
								class="nav-link" data-key="t-crm"> <spring:message
										code="menu.file.PrintMultipleInvoice" />
							</a></li>

							<li class="nav-item"><a href="#sidebarFileImport"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarFileImport"
								data-key="t-file"> <spring:message code="menu.file.Import" />
							</a>

								<div class="collapse menu-dropdown" id="sidebarFileImport">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="confugurationImport()" class="nav-link"
											data-key="t-file-import-config"> <spring:message
													code="BzComposer.Confuguration" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="customerImport()" class="nav-link"
											data-key="t-file-import-customers"> <spring:message
													code="BzComposer.customer.Customers" />
										</a></li>

										<li class="nav-item"><a href="#" onclick="leadsImport()"
											class="nav-link" data-key="t-file-import-leads"> <spring:message
													code="BzComposer.lead.leads" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="vendorImport()"
											class="nav-link" data-key="t-file-import-vendros"> <spring:message
													code="BzComposer.vendor.vendors" />
										</a></li>

										<li class="nav-item"><a href="#" onclick="uploadItem()"
											class="nav-link" data-key="t-file-import-items"> <spring:message
													code="NavigationTree.Items" />
										</a></li>

										<li class="nav-item"><a href="#sidebarfileimportorders"
											class="nav-link" data-bs-toggle="collapse" role="button"
											aria-expanded="false" aria-controls="sidebarfileimportorders"
											data-key="t-file-import-orders"> <spring:message
													code="BzComposer.common.orders" /></a>
											<div class="collapse menu-dropdown"
												id="sidebarfileimportorders">
												<ul class="nav nav-sm flex-column">
													<li class="nav-item"><a href="#"
														onclick="invoicesImport()" class="nav-link"
														data-key="t-file-orders-ivn"> <spring:message
																code="BzComposer.sales.Invoice" /></a></li>
													<li class="nav-item"><a href="#"
														onclick="estimationImport()" class="nav-link"
														data-key="t-file-orders-est"> <spring:message
																code="BzComposer.sales.Estimation" /></a></li>
													<li class="nav-item"><a href="#"
														onclick="salesOrderImport()" class="nav-link"
														data-key="t-file-orders-saleorder"> <spring:message
																code="BzComposer.sales.SalesOrder" /></a></li>
													<li class="nav-item"><a href="#"
														onclick="purchaseOrderImport()" class="nav-link"
														data-key="t-file-orders-purchaseord"> <spring:message
																code="BzComposer.purchase.PurchaseOrder" /></a></li>

												</ul>
											</div></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarFileExport"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarFileExport"
								data-key="t-file"> <spring:message code="menu.file.ExportTo" />
							</a>

								<div class="collapse menu-dropdown" id="sidebarFileExport">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="exportConfiguration()" class="nav-link"
											data-key="t-file-export-config"> <spring:message
													code="BzComposer.Confuguration" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="exportCustomer()" class="nav-link"
											data-key="t-file-export-customers"> <spring:message
													code="BzComposer.customer.Customers" />
										</a></li>

										<li class="nav-item"><a href="#" onclick="exportLead()"
											class="nav-link" data-key="t-file-export-leads"> <spring:message
													code="BzComposer.lead.leads" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="exportVendor()"
											class="nav-link" data-key="t-file-export-vendros"> <spring:message
													code="BzComposer.vendor.vendors" />
										</a></li>

										<li class="nav-item"><a href="#" onclick="exportItem()"
											class="nav-link" data-key="t-file-export-items"> <spring:message
													code="NavigationTree.Items" />
										</a></li>

										<li class="nav-item"><a href="#sidebarfileexportorders"
											class="nav-link" data-bs-toggle="collapse" role="button"
											aria-expanded="false" aria-controls="sidebarfileexportorders"
											data-key="t-file-export-orders"> <spring:message
													code="BzComposer.common.orders" /></a>
											<div class="collapse menu-dropdown"
												id="sidebarfileexportorders">
												<ul class="nav nav-sm flex-column">
													<li class="nav-item"><a
														href="/dataExportAction?tabid=Invoices" class="nav-link"
														data-key="t-file-exp-orders-ivn"> <spring:message
																code="BzComposer.sales.Invoice" /></a></li>
													<li class="nav-item"><a
														href="/dataExportAction?tabid=Estimations"
														class="nav-link" data-key="t-file-exp-orders-est"> <spring:message
																code="BzComposer.sales.Estimation" /></a></li>
													<li class="nav-item"><a
														href="/dataExportAction?tabid=SalesOrders"
														class="nav-link" data-key="t-file-exp-orders-saleorder">
															<spring:message code="BzComposer.sales.SalesOrder" />
													</a></li>
													<li class="nav-item"><a
														href="/dataExportAction?tabid=PurchaseOrders"
														class="nav-link" data-key="t-file-exp-orders-purchaseord">
															<spring:message code="BzComposer.purchase.PurchaseOrder" />
													</a></li>

												</ul>
											</div></li>
									</ul>
								</div></li>

							<li class="nav-item"><a href="#" onclick="quickBookImport()"
								class="nav-link" data-key="t-file-qbimport"> <spring:message
										code="menu.file.QBImport" />
							</a></li>



							<li class="nav-item"><a href="#ex1" rel="modal:open"
								class="nav-link" data-key="t-projects"> <spring:message
										code="menu.file.Calculator" />
							</a></li>

							<li class="nav-item"><a href="./Logout" class="nav-link"
								data-key="t-nft"> <spring:message code="menu.file.Exit" /></a></li>

						</ul>
					</div></li>
				<!-- end Dashboard Menu -->

				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarleads" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarleads"> <i
						class="ri-home-gear-line"></i> <span data-key="t-lead"><spring:message
								code="BzComposer.leads" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarleads">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Leads?tabid=leads"
								class="nav-link" data-key="t-leads"> <spring:message
										code="BzComposer.leads" />
							</a></li>
						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarcustomers" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarcustomers"> <i
						class="ri-building-2-line"></i> <span data-key="t-customers"><spring:message
								code="BzComposer.sales.Customer" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarcustomers">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Customer?tabid=Customer"
								class="nav-link" data-key="t-customer-list"><spring:message
										code="BzComposer.sales.CustomerList" /> </a></li>
							<li class="nav-item"><a href="Customer?tabid=CustomerBoard"
								class="nav-link" data-key="t-customers-board"><spring:message
										code="BzComposer.sales.CustomerBoard" /> </a></li>
							<li class="nav-item"><a href="Customer?tabid=ContactBoard"
								class="nav-link" data-key="t-customers-contactboard"><spring:message
										code="BzComposer.sales.ContactBoard" /> </a></li>
							<li class="nav-item"><a href="Customer?tabid=PrintLabels"
								class="nav-link" data-key="t-customers-addresslabels"><spring:message
										code="BzComposer.customer.CustomerAddressLabels" /> </a></li>
						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarsales" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarsales"> <i
						class="ri-building-4-line"></i> <span data-key="t-customers"><spring:message
								code="BzComposer.Sales" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarsales">
						<ul class="nav nav-sm flex-column">

							<li class="nav-item"><a href="Invoice?tabid=Invoice"
								class="nav-link" data-key="t-sales-invoice"><spring:message
										code="BzComposer.sales.Invoice" /> </a></li>

							<li class="nav-item"><a href="Estimation?tabid=Estimation"
								class="nav-link" data-key="t-sales-estimation"><spring:message
										code="BzComposer.sales.Estimation" /> </a></li>

							<li class="nav-item"><a href="SalesOrder?tabid=SalesOrder"
								class="nav-link" data-key="t-sales-saleorder"><spring:message
										code="BzComposer.sales.SalesOrder" /> </a></li>

							<li class="nav-item"><a href="SalesBord?tabid=ShowList"
								class="nav-link" data-key="t-sales-invoiceboard"><spring:message
										code="BzComposer.sales.InvoiceBoard" /> </a></li>

							<li class="nav-item"><a
								href="EstimationBoard?tabid=ShowList" class="nav-link"
								data-key="t-sales-estimationboard"><spring:message
										code="BzComposer.sales.EstimationBoard" /> </a></li>

							<li class="nav-item"><a
								href="SalesOrderBoard?tabid=ShowList" class="nav-link"
								data-key="t-sales-saleorderboard"><spring:message
										code="BzComposer.sales.SalesOrderBoard" /> </a></li>


							<li class="nav-item"><a href="#sidebarsalesrma"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarsalesrma"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.RMA" /></a>
								<div class="collapse menu-dropdown" id="sidebarsalesrma">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="SalesBord?tabid=ShowList"
											class="nav-link" data-key="t-sales-rma-create"> <spring:message
													code="BzComposer.RMA.CreateRma" />
										</a></li>
										<li class="nav-item"><a href="RMA?tabid=R0L0S0"
											class="nav-link" data-key="t-sales-rma-list"> <spring:message
													code="BzComposer.RMA.RMAList" />
										</a></li>
										<li class="nav-item"><a href="RMA?tabid=CreditMemo"
											class="nav-link" data-key="t-sales-rma-creditdemo"> <spring:message
													code="BzComposer.common.creditMemo" />
										</a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="DataManager?tabid=datamanager"
								class="nav-link" data-key="t-sales-datamanager"><spring:message
										code="BzComposer.sales.DataManager" /> </a></li>
						</ul>
					</div></li>

				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarpos" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarpos"> <i
						class="ri-building-4-line"></i> <span data-key="t-pos"><spring:message
								code="BzComposer.pos" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarpos">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Pos?tabid=POS"
								class="nav-link" data-key="t-pos-pos"> <spring:message
										code="BzComposer.pos" />
							</a></li>
						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebaritem" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebaritem"> <i
						class="ri-store-2-line"></i> <span data-key="t-item"><spring:message
								code="BzComposer.sales.Item" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebaritem">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Item?tabid=Item"
								class="nav-link" data-key="t-item-list"> <spring:message
										code="BzComposer.Item.ItemList" />
							</a></li>
							<li class="nav-item"><a
								href="PurchaseBoard?tabid=ShowReceivedItems" class="nav-link"
								data-key="t-item-receiveditem"> <spring:message
										code="BzComposer.Purchase.ReceivedItem" />
							</a></li>
							<li class="nav-item"><a href="Item?tabid=AdjustInventory"
								class="nav-link" data-key="t-item-adjustinventory"> <spring:message
										code="BzComposer.Item.AdjustInventory" />
							</a></li>
							<li class="nav-item"><a
								href="ItemCategoryManager?tabid=ItemCategoryManager"
								class="nav-link" data-key="t-item-itemcategorymanager"> <spring:message
										code="BzComposer.categorymanager.itemcategorymanager" />
							</a></li>
						</ul>
					</div></li>

				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarpurchase" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarpurchase"> <i
						class="ri-community-line"></i> <span data-key="t-item"><spring:message
								code="BzComposer.Purchase" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarpurchase">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Vendor?tabid=VONODO"
								class="nav-link" data-key="t-purchase-vendors"> <spring:message
										code="BzComposer.vendor.vendors" />
							</a></li>
							<li class="nav-item"><a href="PrintLBL?tabid=PrintLabel"
								class="nav-link" data-key="t-purchase-vendoraddresslabels">
									<spring:message code="BzComposer.vendor.VendorAddressLabels" />
							</a></li>
							<li class="nav-item"><a
								href="PurchaseOrder?tabid=PurchaseOrder" class="nav-link"
								data-key="t-purchase-porder"> <spring:message
										code="BzComposer.purchase.PurchaseOrder" />
							</a></li>
							<li class="nav-item"><a href="PurchaseBoard?tabid=ShowList"
								class="nav-link" data-key="t-purchase-purchaseboard"> <spring:message
										code="BzComposer.purchase.Purchase.PurchaseBoard" />
							</a></li>
						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebaraccounting" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebaraccounting"> <i
						class="ri-ancient-gate-line"></i> <span data-key="t-accounting"><spring:message
								code="BzComposer.Accounting" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebaraccounting">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Banking?tabid=Banking"
								class="nav-link" data-key="t-accounting-banking"> <spring:message
										code="BzComposer.Banking" />
							</a></li>
							<li class="nav-item"><a
								href="AccountReceiveble?tabid=AccountReceiveble"
								class="nav-link" data-key="t-accounting-accountreceiveble">
									<spring:message code="BzComposer.AccountReceiveble" />
							</a></li>
							<li class="nav-item"><a
								href="BillingBoard?tabid=billingBoard" class="nav-link"
								data-key="t-accounting-billingboard"> <spring:message
										code="BzComposer.BillingBoard" />
							</a></li>
							<li class="nav-item"><a href="PoPayable?tabid=popayable"
								class="nav-link" data-key="t-accounting-payabletitle"> <spring:message
										code="BzComposer.popayable.payabletitle" />
							</a></li>

							<li class="nav-item"><a href="BillPayable?tabid=billpayable"
								class="nav-link" data-key="t-accounting-billpayable"> <spring:message
										code="BzComposer.Billpayable" />
							</a></li>

							<li class="nav-item"><a
								href="Reconsilation?tabid=reconsilation" class="nav-link"
								data-key="t-accounting-reconsilation"> <spring:message
										code="BzComposer.Reconsilation" />
							</a></li>

							<li class="nav-item"><a
								href="CategoryDetail?tabid=categoryDetail" class="nav-link"
								data-key="t-accounting-categorydetails"> <spring:message
										code="BzComposer.CategoryDetail" />
							</a></li>
						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarreports" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarreports"> <i
						class="ri-store-line"></i> <span data-key="t-configuration"><spring:message
								code="BzComposer.Report.ReportTitle" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarreports">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Reports?tabid=ReportsCenter"
								class="nav-link" data-key="t-reports-reportcenter"> <spring:message
										code="BzComposer.Report.ReportCenter" />
							</a></li>
							<li class="nav-item"><a
								href="#sidebarreportcustomerandreceiables" class="nav-link"
								data-bs-toggle="collapse" role="button" aria-expanded="false"
								aria-controls="sidebarreportcustomerandreceiables"
								data-key="t-reports=customereceivables"> <spring:message
										code="BzComposer.reportcenter.customerandreceivables" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportcustomerandreceiables">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ShowCustomerList()" class="nav-link"
											data-key="t-reports-customerlist"> <spring:message
													code="BzComposer.reportcenter.listing.customerlist" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowCustomerPhoneList()" class="nav-link"
											data-key="t-reports-customerphonelist"> <spring:message
													code="BzComposer.reportcenter.listing.customerphonelist" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowCustomerContactList()" class="nav-link"
											data-key="t-reports-customercontactlist"> <spring:message
													code="BzComposer.reportcenter.listing.customercontactlist" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowTrancsactionbylistCustomer()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.listing.transactionlistbycustomer" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowCustomerBalSummary()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.balance.customerbalancesummary" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowCustomerBalDetail()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.balance.customerbalancedetail" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowCustomerList()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.sales.salesbycustomerdetails" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowSalesByCustomerSummary()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.sales.salesbycustomersummary" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowIncomeCustomerSummary()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.income.incomebycustomersummary" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowIncomeCustomerDetail()" class="nav-link"
											data-key="t-reports-transactionlistbycustomer"> <spring:message
													code="BzComposer.reportcenter.income.incomebycustomerdetail" />
										</a></li>


									</ul>
								</div></li>



							<li class="nav-item"><a href="#sidebarreportssales"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarreportssales"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.Sales" /></a>
								<div class="collapse menu-dropdown" id="sidebarreportssales">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="showSalesReport('SalesRBC');" class="nav-link"
											data-key="t-reports-salesreportbycustomer"> <spring:message
													code="BzComposer.reportcenter.sales.salesreportbycustomer" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showSalesReport('SalesRID');" class="nav-link"
											data-key="t-reports-salebyitem"> <spring:message
													code="BzComposer.reportcenter.sales.salesbyitem" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showSalesReport('SalesRBI');" class="nav-link"
											data-key="t-reports-salesreportbyitem"> <spring:message
													code="BzComposer.reportcenter.sales.salesreportbyitem" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showInvoiceList('AllInvoice');" class="nav-link"
											data-key="t-reports-allcreditrefundsalesreport"> <spring:message
													code="BzComposer.reportcenter.creditrefund.allcreditrefundsalesreport" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showInvoiceList('PaidInvoice');" class="nav-link"
											data-key="t-reports-paidcreditrefund"> <spring:message
													code="BzComposer.reportcenter.creditrefund.paidcreditrefund" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showInvoiceList('PaidInvoice');" class="nav-link"
											data-key="t-reports-unpaidcreditrefund"> <spring:message
													code="BzComposer.reportcenter.creditrefund.unpaidcreditrefund" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showInvoiceList('AllInvoice');" class="nav-link"
											data-key="t-reports-AllInvoice"> <spring:message
													code="BzComposer.Report.AllInvoice" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="showInvoiceList('PaidInvoice');" class="nav-link"
											data-key="t-reports-PaidInvoice"> <spring:message
													code="BzComposer.Report.PaidInvoice" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="showInvoiceList('UnPaidInvoice');" class="nav-link"
											data-key="t-reports-UnPaidInvoice"> <spring:message
													code="BzComposer.Report.UnPaidInvoice" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="showEstimationList()" class="nav-link"
											data-key="t-reports-allestimation"> <spring:message
													code="BzComposer.reportcenter.estimation.allestimation" />
										</a></li>


									</ul>
								</div></li>


							<li class="nav-item"><a href="#sidebarreportsiteminventory"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false"
								aria-controls="sidebarreportsiteminventory"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.Report.ItemInventory" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportsiteminventory">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="showInventoryList();" class="nav-link"
											data-key="t-reports-InventoryList"> <spring:message
													code="BzComposer.Report.InventoryList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showReceivedItemList();" class="nav-link"
											data-key="t-reports-receivedItemList"> <spring:message
													code="BzComposer.reportcenter.listing.receivedItemList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showReservedInventoryList();" class="nav-link"
											data-key="t-reports-ReservedInventoryList"> <spring:message
													code="BzComposer.Report.ReservedInventoryList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showItemPriceList();" class="nav-link"
											data-key="t-reports-ItemPriceList"> <spring:message
													code="BzComposer.Report.ReservedInventoryList.ItemPriceList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showDiscontinuedInventoryList();" class="nav-link"
											data-key="t-reports-InventoryList"> <spring:message
													code="BzComposer.Report.Discontinued.InventoryList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showDamageInventoryList();" class="nav-link"
											data-key="t-reports-damageinventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.damageinventorylist" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="MissingInventoryList();" class="nav-link"
											data-key="t-reports-missinginventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.missinginventorylist" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ReturnInventoryList();" class="nav-link"
											data-key="t-reports-returninventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.returninventorylist" />
										</a></li>

										<li class="nav-item"><ahref
												="#" onclick="showDamagedInventoryList();" class="nav-link"
												data-key="t-reports-damagedinventorylist"> <spring:message
												code="BzComposer.reportcenter.listing.damagedinventorylist" />
											</a></li>

										<li class="nav-item"><a href="#"
											onclick="showDiscontinuedInventoryList();" class="nav-link"
											data-key="t-reports-returnedinventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.returnedinventorylist" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="showDiscontinuedInventoryList();" class="nav-link"
											data-key="t-reports-returnedinventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.returnedinventorylist" />
										</a></li>



										<li class="nav-item"><a href="#"
											onclick="showUnknownInventoryList();" class="nav-link"
											data-key="t-reports-unknowninventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.unknowninventorylist" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="showReturnedInventoryList();" class="nav-link"
											data-key="t-reports-returnedinventorylist"> <spring:message
													code="BzComposer.reportcenter.listing.returnedinventorylist" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="showDailyItemSummary();" class="nav-link"
											data-key="t-reports-dailyitemsummary"> <spring:message
													code="BzComposer.reportcenter.listing.dailyitemsummary" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="showDailySalesSummary();" class="nav-link"
											data-key="t-reports-dailysalessummary"> <spring:message
													code="BzComposer.reportcenter.listing.dailysalessummary" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="showInvValSummary();" class="nav-link"
											data-key="t-reports-inventoryvaluationsummary"> <spring:message
													code="BzComposer.reportcenter.valuation.inventoryvaluationsummary" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="showInvValDetail();" class="nav-link"
											data-key="t-reports-inventoryvaluationdetail"> <spring:message
													code="BzComposer.reportcenter.valuation.inventoryvaluationdetail" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="showInvOrderReport();" class="nav-link"
											data-key="t-reports-inventoryorderreport"> <spring:message
													code="BzComposer.reportcenter.inventoryorder.inventoryorderreport" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="showInvStatistic();" class="nav-link"
											data-key="t-reports-currentinventorystatictics"> <spring:message
													code="BzComposer.reportcenter.inventorystatistics.currentinventorystatictics" />
										</a></li>


									</ul>
								</div></li>




							<li class="nav-item"><a href="#sidebarreportsvendorpurchase"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false"
								aria-controls="sidebarreportsvendorpurchase"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.Report.VendorPurchase" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportsvendorpurchase">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ShowvendorList();" class="nav-link"
											data-key="t-reports-VendorList"> <spring:message
													code="BzComposer.Report.VendorList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowvendorPhoneList()" class="nav-link"
											data-key="t-reports-VendorPhoneList"> <spring:message
													code="BzComposer.Report.VendorPhoneList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowVendorContactList();" class="nav-link"
											data-key="t-reports-VendorContactList"> <spring:message
													code="BzComposer.Report.VendorContactList" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowsvendorBalanceDetails();" class="nav-link"
											data-key="t-reports-BalanceDetails"> <spring:message
													code="BzComposer.Report.vendor.BalanceDetails" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowsvendorBalanceSymmary();" class="nav-link"
											data-key="t-reports-vendorbalancesummary"> <spring:message
													code="BzComposer.reportcenter.balance.vendorbalancesummary" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowsAllPurchaseorders();" class="nav-link"
											data-key="t-reports-PurchaseOrders"> <spring:message
													code="BzComposer.Report.PurchaseOrders" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowAllPurchaseBills();" class="nav-link"
											data-key="t-reports-allpurchasebills"> <spring:message
													code="BzComposer.reportcenter.allpurchasebills" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowPaidPurchaseBills();" class="nav-link"
											data-key="t-reports-paidpurchasebills"> <spring:message
													code="BzComposer.reportcenter.paidpurchasebills" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowUnPaidPurchaseBills();" class="nav-link"
											data-key="t-reports-unpaidpurchasebills"> <spring:message
													code="BzComposer.reportcenter.unpaidpurchasebills" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowCancelledPurchaseRefBill();" class="nav-link"
											data-key="t-reports-cancelledpurchasebillrefundlist"> <spring:message
													code="BzComposer.reportcenter.cancelledpurchasebillrefundlist" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="ShowVendor1099List();" class="nav-link"
											data-key="t-reports-vendor1099list"> <spring:message
													code="BzComposer.reportcenter.vendor1099list" />
										</a></li>



										<li class="nav-item"><a href="#"
											onclick="Vendor1099TransactionSummary();" class="nav-link"
											data-key="t-reports-vendor1099transactionsummary"> <spring:message
													code="BzComposer.reportcenter.vendor1099transactionsummary" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="vendor1099TransactionDetail();" class="nav-link"
											data-key="t-reports-vendor1099transactiondetail"> <spring:message
													code="BzComposer.reportcenter.vendor1099transactiondetail" />
										</a></li>

									</ul>
								</div></li>


							<li class="nav-item"><a href="#sidebarreportsemployee"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarreportsemployee"
								data-key="t-reports-employees"> <spring:message
										code="BzComposer.Report.Employee" /></a>
								<div class="collapse menu-dropdown" id="sidebarreportsemployee">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ShowEmployeeSalesByRep();" class="nav-link"
											data-key="t-reports-SalesByRepDetails"> <spring:message
													code="BzComposer.Report.Employee.SalesByRepDetails" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowEmployeeSalesReportByRep();" class="nav-link"
											data-key="t-reports-SalesReportByRep"> <spring:message
													code="BzComposer.Report.Employee.SalesReportByRep" />
										</a></li>

									</ul>
								</div></li>


							<li class="nav-item"><a
								href="#sidebarreportsbankingandaccounting" class="nav-link"
								data-bs-toggle="collapse" role="button" aria-expanded="false"
								aria-controls="sidebarreportsbankingandaccounting"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.reportcenter.bankingandaccounting" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportsbankingandaccounting">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ShowCheckDetail();" class="nav-link"
											data-key="t-reports-bankingandtransactiondetailcheckdetail">
												<spring:message
													code="BzComposer.reportcenter.bankingandtransactiondetail.checkdetail" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowDepositDetail();" class="nav-link"
											data-key="t-reports-bankingandtransactiondetaildepositdetail">
												<spring:message
													code="BzComposer.reportcenter.bankingandtransactiondetail.depositdetail" />
										</a></li>
										<li class="nav-item"><ahref
												="#" onclick="ShowBillDetail();" class="nav-link"
												data-key="t-reports-bankingandtransactiondetailbilldetail">
											<spring:message
												code="BzComposer.reportcenter.bankingandtransactiondetail.billdetail" />
											</a></li>
										<li class="nav-item"><a href="#"
											onclick="TransactionDeatail();" class="nav-link"
											data-key="t-reports-bankingandtransactiondetailtransactiondeatails">
												<spring:message
													code="BzComposer.reportcenter.bankingandtransactiondetail.transactiondeatails" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowAccountReceivableGraph();" class="nav-link"
											data-key="t-reports-accountreceivablegraph"> <spring:message
													code="BzComposer.reportcenter.graph.accountreceivablegraph" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowAccountReceivable();" class="nav-link"
											data-key="t-reports-accountaccountreceivable"> <spring:message
													code="BzComposer.reportcenter.account.accountreceivable" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowAccountPayable();" class="nav-link"
											data-key="t-reports-accountpayable"> <spring:message
													code="BzComposer.reportcenter.accountpayable" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="AccountPayableGraph();" class="nav-link"
											data-key="t-reports-accountpayablegraph"> <spring:message
													code="BzComposer.reportcenter.accountpayablegraph" />
										</a></li>


									</ul>
								</div></li>





							<li class="nav-item"><a
								href="#sidebarreportsprofitandbudget" class="nav-link"
								data-bs-toggle="collapse" role="button" aria-expanded="false"
								aria-controls="sidebarreportsprofitandbudget"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.reportcenter.profitandbudget" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportsprofitandbudget">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ShowProfitLoss();" class="nav-link"
											data-key="t-reports-profitlossstandard"> <spring:message
													code="BzComposer.reportcenter.profitorloss.profitlossstandard" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowProfitLossDetail();" class="nav-link"
											data-key="t-reports-profitlossdetail"> <spring:message
													code="BzComposer.reportcenter.profitorloss.profitlossdetail" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowProfitLossByJob();" class="nav-link"
											data-key="t-reports-profitlossbyjob"> <spring:message
													code="BzComposer.reportcenter.profitorloss.profitlossbyjob" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showProfitLossByItem();" class="nav-link"
											data-key="t-reports-profitlossbyitem"> <spring:message
													code="BzComposer.reportcenter.profitorloss.profitlossbyitem" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showBudgetOverview();" class="nav-link"
											data-key="t-reports-profitlossbudgetoverview"> <spring:message
													code="BzComposer.reportcenter.profitorloss.profitlossbudgetoverview" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showBudgetVsActual();" class="nav-link"
											data-key="t-reports-profitlossbudgetactual"> <spring:message
													code="BzComposer.reportcenter.profitorloss.profitlossbudgetactual" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="showIncomeStatement();" class="nav-link"
											data-key="t-reports-financialreportincomestatement"> <spring:message
													code="BzComposer.reportcenter.financialreport.incomestatement" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowBalSheet();" class="nav-link"
											data-key="t-reports-financialreportbalancesheet"> <spring:message
													code="BzComposer.reportcenter.financialreport.balancesheet" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ShowCashFlowForeCast();" class="nav-link"
											data-key="t-reports-cashflowcashflowforecast"> <spring:message
													code="BzComposer.reportcenter.cashflow.cashflowforecast" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="IncomeExpenseGraph();" class="nav-link"
											data-key="t-reports-incomeandexpensegraph"> <spring:message
													code="BzComposer.reportcenter.graph.incomeandexpensegraph" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="Networth();"
											class="nav-link" data-key="t-reports-graphnetworthgraph">
												<spring:message
													code="BzComposer.reportcenter.graph.networthgraph" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="BudgetvsActualGraph();" class="nav-link"
											data-key="t-reports-graphbudgetvsactualgraph"> <spring:message
													code="BzComposer.reportcenter.graph.budgetvsactualgraph" />
										</a></li>


									</ul>
								</div></li>



							<li class="nav-item"><a href="#sidebarreportscentertax"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarreportscentertax"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.reportcenter.tax" /></a>
								<div class="collapse menu-dropdown" id="sidebarreportscentertax">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ShowSalesTaxSummary();" class="nav-link"
											data-key="t-reports-salestaxsummary"> <spring:message
													code="BzComposer.reportcenter.tax.salestax.summary" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ShowReportTaxDetail();" class="nav-link"
											data-key="t-reports-salestaxdetail"> <spring:message
													code="BzComposer.reportcenter.tax.salestax.detail" />
										</a></li>
									</ul>
								</div></li>


							<li class="nav-item"><a href="#sidebarreportscenterlist"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarreportscenterlist"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.reportcenter.lists" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportscenterlist">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ChartsofCategories();" class="nav-link"
											data-key="t-reports-chartsofcategories"> <spring:message
													code="BzComposer.reportcenter.lists.chartsofcategories" />
										</a></li>
										<li class="nav-item"><a href="#" onclick="TermList();"
											class="nav-link" data-key="t-reports-sliststermlist"> <spring:message
													code="BzComposer.reportcenter.lists.termlist" />
										</a></li>

										<li class="nav-item"><a href="#" onclick="SaleRepList();"
											class="nav-link" data-key="t-reports-salereplist"> <spring:message
													code="BzComposer.reportcenter.lists.salereplist" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="PaymentMethodList();" class="nav-link"
											data-key="t-reports-paymentmethodlist"> <spring:message
													code="BzComposer.reportcenter.lists.paymentmethodlist" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="ShipViaList();"
											class="nav-link" data-key="t-reports-shipvialist"> <spring:message
													code="BzComposer.reportcenter.lists.shipvialist" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="TaxTypeList();"
											class="nav-link" data-key="t-reports-taxtypelist"> <spring:message
													code="BzComposer.reportcenter.lists.taxtypelist" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="FootnoteList();" class="nav-link"
											data-key="t-reports-footnotelist"> <spring:message
													code="BzComposer.reportcenter.lists.footnotelist" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="ShipViaList();"
											class="nav-link" data-key="t-reports-shipvialist"> <spring:message
													code="BzComposer.reportcenter.lists.shipvialist" />
										</a></li>


										<li class="nav-item"><a href="#" onclick="MessageList();"
											class="nav-link" data-key="t-reports-messagelist"> <spring:message
													code="BzComposer.reportcenter.lists.messagelist" />
										</a></li>
									</ul>
								</div></li>


							<li class="nav-item"><a href="#sidebarreportscenteresales"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarreportscenteresales"
								data-key="t-sales-rma"> <spring:message
										code="BzComposer.reportcenter.esales" /></a>
								<div class="collapse menu-dropdown"
									id="sidebarreportscenteresales">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#"
											onclick="ESales_Invoice_Detail();" class="nav-link"
											data-key="t-reports-esalesinvoicedetail"> <spring:message
													code="BzComposer.reportcenter.esalesinvoicedetail" />
										</a></li>
										<li class="nav-item"><a href="#"
											onclick="ESales_Refund_Detail();" class="nav-link"
											data-key="t-reports-esalesrefunddetail"> <spring:message
													code="BzComposer.reportcenter.esalesrefunddetail" />
										</a></li>

										<li class="nav-item"><a href="#"
											onclick="ESales_sale_Detail();" class="nav-link"
											data-key="t-reports-esalessaledetail"> <spring:message
													code="BzComposer.reportcenter.esalessaledetail" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="ESales_Inventory_Sale_Statistics();"
											class="nav-link"
											data-key="t-reports-esalesinventorysalestatistics"> <spring:message
													code="BzComposer.reportcenter.esalesinventorysalestatistics" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="Cross_Sell_Inventory_Report();" class="nav-link"
											data-key="t-reports-crosssaledetail"> <spring:message
													code="BzComposer.reportcenter.crosssale.crosssaledetail" />
										</a></li>


										<li class="nav-item"><a href="#"
											onclick="ESale_Sales_Graph();" class="nav-link"
											data-key="t-reports-esalesalesgraph"> <spring:message
													code="BzComposer.reportcenter.graph.esalesalesgraph" />
										</a></li>



									</ul>
								</div></li>

						</ul>
					</div></li>

				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarconfiguration" data-bs-toggle="collapse"
					role="button" aria-expanded="false"
					aria-controls="sidebarconfiguration"> <i
						class="ri-stack-line"></i> <span data-key="t-configuration"><spring:message
								code="BzComposer.Confuguration" /></span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarconfiguration">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="Pos?tabid=POS"
								class="nav-link" data-key="t-configuration-config"> <spring:message
										code="BzComposer.Confuguration" />
							</a></li>
						</ul>
					</div></li>

				<li class="nav-item"><a class="nav-link menu-link"
					href="#sidebarIcons" data-bs-toggle="collapse" role="button"
					aria-expanded="false" aria-controls="sidebarIcons"> <i
						class="ri-compasses-2-line"></i> <span data-key="t-icons">Icons</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarIcons">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="icons-remix.html"
								class="nav-link" data-key="t-remix">Remix</a></li>
							<li class="nav-item"><a href="icons-boxicons.html"
								class="nav-link" data-key="t-boxicons">Boxicons</a></li>
							<li class="nav-item"><a href="icons-materialdesign.html"
								class="nav-link" data-key="t-material-design">Material
									Design</a></li>
							<li class="nav-item"><a href="icons-lineawesome.html"
								class="nav-link" data-key="t-line-awesome">Line Awesome</a></li>
							<li class="nav-item"><a href="icons-feather.html"
								class="nav-link" data-key="t-feather">Feather</a></li>
							<li class="nav-item"><a href="icons-crypto.html"
								class="nav-link"> <span data-key="t-crypto-svg">Crypto
										SVG</span></a></li>
						</ul>
					</div></li>
			</ul>
		</div>
		</li>


		<!-- 
				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarApps"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarApps"> <i class="ri-apps-2-line"></i> <span
						data-key="t-apps">Apps</span>
				</a>
					<div style="display: none;" class="collapse menu-dropdown" id="sidebarApps">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="apps-calendar.html"
								class="nav-link" data-key="t-calendar"> Calendar </a></li>
							<li class="nav-item"><a href="apps-chat.html"
								class="nav-link" data-key="t-chat"> Chat </a></li>
							<li class="nav-item"><a href="#sidebarEmail"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarEmail"
								data-key="t-email"> Email </a>
								<div class="collapse menu-dropdown" id="sidebarEmail">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-mailbox.html"
											class="nav-link" data-key="t-mailbox"> Mailbox </a></li>
										<li class="nav-item"><a href="#sidebaremailTemplates"
											class="nav-link" data-bs-toggle="collapse" role="button"
											aria-expanded="false" aria-controls="sidebaremailTemplates"
											data-key="t-email-templates"> Email Templates </a>
											<div class="collapse menu-dropdown"
												id="sidebaremailTemplates">
												<ul class="nav nav-sm flex-column">
													<li class="nav-item"><a href="apps-email-basic.html"
														class="nav-link" data-key="t-basic-action"> Basic
															Action </a></li>
													<li class="nav-item"><a
														href="apps-email-ecommerce.html" class="nav-link"
														data-key="t-ecommerce-action"> Ecommerce Action </a></li>
												</ul>
											</div></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarEcommerce"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarEcommerce"
								data-key="t-ecommerce"> Ecommerce </a>
								<div class="collapse menu-dropdown" id="sidebarEcommerce">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a
											href="apps-ecommerce-products.html" class="nav-link"
											data-key="t-products"> Products </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-product-details.html" class="nav-link"
											data-key="t-product-Details"> Product Details </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-add-product.html" class="nav-link"
											data-key="t-create-product"> Create Product </a></li>
										<li class="nav-item"><a href="apps-ecommerce-orders.html"
											class="nav-link" data-key="t-orders"> Orders </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-order-details.html" class="nav-link"
											data-key="t-order-details"> Order Details </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-customers.html" class="nav-link"
											data-key="t-customers"> Customers </a></li>
										<li class="nav-item"><a href="apps-ecommerce-cart.html"
											class="nav-link" data-key="t-shopping-cart"> Shopping
												Cart </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-checkout.html" class="nav-link"
											data-key="t-checkout"> Checkout </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-sellers.html" class="nav-link"
											data-key="t-sellers"> Sellers </a></li>
										<li class="nav-item"><a
											href="apps-ecommerce-seller-details.html" class="nav-link"
											data-key="t-sellers-details"> Seller Details </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarProjects"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarProjects"
								data-key="t-projects"> Projects </a>
								<div class="collapse menu-dropdown" id="sidebarProjects">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-projects-list.html"
											class="nav-link" data-key="t-list"> List </a></li>
										<li class="nav-item"><a
											href="apps-projects-overview.html" class="nav-link"
											data-key="t-overview"> Overview </a></li>
										<li class="nav-item"><a href="apps-projects-create.html"
											class="nav-link" data-key="t-create-project"> Create
												Project </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarTasks"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarTasks"
								data-key="t-tasks"> Tasks </a>
								<div class="collapse menu-dropdown" id="sidebarTasks">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-tasks-kanban.html"
											class="nav-link" data-key="t-kanbanboard"> Kanban Board </a></li>
										<li class="nav-item"><a href="apps-tasks-list-view.html"
											class="nav-link" data-key="t-list-view"> List View </a></li>
										<li class="nav-item"><a href="apps-tasks-details.html"
											class="nav-link" data-key="t-task-details"> Task Details
										</a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarCRM" class="nav-link"
								data-bs-toggle="collapse" role="button" aria-expanded="false"
								aria-controls="sidebarCRM" data-key="t-crm"> CRM </a>
								<div class="collapse menu-dropdown" id="sidebarCRM">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-crm-contacts.html"
											class="nav-link" data-key="t-contacts"> Contacts </a></li>
										<li class="nav-item"><a href="apps-crm-companies.html"
											class="nav-link" data-key="t-companies"> Companies </a></li>
										<li class="nav-item"><a href="apps-crm-deals.html"
											class="nav-link" data-key="t-deals"> Deals </a></li>
										<li class="nav-item"><a href="apps-crm-leads.html"
											class="nav-link" data-key="t-leads"> Leads </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarCrypto"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarCrypto"
								data-key="t-crypto"> Crypto </a>
								<div class="collapse menu-dropdown" id="sidebarCrypto">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a
											href="apps-crypto-transactions.html" class="nav-link"
											data-key="t-transactions"> Transactions </a></li>
										<li class="nav-item"><a href="apps-crypto-buy-sell.html"
											class="nav-link" data-key="t-buy-sell"> Buy & Sell </a></li>
										<li class="nav-item"><a href="apps-crypto-orders.html"
											class="nav-link" data-key="t-orders"> Orders </a></li>
										<li class="nav-item"><a href="apps-crypto-wallet.html"
											class="nav-link" data-key="t-my-wallet"> My Wallet </a></li>
										<li class="nav-item"><a href="apps-crypto-ico.html"
											class="nav-link" data-key="t-ico-list"> ICO List </a></li>
										<li class="nav-item"><a href="apps-crypto-kyc.html"
											class="nav-link" data-key="t-kyc-application"> KYC
												Application </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarInvoices"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarInvoices"
								data-key="t-invoices"> Invoices </a>
								<div class="collapse menu-dropdown" id="sidebarInvoices">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-invoices-list.html"
											class="nav-link" data-key="t-list-view"> List View </a></li>
										<li class="nav-item"><a href="apps-invoices-details.html"
											class="nav-link" data-key="t-details"> Details </a></li>
										<li class="nav-item"><a href="apps-invoices-create.html"
											class="nav-link" data-key="t-create-invoice"> Create
												Invoice </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarTickets"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarTickets"
								data-key="t-supprt-tickets"> Support Tickets </a>
								<div class="collapse menu-dropdown" id="sidebarTickets">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-tickets-list.html"
											class="nav-link" data-key="t-list-view"> List View </a></li>
										<li class="nav-item"><a href="apps-tickets-details.html"
											class="nav-link" data-key="t-ticket-details"> Ticket
												Details </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarnft" class="nav-link"
								data-bs-toggle="collapse" role="button" aria-expanded="false"
								aria-controls="sidebarnft" data-key="t-nft-marketplace"> NFT
									Marketplace </a>
								<div class="collapse menu-dropdown" id="sidebarnft">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-nft-marketplace.html"
											class="nav-link" data-key="t-marketplace"> Marketplace </a></li>
										<li class="nav-item"><a href="apps-nft-explore.html"
											class="nav-link" data-key="t-explore-now"> Explore Now </a></li>
										<li class="nav-item"><a href="apps-nft-auction.html"
											class="nav-link" data-key="t-live-auction"> Live Auction
										</a></li>
										<li class="nav-item"><a href="apps-nft-item-details.html"
											class="nav-link" data-key="t-item-details"> Item Details
										</a></li>
										<li class="nav-item"><a href="apps-nft-collections.html"
											class="nav-link" data-key="t-collections"> Collections </a></li>
										<li class="nav-item"><a href="apps-nft-creators.html"
											class="nav-link" data-key="t-creators"> Creators </a></li>
										<li class="nav-item"><a href="apps-nft-ranking.html"
											class="nav-link" data-key="t-ranking"> Ranking </a></li>
										<li class="nav-item"><a href="apps-nft-wallet.html"
											class="nav-link" data-key="t-wallet-connect"> Wallet
												Connect </a></li>
										<li class="nav-item"><a href="apps-nft-create.html"
											class="nav-link" data-key="t-create-nft"> Create NFT </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="apps-file-manager.html"
								class="nav-link"> <span data-key="t-file-manager">File
										Manager</span></a></li>
							<li class="nav-item"><a href="apps-todo.html"
								class="nav-link"> <span data-key="t-to-do">To Do</span></a></li>
							<li class="nav-item"><a href="#sidebarjobs" class="nav-link"
								data-bs-toggle="collapse" role="button" aria-expanded="false"
								aria-controls="sidebarjobs"> <span data-key="t-jobs">Jobs</span>
									<span class="badge badge-pill bg-success" data-key="t-new">New</span></a>
								<div class="collapse menu-dropdown" id="sidebarjobs">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="apps-job-statistics.html"
											class="nav-link" data-key="t-candidate-list"> Statistics
										</a></li>
										<li class="nav-item"><a href="#sidebarJoblists"
											class="nav-link" data-bs-toggle="collapse" role="button"
											aria-expanded="false" aria-controls="sidebarJoblists"
											data-key="t-job-lists"> Job Lists </a>
											<div class="collapse menu-dropdown" id="sidebarJoblists">
												<ul class="nav nav-sm flex-column">
													<li class="nav-item"><a href="apps-job-lists.html"
														class="nav-link" data-key="t-list"> List </a></li>
													<li class="nav-item"><a
														href="apps-job-grid-lists.html" class="nav-link"
														data-key="t-grid"> Grid </a></li>
													<li class="nav-item"><a href="apps-job-details.html"
														class="nav-link" data-key="t-overview"> Overview</a></li>
												</ul>
											</div></li>
										<li class="nav-item"><a href="#sidebarCandidatelists"
											class="nav-link" data-bs-toggle="collapse" role="button"
											aria-expanded="false" aria-controls="sidebarCandidatelists"
											data-key="t-candidate-lists"> Candidate Lists </a>
											<div class="collapse menu-dropdown"
												id="sidebarCandidatelists">
												<ul class="nav nav-sm flex-column">
													<li class="nav-item"><a
														href="apps-job-candidate-lists.html" class="nav-link"
														data-key="t-list-view"> List View </a></li>
													<li class="nav-item"><a
														href="apps-job-candidate-grid.html" class="nav-link"
														data-key="t-grid-view"> Grid View</a></li>
												</ul>
											</div></li>
										<li class="nav-item"><a href="apps-job-application.html"
											class="nav-link" data-key="t-application"> Application </a></li>
										<li class="nav-item"><a href="apps-job-new.html"
											class="nav-link" data-key="t-new-job"> New Job </a></li>
										<li class="nav-item"><a
											href="apps-job-companies-lists.html" class="nav-link"
											data-key="t-companies-list"> Companies List </a></li>
										<li class="nav-item"><a href="apps-job-categories.html"
											class="nav-link" data-key="t-job-categories"> Job
												Categories</a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="apps-api-key.html"
								class="nav-link"> <span data-key="t-api-key">API Key</span>
									<span class="badge badge-pill bg-success" data-key="t-new">New</span></a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarLayouts"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarLayouts"> <i class="ri-layout-3-line"></i>
						<span data-key="t-layouts">Layouts</span> <span
						class="badge badge-pill bg-danger" data-key="t-hot">Hot</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarLayouts">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="layouts-horizontal.html"
								target="_blank" class="nav-link" data-key="t-horizontal">Horizontal</a>
							</li>
							<li class="nav-item"><a href="layouts-detached.html"
								target="_blank" class="nav-link" data-key="t-detached">Detached</a>
							</li>
							<li class="nav-item"><a href="layouts-two-column.html"
								target="_blank" class="nav-link" data-key="t-two-column">Two
									Column</a></li>
							<li class="nav-item"><a href="layouts-vertical-hovered.html"
								target="_blank" class="nav-link" data-key="t-hovered">Hovered</a></li>
						</ul>
					</div></li>
					
					 -->
		<!-- end Dashboard Menu -->

		<!-- 
				<li style="display: none;" class="menu-title"><i
					class="ri-more-fill"></i> <span data-key="t-pages">Pages</span></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarAuth"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarAuth"> <i class="ri-account-circle-line"></i>
						<span data-key="t-authentication">Authentication</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarAuth">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="#sidebarSignIn"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarSignIn"
								data-key="t-signin"> Sign In </a>
								<div class="collapse menu-dropdown" id="sidebarSignIn">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-signin-basic.html"
											class="nav-link" data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a href="auth-signin-cover.html"
											class="nav-link" data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarSignUp"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarSignUp"
								data-key="t-signup"> Sign Up </a>
								<div class="collapse menu-dropdown" id="sidebarSignUp">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-signup-basic.html"
											class="nav-link" data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a href="auth-signup-cover.html"
											class="nav-link" data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>

							<li class="nav-item"><a href="#sidebarResetPass"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarResetPass"
								data-key="t-password-reset"> Password Reset </a>
								<div class="collapse menu-dropdown" id="sidebarResetPass">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-pass-reset-basic.html"
											class="nav-link" data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a href="auth-pass-reset-cover.html"
											class="nav-link" data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>

							<li class="nav-item"><a href="#sidebarchangePass"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarchangePass"
								data-key="t-password-create"> Password Create </a>
								<div class="collapse menu-dropdown" id="sidebarchangePass">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a
											href="auth-pass-change-basic.html" class="nav-link"
											data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a
											href="auth-pass-change-cover.html" class="nav-link"
											data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>

							<li class="nav-item"><a href="#sidebarLockScreen"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarLockScreen"
								data-key="t-lock-screen"> Lock Screen </a>
								<div class="collapse menu-dropdown" id="sidebarLockScreen">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-lockscreen-basic.html"
											class="nav-link" data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a href="auth-lockscreen-cover.html"
											class="nav-link" data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>

							<li class="nav-item"><a href="#sidebarLogout"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarLogout"
								data-key="t-logout"> Logout </a>
								<div class="collapse menu-dropdown" id="sidebarLogout">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-logout-basic.html"
											class="nav-link" data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a href="auth-logout-cover.html"
											class="nav-link" data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarSuccessMsg"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarSuccessMsg"
								data-key="t-success-message"> Success Message </a>
								<div class="collapse menu-dropdown" id="sidebarSuccessMsg">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a
											href="auth-success-msg-basic.html" class="nav-link"
											data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a
											href="auth-success-msg-cover.html" class="nav-link"
											data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarTwoStep"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarTwoStep"
								data-key="t-two-step-verification"> Two Step Verification </a>
								<div class="collapse menu-dropdown" id="sidebarTwoStep">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-twostep-basic.html"
											class="nav-link" data-key="t-basic"> Basic </a></li>
										<li class="nav-item"><a href="auth-twostep-cover.html"
											class="nav-link" data-key="t-cover"> Cover </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="#sidebarErrors"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarErrors"
								data-key="t-errors"> Errors </a>
								<div class="collapse menu-dropdown" id="sidebarErrors">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="auth-404-basic.html"
											class="nav-link" data-key="t-404-basic"> 404 Basic </a></li>
										<li class="nav-item"><a href="auth-404-cover.html"
											class="nav-link" data-key="t-404-cover"> 404 Cover </a></li>
										<li class="nav-item"><a href="auth-404-alt.html"
											class="nav-link" data-key="t-404-alt"> 404 Alt </a></li>
										<li class="nav-item"><a href="auth-500.html"
											class="nav-link" data-key="t-500"> 500 </a></li>
										<li class="nav-item"><a href="auth-offline.html"
											class="nav-link" data-key="t-offline-page"> Offline Page
										</a></li>
									</ul>
								</div></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarPages"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarPages"> <i class="ri-pages-line"></i> <span
						data-key="t-pages">Pages</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarPages">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="pages-starter.html"
								class="nav-link" data-key="t-starter"> Starter </a></li>
							<li class="nav-item"><a href="#sidebarProfile"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarProfile"
								data-key="t-profile"> Profile </a>
								<div class="collapse menu-dropdown" id="sidebarProfile">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="pages-profile.html"
											class="nav-link" data-key="t-simple-page"> Simple Page </a></li>
										<li class="nav-item"><a
											href="pages-profile-settings.html" class="nav-link"
											data-key="t-settings"> Settings </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="pages-team.html"
								class="nav-link" data-key="t-team"> Team </a></li>
							<li class="nav-item"><a href="pages-timeline.html"
								class="nav-link" data-key="t-timeline"> Timeline </a></li>
							<li class="nav-item"><a href="pages-faqs.html"
								class="nav-link" data-key="t-faqs"> FAQs </a></li>
							<li class="nav-item"><a href="pages-pricing.html"
								class="nav-link" data-key="t-pricing"> Pricing </a></li>
							<li class="nav-item"><a href="pages-gallery.html"
								class="nav-link" data-key="t-gallery"> Gallery </a></li>
							<li class="nav-item"><a href="pages-maintenance.html"
								class="nav-link" data-key="t-maintenance"> Maintenance </a></li>
							<li class="nav-item"><a href="pages-coming-soon.html"
								class="nav-link" data-key="t-coming-soon"> Coming Soon </a></li>
							<li class="nav-item"><a href="pages-sitemap.html"
								class="nav-link" data-key="t-sitemap"> Sitemap </a></li>
							<li class="nav-item"><a href="pages-search-results.html"
								class="nav-link" data-key="t-search-results"> Search Results
							</a></li>
							<li class="nav-item"><a href="pages-privacy-policy.html"
								class="nav-link"><span data-key="t-privacy-policy">Privacy
										Policy</span> <span class="badge badge-pill bg-success"
									data-key="t-new">New</span></a></li>
							<li class="nav-item"><a href="pages-term-conditions.html"
								class="nav-link"><span data-key="t-term-conditions">Term
										& Conditions</span> <span class="badge badge-pill bg-success"
									data-key="t-new">New</span></a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarLanding"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarLanding"> <i class="ri-rocket-line"></i>
						<span data-key="t-landing">Landing</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarLanding">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="landing.html" class="nav-link"
								data-key="t-one-page"> One Page </a></li>
							<li class="nav-item"><a href="nft-landing.html"
								class="nav-link" data-key="t-nft-landing"> NFT Landing </a></li>
							<li class="nav-item"><a href="job-landing.html"
								class="nav-link"><span data-key="t-job">Job</span> <span
									class="badge badge-pill bg-success" data-key="t-new">New</span></a>
							</li>
						</ul>
					</div></li>

				<li style="display: none;" class="menu-title"><i
					class="ri-more-fill"></i> <span data-key="t-components">Components</span></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarUI"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarUI"> <i class="ri-pencil-ruler-2-line"></i>
						<span data-key="t-base-ui">Base UI</span>
				</a>
					<div class="collapse menu-dropdown mega-dropdown-menu"
						id="sidebarUI">
						<div class="row">
							<div class="col-lg-4">
								<ul class="nav nav-sm flex-column">
									<li class="nav-item"><a href="ui-alerts.html"
										class="nav-link" data-key="t-alerts">Alerts</a></li>
									<li class="nav-item"><a href="ui-badges.html"
										class="nav-link" data-key="t-badges">Badges</a></li>
									<li class="nav-item"><a href="ui-buttons.html"
										class="nav-link" data-key="t-buttons">Buttons</a></li>
									<li class="nav-item"><a href="ui-colors.html"
										class="nav-link" data-key="t-colors">Colors</a></li>
									<li class="nav-item"><a href="ui-cards.html"
										class="nav-link" data-key="t-cards">Cards</a></li>
									<li class="nav-item"><a href="ui-carousel.html"
										class="nav-link" data-key="t-carousel">Carousel</a></li>
									<li class="nav-item"><a href="ui-dropdowns.html"
										class="nav-link" data-key="t-dropdowns">Dropdowns</a></li>
									<li class="nav-item"><a href="ui-grid.html"
										class="nav-link" data-key="t-grid">Grid</a></li>
								</ul>
							</div>
							<div class="col-lg-4">
								<ul class="nav nav-sm flex-column">
									<li class="nav-item"><a href="ui-images.html"
										class="nav-link" data-key="t-images">Images</a></li>
									<li class="nav-item"><a href="ui-tabs.html"
										class="nav-link" data-key="t-tabs">Tabs</a></li>
									<li class="nav-item"><a href="ui-accordions.html"
										class="nav-link" data-key="t-accordion-collapse">Accordion
											& Collapse</a></li>
									<li class="nav-item"><a href="ui-modals.html"
										class="nav-link" data-key="t-modals">Modals</a></li>
									<li class="nav-item"><a href="ui-offcanvas.html"
										class="nav-link" data-key="t-offcanvas">Offcanvas</a></li>
									<li class="nav-item"><a href="ui-placeholders.html"
										class="nav-link" data-key="t-placeholders">Placeholders</a></li>
									<li class="nav-item"><a href="ui-progress.html"
										class="nav-link" data-key="t-progress">Progress</a></li>
									<li class="nav-item"><a href="ui-notifications.html"
										class="nav-link" data-key="t-notifications">Notifications</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-4">
								<ul class="nav nav-sm flex-column">
									<li class="nav-item"><a href="ui-media.html"
										class="nav-link" data-key="t-media-object">Media object</a></li>
									<li class="nav-item"><a href="ui-embed-video.html"
										class="nav-link" data-key="t-embed-video">Embed Video</a></li>
									<li class="nav-item"><a href="ui-typography.html"
										class="nav-link" data-key="t-typography">Typography</a></li>
									<li class="nav-item"><a href="ui-lists.html"
										class="nav-link" data-key="t-lists">Lists</a></li>
									<li class="nav-item"><a href="ui-general.html"
										class="nav-link" data-key="t-general">General</a></li>
									<li class="nav-item"><a href="ui-ribbons.html"
										class="nav-link" data-key="t-ribbons">Ribbons</a></li>
									<li class="nav-item"><a href="ui-utilities.html"
										class="nav-link" data-key="t-utilities">Utilities</a></li>
								</ul>
							</div>
						</div>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarAdvanceUI"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarAdvanceUI"> <i class="ri-stack-line"></i>
						<span data-key="t-advance-ui">Advance UI</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarAdvanceUI">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="advance-ui-sweetalerts.html"
								class="nav-link" data-key="t-sweet-alerts">Sweet Alerts</a></li>
							<li class="nav-item"><a href="advance-ui-nestable.html"
								class="nav-link" data-key="t-nestable-list">Nestable List</a></li>
							<li class="nav-item"><a href="advance-ui-scrollbar.html"
								class="nav-link" data-key="t-scrollbar">Scrollbar</a></li>
							<li class="nav-item"><a href="advance-ui-animation.html"
								class="nav-link" data-key="t-animation">Animation</a></li>
							<li class="nav-item"><a href="advance-ui-tour.html"
								class="nav-link" data-key="t-tour">Tour</a></li>
							<li class="nav-item"><a href="advance-ui-swiper.html"
								class="nav-link" data-key="t-swiper-slider">Swiper Slider</a></li>
							<li class="nav-item"><a href="advance-ui-ratings.html"
								class="nav-link" data-key="t-ratings">Ratings</a></li>
							<li class="nav-item"><a href="advance-ui-highlight.html"
								class="nav-link" data-key="t-highlight">Highlight</a></li>
							<li class="nav-item"><a href="advance-ui-scrollspy.html"
								class="nav-link" data-key="t-scrollSpy">ScrollSpy</a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="widgets.html"> <i
						class="ri-honour-line"></i> <span data-key="t-widgets">Widgets</span>
				</a></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarForms"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarForms"> <i class="ri-file-list-3-line"></i>
						<span data-key="t-forms">Forms</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarForms">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="forms-elements.html"
								class="nav-link" data-key="t-basic-elements">Basic Elements</a></li>
							<li class="nav-item"><a href="forms-select.html"
								class="nav-link" data-key="t-form-select"> Form Select </a></li>
							<li class="nav-item"><a href="forms-checkboxs-radios.html"
								class="nav-link" data-key="t-checkboxs-radios">Checkboxs &
									Radios</a></li>
							<li class="nav-item"><a href="forms-pickers.html"
								class="nav-link" data-key="t-pickers"> Pickers </a></li>
							<li class="nav-item"><a href="forms-masks.html"
								class="nav-link" data-key="t-input-masks">Input Masks</a></li>
							<li class="nav-item"><a href="forms-advanced.html"
								class="nav-link" data-key="t-advanced">Advanced</a></li>
							<li class="nav-item"><a href="forms-range-sliders.html"
								class="nav-link" data-key="t-range-slider"> Range Slider </a></li>
							<li class="nav-item"><a href="forms-validation.html"
								class="nav-link" data-key="t-validation">Validation</a></li>
							<li class="nav-item"><a href="forms-wizard.html"
								class="nav-link" data-key="t-wizard">Wizard</a></li>
							<li class="nav-item"><a href="forms-editors.html"
								class="nav-link" data-key="t-editors">Editors</a></li>
							<li class="nav-item"><a href="forms-file-uploads.html"
								class="nav-link" data-key="t-file-uploads">File Uploads</a></li>
							<li class="nav-item"><a href="forms-layouts.html"
								class="nav-link" data-key="t-form-layouts">Form Layouts</a></li>
							<li class="nav-item"><a href="forms-select2.html"
								class="nav-link" data-key="t-select2">Select2</a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarTables"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarTables"> <i class="ri-layout-grid-line"></i>
						<span data-key="t-tables">Tables</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarTables">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="tables-basic.html"
								class="nav-link" data-key="t-basic-tables">Basic Tables</a></li>
							<li class="nav-item"><a href="tables-gridjs.html"
								class="nav-link" data-key="t-grid-js">Grid Js</a></li>
							<li class="nav-item"><a href="tables-listjs.html"
								class="nav-link" data-key="t-list-js">List Js</a></li>
							<li class="nav-item"><a href="tables-datatables.html"
								class="nav-link" data-key="t-datatables">Datatables</a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarCharts"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarCharts"> <i class="ri-pie-chart-line"></i>
						<span data-key="t-charts">Charts</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarCharts">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="#sidebarApexcharts"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarApexcharts"
								data-key="t-apexcharts"> Apexcharts </a>
								<div class="collapse menu-dropdown" id="sidebarApexcharts">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="charts-apex-line.html"
											class="nav-link" data-key="t-line"> Line </a></li>
										<li class="nav-item"><a href="charts-apex-area.html"
											class="nav-link" data-key="t-area"> Area </a></li>
										<li class="nav-item"><a href="charts-apex-column.html"
											class="nav-link" data-key="t-column"> Column </a></li>
										<li class="nav-item"><a href="charts-apex-bar.html"
											class="nav-link" data-key="t-bar"> Bar </a></li>
										<li class="nav-item"><a href="charts-apex-mixed.html"
											class="nav-link" data-key="t-mixed"> Mixed </a></li>
										<li class="nav-item"><a href="charts-apex-timeline.html"
											class="nav-link" data-key="t-timeline"> Timeline </a></li>
										<li class="nav-item"><a
											href="charts-apex-candlestick.html" class="nav-link"
											data-key="t-candlstick"> Candlstick </a></li>
										<li class="nav-item"><a href="charts-apex-boxplot.html"
											class="nav-link" data-key="t-boxplot"> Boxplot </a></li>
										<li class="nav-item"><a href="charts-apex-bubble.html"
											class="nav-link" data-key="t-bubble"> Bubble </a></li>
										<li class="nav-item"><a href="charts-apex-scatter.html"
											class="nav-link" data-key="t-scatter"> Scatter </a></li>
										<li class="nav-item"><a href="charts-apex-heatmap.html"
											class="nav-link" data-key="t-heatmap"> Heatmap </a></li>
										<li class="nav-item"><a href="charts-apex-treemap.html"
											class="nav-link" data-key="t-treemap"> Treemap </a></li>
										<li class="nav-item"><a href="charts-apex-pie.html"
											class="nav-link" data-key="t-pie"> Pie </a></li>
										<li class="nav-item"><a href="charts-apex-radialbar.html"
											class="nav-link" data-key="t-radialbar"> Radialbar </a></li>
										<li class="nav-item"><a href="charts-apex-radar.html"
											class="nav-link" data-key="t-radar"> Radar </a></li>
										<li class="nav-item"><a href="charts-apex-polar.html"
											class="nav-link" data-key="t-polar-area"> Polar Area </a></li>
									</ul>
								</div></li>
							<li class="nav-item"><a href="charts-chartjs.html"
								class="nav-link" data-key="t-chartjs"> Chartjs </a></li>
							<li class="nav-item"><a href="charts-echarts.html"
								class="nav-link" data-key="t-echarts"> Echarts </a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarIcons"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarIcons"> <i class="ri-compasses-2-line"></i>
						<span data-key="t-icons">Icons</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarIcons">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="icons-remix.html"
								class="nav-link" data-key="t-remix">Remix</a></li>
							<li class="nav-item"><a href="icons-boxicons.html"
								class="nav-link" data-key="t-boxicons">Boxicons</a></li>
							<li class="nav-item"><a href="icons-materialdesign.html"
								class="nav-link" data-key="t-material-design">Material
									Design</a></li>
							<li class="nav-item"><a href="icons-lineawesome.html"
								class="nav-link" data-key="t-line-awesome">Line Awesome</a></li>
							<li class="nav-item"><a href="icons-feather.html"
								class="nav-link" data-key="t-feather">Feather</a></li>
							<li class="nav-item"><a href="icons-crypto.html"
								class="nav-link"> <span data-key="t-crypto-svg">Crypto
										SVG</span></a></li>
						</ul>
					</div></li>

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarMaps"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarMaps"> <i class="ri-map-pin-line"></i> <span
						data-key="t-maps">Maps</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarMaps">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="maps-google.html"
								class="nav-link" data-key="t-google"> Google </a></li>
							<li class="nav-item"><a href="maps-vector.html"
								class="nav-link" data-key="t-vector"> Vector </a></li>
							<li class="nav-item"><a href="maps-leaflet.html"
								class="nav-link" data-key="t-leaflet"> Leaflet </a></li>
						</ul>
					</div></li>
					
					

				<li style="display: none;" class="nav-item"><a
					class="nav-link menu-link" href="#sidebarMultilevel"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="sidebarMultilevel"> <i class="ri-share-line"></i>
						<span data-key="t-multi-level">Multi Level</span>
				</a>
					<div class="collapse menu-dropdown" id="sidebarMultilevel">
						<ul class="nav nav-sm flex-column">
							<li class="nav-item"><a href="#" class="nav-link"
								data-key="t-level-1.1"> Level 1.1 </a></li>
							<li class="nav-item"><a href="#sidebarAccount"
								class="nav-link" data-bs-toggle="collapse" role="button"
								aria-expanded="false" aria-controls="sidebarAccount"
								data-key="t-level-1.2"> Level 1.2 </a>
								<div class="collapse menu-dropdown" id="sidebarAccount">
									<ul class="nav nav-sm flex-column">
										<li class="nav-item"><a href="#" class="nav-link"
											data-key="t-level-2.1"> Level 2.1 </a></li>
										<li class="nav-item"><a href="#sidebarCrm"
											class="nav-link" data-bs-toggle="collapse" role="button"
											aria-expanded="false" aria-controls="sidebarCrm"
											data-key="t-level-2.2"> Level 2.2 </a>
											<div class="collapse menu-dropdown" id="sidebarCrm">
												<ul class="nav nav-sm flex-column">
													<li class="nav-item"><a href="#" class="nav-link"
														data-key="t-level-3.1"> Level 3.1 </a></li>
													<li class="nav-item"><a href="#" class="nav-link"
														data-key="t-level-3.2"> Level 3.2 </a></li>
												</ul>
											</div></li>
									</ul>
								</div></li>
						</ul>
					</div></li> -->

		</ul>
	</div>
	<!-- Sidebar -->
</div>

<div class="sidebar-background"></div>
</div>
<!-- Left Sidebar End -->
<!-- Vertical Overlay-->
<div class="vertical-overlay"></div>