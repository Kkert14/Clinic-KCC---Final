<!DOCTYPE html>
<html>

<head>
    <title>Patient Record</title>
</head>

<body onload="window.print()">

    <div class="header">
        <img src="<?= base_url('assets/img/KCC_Logo.jpg') ?>" class="logo">
        <div class="clinic-name">Kabankalan Catholic College, Inc.</div>
        <div class="sub">Patient Medical Record</div>
    </div>

  <div class="record">Individual Treatment Record</div>

    <div class="section">

        <!-- <div class="row"><span class="label">Patient ID:</span> <?= $patient['patient_id'] ?></div> -->
        <div class="row"><span class="label">Name:</span> <?= $patient['name'] ?></div>
        <div class="row"><span class="label">Last Name:</span> <?= $patient['last_name'] ?></div>
        <div class="row"><span class="label">Middle Name:</span> <?= $patient['middle_name'] ?></div>
        <div class="row"><span class="label">Sex:</span> <?= $patient['sex'] ?></div>
        <div class="row"><span class="label">Age:</span> <?= $patient['age'] ?></div>
        <div class="row"><span class="label">Birthdate:</span> <?= $patient['birthdate'] ?></div>
        <div class="row"><span class="label">Contact:</span> <?= $patient['contact'] ?></div>
        <div class="row"><span class="label">Department:</span> <?= $patient['department'] ?></div>

    </div>

    <div class="footer">
        <div class="sign">Doctor Signature</div>
        <div class="sign">Patient Signature</div>
    </div>

</body>

</html>

 <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 30px;
            color: #000;
        }

        .header {
            text-align: center;
            border-bottom: 2px solid #000;
            padding-bottom: 10px;
            margin-bottom: 25px;
        }

        .logo {
            height: 80px;
            margin-bottom: 10px;
            
        }

        .clinic-name {
            font-size: 22px;
            font-weight: bold;
        }

        .sub {
            font-size: 13px;
        }

        .record {
            text-align: center;
            font-size: 14px;
            font-weight: bold;
        }

        .section {
            border: 1px solid #000;
            padding: 20px;
        }

        .row {
            margin-bottom: 10px;
            font-size: 14px;
        }

        .label {
            font-weight: bold;
            display: inline-block;
            width: 150px;
        }

        .footer {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
        }

        .sign {
            text-align: center;
            width: 200px;
            border-top: 1px solid #000;
            padding-top: 5px;
            font-size: 12px;
        }

        @media print {
            body {
                padding: 0;
            }
        }
    </style>