<?= $this->extend('theme/template') ?>

<?= $this->section('content') ?>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Individual Treatment Records</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Dashboard v1</li>
          </ol>
        </div>
      </div>
    </div>
  </div>

  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">List of Individual Treatment Records</h3>
              <div class="float-right">
                <button type="button" class="btn btn-md btn-primary" data-toggle="modal" data-target="#AddNewModal">
                  <i class="fa fa-plus-circle fa fw"></i> Add New
                </button>
              </div>
            </div>
            <div class="card-body">
               <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th style="display:none;">id</th>
                    <th>Surname</th>
                    <th>Name</th>
                    <th>Middle Name</th>
                    <th>Sex</th>
                    <th>Age</th>
                    <th>Birthdate</th>
                    <th>Contact</th>
                    <th>Course</th>
                    <th>Year Level</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

   

    <!-- ✅ Add New Modal -->
   <div class="modal fade" id="AddNewModal" tabindex="-1">
  <div class="modal-dialog">
    <form id="addUserForm">
      <?= csrf_field() ?>
      <div class="modal-content">

        <div class="modal-header">
          <h5 class="modal-title">
            <i class="fa fa-plus-circle"></i> Add New
          </h5>
          <button type="button" class="close" data-dismiss="modal">
            &times;
          </button>
        </div>

        <div class="modal-body">

          <div class="form-group">
            <label>Surname</label>
            <input type="text" name="last_name" class="form-control" required>
          </div>

          <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" class="form-control" required>
          </div>

          <div class="form-group">
            <label>Middle Name</label>
            <input type="text" name="middle_name" class="form-control">
          </div>

          <div class="form-group">
            <label>Sex</label>
            <select class="form-control" name="sex">
              <option value="Male">Male</option>
              <option value="Female">Female</option>
            </select>
          </div>

          <div class="form-group">
            <label>Age</label>
            <input type="number" name="age" class="form-control">
          </div>

          <div class="form-group">
            <label>Birthdate</label>
            <input type="date" name="birthdate" class="form-control">
          </div>

          <div class="form-group">
            <label>Contact</label>
            <input type="text" name="contact" class="form-control">
          </div>

          <div class="form-group">
            <label>Course</label>
            <input type="text" name="course" class="form-control">
          </div>

          <div class="form-group">
            <label>Year Level</label>
            <select class="form-control" name="year_level">
              <option value="first">First</option>
              <option value="second">Second</option>
              <option value="third">Third</option>
              <option value="fourth">Fourth</option>
            </select>
          </div>

        </div>

        <div class="modal-footer">
          <button class="btn btn-secondary" data-dismiss="modal">
            Cancel
          </button>

          <button type="submit" class="btn btn-primary">
            Save
          </button>
        </div>

      </div>
    </form>
  </div>
</div>
      </form>
    </div>
  </div>

   <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editUserModalLabel"><i class="far fa-edit fa fw"></i> Edit Record</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="editUserForm">
           <?= csrf_field() ?>
          <div class="modal-body">

            <input type="hidden" id="userId" name="record_id">

             <div class="form-group">
                <label>Surame</label>
                <input type="text" name="last_name" id="last_name" class="form-control" required />
              </div>

              <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" id="name" class="form-control" required />
              </div>

              <div class="form-group">
                <label>Middle Name</label>
                <input type="text" name="middle_name" id="middle_name" class="form-control" required />
              </div>

               <div class="form-group">
            <label>Sex</label>
            <select class="form-control" id="sex" name="sex">
              <option value="Male">Male</option>
              <option value="Female">Female</option>
            </select>
          </div>

              <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" id="age" class="form-control" required />
              </div>

              <div class="form-group">
                <label>Birthdate</label>
                <input type="date" name="birthdate" id="birthdate" class="form-control" required />
              </div>

              <div class="form-group">
                <label>Contact</label>
                <input type="text" name="contact" id="contact" class="form-control" required />
              </div>

              <div class="form-group">
                <label>Course</label>
                <input type="text" name="course" id="course" class="form-control" required />
              </div>

              <div class="form-group">
            <label>Year Level</label>
            <select class="form-control" name="year_level" id="year_level">
              <option value="first">First</option>
              <option value="second">Second</option>
              <option value="third">Third</option>
              <option value="fourth">Fourth</option>
            </select>
          </div>

            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class='fas fa-times-circle'></i> Cancel</button>
            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
          </div>
        </div>
      </form>
    </div>
  </div>

</section>
</div>
<div class="toasts-top-right fixed" style="position: fixed; top: 1rem; right: 1rem; z-index: 9999;"></div>
<?= $this->endSection() ?>


<?= $this->section('scripts') ?>
<script> const baseUrl = "<?= base_url() ?>"; </script>
<script src="<?= base_url('js/record/record.js') ?>"></script>
<?= $this->endSection() ?>
