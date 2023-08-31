

{{{ if config.searchEnabled }}}
<li component="sidebar/search" class="nav-item mx-2 search dropstart position-relative" title="[[global:header.search]]">
<form component="search/form" id="search-form" class="d-flex justify-content-end align-items-center" role="search" method="GET">
		<div component="search/fields" class="w-100" id="search-fields">
			<div class="d-flex gap-1">
				<input autocomplete="off" type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">

				<div class="btn-ghost advanced-search-link">
					<i class="fa fa-gears fa-fw text-muted"></i>
				</div>
			</div>

			<div id="quick-search-container" class="quick-search-container d-block mt-2 hidden">
				<div class="form-check filter-category mb-2 ms-2">
					<input class="form-check-input" type="checkbox" checked>
					<label class="form-check-label name text-sm"></label>
				</div>

				<div class="text-center loading-indicator"><i class="fa fa-spinner fa-spin"></i></div>
				<div class="quick-search-results-container"></div>
			</div>
			<button type="submit" class="btn btn-outline-secondary hide">[[global:search]]</button>
		</div>
	</form>
</li>
{{{ end }}}





<li component="sidebar/drafts" class="nav-item mx-2 drafts dropstart" title="[[global:header.drafts]]">
<!-- IMPORT partials/sidebar/drafts.tpl -->
</li>
<li component="notifications" class="nav-item mx-2 notifications dropstart" title="[[global:header.notifications]]">
<!-- IMPORT partials/sidebar/notifications.tpl -->
</li>
{{{ if canChat }}}
<li class="nav-item mx-2 chats dropstart" title="[[global:header.chats]]">
<!-- IMPORT partials/sidebar/chats.tpl -->
</li>
{{{ end }}}
<li id="user_label" class="nav-item mx-2 dropstart usermenu" title="{user.username}">
	<!-- IMPORT partials/sidebar/user-menu.tpl -->
</li>