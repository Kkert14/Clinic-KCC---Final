<?= $this->extend('theme/template') ?>

<?= $this->section('content') ?>
<div class="content-wrapper">

    <!-- HEADER -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Appointments</h1>
                </div>
            </div>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <section class="content">
        <div class="container-fluid">

            <div class="card">

                <div class="card-header">
                    <h3 class="card-title">List of Appointments</h3>

                    <div class="float-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddNewModal">
                            <i class="fa fa-plus-circle"></i> Add New
                        </button>
                    </div>
                </div>

                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped table-sm">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th style="display:none;">ID</th>
                                <th>Patient Name</th>
                                <th>Doctor/Nurse</th>
                                <th>Appointment Date</th>
                                <th>Status</th>
                                <th>Notes</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>

            </div>

        </div>
    </section>

</div>

<!-- ================= ADD MODAL ================= -->
<div class="modal fade" id="AddNewModal">
    <div class="modal-dialog">
        <form id="addAppointmentForm">

            <?= csrf_field() ?>

            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Add Appointment</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="form-group">
                        <label>Patient</label>
                        <select name="patient_id" class="form-control" required>
                            <option value="">-- Select Patient --</option>

                            <?php foreach ($patients as $p): ?>
                                <option value="<?= $p['patient_id'] ?>">
                                    <?= $p['name'] ?>
                                </option>
                            <?php endforeach; ?>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>User</label>
                        <select name="user_id" class="form-control" required>
                            <option value="">-- Select Doctor/Nurse --</option>

                            <?php foreach ($users as $u): ?>
                                <?php if ($u['role'] !== 'Admin'): ?>
                                    <option value="<?= $u['id'] ?>">
                                        <?= $u['name'] ?> - <?= $u['role'] ?>
                                    </option>
                                <?php endif; ?>
                            <?php endforeach; ?>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>Appointment Date</label>
                        <input type="datetime-local" name="appointment_date" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" class="form-control">
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Notes</label>
                        <input type="text" name="notes" class="form-control">
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>

            </div>

        </form>
    </div>
</div>

<!-- ================= EDIT MODAL ================= -->
<div class="modal fade" id="editAppointmentModal">
    <div class="modal-dialog">
        <form id="editAppointmentForm">

            <?= csrf_field() ?>

            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Edit Appointment</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <input type="hidden" id="appointment_id" name="appointment_id">

                    <div class="form-group">
                        <label>Patient</label>
                        <select name="patient_id" class="form-control" id="patient_id" required>
                            <option value="">-- Select Patient --</option>

                            <?php foreach ($patients as $p): ?>
                                <option value="<?= $p['patient_id'] ?>">
                                    <?= $p['name'] ?>
                                </option>
                            <?php endforeach; ?>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>User</label>
                        <select name="user_id" class="form-control" id="user_id" required>
                            <option value="">-- Select Doctor/User --</option>

                            <?php foreach ($users as $u): ?>
                                <option value="<?= $u['id'] ?>">
                                    <?= $u['name'] ?>
                                </option>
                            <?php endforeach; ?>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>Appointment Date</label>
                        <input type="datetime-local" name="appointment_date" id="appointment_date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" id="status" class="form-control">
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Notes</label>
                        <input type="text" name="notes" id="notes" class="form-control">
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>

            </div>

        </form>
    </div>
</div>

<?= $this->endSection() ?>


<?= $this->section('scripts') ?>
<script>
    const baseUrl = "<?= base_url() ?>";
</script>
<script src="<?= base_url('js/appointment/appointment.js') ?>"></script>
<?= $this->endSection() ?>