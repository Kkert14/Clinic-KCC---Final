<?php

namespace App\Controllers;

use App\Models\PatientModel;
use App\Models\MedicineModel;
use App\Models\EquipmentModel;
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
        $userModel = new UserModel();

        $data = [
            'patientCount' => $patientModel->countAll(),
            'todayConsultations' => $patientModel->countAll(),
            'role' => $role
        ];

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
