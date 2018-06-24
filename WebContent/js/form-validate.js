$(document)
    .ready(
        function() {
            function validatePhone(txtPhone) {
                var filter = /^[0-9-+]+$/;
                if (filter.test(txtPhone + "") && txtPhone.length >= 10 &&
                    txtPhone.length < 12) {
                    return true;
                } else {
                    return false;
                }
            }

            function validateNumber(txtNumber) {
                var filter = /^[0-9]+$/;
                if (filter.test(txtNumber + "") && txtNumber.length > 0) {
                    return true;
                } else {
                    return false;
                }
            }

            $("#addCustomerForm")
                .bind({
                    'submit': function() {

                        if ($('#customerName').val() == '') {
                            $('#error_customerName')
                                .html(
                                    'Bạn không được bỏ trống trường này!');
                            return false;
                        }

                        if ($('#userName').val() == '') {
                            $('#error_userName')
                                .html(
                                    'Bạn không được bỏ trống trường này!');
                            return false;
                        }
                        if ($('#password').val() == '') {
                            $('#error_passWord')
                                .html(
                                    'Bạn không được bỏ trống trường này!');
                            return false;
                        }

                        if (!validatePhone($('#phoneNumber')
                                .val())) {
                            $('#error_phoneNumber')
                                .html(
                                    'Số điện thoại bạn nhập vào không phù hợp!');
                            return false;
                        }

                        return true;
                    },
                    'keydown': function() {
                        /*delay 1 keydown  
                        if ($('#customerName').val().length > 0) {
                              $('#error_customerName').html(
                                  '');
                          }*/
                        $('#customerName').on('input', function() {
                            $('#error_customerName').html(
                                '');
                        });

                        $('#userName').on('input', function() {
                            $('#error_userName').html(
                                '');
                        });

                        $('#password').on('input', function() {
                            $('#error_passWord').html(
                                '');
                        });

                        $('#phoneNumber').on('input', function() {
                            $('#error_phoneNumber').html(
                                '');
                        });



                    }
                });
            $("#addProductForm")
                .bind({
                    'submit': function() {

                        if ($('#productName').val() == '') {
                            $('#error_productName')
                                .html(
                                    'Bạn không được bỏ trống trường này!');
                            return false;
                        }

                        if (!validateNumber($('#price').val())) {
                            $('#error_price').html('Giá bạn nhập vào không phù hợp!');
                            return false;
                        }

                        if ($('#producerID').val() == '') {
                            $('#error_producerID')
                                .html(
                                    'Bạn không được bỏ trống trường này!');
                            return false;
                        }


                        return true;
                    },
                    'keydown': function() {
                        /*old way, will delay 1 keydown
                        / if ($('#productName').val().length > 0) {
                             $('#error_productName').html(
                                 '');
                         }*/
                        $('#productName').on('input', function() {
                            $('#error_productName').html(
                                '');
                        });
                        $('#price').on('input', function() {
                            $('#error_price').html(
                                '');
                        });
                        $('#producerID').on('input', function() {
                            $('#error_producerID').html(
                                '');
                        });



                    }
                });
        });