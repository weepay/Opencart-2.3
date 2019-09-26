
<style>
    .sk-cube8,.sk-cube7, .sk-cube4 {background-color:#12bde2!important;}.sk-cube-grid {   width: 40px;   height: 40px;   margin: 100px auto; }.sk-cube-grid .sk-cube {   width: 33%;   height: 33%;   background-color: #1f216e;   float: left;   -webkit-animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out;           animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out; }.sk-cube-grid .sk-cube1 {   -webkit-animation-delay: 0.2s;           animation-delay: 0.2s; } .sk-cube-grid .sk-cube2 {   -webkit-animation-delay: 0.3s;           animation-delay: 0.3s; } .sk-cube-grid .sk-cube3 {   -webkit-animation-delay: 0.4s;           animation-delay: 0.4s; } .sk-cube-grid .sk-cube4 {   -webkit-animation-delay: 0.1s;           animation-delay: 0.1s; } .sk-cube-grid .sk-cube5 {   -webkit-animation-delay: 0.2s;           animation-delay: 0.2s; } .sk-cube-grid .sk-cube6 {   -webkit-animation-delay: 0.3s;           animation-delay: 0.3s; } .sk-cube-grid .sk-cube7 {   -webkit-animation-delay: 0s;           animation-delay: 0s; } .sk-cube-grid .sk-cube8 {   -webkit-animation-delay: 0.1s;           animation-delay: 0.1s; } .sk-cube-grid .sk-cube9 {   -webkit-animation-delay: 0.2s;           animation-delay: 0.2s; }  @-webkit-keyframes sk-cubeGridScaleDelay {   0%, 70%, 100% {     -webkit-transform: scale3D(1, 1, 1);             transform: scale3D(1, 1, 1);   } 35% {     -webkit-transform: scale3D(0, 0, 1);             transform: scale3D(0, 0, 1);   } }  @keyframes sk-cubeGridScaleDelay {   0%, 70%, 100% {     -webkit-transform: scale3D(1, 1, 1);             transform: scale3D(1, 1, 1);   } 35% {     -webkit-transform: scale3D(0, 0, 1);      transform: scale3D(0, 0, 1);   } }.weelogo p{color:#1f216e;text-align:center;margin-top:-100px}.weelogo p span{color:#12bde2;}
</style>
<div id="loadingWeePay">
    <div class="sk-cube-grid"><div class="sk-cube sk-cube1"></div><div class="sk-cube sk-cube2"></div><div class="sk-cube sk-cube3"></div><div class="sk-cube sk-cube4"></div><div class="sk-cube sk-cube5"></div> <div class="sk-cube sk-cube6"></div><div class="sk-cube sk-cube7"></div><div class="sk-cube sk-cube8"></div><div class="sk-cube sk-cube9"></div></div>
    <div class="weelogo">
        <p><span>wee</span>pay</p>
        <?php if ($form_type == 'onepage') { ?>
            <br>
            <p style="margin:40px;font-size:16px;">Ödeme formu bilgilerinizi doldurup siparişi tamamla butonuna bastığınız zaman aktif olacaktır.</p>

        <?php } ?>
    </div>
</div>

<div class="weepay_form_payment" style="display:none;">
    <h2 style="" class='weepay-h'><?php echo $text_credit_card; ?></h2>
    <div class="weepay-form-content" id="payment"></div>
    <div id="weePay-checkout-form" class="<?php echo $form_class; ?>"></div>
</div>
<?php if ($cart_total == 0) { ?>
    <div class="weepay_payment_confirm">
        <div class="buttons">
            <div class="pull-right">
                <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="<?php echo $text_wait; ?>" />
            </div>
        </div>
    </div>

<?php } ?>
<script type="text/javascript">

    function getFormTokenCall(checkout) {

        if (typeof weePayUtilInıt != 'undefined') {
            delete weePayUtilInıt;
        }
        $.ajax({
            url: 'index.php?route=extension/payment/weepay_payment/checkoutform',
            type: 'post',
            dataType: 'json',
            cache: false,
            success: function (json) {

                if (json != null) {

                    if (typeof json.CheckoutFormData != "undefined" && json.CheckoutFormData != "") {

                        $(".weepay_form_payment").show(function () {

                            $('.weepay-form-content').append(json.CheckoutFormData);

                            $("#weePay-checkout-form").promise().done(function () {
                                $('#loadingWeePay').css('opacity', '0');
                            });

                        });

                        if (checkout == 'onepage') {
                            $(".checkout-loading").css("opacity", "100");
                            $("#payment-confirm-button").css("pointer-events", "visible");
                            $('#journal-checkout-confirm-button').css('display', 'none');
                        }
                    } else {

                        $(".weepay_form_payment").show();
                        $('.weepay-form-content').append('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>' + json.message + '</div>');
                           $('#loadingWeePay').css("opacity", "0");
                    
                    }
                } else {

                    $(".weepay_form_payment").show();
                    $('.weepay-form-content').append('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>Connection Error</div>');
                    $('#loadingWeePay').css("opacity", "0");
                }
            }
        });

    }


</script>



    <script>
        $(document).ready(function () {
            return getFormTokenCall('default');
        });
    </script>


