var app=angular.module("App",[]);

app.controller("viewController",viewController);

app.constant("appUrl","http://localhost:8080/CareerVidhya_Operations8.0");




function viewController($http, appUrl,$scope)
{

	var currentScope=this;
	
	
	
	this.requestAllStudents=function(){
	$http.get(appUrl+"/viewAll").then(function(response){
		currentScope.studentsList=response.data["studentsList"];
		
		//currentScope.filteredData=currentScope.studentsList;
		//currentScope.JSONToCSVConvertor(currentScope.studentsList,"Testing",true);
	});
	};
	
	
	
	this.requestBatchStudents=function(batchNumber){
		$http.get(appUrl+"/viewBatch/"+batchNumber).then(function(response){
			currentScope.studentsList=response.data["studentsList"];
			//currentScope.filteredData=currentScope.studentsList;
		});
	};
	
	
	// Selection
	
	$scope.selectAll=function()
	{
		console.log("test checkbox");
		
		var source=$scope.checkAll;
		
		if(source)
			currentScope.filteredData=$scope.fstudentsList.slice();
		else
			currentScope.filteredData=[];
		
		console.log("test checkbox"+source);
		 var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		    for (var i = 0; i < checkboxes.length; i++) {
		    	if (checkboxes[i].checked != source)
	        	{
	            	checkboxes[i].checked = source;
	        	}
		    	}
	};
	
	
	// Add or Remove
	
	this.checkStudent=function(st,event)
	{
		var element=event.currentTarget;
		var isFound=false;
		var index=-1;
			    for(var i=0;i<currentScope.filteredData.length;i++)
			    	{
			    	  if(currentScope.filteredData[i].email==st.email)
			    		  {
			    		  isFound=true;
			    		  index=i;
			    		  }
			    	}
			    if(!isFound)
			    	{
			    	 if(element.checked)
			    		 currentScope.filteredData.push(st);
			    	}
			    else
			    	{
			    	if(!element.checked)
			    		 currentScope.filteredData.splice(index,1);
			    	}
			
		
	
			
			
	};
	
	// Filter Students Data
	
	$scope.sscFilter=function(st)
	{
		
		return $scope.SSC<=st.sscPercentage;
	};
	
	$scope.interFilter=function(st)
	{
		
		return $scope.inter<=st.interPercentage;
	};
	
	$scope.aggregateFilter=function(st)
	{
		
		return $scope.aggregate<=st.aggregate;
	};
	
	$scope.degreeFilter=function(st)
	{
		
		return $scope.degree<=st.graduationPercentage;
	};
	
	$scope.fee=-1;
	$scope.feeFilter=function(st)
	{
		if($scope.fee==-1)
			return true;
		else if($scope.fee==1)
			return st.feeTotal==st.feePaid;
		else if($scope.fee==0)
			return st.feePaid==0;
		else
			return st.feePaid!=0;
	}
	
	
	
	
	
	
	this.JSONToCSVConvertor=function () {
	    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
		
		var JSONData=currentScope.filteredData;
		var ReportTitle="students_list"+new Date();
		var ShowLabel=true;
		
	    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
	    
	    var CSV = '';    
	    //Set Report title in first row or line
	    
	    CSV += ReportTitle + '\r\n\n';

	    //This condition will generate the Label/Header
	    if (ShowLabel) {
	        var row = "";
	        
	        //This loop will extract the label from 1st index of on array
	        for (var index in arrData[0]) {
	            
	            //Now convert each value to string and comma-seprated
	            row += index + ',';
	        }

	        row = row.slice(0, -1);
	        
	        //append Label row with line break
	        CSV += row + '\r\n';
	    }
	    
	    //1st loop is to extract each row
	    for (var i = 0; i < arrData.length; i++) {
	        var row = "";
	        
	        //2nd loop will extract each column and convert it in string comma-seprated
	        for (var index in arrData[i]) {
	            row += '"' + arrData[i][index] + '",';
	        }

	        row.slice(0, row.length - 1);
	        
	        //add a line break after each row
	        CSV += row + '\r\n';
	    }

	    if (CSV == '') {        
	        alert("Invalid data");
	        return;
	    }   
	    
	    //Generate a file name
	    var fileName = "MyReport_";
	    //this will remove the blank-spaces from the title and replace it with an underscore
	    fileName += ReportTitle.replace(/ /g,"_");   
	    
	    //Initialize file format you want csv or xls
	    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
	    
	    // Now the little tricky part.
	    // you can use either>> window.open(uri);
	    // but this will not work in some browsers
	    // or you will not get the correct file extension    
	    
	    //this trick will generate a temp <a /> tag
	    var link = document.createElement("a");    
	    link.href = uri;
	    
	    //set the visibility hidden so it will not effect on your web-layout
	    link.style = "visibility:hidden";
	    link.download = fileName + ".csv";
	    
	    //this part will append the anchor tag and remove it after automatic click
	    document.body.appendChild(link);
	    link.click();
	    document.body.removeChild(link);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	this.editFee=function(email)
	{
	
		 document.getElementById("feeUpdate_"+email).innerHTML="<input type='number' id='totalFee_"+email+"' value='20000'><i style='cursor:pointer;color:66ffff' ng-click='view.updateTotalFee()' class='fa fa-pencil-square' aria-hidden='true'></i>";
		 
		
	};
	
	
	
	
	
	
	
	this.updateTotalFee=function()
	{
		console.log(test);
		
		var val=document.getElementById('totalFee_'+email).value;
		$http.get(appUrl+"/updateTotalFee/"+email+"/"+val).then(function(data){
			
			data=JSON.parse(data);
			
			if(data["status"]){
				   document.getElementById('success').style.display='block';
				document.getElementById('reportT').innerHTML=data["notification"];
				$('#success').flash_message({
			        text: ' ',
			        how: 'append',
			        idR :'success'
			    });
				
				
				}
				else{
					document.getElementById('fail').style.display='block';
					document.getElementById('reportF').innerHTML=data["notification"];
					$('#fail').flash_message({
				        text: ' ',
				        how: 'append',
				        idR :'fail'
				    });
					
				}
			
			
		});
		
	};
	
}