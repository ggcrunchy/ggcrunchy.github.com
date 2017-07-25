// JavaScript Document
jQuery( document ).ready( function( $ ) {
	
	/*----------------------------------------------------*/
	/*	Corona User menu
	/*----------------------------------------------------*/
	var loggedOutUserMenu = '<a href="https://developer.coronalabs.com/user/login" id="" class="btn btn-primary btn-sm navbar-btn" target="_parent">Sign-in</a>';
	var loggedInUserMenu = '<div class="btn-group"><button type="button" class="btn btn-default btn-sm navbar-btn"><span class="glyphicon glyphicon-user"></span></button><button type="button" class="btn btn-default btn-sm navbar-btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button><ul id="top-user-nav-bar" class="dropdown-menu" role="menu">';

	if(typeof(inTrial) != 'undefined' && inTrial) {
	    loggedInUserMenu += '<li><a href="https://developer.coronalabs.com/downloads/daily-builds/" target="_parent" id="" class="top-user-links">Daily Builds</a></li>';
	} else {
	    loggedInUserMenu += '<li><a href="https://developer.coronalabs.com/downloads/daily-builds/" target="_parent" id="" class="top-user-links">Daily Builds</a></li>';
	}

	loggedInUserMenu += '<li><a href="http://docs.coronalabs.com" target="_blank" id="" class="top-user-links">Documentation</a></li><li><a href="http://forums.coronalabs.com/" target="_parent" id="" class="top-user-links">Forum</a></li><li><a href="https://developer.coronalabs.com/content/bug-submission" target="_parent" id="" class="top-user-links">Report A Bug</a></li><li class="divider"></li><li><a href="https://developer.coronalabs.com/user" target="_parent" id="" class="top-user-links">Account</a></li><li><a href="http://shared.coronalabs.com/process/user/logout/" target="_parent" id="" class="top-user-links">Log-out</a></li></ul>';
	loggedInUserMenu += '</div>';
	if(isUser) {
		$('#top-download-signin').addClass('hidden');
		$('#top-user-account').removeClass('hidden');
	    $('#top-user-account').html(loggedInUserMenu).fadeIn('fast');
	} else {
		$('#top-user-account').addClass('hidden');
		$('#top-download-signin').removeClass('hidden');
	    $('#top-download-signin').html(loggedOutUserMenu).fadeIn('fast');
	}

	/*----------------------------------------------------*/
	/*	Scroll Navbar
	/*----------------------------------------------------*/
	$(window).scroll(function(){	

		"use strict";	
	
		var b = $(window).scrollTop();
		
		if( b > 60 ){		
			$(".navbar").addClass("scroll-fixed-navbar");
		} else {
			$(".navbar").removeClass("scroll-fixed-navbar");
		}
		
	});	
	/*----------------------------------------------------*/
	/*	Sidebar Reveal
	/*----------------------------------------------------*/
	$(document).ready(function() {	
		"use strict";
		$("#sidebar-reveal").click(function() {
			$(".sidebar-content-inner").animate({right:'-4px'});
			$("#sidebar-hide").removeClass("hidden");
			$("#sidebar-reveal").addClass("hidden");
		});
		$("#sidebar-hide").click(function() {
			$(".sidebar-content-inner").animate({right:'-100%'});
			$("#sidebar-hide").addClass("hidden");
			$("#sidebar-reveal").removeClass("hidden");
		});
	});	
	/*----------------------------------------------------*/
	/*	Seach Menu Toggle
	/*----------------------------------------------------*/
	$(document).ready(function() {
		
		"use strict";	

		$('.search-link button').click(function() {
			$('#main-menu').addClass("hidden");
			$('#download-link').addClass("hidden");
			$('.search-link').addClass("hidden");
			$('#user-account-top-bar').addClass("hidden");
			$('.navbar-toggle').addClass("hidden");
			$('#search_form').removeClass("hidden");
		});		
		$('#search_form a.search-close').click(function() {
			$('#search_form').addClass("hidden");
			$('#main-menu').removeClass("hidden");
			$('#download-link').removeClass("hidden");
			$('.search-link').removeClass("hidden");
			$('.navbar-toggle').removeClass("hidden");
			$('#user-account-top-bar').removeClass("hidden");
		});		
	});
});
