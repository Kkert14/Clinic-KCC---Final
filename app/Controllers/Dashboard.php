<?php

namespace App\Controllers;

use App\Models\RecordModel;
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
        $recordModel = new RecordModel();
        $medicineModel = new MedicineModel();
        $equipmentModel = new EquipmentModel();
        $userModel = new UserModel();
        $todayConsultationsModel = new RecordModel();

        $data = [
            'recordCount' => $recordModel->countAll(),
            'medicineCount' => $medicineModel->countAll(),
            'equipmentCount' => $equipmentModel->countAll(),
            'userCount' => $userModel->countAll(),
            'todayConsultations' => $todayConsultationsModel->countAll()
        ];

        

        

        return view('dashboard', $data);
    }
}