
function g(id){return document.getElementById(id);}


function showLogDialog(){

   // g("loginBox").style.opacity = "1";
   g("loginBox").style.visibility = "visible";
    g("logimg").style.display = "block";

}
 
function closeLogDialog(){
	//g("loginBox").style.opacity = "0";
    g("loginBox").style.visibility = "hidden";
    g("logimg").style.display = "none";
}
function showRegDialog(){
	 g("RegisterBox").style.visibility = "visible";
     g("logimg").style.display = "block";
}
function closeRegDialog(){
	g("RegisterBox").style.visibility = "hidden";
	 g("logimg").style.display = "none";
}


function submitLogin(){
  var name=document.getElementById("LogUserName").value;
  var password=document.getElementById("LogPassword").value;
  console.log(name);
  console.log(password);
}

function submitRegist(){
  var name=document.getElementById("RegUsername").value;
  var password=document.getElementById("RegPassword").value;
  console.log(name);
  console.log(password);
  var radio=document.getElementsByName("1");
  for(var i=0;i<radio.length;i++)
  {
    if(radio[i].checked)
    {
      console.log(radio[i].value);
    }
  }
}