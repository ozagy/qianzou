$(function(){
	
	var base_url = 'http://'+window.location.host;
    $('.upload').bootstrapFileInput();
		
	$('#title').click(function(){ window.location = base_url; });
	$('#nav-home').click(function(){ window.location = base_url; });
	$('#nav-about').click(function(){ window.location = base_url+'/about.html'; });
	$('#nav-gallery').click(function(){ window.location = base_url+'/gallery.html'; });
	$('#nav-contacts').click(function(){ window.location = base_url+'/contacts.html'; });
	
	
});
