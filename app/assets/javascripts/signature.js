/**
 * Created by duckstab on 2/24/17.
 */

var ready = function () {
    var canvas = document.querySelector("canvas");
    if (canvas) {
        canvas.height = canvas.offsetHeight;
        canvas.width = canvas.offsetWidth;
        var signature_pad = new SignaturePad(canvas);
        $('.signature_pad_clear').click(function () {
            signature_pad.clear()
        });
        $('.signature_pad_save').click(function (event) {
            $('.signature_pad_input').val(signature_pad.toDataURL());
        });

        $("#user_role_type_non_admin").click(function() {
            $("#signature_area").show();
            canvas.height = 150;
            canvas.width = 300;
            signature_pad.clear();
        });

        $("#user_role_type_admin").click(function() {
            $("#signature_area").hide();
        });
    }


};

$(document).on('turbolinks:load', ready);