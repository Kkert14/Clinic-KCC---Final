<?php

namespace App\Controllers;

use App\Models\EquipmentModel;
use CodeIgniter\Controller;
use App\Models\LogModel;

class Equipment extends Controller
{
    public function index(){
        $model = new EquipmentModel();
        $data['equipment'] = $model->findAll();
        return view('equipment/index', $data);
    }

    public function save(){
        $equipment_name = $this->request->getPost('equipment_name');
        $quantity = $this->request->getPost('quantity');
        $item_status = $this->request->getPost('item_status');
        $date_acquired = $this->request->getPost('date_acquired');
        

        $userModel = new \App\Models\EquipmentModel();
        $logModel = new LogModel();

        $data = [
            'equipment_name'       => $equipment_name,
            'quantity'       => $quantity,
            'item_status'       => $item_status,
            'date_acquired'       => $date_acquired,
            
        ];

        if ($userModel->insert($data)) {
            $logModel->addLog('New Equipment has been added: ' . $equipment_name, 'ADD');
            return $this->response->setJSON(['status' => 'success']);
        } else {
            return $this->response->setJSON(['status' => 'error', 'message' => 'Failed to save Equipment']);
        }
    }

    public function update(){
        $model = new EquipmentModel();
        $logModel = new LogModel();
        $userId = $this->request->getPost('equipment_id');
        $equipment_name = $this->request->getPost('equipment_name');
        $quantity = $this->request->getPost('quantity');
        $item_status = $this->request->getPost('item_status');
        $date_acquired = $this->request->getPost('date_acquired');
      

        $userData = [
            'equipment_name'       => $equipment_name,
            'quantity'       => $quantity,
            'item_status'       => $item_status,
            'date_acquired'       => $date_acquired,

        ];

        $updated = $model->update($userId, $userData);

        if ($updated) {
            $logModel->addLog('New Equipment has been apdated: ' . $equipment_name, 'UPDATED');
            return $this->response->setJSON([
                'success' => true,
                'message' => 'Equipment updated successfully.'
            ]);
        } else {
            return $this->response->setJSON([
                'success' => false,
                'message' => 'Error updating Equipment.'
            ]);
        }
    }

    public function edit($id){
        $model = new EquipmentModel();
    $user = $model->find($id); // Fetch user by ID

    if ($user) {
        return $this->response->setJSON(['data' => $user]); // Return user data as JSON
    } else {
        return $this->response->setStatusCode(404)->setJSON(['error' => 'User not found']);
    }
}

public function delete($id){
    $model = new EquipmentModel();
    $logModel = new LogModel();
    $user = $model->find($id);
    if (!$user) {
        return $this->response->setJSON(['success' => false, 'message' => 'Equipment not found.']);
    }

    $deleted = $model->delete($id);

    if ($deleted) {
        $logModel->addLog('Delete Equipment', 'DELETED');
        return $this->response->setJSON(['success' => true, 'message' => 'Equipment deleted successfully.']);
    } else {
        return $this->response->setJSON(['success' => false, 'message' => 'Failed to delete Equipment.']);
    }
}

public function fetchRecords()
{
    $request = service('request');
    $model = new \App\Models\EquipmentModel();

    $start = $request->getPost('start') ?? 0;
    $length = $request->getPost('length') ?? 10;
    $searchValue = $request->getPost('search')['value'] ?? '';

    $totalRecords = $model->countAll();
    $result = $model->getRecords($start, $length, $searchValue);

    $data = [];
    $counter = $start + 1;
    foreach ($result['data'] as $row) {
        $row['row_number'] = $counter++;
        $data[] = $row;
    }

    return $this->response->setJSON([
        'draw' => intval($request->getPost('draw')),
        'recordsTotal' => $totalRecords,
        'recordsFiltered' => $result['filtered'],
        'data' => $data,
    ]);
}

}