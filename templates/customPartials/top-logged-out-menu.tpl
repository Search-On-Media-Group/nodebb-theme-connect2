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



{{{ if allowRegistration }}}
<li class="nav-item mx-2" title="[[global:register]]">
	<span class="text-xs visible-open">[[login:dont_have_account]]</span>
	<a class="nav-link nav-btn" href="{relative_path}/register">
		<span class="d-flex gap-2 align-items-center text-nowrap truncate-open">
			<span class="position-relative">
				<i class="fa fa-fw fa-user-plus"></i>
			</span>
			<span class="nav-text small visible-open fw-semibold">[[global:register]]</span>
		</span>
	</a>
</li>

{{{ end }}}

<li class="nav-item mx-2 order-last order-md-first" title="[[global:login]]">
	<a class="nav-link nav-btn" href="{relative_path}/login">
		<span class="d-flex gap-2 align-items-center text-nowrap truncate-open">
			<span class="position-relative">
				<i class="fa fa-fw fa-sign-in"></i>
			</span>
			<span class="nav-text small visible-open fw-semibold">[[global:login]]</span>
		</span>
	</a>
</li>

