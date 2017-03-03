/**
 * Created by duckstab on 2/24/17.
 */

var ready = function () {
    debugger;
    var canvas = document.querySelector("canvas");
    if (canvas) {
        debugger;
        canvas.height = canvas.offsetHeight;
        canvas.width = canvas.offsetWidth;
        var signature_pad = new SignaturePad(canvas);
        $('.signature_pad_clear').click(function () {
            signature_pad.clear()
        });
        $('.signature_pad_save').click(function (event) {
            if (signature_pad.isEmpty()) {
                alert('No signature entered');
                event.preventDefault();
            } else {
                $('.signature_pad_input').val(signature_pad.toDataURL());
            }
        });
    }
};

$(document).on('turbolinks:load', ready);