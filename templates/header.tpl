<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
	<title>{browserTitle}</title>
	{{{each metaTags}}}{function.buildMetaTag}{{{end}}}
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};

		document.documentElement.style.setProperty('--panel-offset', `${localStorage.getItem('panelOffset') || 0}px`);
	</script>

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}}">
	<div class="connect-top-header layout-container d-flex align-items-center">
		<div class="d-flex  gap-3 brand-container-connect">
			{{{ if (brand:logo || config.showSiteTitle)}}}
					<div component="brand/wrapper" class="d-flex align-items-center gap-3 rounded-1 align-content-stretch ">
						{{{ if brand:logo }}}
						<a component="brand/anchor" href="{{{ if brand:logo:url }}}{brand:logo:url}{{{ else }}}{relative_path}/{{{ end }}}">
							<img component="brand/logo" alt="{brand:logo:alt}" class="{brand:logo:display}" src="{brand:logo}?{config.cache-buster}" />
						</a>
						{{{ end }}}

						{{{ if config.showSiteTitle }}}
						<a component="siteTitle" class="text-truncate align-self-stretch align-items-center d-flex" href="{{{ if title:url }}}{title:url}{{{ else }}}{relative_path}/{{{ end }}}">
							<h1 class="fs-6 fw-bold text-body mb-0">{config.siteTitle}</h1>
						</a>
						{{{ end }}}
					</div>
					{{{ if widgets.brand-header.length }}}
					<div data-widget-area="brand-header" class="flex-fill gap-3 p-2 align-self-center">
						{{{each widgets.brand-header}}}
						{{./html}}
						{{{end}}}
					</div>
					{{{ end }}}
				
			
			{{{ end }}}
		</div>
		<div class="pe-2 d-flex justify-content-between align-items-center " style="flex:1">
			<ul class="list-unstyled d-flex align-items-center flex-row h-100 gap-2 mb-0 ml-2">
				{{{ if config.searchEnabled }}}
				<li component="sidebar/search" class="nav-item mx-2 search dropstart position-relative" title="[[global:header.search]]">
				<form component="search/form" id="search-form" class="d-flex justify-content-end align-items-center" role="search" method="GET">
						<div component="search/fields" class="w-100" id="search-fields">
							<div class="input-group">
								<input autocomplete="off" type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">

								<div class="btn-ghost advanced-search-link">
									<i class="fa fa-gears fa-fw text-muted"></i>
								</div>
								<button type="submit" class="btn btn-ghost"><i class="fa fa-search fa-fw text-muted"></i></button>
							</div>

							<div id="quick-search-container" class="quick-search-container d-block hidden">
								<div class="form-check filter-category mb-2 ms-2">
									<input class="form-check-input" type="checkbox" checked>
									<label class="form-check-label name text-sm"></label>
								</div>

								<div class="text-center loading-indicator"><i class="fa fa-spinner fa-spin"></i></div>
								<div class="quick-search-results-container"></div>
							</div>
							
						</div>
					</form>
				</li>
				{{{ end }}}
			</ul>
			{{{ if config.loggedIn }}}
			<ul id="logged-in-menu" class="list-unstyled d-none d-lg-flex align-items-center flex-row h-100 gap-2 mb-0 ml-2">
			<!-- IMPORT customPartials/top-logged-in-menu.tpl -->
			</ul>
			{{{ else }}}
			<ul id="logged-out-menu" class="list-unstyled d-none d-lg-flex align-items-center flex-rw h-100 gap-2 mb-0 ml-2">
			<!-- IMPORT customPartials/top-logged-out-menu.tpl -->
			</ul>
			{{{ end }}}

		</div>
	</div>
	<!-- noIMPORT partials/header-connect.tpl -->
	<div class="layout-container d-flex justify-content-between pb-4 pb-md-0">
		<!-- IMPORT partials/sidebar-left.tpl -->

		<main id="panel" class="d-flex flex-column gap-3 flex-grow-1 mt-3" style="min-width: 0;">
			
			
			<script>
				const headerEl = document.getElementById('header-menu');
				if (headerEl) {
					const rect = headerEl.getBoundingClientRect();
					const offset = Math.max(0, rect.bottom);
					document.documentElement.style.setProperty('--panel-offset', offset + `px`);
				} else {
					document.documentElement.style.setProperty('--panel-offset', `0px`);
				}
			</script>
			<div class="container px-md-4 d-flex flex-column gap-3 h-100 mb-5 mb-lg-0" id="content">
			<!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->
