<div class="row">
    <nav style="width: 1220px;" class="navbar navbar-info re-navbar">
        <div class="container-fluid re-container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->

            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">--- Menu ---</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div style="width: 1440px;" class="collapse navbar-collapse re-navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul style="width: 70%;" class="nav navbar-nav">

                    <li><a style="padding: 0;margin-right: 15px;" href="http://barbershop.com/Barbershop/" ; ?><img src="<?php echo base_url(); ?>images/barbershop_logo.png" alt="" class="img-responsive"></a></li>
                    <li class="active"><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ<span class="sr-only">(current)</span></a></li>

                    <li><a href="http://barbershop.com/Barbershop/appointment.php" target="_blank">Đặt lịch</a></li>
                    <li><a href="<?php echo base_url('moi'); ?>">Sản phẩm mới</a></li>
                    <li><a href="<?php echo base_url('ban-chay'); ?>">Bán chạy</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sản phẩm<span class="caret"></span></a>
                        <ul class="dropdown-menu" id="re-dropdown-menu">
                            <?php
                            foreach ($catalog as $value) {
                                $name = covert_vi_to_en($value->name);
                                $name = strtolower($name);
                            ?>
                                <li><a style="padding: 10px 20px;" href="<?php echo base_url($name . '-c' . $value->id); ?>"><?php echo $value->name; ?></a></li>
                            <?php } ?>
                        </ul>
                    </li>
                    <li><a href="<?php echo base_url('khuyen-mai'); ?>">Khuyến mãi</a></li>
                    <li style="padding-top: 7px;margin-left: 10px">
                        <form method="post" action="<?php echo base_url('product/search_name'); ?>">
                            <button class="btn-search_info" type="submit"><i class="fa fa-search"></i></button>
                            <input id="seach_info" type="text" name="search" placeholder="Tìm kiếm..">
                        </form>
                    </li>
                </ul>
                <ul style="width: 30%;" class="nav navbar-nav navbar-right">
                    <?php $this->load->view('site/cart/cart_sh'); ?>

                    <?php if (!isset($user)) { ?>
                        <li><a href="<?php echo base_url('dang-nhap'); ?>">Đăng nhập</a></li>
                    <?php } else { ?>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $user->name; ?><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<?php echo base_url('user'); ?>">Tài khoản</a></li>
                                <li role="separator" class="divider"></li>


                                <li><a href="<?php echo base_url('user/logout'); ?>">Đăng xuất</a></li>
                            </ul>
                        </li>
                    <?php } ?>
                </ul>
            </div><!-- /.navbar-collapse -->

        </div><!-- /.container-fluid -->
    </nav>
</div>