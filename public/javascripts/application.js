// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function openInBackground(url, close){
  if(url.indexOf('<a href=') !=-1){
    url = url.substring(9,url.length-11);
    url = url.replace(/\&amp;/g,'&');
  }
  
  //alert(url);
  
  var openedWindow = window.open(url);
  
  if(close)
    openedWindow.close();
}