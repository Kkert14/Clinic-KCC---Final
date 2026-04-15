<?php

namespace App\Controllers;

use App\Models\RecordModel;

class Dashboard extends BaseController
{
    public function index()
    {
        if (!session()->get('user_id')) {
            return redirect()->to('/login');
        }

        $recordModel = new RecordModel();

        $data = [
            'recordCount' => $recordModel->countAll()
        ];

        return view('dashboard', $data);
    }
}