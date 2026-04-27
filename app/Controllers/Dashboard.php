<?php

namespace App\Controllers;

use App\Models\PatientModel;
use App\Models\MedicineModel;
use App\Models\EquipmentModel;
use App\Models\MedicalRecordModel;
use App\Models\UserModel;

class Dashboard extends BaseController
{
    public function index()
    {
        if (!session()->get('user_id')) {
            return redirect()->to('/login');
        }

        $role = session()->get('role');

        $patientModel = new PatientModel();
        $medicineModel = new MedicineModel();
        $equipmentModel = new EquipmentModel();
        $medicalModel = new MedicalRecordModel();
        $userModel = new UserModel();

        // 🔥 MERGED DASHBOARD STATS (ONLY ONE CALL)
        $medicalStats = $medicalModel->getDashboardStats();

        $data = [
            'patientCount' => $patientModel->countAll(),
            'totalPatients' => $patientModel->countAll(),

            // medical stats (MERGED)
            'totalRecords'  => $medicalStats['totalRecords'],
            'todayRecords'  => $medicalStats['todayRecords'],
            'weekRecords'   => $medicalStats['weekRecords'],
            'recentRecords' => $medicalStats['recentRecords'],

            'role' => $role
        ];

        // role-based data
        if (in_array($role, ['Admin', 'Doctor'])) {
            $data['medicineCount'] = $medicineModel->countAll();
            $data['equipmentCount'] = $equipmentModel->countAll();
        }

        if ($role === 'Admin') {
            $data['userCount'] = $userModel->countAll();
        }

        return view('dashboard', $data);
    }
}