
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