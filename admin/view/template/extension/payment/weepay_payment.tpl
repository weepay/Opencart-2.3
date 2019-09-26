<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-free-checkout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if ($error_version) { ?>
            <div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_version; ?> <a href="<?php echo $version_update_link; ?>"><i class="fa fa-arrow-down"></i> <?php echo $weepay_update_button; ?></a> <?php echo $weepay_or_text; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-free-checkout" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-api" data-toggle="tab" aria-expanded="true"><?php echo $text_tabapi; ?></a></li>
                        <li class=""><a href="#tab-about" data-toggle="tab" aria-expanded="true"><?php echo $text_tababout; ?></a></li>

                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane  active" id="tab-api">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_bayiid"> <?php echo $entry_bayiid; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="weepay_payment_bayiid" value="<?php echo $weepay_payment_bayiid; ?>" class="form-control"/>
                                    <?php if ($error_bayiid) { ?>
                                        <span class="text-danger"><?php echo $error_bayiid; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_api">  <?php echo $entry_api; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="weepay_payment_api" value="<?php echo $weepay_payment_api; ?>" class="form-control"/>
                                    <?php if ($error_api) { ?>
                                        <span class="text-danger"><?php echo $error_api; ?></span>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_secret">  <?php echo $entry_secret; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="weepay_payment_secret" value="<?php echo $weepay_payment_secret; ?>" class="form-control"/>
                                    <?php if ($error_secret) { ?>
                                        <span class="text-danger"><?php echo $error_secret; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="weepay_payment_status" class="form-control">
                                        <?php if ($weepay_payment_status) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_installement"><?php echo $entry_installement; ?></label>
                                <div class="col-sm-10">
                                    <select name="weepay_payment_installement" class="form-control">
                                        <?php if ($weepay_installement == "OFF") { ?>
                                            <option value="ON"><?php echo $text_enabled; ?></option>
                                            <option value="OFF" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="ON" selected="selected"><?php echo $text_enabled ?></option>
                                            <option value="OFF"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_form_type"><?php echo $entry_form_type; ?></label>
                                <div class="col-sm-10">
                                    <select name="weepay_payment_form_type" class="form-control">
                                        <?php if ($weepay_payment_form_type == "responsive") { ?>
                                            <option value="popup"><?php echo $entry_class_popup ?></option>
                                            <option value="responsive" selected="selected"><?php echo $entry_class_responsive; ?></option>
                                        <?php } else { ?>
                                            <option value="popup" selected="selected"><?php echo $entry_class_popup ?></option>
                                            <option value="responsive"><?php echo $entry_class_responsive; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_test_mode"><?php echo $entry_test_mode; ?></label>
                                <div class="col-sm-10">
                                    <select name="weepay_payment_test_mode" class="form-control">
                                        <?php if ($weepay_payment_test_mode == "OFF") { ?>
                                            <option value="ON"><?php echo $text_enabled; ?></option>
                                            <option value="OFF" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="ON" selected="selected"><?php echo $text_enabled ?></option>
                                            <option value="OFF"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_order_status_id">
                                    <span data-toggle="tooltip" title="<?php echo $entry_order_status; ?>">
                                        <?php echo $entry_order_status; ?>
                                    </span>
                                </label>
                                <div class="col-sm-10">
                                    <select name="weepay_payment_order_status_id" id="input-order-status" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                            <?php if ($order_status['order_status_id'] == $weepay_payment_order_status_id) { ?>
                                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="weepay_payment_cancel_order_status_id"><span data-toggle="tooltip" title="<?php echo $entry_cancel_order_status; ?>"><?php echo $entry_cancel_order_status; ?></span></label>
                                <div class="col-sm-10">
                                    <select name="weepay_payment_cancel_order_status_id" id="input-cancel-order-status" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                            <?php if ($order_status['order_status_id'] == $weepay_payment_cancel_order_status_id) { ?>
                                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="weepay_payment_sort_order" value="<?php echo $weepay_payment_sort_order; ?>" size="1" class="form-control"/>
                                </div>
                            </div>


                        </div>
                </form>





                <div class="tab-pane" id="tab-about">
                    <div class="panel">
                        <div class="row kahvedigital_weepay-header">
                            <img src="../catalog/view/theme/default/image/weepay_payment/weepos-logo.png" class="col-xs-4 col-md-2 text-center" id="payment-logo" />
                            <div class="col-xs-6 col-md-5 text-center">
                                <h4>weepay Ödeme Hizmetleri</h4>
                                <h4>Hızlı Güvenli ve Kolay</h4>
                            </div>
                            <div class="col-xs-12 col-md-5 text-center">
                                <a href="https://weepay.co" class="btn continue-button" id="create-account-btn">weePos'a başvurun</a><br />
                                weePos'unuz varsa ?<a href="https://pos.weepay.co"> Hesabınıza giriş yapın</a>
                            </div>
                        </div>

                        <hr />


                        <div class="kahvedigital_weepay-content">
                            <div class="row">
                                <div class="col-md-4 col-sm-4">
                                    <div class="thumbnail">
                                        <figure class="figure text-center">
                                            <img src="../catalog/view/theme/default/image/weepay_payment/ertesigun-icon.svg" width="140" height="100"/>
                                        </figure>
                                        <p class="text text-center">
                                            7x24 kesintisiz
                                            <br>Ertesi iş günü hesabınızda
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="thumbnail">
                                        <figure class="figure text-center">
                                            <img src="../catalog/view/theme/default/image/weepay_payment/hesaplisatis.svg" width="140" height="100"/>
                                        </figure>
                                        <p class="text text-center">
                                            Hesaplı
                                            <br>satış avantajı
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="thumbnail">
                                        <figure class="figure text-center">
                                            <img src="../catalog/view/theme/default/image/weepay_payment/butunkredikartlari.svg" width="140" height="100"/>
                                        </figure>
                                        <p class="text text-center">
                                            Bütün kredi kartları için
                                            <br>taksitli satış imkanı
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="thumbnail">
                                        <figure class="figure text-center">
                                            <img src="../catalog/view/theme/default/image/weepay_payment/visamastercard.svg" width="140" height="100"/>
                                        </figure>
                                        <p class="text text-center">
                                            Visa ve MasterCard
                                            <br>tahsilat imkanı
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="thumbnail">
                                        <figure class="figure text-center">
                                            <img src="../catalog/view/theme/default/image/weepay_payment/dolareuro.svg" width="140" height="100"/>
                                        </figure>
                                        <p class="text text-center">
                                            Yabancı kartlar ile
                                            <br>işlem yapabilme
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="thumbnail">
                                        <figure class="figure text-center">
                                            <img src="../catalog/view/theme/default/image/weepay_payment/kolayentegrasyon.svg" width="140" height="100"/>
                                        </figure>
                                        <p class="text text-center">
                                            Hızlı ve kolay
                                            <br>entegrasyon
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </div>
                    </div>					





                </div>

            </div>	

        </div>

    </div>
</div>
</div>
</div>
</div>

<style>
    .continue-button {
        width: 280px;
        font-size: 16px;
        font-weight: 600;
        letter-spacing: -.33px;
        border-radius: 31px;
        background-image: linear-gradient(279deg,#5170e9 ,#12bbe2);
        height: 40px;
        line-height: 38px;
        border-radius: 100px;

        color: #fff;
        font-size: 16px;
        font-weight: 600;
        letter-spacing: -.33px;

        text-align: center;
        cursor: pointer;
        border: none;
        outline: 0;
        padding: 0 20px;
    }
    .zbtn {
        border: none;
        font-family: inherit;
        font-size: 13px;
        color: white !important;
        background: none;
        cursor: pointer;
        padding: 25px 80px;
        display: inline-block;

        margin: 15px 30px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        max-width: 350px;
        min-width: 350px;
        outline: none;
        position: relative;
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        transition: all 0.3s;
    }
    .btn-2a {
        border-radius: 0 0 5px 5px;
    }

    .btn-2a:hover {
        box-shadow: 0 4px #e91027;
        top: 2px;
    }

    .btn-2a:active {
        box-shadow: 0 0 #e91027;
        top: 6px;
    }
    .btn-2 {
        background: #ff2b42;
        color: #fff;
        box-shadow: 0 6px #e91027;
        -webkit-transition: none;
        -moz-transition: none;
        transition: none;
    }

</style>
<?php echo $footer; ?>


