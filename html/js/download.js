 

function getTable(){
    //清空表格
    var tb = document.getElementById('tableExcel');
    tb.innerHTML=''
    //增加标题
    var tableName;
    var thisTable=document.getElementById('tableExcel');
    tableName=document.getElementById("txt_ide").value;
    var tableTitle=thisTable.createCaption("tableTitle");
   // $("#tableTitle").html(tableName);
    tableTitle.innerHTML=tableName;
    if(tableName=="tbATUHandOver")
    {


       var trNode=thisTable.insertRow(0);
       var tdNode0=trNode.insertCell(0);
       var tdNode1=trNode.insertCell(1);
       var tdNode2=trNode.insertCell(2);
       trNode.style.background="#A7C942";
       tdNode0.innerHTML="SSECTOR_ID";
       tdNode1.innerHTML="NSECTOR_ID";
       tdNode2.innerHTML="HOATT";
  }
  else if(tableName=="tbOptCell")
  {
       var trNode=thisTable.insertRow(0);
       var tdNode0=trNode.insertCell(0);
       var tdNode1=trNode.insertCell(1);
       var tdNode2=trNode.insertCell(2);
       trNode.style.background="#A7C942";
       tdNode0.innerHTML="SSECTOR_ID";
       tdNode1.innerHTML="EARFCN";
       tdNode2.innerHTML="CELL_TYPE";
  }
  else if(tableName=="tbAdjCell")
  {
       var trNode=thisTable.insertRow(0);
       var tdNode0=trNode.insertCell(0);
       var tdNode1=trNode.insertCell(1);
       var tdNode2=trNode.insertCell(2);
       var tdNode3=trNode.insertCell(3);
       trNode.style.background="#A7C942";
       tdNode0.innerHTML="S_SECTOR_ID";
       tdNode1.innerHTML="N_SECTOR_ID";
       tdNode2.innerHTML="S_EARFCN"; 
       tdNode3.innerHTML="N_EARFCN";
  }
}



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