<li component="categories/category" data-cid="{./cid}" class="w-100 border-bottom pb-3 pb-lg-4 gap-1 category-{./cid} {./unread-class}">
	<meta itemprop="name" content="{./name}">

	<div class="d-flex gap-2 gap-lg-3 bg-primary text-white">
		<div class="flex-shrink-0">
			{buildCategoryIcon(@value, "46px", "bg-primary text-white rounded-circle")}
		</div>
		<div class="flex-grow-1 d-flex flex-wrap gap-1">
			<h2 class="title text-break fs-4 fw-semibold m-0 tracking-tight w-100">
				<!-- IMPORT partials/categories/link.tpl --> BB
			</h2>
		</div>
	</div>
	
</li>
