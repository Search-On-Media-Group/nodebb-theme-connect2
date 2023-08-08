<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
<div class="row py-2">
	<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
		{{{ if pagination.pages.length }}}
		<div><!-- IMPORT partials/category/selector-dropdown-left.tpl --></div>
		{{{ end }}}
		
		<ul class="main-categories-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList">
			{{{ each categories }}}
				<li>
					<div class="main-categories-list-title bg-primary text-white d-flex gap-2 gap-lg-3">
						<div class="flex-shrink-0">
							<div class="main-categories-ico">
							{buildCategoryIcon(@value, "44px", "bg-primary rounded-circle")}
							</div>
						</div>
						<div class="flex-grow-1 d-flex flex-wrap gap-1">
							<h2 class="title text-break fs-4 fw-semibold m-0 tracking-tight w-100">
								<!-- IMPORT partials/categories/link.tpl -->
							</h2>
						</div>
					</div>
					{{{ if ./children.length }}}
						<ul class="categories-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList">
							{{{ each ./children }}}
						
							
							<!-- IMPORT partials/categories/item.tpl -->
							{{{ end }}}	
						</ul>
						
					{{{ end }}}
				</li>
			{{{ end }}}
		</ul>

		<!-- IMPORT partials/paginator.tpl -->
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{ each widgets.sidebar }}}
		{{widgets.sidebar.html}}
		{{{ end }}}
	</div>
</div>
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
