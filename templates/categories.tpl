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
		<ul class="categories-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList">
			{{{ each categories }}}
			<!-- IMPORT partials/categories/item-c.tpl -->
			{{{ if ./children.length }}}
				<!-- IMPORT partials/categories/item.tpl -->
				{{{ each ./children }}}
					<div>
						<div class="d-flex align-items-start gap-1">
							<i class="fa fa-fw fa-caret-right text-primary mt-1"></i>
							<a href="{config.relative_path}/category/{./slug}" class="text-reset fw-semibold">{./name}</a>
						</div>
						{{{ if ./children.length }}}
							{{{ each ./children }}}
							<div class="d-flex align-items-start gap-1">
								<i class="fa fa-fw fa-caret-right text-primary mt-1"></i>
								<a href="{config.relative_path}/category/{./slug}" class="text-reset fw-semibold">{./name}</a>
							</div>
							{{{ end }}}
						{{{ end }}}
					</div>
				{{{ end }}}
			{{{ end }}}
			
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
