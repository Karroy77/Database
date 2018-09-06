 setInterval(function(){
	  var pg=document.getElementById("probar");
     
      var i=5;//获取导成功条数
 	  var total=20;//从后台获取总条数
 	  var bili=(i/total)*100;

      pg.style.width = bili+"%";
  pg.innerHTML = pg.style.width; 
},100)