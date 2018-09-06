/* window.onload=function(){
        $.ajax({
          //  type:"get",
           // url:"/getTableData",
            data:{'2','3','5'},
            async: false,
            success:function (data) {
                //var data = eval('('+data+')');
                for(var i=0;i < data.length;i++){
                    var x=document.getElementById('tb').insertRow();
                    for(var j=0;j < data[i].length;j++){
                        var cell=x.insertCell();
                        cell.innerHTML=data[i][j];
                    }
                }
           }
        });
    }
*/

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

function getX(){
     $("#tableExcel  tr:not(:first)").html("");
    var x;
    x=document.getElementById("paraX").value;
    if (x=="") {
        alert("请输入x的值");
    }
    $("#cap").html("tbC2I3（x="+x+")");
}