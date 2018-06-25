//Producer check - sample - included in form-validate.js
$(document).ready(
			function() {

				function isProducerID(txtProducerID) {
					var listProducer = document.getElementById("listProducer");
					var i;
					for (i = listProducer.options.length - 1; i >= 0; i--) {
						if (listProducer.options[i].value == txtProducerID) {
							return true;
						}
					}
					return false;
				}
				$("#addProductForm").bind(
						{
							'submit' : function() {
								if (!isProducerID($("#producerID").val())){
									$('#error_producerID').html(
											'Không tồn tại nhà cung cấp này.');
									return false;
								}

								return true;
							},
						});
			});