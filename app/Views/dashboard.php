<?= $this->extend('theme/template') ?>
<link rel="stylesheet" href="<?= base_url('assets/css/dashboard.css') ?>">
<?= $this->section('content') ?>

<div class="content-wrapper">

    <div class="content-header">
        <div class="container-fluid">

            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Dashboard</h1>
                </div>

                <!-- <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="<?= base_url('dashboard') ?>">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div> -->
            </div>

        </div>
    </div>


    <section class="content">

        <div class="container-fluid">

            <div class="row">


                <!-- Treatment Records -->
                <div class="col-lg-3 col-6">

                    <div class="small-box bg-primary">

                        <div class="inner">
                            <h3><?= $patientCount ?></h3>
                            <p>Clinic Records</p>
                        </div>

                        <div class="icon">
                            <i class="fas fa-notes-medical"></i>
                        </div>

                        <a href="<?= base_url('patient') ?>" class="small-box-footer">
                            More info <i class="fas fa-arrow-circle-right"></i>
                        </a>

                    </div>

                </div>



                <?php if (in_array($role, ['Admin', 'Doctor'])): ?>
                    <div class="col-lg-3 col-6">

                        <div class="small-box consultation-box">

                            <div class="inner">
                                <h3><?= $medicineCount ?></h3>
                                <p>Clinic Medicines</p>
                            </div>

                            <div class="icon">
                                <i class="fas fa-briefcase-medical"></i>
                            </div>

                            <a href="<?= base_url('medicine') ?>" class="small-box-footer">
                                More info <i class="fas fa-arrow-circle-right"></i>
                            </a>

                        </div>

                    </div>
                <?php endif; ?>



                <!-- Equipment -->
                <?php if (in_array($role, ['Admin', 'Doctor'])): ?>
                    <div class="col-lg-3 col-6">

                        <div class="small-box bg-primary">

                            <div class="inner">
                                <h3><?= $equipmentCount ?></h3>
                                <p>Clinic Equipment</p>
                            </div>

                            <div class="icon">
                                <i class="fas fa-stethoscope"></i>
                            </div>

                            <a href="<?= base_url("equipment") ?>" class="small-box-footer">
                                More info <i class="fas fa-arrow-circle-right"></i>
                            </a>

                        </div>

                    </div>
                <?php endif; ?>

                <!-- Users -->
                <?php if ($role === 'Admin'): ?>
                    <div class="col-lg-3 col-6">

                        <div class="small-box consultation-box">

                            <div class="inner">
                                <h3><?= $userCount ?></h3>
                                <p>System Users</p>
                            </div>

                            <div class="icon">
                                <i class="fas fa-user-nurse"></i>
                            </div>

                            <a href="<?= base_url("users") ?>" class="small-box-footer">
                                More info <i class="fas fa-arrow-circle-right"></i>
                            </a>

                        </div>

                    </div>
                <?php endif; ?>

                <!-- Split -->

                <div class="col-lg-3 col-6">

                    <div class="small-box consultation-box">

                        <div class="inner">
                            <h3><?= $totalRecords ?></h3>
                            <p>Medical Records</p>
                        </div>

                        <div class="icon">
                            <i class="fas fa-file-medical-alt"></i>
                        </div>

                        <a href="<?= base_url('medical-records') ?>" class="small-box-footer">
                            More info <i class="fas fa-arrow-circle-right"></i>
                        </a>

                    </div>

                </div>
                <!-- Split -->
                <div class="col-lg-3 col-6">

                    <div class="small-box bg-info">

                        <div class="inner">
                            <h3><?= $todayRecords ?></h3>
                            <p>Consultations Today</p>

                            <small class="text-light">
                                <?= date('F d, Y') ?>
                            </small>
                        </div>

                        <div class="icon">
                            <i class="fas fa-calendar-day"></i>
                        </div>

                        <a href="<?= base_url('medical-records') ?>" class="small-box-footer">
                            View records <i class="fas fa-arrow-circle-right"></i>
                        </a>

                    </div>

                </div>
                <!-- Split -->
                <div class="col-lg-3 col-6">

                    <div class="small-box consultation-box">

                        <div class="inner">
                            <h3><?= $weekRecords ?></h3>
                            <p>Consultations (Last 7 Days)</p>

                            <small>
                                Since <?= date('M d', strtotime('-7 days')) ?>
                            </small>
                        </div>

                        <div class="icon">
                            <i class="fas fa-calendar-week"></i>
                        </div>

                        <a href="<?= base_url('medical-records') ?>" class="small-box-footer">
                            View records <i class="fas fa-arrow-circle-right"></i>
                        </a>

                    </div>

                </div>

                <!-- Split -->
                <div class="container-fluid mt-3">

                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">Recent Medical Consultations</h3>
                        </div>

                        <div class="card-body table-responsive">

                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Patient</th>
                                        <th>Doctor/Nurse</th>
                                        <th>Diagnosis</th>
                                        <th>Treatment</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <?php foreach ($recentRecords as $record): ?>
                                        <tr>
                                            <td><?= esc($record['date_consulted']) ?></td>
                                            <td><?= esc($record['patient_name'] ?? 'Unknown Patient') ?></td>
                                            <td><?= esc($record['staff_name'] ?? 'N/A') ?></td>
                                            <td><?= esc($record['diagnosis']) ?></td>
                                            <td><?= esc($record['treatment']) ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>

                        </div>

                    </div>

                </div>
                <!-- -->

            </div>

        </div>


</div>

</div>

</section>

</div>


<?= $this->endSection() ?>