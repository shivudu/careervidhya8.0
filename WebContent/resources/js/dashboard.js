/**
 * 
 */
app.controller("dashBoardController",dashBoardController);


function dashBoardController($http,appUrl,$scope,$window)
{
  var dScope=this;
  
  $('.progress .progress-bar').css("width",
          function() {
              return $(this).attr("aria-valuenow") + "%";
          }
      )
      
      dScope.getBatchProgress=function(batchNumber){
	  
	  
	   
	    $http.get("getProgress/"+batchNumber+"/Java").then(
	    function(response){
	    	console.log(response);
	    	dScope.javaPerc=parseInt((response.data.done*100)/response.data.total);
	    	console.log(dScope.javaPerc);
	    	
	    }		
	    );
	    
	    $http.get("getProgress/"+batchNumber+"/Comms").then(
	    	    function(response){
	    	    	console.log(response);
	    	    	dScope.commsPerc=parseInt((response.data.done*100)/response.data.total);
	    	    }		
	    	    );
	    $http.get("getProgress/"+batchNumber+"/Math").then(
	    	    function(response){
	    	    	console.log(response);
	    	    	dScope.mathPerc=parseInt((response.data.done*100)/response.data.total);
	    	    }		
	    	    );
	    $http.get("getProgress/"+batchNumber+"/MySql").then(
	    	    function(response){
	    	    	console.log(response);
	    	    	dScope.mySqlPerc=parseInt((response.data.done*100)/response.data.total);
	    	    }		
	    	    );
	    
	    $('.progress .progress-bar').css("width",
	            function() {
	                return $(this).attr("aria-valuenow") + "%";
	            }
	        )
	  
       }
  
  
  console.log(batchNos);
   (function(){
	   dScope.batchNumbers=batchNos;   		   
   })();
   
   dScope.getBatchProgress(batchNos[batchNos.length-2]);
}



app.controller("PieCtrl", function ($scope) {
	
	
	  $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
	  $scope.data = [300, 500, 100];
	  
	  
	});
