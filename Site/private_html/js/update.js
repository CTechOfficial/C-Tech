


 function update(id){

    $.ajax({
        url: "update.php",
        type:"post",
       
        console.log(id);

        success: function(result){
            alert(result);
           
    	}
    });