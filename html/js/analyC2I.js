function insertRow(){
    var index=document.getElementById("tableExcel").rows.length;
    var insertRow=document.getElementById("tableExcel").insertRow(index);
    var x=insertRow.insertCell(0);//插到此行第0列
    var y=insertRow.insertCell(1);
    var z=insertRow.insertCell(2);

    x.innerHTML="1";
    y.innerHTML="2";
    z.innerHTML="3";

}

