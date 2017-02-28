/**
 * Created by duckstab on 2/24/17.
 */

/** Taken verbatim from:
    https://www.driftingruby.com/episodes/capturing-signatures-with-signature-pad
    and
    https://github.com/driftingruby/044-capturing-signatures-with-signature-pad **/

function resizeCanvas(canvas) {
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    canvas.width = canvas.offsetWidth * ratio;
    canvas.height = canvas.offsetHeight * ratio;
    canvas.getContext("2d").scale(ratio, ratio);
}

$(document).ready(function() {
    var canvas = document.querySelector("canvas");
    if (canvas){
        canvas.height = canvas.offsetHeight;
        canvas.width = canvas.offsetWidth;
        window.onresize = resizeCanvas(canvas);
        resizeCanvas(canvas);
        signature_pad = new SignaturePad(canvas);
        $('.signature_pad_clear').click(function() { signature_pad.clear() });
        $('.signature_pad_save').click(function(event) {
            if (signature_pad.isEmpty()){
                alert('No signature entered');
                event.preventDefault();
            } else {
                $('.signature_pad_input').val(signature_pad.toDataURL());
            }
        });
    }
});
