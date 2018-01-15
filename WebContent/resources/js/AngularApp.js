var app=angular.module("App",[]);

app.controller("viewController",viewController);

app.constant("appUrl","http://localhost:8080/CareerVidhya_Operations8.0");




function viewController($http, appUrl,$scope)
{

	var currentScope=this;
	
	currentScope.filteredData=[];
	
	
	this.requestAllStudents=function(){
		$('#ajaxPageLoader').show();
	$http.get(appUrl+"/viewAll").then(function(response){
		currentScope.studentsList=response.data["studentsList"];
		$('#ajaxPageLoader').hide();
		//currentScope.filteredData=currentScope.studentsList;
		//currentScope.JSONToCSVConvertor(currentScope.studentsList,"Testing",true);
	});
	};
	
	
	
	this.requestBatchStudents=function(batchNumber){
		$('#ajaxPageLoader').show();
		$http.get(appUrl+"/viewBatch/"+batchNumber).then(function(response){
			currentScope.studentsList=response.data["studentsList"];
			$('#ajaxPageLoader').hide();
			//currentScope.filteredData=currentScope.studentsList;
		});
	};
	
	
	// Selection
	
	$scope.selectAll=function()
	{
		console.log("test checkbox");
		
		var source=$scope.checkAll;
		
		if(source){
			currentScope.filteredData=$scope.fstudentsList.slice();
		    console.log(currentScope.filteredData);
		}
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
	
	
	this.resetFilters=function()
	{
		$scope.fee=-1;
		$scope.degree=0;
		$scope.aggregate=0;
		$scope.inter=0;
		$scope.SSC=0;
		$scope.genderI="";
		$scope.graduationType="";
		$scope.branchName="";
		$scope.yearOfPass="";
		$scope.studentName="";
	}
	
	
	
	
	
	this.JSONToCSVConvertor=function () {
	    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
		
		var JSONData=currentScope.filteredData.slice();
		 var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
		
		 
		 
		var checkBoxes=document.getElementsByName("fieldToSelect");
		console.log(checkBoxes);
		
		//Delete Fields
		for(var k=0;k<arrData.length;k++)
			{
		delete arrData[k].student_id;
		delete arrData[k].isRegistered;
		delete arrData[k].houseNo;
		delete arrData[k].city;
		delete arrData[k].state;
		delete arrData[k].attendancePerc;
		delete arrData[k].password_hash;
		delete arrData[k].attendance;
		delete arrData[k].$$hashKey;
		
			}
		
		
		
		for(var i=0;i<checkBoxes.length;i++)
			{
			  if(!checkBoxes[i].checked)
				  {
				  for(var l=0;l<arrData.length;l++){
				  switch(parseInt(checkBoxes[i].value))
				  {
				  case 0: delete arrData[l].fullName; break;
				  case 2: delete arrData[l].batchNumber; break;
				  case 3: delete arrData[l].email; break;
				  case 4: delete arrData[l].parentName; break;
				  case 6: delete arrData[l].mobile; break;
				  case 7: delete arrData[l].gender; break;
				  case 8: delete arrData[l].dob; break;
				  case 9: delete arrData[l].graduationCity; break;
				  case 11: delete arrData[l].locality; break;
				  case 14: delete arrData[l].mobile_Parent; break;
				  case 15: delete arrData[l].feePaid; break;
				  case 16: delete arrData[l].feeTotal; break;
				  case 17: delete arrData[l].sscPercentage; break;
				  case 18: delete arrData[l].interPercentage; break;
				  case 19: delete arrData[l].graduationPercentage; break;
				  case 20: delete arrData[l].graduationCollege; break;
				  case 21: delete arrData[l].graduationYOP; break;
				  case 22: delete arrData[l].graduationType; break;
				  case 23: delete arrData[l].graduationBranch; break;
				  case 26: delete arrData[l].aggregate; break;
				  case 28: delete arrData[l].joinDate;
				  
				  }
				  }
				  }
			}
		
		
		console.log(arrData);
		
		var ReportTitle="students_list"+new Date();
		var ShowLabel=true;
		
	   
	    
	    var CSV = '';    
	    //Set Report title in first row or line
	    
	    CSV += ReportTitle + '\r\n\n';

	    //This condition will generate the Label/Header
	    if (ShowLabel) {
	        var row = "";
	        
	        //This loop will extract the label from 1st index of on array
	        for (var index in arrData[0]) {
	            
	            //Now convert each value to string and comma-seprated
	        	//console.log("Now convert each value to string and comma-seprated");
	            row += index + ',';
	           // console.log(row);
	        }

	        row = row.slice(0, -1);
	        
	        //append Label row with line break
	        CSV += row + '\r\n';
	    }
	    
	    //1st loop is to extract each row
	    for (var i = 0; i < arrData.length; i++) {
	        var row = "";
	        
	        //2nd loop will extract each column and convert it in string comma-seprated
	       // console.log("2nd loop will extract each column and convert it in string comma-seprated");
	        for (var index in arrData[i]) {
	            row += '"' + arrData[i][index] + '",';
	          // console.log(row);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	this.showhide=function(e)
	{
		var e=document.getElementById(e);
		if(e.style.display=="none")
			e.style.display="block";
		else
			e.style.display="none";
		
	};
	
	
	
	
	
	
	
	
	// Fetch Report View Progress
	
	
	this.fetchReport=function(email){ 
		console.log(email);
		let url=appUrl+"/getStudentReport/"+email+"/any";
		if(document.getElementById(email+"Chart").style.display=="none")
			{
			document.getElementById("V"+email).style.display="none";
			document.getElementById(email+"Chart").style.display="block";
			
			$('#ajaxPageLoader').show();
			
	    $http.get(url).then(function(data) {
	    	console.log(data);
	    	//data = JSON.parse(data.data);
	    	data=data.data;
	    	console.log(data);
	    	if(data["scorePerc"]!=null)
	    		{
	    	displayChart(email+"ChartM",data["scorePerc"],"Students overall Exams %","Secured %","Lost %");
	    	document.getElementById(email+"ChartM").style.display='block';
	    	document.getElementById(email+"ChartMError").innerHTML="Student took  <strong>"+data["testCount"]+"</strong> exams in total";
	    	document.getElementById(email+"ChartMError").style.color='#908684';
	    	document.getElementById(email+"ChartMError").style.fontSize="16px";
	    		}
	    	else{
	    		document.getElementById(email+"ChartMError").innerHTML="<p style='color:#ff6666 !important;text-align:center !important;font-size:18px !important;'>Student might not taken any exam</p>";
	    	}
	    	if(data["attendancePerc"]!=-1){
	    	displayChart(email+"ChartA",data["attendancePerc"],"Students overall attendance %","Present %","Absent %");
	    	document.getElementById(email+"ChartA").style.display='block';
	    	}else{
	    		document.getElementById(email+"ChartAError").innerHTML="<p style='color:#ff6666 !important;text-align:center !important;font-size:18px !important;'>Attendance of Student is not updated</p>";
	    	}
	    	$('#ajaxPageLoader').hide();
	    });
			}
		
		else{
			document.getElementById(email+"Chart").style.display="none";
		}
	}
	
	
	this.displayD=function (e)
	{
		console.log(e);

		if(document.getElementById(e).style.display=='none')
			document.getElementById(e).style.display='block';
		else
			document.getElementById(e).style.display='none';
	}
	
	this.convertToInt=function(v)
	{
		return parseInt(v);
	}
	
	
	this.updateFee=function(t)
	{
		console.log("Test fee Pay");
		if(t.feePaid>=t.feeTotal)
		{
		alert("fee already paid");
		}
	else if(document.getElementById(t.email+"Fee").value!=""){
		var v=document.getElementById(t.email+"Fee").value;
		var pay=v;
		v= parseInt(v)+parseInt(t.feePaid);
		//document.getElementById("feeLoad").style.display='block';
		if(confirm("Are you confirm that student"+t.fullName+" is paying"+pay+" Rupees?"))
			{
			
			
		//sendData("updateFee/"+t.email,"/"+v,"feeLoad",-1);
		
		 $http.get("updateFee/"+t.email+"/"+v).then(function(data) {
			 
			 data=data.data;
			 
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
		
		//document.getElementById("feeLoad").style.display='none';
		//document.getElementById(e).style.display='none';
		 });
		
			}
	}
		
	}
	
	this.updateTotalFee=function(email)
	{
	
		
		var val=document.getElementById('totalFee_'+email).value;
		$http.get("updateTotalFee/"+email+"/"+val).then(function(data){
			
			data=data.data;
			
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
	
	
	this.studentDetails=function(student)
	{
	  currentScope.student=student;
	  document.getElementById('viewMore_Student').style.display="block";
	}
	
}