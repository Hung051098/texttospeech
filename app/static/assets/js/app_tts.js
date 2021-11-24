"use strict";

var tts_global_base_url = $("#global_base_url").val();
var tts_global_caption_array = $("#global_caption").val().split("||");
var tts_language_list_json;

(function($){
	
	$.ajax({  // get language list and details, the result will be saved to local as a variable
        url: tts_global_base_url + "tts/get_language_detail/",
        async: false,
        dataType: "json",
        success: function(data) {
			tts_language_list_json = data;
        }
    });


	$('#tts_language').on("change", function(){
		$("#tts_engine_standard").prop("checked", true);
		$("#tts_engine_neural").prop("checked", false);
		tts_list_voice_builder($("#tts_language").val(), "standard");
		$("#tts_hidden_current_language").val($("#tts_language").val());
	});
	
	
	
	$('#tts_engine_standard').on("click", function(){
		$("#tts_engine_neural").prop("checked", false);
		tts_list_voice_builder($("#tts_language").val(), "standard");
	});
	
	
	
	$("#tts_engine_neural").on("click", function(){
		$("#tts_engine_standard").prop("checked", false);
		tts_list_voice_builder($("#tts_language").val(), "neural");
	});
	

	
	$('#tts_text').bind("input propertychange", function() {
		$("#tts_text_used").text(this.value.length);
		if (this.value.length > $("#tts_text_character_limit").text()) {
			var maximum_characters = $("#tts_text_character_limit").text();
			showMessage("warning", "", $('#maximum_characters_notice').val() + maximum_characters, "");
			this.value = this.value.substring(0, maximum_characters);
			$("#tts_text_used").text(maximum_characters);
		}
	});



	$("#tts_text_clear").on("click", function(){
		$("#tts_text").val("");
		$("#tts_text_used").text('0');
	});
	
	
	
	$("#tts_text").on("focusout", function() {
		$('#tts_text_input_position').val($('#tts_text').prop("selectionStart"));		
	});	



	$("#tts_text_pause").on("click", function(){
		var tts_text = $('#tts_text').val();
		var tts_text_input_position = $('#tts_text_input_position').val();
		var tts_text_left = tts_text.substring(0, tts_text_input_position);
		var tts_text_right = tts_text.substring(tts_text_input_position);
		tts_text = tts_text_left + '<break time="1s"/>' + tts_text_right;
		$('#tts_text').val(tts_text);
		$("#tts_text_used").text($('#tts_text').val().length);
		$('#tts_text').focus();
	});
	
	

	$("#tts_btn_synthesize_to_preview").on("click", function(){
		event.preventDefault();
		$('#tts_view_text').hide();
		$("#synthesize_type").val('preview');
		my_blockUI(180);
		$.ajax({
			type: 'post',
			async: true,
			url: $("#tts_start").attr("action"),
			data: $("#tts_start").serialize(),
			success: function(data) {
				var json = JSON.parse(data);
				if (json.result) {
					$("#tts_player").attr('controlsList', "nodownload");
					setTimeout(function(){
						$.unblockUI();
						play_file(json.tts_uri, '');
					}, $("#ttsc_preview_delay").val()*1000);
				}
				else {
					$.unblockUI();
					showMessage("warning", "", json.message, "");
					return;
				}
			}
		});	
	});



	$("#tts_btn_synthesize_to_file").on("click", function(){
		event.preventDefault();
		$("#synthesize_type").val('save');
		my_blockUI(180);
		$.ajax({
			type: 'post',
			url: $('#tts_start').attr('action'),
			data: $('#tts_start').serialize(),
			success: function(data) {
				var json = JSON.parse(data);
				$.unblockUI();
				if (json.result) {
					$("html, body").animate({scrollTop: $("#dataTable_list_tts").offset().top}, 500);
					$("#dataTable_list_tts").DataTable().ajax.reload();
				}
				else {
					showMessage("warning", "", json.message, "");
					return;
				}
			}
		});	
	});
	
	
	
	$("#tts_sync_aws, #tts_sync_google, #tts_sync_azure, #bulk_enable_aws ,#bulk_disable_aws ,#bulk_delete_aws, #bulk_enable_google, #bulk_disable_google, #bulk_delete_google, #bulk_enable_azure, #bulk_disable_azure, #bulk_delete_azure, #bulk_free, #bulk_payg, #bulk_revoke").on("click", function(){
		var id = this.id;
		Swal.fire({
			text: this.value,
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "Yes"
		}).then(function(result) {
			if (result.value) {
				my_blockUI(180);
				window.location.href = global_base_url + "tts/admin_resource_bulk_action/" + id;
			}
		});	
	});



	if ($("#dataTable_list_tts").length) {
		var columnDefs = [
		  {
			"targets": 0,
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).html(time_conversion(cellData, $("#timezone_offset").val(), $("#user_dateformat").val(), $("#user_timeformat").val()));
			}
		  },
		  {
			"targets": 3,
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).html(cellData.substring(0, 100) + "...");
			}
		  },
		  {
			"targets": 5,
			"createdCell": function (td, cellData, rowData, row, col) {
				var cellData_array = cellData.split(",");
				var play_btn = '<button type="button" onclick="play_file(\'' + cellData_array[1] + '\', \'' + cellData_array[0] + '\')" id="btn_play1" class="btn btn-light btn-sm mr-2"><i class="fa fa-play text-gray-500"></i></button>';
				var download_btn = '<a href="' + global_base_url + 'tts/download/' + cellData_array[0] + '" target="_blank" class="btn btn-light btn-sm mr-2"><i class="fa fa-download text-gray-500"></i></a>';
				var action_btn = renderDataTableButton(cellData_array[0], 'tts/view/', '', 'tts/remove/');
				$(td).html(play_btn + download_btn + action_btn);
			}
		  }
		];
		renderDataTable('dataTable_list_tts', 'query/tts_list/', columnDefs);
	}
	
	
	
	if ($("#dataTable_list_tts_admin").length) {
		var columnDefs = [
		  {
			"targets": 3,
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).html(cellData.substring(0, 100) + "...");
			}
		  },
		{
			"targets": 5,
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).html(renderDataTableButton(cellData, 'tts/admin_tts_view/', '', 'tts/remove/'));
			}
		}
		];
		renderDataTable('dataTable_list_tts_admin', 'query/tts_list_admin/', columnDefs);
	}
	
		
		
	if ($("#dataTable_tts_resource").length) {
		var columnDefs = [
		  {
			"targets": 0,
			"createdCell": function (td, cellData, rowData, row, col) {
				switch (cellData) {
					case '1' :
					  $(td).html('<span class="badge badge-success">Enabled</span>');
					  break;
					case '0' :
					  $(td).html('<span class="badge badge-warning">Disabled</span>');
					  break;
				}
			}
		  },
		  {
			"targets": 7,
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).html('<a href="' + global_base_url + 'tts/admin_resource_edit/' + cellData + '" target="_blank" class="btn btn-light btn-sm"><i class="fa fa-edit text-gray-500"></i></a>');
			}
		  }
		];
		renderDataTable('dataTable_tts_resource', 'query/tts_resource/', columnDefs);
	}
	
	
	
	$("#tts_listen_modal").on('hidden.bs.modal', function () {
		var player = document.getElementById("tts_player");
		player.pause();
	});
	
	
	
	if ($("#item_type").length && $("#purchase_times").length) {  //item_detail page loaded, for legacy reason ,need to check
		var act = $("#item_type").val();
		if (act == 'purchase') {
			$("#payment_item_row_recurring").hide();
			$("#renew_action option[value=3]").hide();
			$("#renew_action option[value=4]").hide();
		}
		else if (act == 'top-up') {
			$("#payment_item_row_recurring").hide();
			$("#payment_item_row_characters_limit").hide();
			$("#payment_item_row_actions").hide();
		}
		else if (act == 'subscription') {
			$("#payment_item_row_recurring").show();
			$("#renew_action option[value=1]").hide();
			$("#renew_action option[value=2]").hide();
		}
	}
	
	
	
	$("#item_type").on("change", function(){
		if ($("#purchase_times").length) {  //it's at item_detail page, for legacy reason ,need to check
			var act = $("#item_type").val();
			if (act == 'purchase') {
				$("#payment_item_row_recurring").hide();
				$("#payment_item_row_characters_limit").show();
				$("#payment_item_row_actions").show();
				$("#renew_action option[value=1]").show();
				$("#renew_action option[value=2]").show();
				$("#renew_action option[value=3]").hide();
				$("#renew_action option[value=4]").hide();
				$("#renew_action").val(1);
			}
			else if (act == 'top-up') {
				$("#payment_item_row_recurring").hide();
				$("#payment_item_row_characters_limit").hide();
				$("#payment_item_row_actions").hide();
			}
			else if (act == 'subscription') {
				$("#payment_item_row_recurring").show();
				$("#payment_item_row_characters_limit").show();
				$("#payment_item_row_actions").show();
				$("#renew_action option[value=1]").hide();
				$("#renew_action option[value=2]").hide();
				$("#renew_action option[value=3]").show();
				$("#renew_action option[value=4]").show();
				$("#renew_action").val(3);
			}
		}
	});
	
	
	
	tts_list_voice_builder($("#tts_hidden_current_language").val(), "standard");  //init when page is loaded
	
})(jQuery);



function tts_list_voice_builder(language_code, engine) {
	var voiceRadio = "", radio_id, radio_count = 0, engines, activate, checked, checked_set = false, tts_example_url, tts_example_field, placeholder = 'place_holder', div_col;
	if ($("#tts_voice_list").html() != "" && $("#tts_hidden_current_language").val() != language_code) { //language changed, clear the voice list area
		$("#tts_voice_list").html('');
	}
	$.each(tts_language_list_json, function(key, detail){
		engines = detail["engines"];
		if (detail["language_code"] == language_code) {
			if (engines.includes(engine)) {
				activate = "";
				if (detail["scheme"] == "aws") {
					tts_example_url = tts_global_base_url + "tts_file/example/aws_" + engine + "_" + detail["language_code"] + "_" + detail["voice_id"] + ".mp3";
				}
				else if (detail["scheme"] == "azure") {
					tts_example_url = tts_global_base_url + "tts_file/example/azure_" + detail["voice_id"] + ".mp3";
				}
				else {
					var google_voice_sample;
					(engine == 'standard') ? google_voice_sample = detail["voice_id"].replace('{{engine}}', 'Standard') : google_voice_sample = detail["voice_id"].replace('{{engine}}', 'Wavenet');
					tts_example_url = tts_global_base_url + "tts_file/example/" + google_voice_sample + ".wav";
				}
				tts_example_field = '<audio id="tts_example_audio_' + detail["ids"] + '" src="' + tts_example_url + '"></audio><span><i id="tts_example_play_button_' + detail["ids"] + '" onclick="play_example(\'' + detail["ids"] + '\')" class="far fa-play-circle ml-2 text-gray-500 hand-cursor"></i></span>'
			}
			else {
				tts_example_field = "";
				activate = "disabled";
			}
			radio_id = "radio_" + detail["ids"];
			if (activate == "" && checked_set == false) {
				checked = " checked";
				checked_set = true;
			}
			else {
				checked = "";
			}
			voiceRadio += '<div class="' + placeholder + '"><input type="radio" id="' + radio_id + '" name="tts_resource_ids" value="' + detail["ids"] + '" class="mr-2 mb-3" ' + activate + checked + '><label for="' + radio_id + '">' + detail["gender"] + ', ' + detail["name"] + ' </label>' + tts_example_field + '<br></div>';
			radio_count++;
		}
	});
	(radio_count > 10) ? div_col = 'col-lg-6 col-md-12' : div_col = 'col-lg-12';
	voiceRadio = voiceRadio.replaceAll('place_holder', div_col);
	$("#tts_voice_list").html("<div class=\"row\">" + voiceRadio + "</div>");
}



function play_example(ids) {
	$("#tts_example_play_button_" + ids).attr("class", "far fa-stop-circle ml-2 text-gray-500 hand-cursor");
	var audio = document.getElementById("tts_example_audio_" + ids);
	$("#tts_example_audio_" + ids).on("ended", function() {
		$("#tts_example_play_button_" + ids).attr("class", "far fa-play-circle ml-2 text-gray-500 hand-cursor");
	});
	audio.play();
}



function play_file(uri, ids) {
	$('#tts_listen_modal').modal('show');
	if (ids != '') {
		$("#tts_player").attr('controlsList', "");
		$('#tts_view_text').show();
		$('#tts_view_text').attr("href", global_base_url + "tts/view/" + ids);
	}
	$("#tts_player").attr("src", uri).trigger("play");
}




