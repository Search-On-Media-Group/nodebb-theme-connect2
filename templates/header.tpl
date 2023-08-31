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
	<div class="layout-container d-flex justify-content-between pb-4 pb-md-0">
		<div>
			<!-- IMPORT partials/header/brand.tpl -->
		</div>
		<div>
			{{{ if config.loggedIn }}}
			<ul id="logged-in-menu" class="list-unstyled d-flex flex-row h-100 gap-2 ml-2">
			<!-- IMPORT customPartials/top-logged-in-menu.tpl -->
			</ul>
			{{{ else }}}
			<ul id="logged-out-menu" class="list-unstyled d-flex flex-rw h-100 gap-2 ml-2">
			<!-- IMPORT customPartials/top-logged-out-menu.tpl -->
			</ul>
			{{{ end }}}

		</div>
	</div>
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
