$('document').ready(function () {
    $("select#product_state").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#product_city option").remove();
            var row = "<option value=\"" + "" + "\">" + "city" + "</option>";
            $(row).appendTo("select#product_city");
        } else {
            // Send the request and update city dropdown
            getCitiesOfState(id_value_string)

        }
    });

    function getCitiesOfState(val) {
        $.ajax({
            dataType: "json",
            cache: false,
            beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
            url: '/get_cities_by_state',
            type: 'post',
            data: { "state": val },
            timeout: 5000,
            error: function (XMLHttpRequest, errorTextStatus, error) {
                alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function (data) {
                var citySelect = $("select#product_city");
                citySelect.find('option').remove();
                citySelect.filteringSelect("destroy");
                $.each(data, function (i, j) {
                    citySelect.append('<option value=' + j.id + '>' + j.name + '</option>')
                });
                citySelect.filteringSelect();
            }
        });
    }

    $("select#product_city").change(function () {
        var city_id = $(this).val();
        if (city_id == "") {
            $("select#product_area option").remove();
            var row = "<option value=\"" + "" + "\">" + "city" + "</option>";
            $(row).appendTo("select#product_area");
        } else {
            // Send the request and update city dropdown
            getAreasOfCity(city_id)

        }
    });

    function getAreasOfCity(id) {
        $.ajax({
            dataType: "json",
            cache: false,
            beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
            url: '/get_areas_by_city',
            type: 'post',
            data: { "city": id },
            timeout: 5000,
            error: function (XMLHttpRequest, errorTextStatus, error) {
                alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function (data) {
                var areaSelect = $("select#product_area");
                areaSelect.find('option').remove();
                areaSelect.filteringSelect("destroy");
                $.each(data, function (i, j) {
                    areaSelect.append('<option value=' + j.id + '>' + j.name + '</option>')
                });
                areaSelect.filteringSelect();
            }
        });
    }

});