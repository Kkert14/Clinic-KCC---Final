<?= $this->extend('theme/template') ?>

<?= $this->section('content') ?>

<div class="content-wrapper">

    <div class="content-header">
        <div class="container-fluid">

            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Dashboard</h1>
                </div>

                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="<?= base_url('dashboard') ?>">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>

        </div>
    </div>


<section class="content">

<div class="container-fluid">

<div class="row">


<!-- Treatment Records -->
<div class="col-lg-3 col-6">

<div class="small-box bg-info">

<div class="inner">
<h3><?= $recordCount ?></h3>
<p>Treatment Records</p>
</div>

<div class="icon">
<i class="ion ion-bag"></i>
</div>

<a href="<?= base_url('record') ?>" class="small-box-footer">
More info <i class="fas fa-arrow-circle-right"></i>
</a>

</div>

</div>


<!-- Medicines (placeholder until medicine table ready) -->
<div class="col-lg-3 col-6">

<div class="small-box bg-success">

<div class="inner">
<h3>--</h3>
<p>Medicines</p>
</div>

<div class="icon">
<i class="ion ion-stats-bars"></i>
</div>

<a href="#" class="small-box-footer">
More info <i class="fas fa-arrow-circle-right"></i>
</a>

</div>

</div>


<!-- Users -->
<div class="col-lg-3 col-6">

<div class="small-box bg-warning">

<div class="inner">
<h3>--</h3>
<p>System Users</p>
</div>

<div class="icon">
<i class="ion ion-person-add"></i>
</div>

<a href="#" class="small-box-footer">
More info <i class="fas fa-arrow-circle-right"></i>
</a>

</div>

</div>


<!-- Equipment -->
<div class="col-lg-3 col-6">

<div class="small-box bg-danger">

<div class="inner">
<h3>--</h3>
<p>Clinic Equipment</p>
</div>

<div class="icon">
<i class="ion ion-pie-graph"></i>
</div>

<a href="#" class="small-box-footer">
More info <i class="fas fa-arrow-circle-right"></i>
</a>

</div>

</div>


</div>

</div>

</section>

</div>

<?= $this->endSection() ?>