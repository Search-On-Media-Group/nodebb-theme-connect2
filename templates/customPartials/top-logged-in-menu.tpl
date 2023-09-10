
<li component="sidebar/drafts" class="nav-item mx-2 drafts " title="[[global:header.drafts]]">
<!-- IMPORT partials/sidebar/drafts.tpl -->
</li>
<li component="notifications" class="nav-item mx-2 notifications " title="[[global:header.notifications]]">
<!-- IMPORT partials/sidebar/notifications.tpl -->
</li>
{{{ if canChat }}}
<li class="nav-item mx-2 chats " title="[[global:header.chats]]">
<!-- IMPORT partials/sidebar/chats.tpl -->
</li>
{{{ end }}}
<li id="user_label" class="nav-item mx-2  usermenu" title="{user.username}">
	<!-- IMPORT partials/sidebar/user-menu.tpl -->
</li>