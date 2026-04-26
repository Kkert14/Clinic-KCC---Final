function showToast(type, message) {
  if (type === "success") {
    toastr.success(message, "Success");
  } else {
    toastr.error(message, "Error");
  }
}

$("#addUserForm").on("submit", function (e) {
  e.preventDefault();
  $.ajax({
    url: baseUrl + "patient/save",
    method: "POST",
    data: $(this).serialize(),
    dataType: "json",
    success: function (response) {
      if (response.status === "success") {
        $("#AddNewModal").modal("hide");
        $("#addUserForm")[0].reset();
        showToast("success", "patient added successfully!");
        setTimeout(() => {
          location.reload();
        }, 1000);
      } else {
        showToast("error", response.message || "Failed to add patient.");
      }
    },
    error: function () {
      showToast("error", "An error occurred.");
    },
  });
});

$(document).on("click", ".edit-btn", function () {
  const userId = $(this).data("id");
  $.ajax({
    url: baseUrl + "patient/edit/" + userId,
    method: "GET",
    dataType: "json",
    success: function (response) {
      if (response.data) {
        $("#editUserModal #name").val(response.data.name);
        $("#editUserModal #userId").val(response.data.patient_id);
        $("#editUserModal #last_name").val(response.data.last_name);
        $("#editUserModal #middle_name").val(response.data.middle_name);
        $("#editUserModal #sex").val(response.data.sex);
        $("#editUserModal #age").val(response.data.age);
        $("#editUserModal #birthdate").val(response.data.birthdate);
        $("#editUserModal #contact").val(response.data.contact);
        $("#editUserModal #department").val(response.data.department);
        $("#editUserModal").modal("show");
      } else {
        alert("Error fetching patient data");
      }
    },
    error: function () {
      alert("Error fetching patient data");
    },
  });
});

$(document).ready(function () {
  $("#editUserForm").on("submit", function (e) {
    e.preventDefault();

    $.ajax({
      url: baseUrl + "patient/update",
      method: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function (response) {
        if (response.success) {
          $("#editUserModal").modal("hide");
          showToast("success", "patient Updated successfully!");
          setTimeout(() => location.reload(), 1000);
        } else {
          alert("Error updating: " + (response.message || "Unknown error"));
        }
      },
      error: function (xhr) {
        alert("Error updating");
        console.error(xhr.responseText);
      },
    });
  });
});

$(document).on("click", ".deleteUserBtn", function () {
  const userId = $(this).data("id");
  const csrfName = $('meta[name="csrf-name"]').attr("content");
  const csrfToken = $('meta[name="csrf-token"]').attr("content");

  if (confirm("Are you sure you want to delete this patient?")) {
    $.ajax({
      url: baseUrl + "patient/delete/" + userId,
      method: "POST",
      data: {
        _method: "DELETE",
        [csrfName]: csrfToken,
      },
      success: function (response) {
        if (response.success) {
          showToast("success", "Record deleted successfully.");
          setTimeout(() => location.reload(), 1000);
        } else {
          alert(response.message || "Failed to delete.");
        }
      },
      error: function () {
        alert("Something went wrong while deleting.");
      },
    });
  }
});

//View
$(document).on('click', '.view-btn', function () {
    const userId = $(this).data('id');

    $.ajax({
        url: baseUrl + 'patient/view/' + userId,
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.data) {
                // Fill modal fields
                $('#viewModal #name').text(response.data.name);
                $('#viewModal #last_name').text(response.data.last_name);
                $('#viewModal #middle_name').text(response.data.middle_name);
                $('#viewModal #sex').text(response.data.sex);
                $('#viewModal #age').text(response.data.age);
                $('#viewModal #birthdate').text(response.data.birthdate);
                $('#viewModal #contact').text(response.data.contact);
                $('#viewModal #department').text(response.data.department);

                $('#viewModal').modal('show');
            } else {
                alert('No data found');
            }
        },
        error: function () {
            alert('Error fetching details');
        }
    });
});

//Print

$(document).on('click', '.print-btn', function () {
    const userId = $(this).data('id');
    window.open(baseUrl + 'patient/print/' + userId, '_blank');
});

// $(document).on('click', '.print-btn', function () {
//     const userId = $(this).data('id');

//     $.ajax({
//         url: baseUrl + 'patient/view/' + userId,
//         method: 'GET',
//         dataType: 'json',
//         success: function (response) {
//             if (response.data) {
//                 let content = `
// <html>
// <head>
// <title>Patient Record</title>

// <style>
//     body {
//         font-family: Arial, sans-serif;
//         padding: 30px;
//         color: #000;
//     }

//     .header {
//         text-align: center;
//         border-bottom: 2px solid #000;
//         padding-bottom: 10px;
//         margin-bottom: 20px;
//     }

//     .clinic-name {
//         font-size: 20px;
//         font-weight: bold;
//     }

//     .sub {
//         font-size: 12px;
//     }

//     .section {
//         border: 1px solid #000;
//         padding: 15px;
//     }

//     .row {
//         margin-bottom: 8px;
//         font-size: 14px;
//     }

//     .label {
//         font-weight: bold;
//         display: inline-block;
//         width: 140px;
//     }

//     .footer {
//         margin-top: 50px;
//         display: flex;
//         justify-content: space-between;
//     }

//     .sign {
//         text-align: center;
//         width: 200px;
//         border-top: 1px solid #000;
//         padding-top: 5px;
//         font-size: 12px;
//     }

//     @media print {
//         body {
//             padding: 0;
//         }
//     }
// </style>

// </head>

// <body>

// <div class="header">
//     <div class="clinic-name">YOUR CLINIC NAME</div>
//     <div class="sub">Patient Medical Record</div>
// </div>

// <div class="section">

//     <div class="row"><span class="label">Name:</span> ${response.data.name}</div>
//     <div class="row"><span class="label">Last Name:</span> ${response.data.last_name}</div>
//     <div class="row"><span class="label">Middle Name:</span> ${response.data.middle_name}</div>
//     <div class="row"><span class="label">Sex:</span> ${response.data.sex}</div>
//     <div class="row"><span class="label">Age:</span> ${response.data.age}</div>
//     <div class="row"><span class="label">Birthdate:</span> ${response.data.birthdate}</div>
//     <div class="row"><span class="label">Contact:</span> ${response.data.contact}</div>
//     <div class="row"><span class="label">Department:</span> ${response.data.department}</div>

// </div>

// <div class="footer">
//     <div class="sign">Doctor Signature</div>
//     <div class="sign">Patient Signature</div>
// </div>

// </body>
// </html>
// `;

// let printWindow = window.open('', '', 'width=800,height=600');
// printWindow.document.write(content);
// printWindow.document.close();
// printWindow.print();
//             }
//         }
//     });
// });

$(document).ready(function () {
  const $table = $("#example1");

  const csrfName = "csrf_test_name";
  const csrfToken = $('input[name="' + csrfName + '"]').val();

  $table.DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: baseUrl + "patient/fetchRecords",
      type: "POST",
      headers: {
        "X-CSRF-TOKEN": csrfToken,
      },
    },
    columns: [
      { data: "row_number" },
      { data: "patient_id", visible: false },
      { data: "last_name" },
      { data: "name" },
      { data: "middle_name" },
      { data: "sex" },
      { data: "age" },
      { data: "birthdate" },
      { data: "contact" },
      { data: "department" },

      {
        data: null,
        orderable: false,
        searchable: false,
        render: function (data, type, row) {
          return `
                <button class="btn btn-sm btn-warning edit-btn" data-id="${row.patient_id}">
                <i class="far fa-edit"></i>
                </button>
                <button class="btn btn-sm btn-danger deleteUserBtn" data-id="${row.patient_id}">
                <i class="fas fa-trash-alt"></i>
                </button>
                
                 <button class="btn btn-sm btn-info view-btn" data-id="${row.patient_id}">
                <i class="fas fa-eye"></i>
                </button>

                <button class="btn btn-sm btn-secondary print-btn" data-id="${row.patient_id}">
                <i class="fas fa-print"></i>
                </button>
                `;
        },
      },
    ],
    responsive: true,
    autoWidth: false,
  });
});
