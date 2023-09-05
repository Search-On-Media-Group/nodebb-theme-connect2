'use strict';

$(document).ready(function () {
	setupMobileMenuTop();

	

	// require(['hooks'], function (hooks) {
	// 	$(window).on('action:composer.resize action:sidebar.toggle', function () {
	// 		const isRtl = $('html').attr('data-dir') === 'rtl';
	// 		const css = {
	// 			width: $('#panel').width(),
	// 		};
	// 		const sidebarEl = $('.sidebar-left');
	// 		css[isRtl ? 'right' : 'left'] = sidebarEl.is(':visible') ? sidebarEl.outerWidth(true) : 0;
	// 		$('[component="composer"]').css(css);
	// 	});

	// 	hooks.on('filter:chat.openChat', function (hookData) {
	// 		// disables chat modals & goes straight to chat page based on user setting
	// 		hookData.modal = config.theme.chatModals;
	// 		return hookData;
	// 	});
	// });

	function setupMobileMenuTop() {
		require(['hooks', 'api', 'navigator'], function (hooks, api, navigator) {
			$('[component="sidebar/toggle"]').on('click', async function () {
				const sidebarEl = $('.sidebar');
				sidebarEl.toggleClass('open');
				if (app.user.uid) {
					await api.put(`/users/${app.user.uid}/settings`, {
						settings: {
							openSidebars: sidebarEl.hasClass('open') ? 'on' : 'off',
						},
					});
				}
				$(window).trigger('action:sidebar.toggle');
				if (ajaxify.data.template.topic) {
					hooks.fire('action:navigator.update', { newIndex: navigator.getIndex() });
				}
			});

			const topBar = $('[component="topbar"]');
			const $body = $('body');
			const $window = $(window);
			$body.on('shown.bs.dropdown', '.sticky-tools', function () {
				topBar.addClass('hidden');
			});
			$body.on('hidden.bs.dropdown', '.sticky-tools', function () {
				topBar.removeClass('hidden');
			});
			function isSearchVisible() {
				return !!$('[component="topbar"] [component="sidebar/search"] .search-dropdown.show').length;
			}

			let lastScrollTop = 0;
			let newPostsLoaded = false;

			function onWindowScroll() {
				const st = $window.scrollTop();
				if (newPostsLoaded) {
					newPostsLoaded = false;
					lastScrollTop = st;
					return;
				}
				if (st !== lastScrollTop && !navigator.scrollActive && !isSearchVisible()) {
					const diff = Math.abs(st - lastScrollTop);
					const scrolledDown = st > lastScrollTop;
					const scrolledUp = st < lastScrollTop;
					if (diff > 5) {
						topBar.css({
							bottom: !scrolledUp && scrolledDown ?
								-topBar.find('.topbar-nav').outerHeight(true) :
								0,
						});
					}
				}
				lastScrollTop = st;
			}

			const delayedScroll = utils.throttle(onWindowScroll, 250);
			function enableAutohide() {
				$window.off('scroll', delayedScroll);
				if (config.theme.autohideBottombar) {
					lastScrollTop = $window.scrollTop();
					$window.on('scroll', delayedScroll);
				}
			}

			hooks.on('action:posts.loading', function () {
				$window.off('scroll', delayedScroll);
			});
			hooks.on('action:posts.loaded', function () {
				newPostsLoaded = true;
				setTimeout(enableAutohide, 250);
			});
			hooks.on('action:ajaxify.end', function () {
				$window.off('scroll', delayedScroll);
				topBar.css({ bottom: 0 });
				setTimeout(enableAutohide, 250);
			});
		});
	}


});
