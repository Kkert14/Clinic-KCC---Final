<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Record - <?= esc($record['patient_name']) ?></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 13px;
            color: #000;
            padding: 40px;
        }

        /* ── CLINIC HEADER ── */
        .clinic-header {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            margin-bottom: 10px;
        }

        .clinic-header .logo {
            height: 70px;
            width: auto;
        }

        .clinic-header .clinic-info {
            text-align: center;
        }

        .clinic-header .clinic-name {
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .clinic-header .clinic-sub {
            font-size: 12px;
            color: #444;
            margin-top: 3px;
        }

        /* ── DIVIDER ── */
        .header-divider {
            border: none;
            border-top: 2px solid #000;
            margin-bottom: 20px;
        }

        /* ── DOCUMENT TITLE ── */
        .doc-title {
            text-align: center;
            margin-bottom: 20px;
        }

        .doc-title h2 {
            font-size: 16px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .doc-title p {
            font-size: 12px;
            color: #444;
            margin-top: 4px;
        }

        /* ── RECORD ID ── */
        .record-id {
            font-size: 11px;
            color: #888;
            text-align: right;
            margin-bottom: 10px;
        }

        /* ── SECTION TITLE ── */
        .section-title {
            font-size: 13px;
            font-weight: bold;
            text-transform: uppercase;
            background: #f0f0f0;
            padding: 6px 10px;
            margin: 20px 0 10px;
            border-left: 4px solid #333;
        }

        /* ── TABLE ── */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        table th,
        table td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            vertical-align: top;
        }

        table th {
            background: #f7f7f7;
            width: 35%;
            font-weight: bold;
        }

        /* ── FOOTER ── */
        .footer {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
        }

        .signature-block {
            text-align: center;
            width: 40%;
        }

        .signature-block .line {
            border-top: 1px solid #000;
            margin-bottom: 5px;
        }

        .signature-block p {
            font-size: 12px;
        }

        @media print {
            body { padding: 20px; }
            .no-print { display: none; }
        }
    </style>
</head>
<body>

    <!-- PRINT BUTTON -->
    <div class="no-print" style="text-align:right; margin-bottom: 20px;">
        <button onclick="window.print()" style="padding: 8px 16px; cursor: pointer;">
            🖨️ Print
        </button>
    </div>

    <!-- CLINIC HEADER -->
    <div class="clinic-header">
        <img src="<?= base_url('assets/img/KCC_Logo.jpg') ?>" class="logo">
        <div class="clinic-info">
            <div class="clinic-name">Kabankalan Catholic College, Inc.</div>
            <div class="clinic-sub">School Clinic</div>
        </div>
        <img src="<?= base_url('assets/img/school_clinic_logo_kcc.png') ?>" class="logo">
    </div>
    <hr class="header-divider">

    <!-- DOCUMENT TITLE -->
    <div class="doc-title">
        <h2>Medical Record</h2>
        <p>Patient Consultation Report</p>
    </div>

    <!-- RECORD ID -->
    <div class="record-id">
        Record ID: #<?= esc($record['record_id']) ?>
    </div>

    <!-- PATIENT INFORMATION -->
    <div class="section-title">Patient Information</div>
    <table>
        <tr>
            <th>Patient Name</th>
            <td><?= esc($record['patient_name']) ?></td>
        </tr>
        <tr>
            <th>Date Consulted</th>
            <td><?= esc($record['date_consulted']) ?></td>
        </tr>
        <tr>
            <th>Attending Staff</th>
            <td><?= esc($record['doctor_name']) ?></td>
        </tr>
    </table>

    <!-- CLINICAL DETAILS -->
    <div class="section-title">Clinical Details</div>
    <table>
        <tr>
            <th>Chief Complaint</th>
            <td><?= esc($record['chief_complaint']) ?></td>
        </tr>
        <tr>
            <th>Diagnosis</th>
            <td><?= esc($record['diagnosis']) ?></td>
        </tr>
        <tr>
            <th>Treatment</th>
            <td><?= esc($record['treatment']) ?></td>
        </tr>
        <tr>
            <th>Remarks</th>
            <td><?= esc($record['remarks']) ?></td>
        </tr>
    </table>

    <!-- SIGNATURE FOOTER -->
    <div class="footer">
        <div class="signature-block">
            <div class="line"></div>
            <p><?= esc($record['doctor_name']) ?></p>
            <p>Attending Staff</p>
        </div>
        <div class="signature-block">
            <div class="line"></div>
            <p>Authorized Signatory</p>
        </div>
    </div>

</body>
</html>