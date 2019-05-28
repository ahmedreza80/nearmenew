function getCitiesOfState(val){
    $.ajax({
      dataType: "json",
      cache: false,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/get_cities_by_state',
      type: 'post',
      data: {"state" : val},
      timeout: 5000,
      error: function(XMLHttpRequest, errorTextStatus, error) {
       alert("Failed to submit : " + errorTextStatus + " ;" + error);
      },
      success: function(data) {
       // Clear all options from city select
       $("select#city option").remove();
       //put in a empty default line
       // Fill city select

       var row = "<option value=\"" + "" + "\">" + "Select a city" + "</option>";
       $(row).appendTo("select#city");
       $.each(data, function(i, j) {
        if(j.id == selectedCity){
          row = "<option value=\"" + j.id + "\" selected>" + j.name + "</option>";
        }else{
          row = "<option value=\"" + j.id + "\">" + j.name + "</option>"; 
        }
        $(row).appendTo("select#city");
       });
      }
     });
   }

   function getAreasOfCity(val){
    $.ajax({
      dataType: "json",
      cache: false,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/get_areas_by_city',
      type: 'post',
      data: {"city" : val},
      timeout: 5000,
      error: function(XMLHttpRequest, errorTextStatus, error) {
       alert("Failed to submit : " + errorTextStatus + " ;" + error);
      },
      success: function(data) {
       // Clear all options from city select
       $("select#area option").remove();
       //put in a empty default line
       // Fill city select

       var row = "<option value=\"" + "" + "\">" + "Select a area" + "</option>";
       $(row).appendTo("select#area");
       $.each(data, function(i, j) {
        if(j.id == selectedArea){
          row = "<option value=\"" + j.id + "\" selected>" + j.name + "</option>";
        }else{
          row = "<option value=\"" + j.id + "\">" + j.name + "</option>"; 
        }
        $(row).appendTo("select#area");
       });
      }
     });
   }