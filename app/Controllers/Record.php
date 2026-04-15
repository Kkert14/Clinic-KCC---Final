<?php

namespace App\Controllers;

use App\Models\UserModel;
use App\Models\RecordModel;
use CodeIgniter\Controller;
use App\Models\LogModel;

class Record extends Controller
{
    public function index(){
        $model = new RecordModel();
        $data['record'] = $model->findAll();
        return view('record/index', $data);
    }

    public function save(){
        $name = $this->request->getPost('name');
        $last_name = $this->request->getPost('last_name');
        $middle_name = $this->request->getPost('middle_name');
        $sex = $this->request->getPost('sex');
        $age = $this->request->getPost('age');
        $birthdate = $this->request->getPost('birthdate');
        $contact = $this->request->getPost('contact');
        $course = $this->request->getPost('course');
        $year_level = $this->request->getPost('year_level');
        

        $userModel = new \App\Models\RecordModel();
        $logModel = new LogModel();

        $data = [
            'name'       => $name,
            'last_name'       => $last_name,
            'middle_name'       => $middle_name,
            'sex'       => $sex,
            'age'       => $age,
            'birthdate'       => $birthdate,
            'contact'       => $contact,
            'course'       => $course,
            'year_level'       => $year_level,
            
        ];

        if ($userModel->insert($data)) {
            $logModel->addLog('New Record has been added: ' . $name, 'ADD');
            return $this->response->setJSON(['status' => 'success']);
        } else {
            return $this->response->setJSON(['status' => 'error', 'message' => 'Failed to save Record']);
        }
    }

    public function update(){
        $model = new RecordModel();
        $logModel = new LogModel();
        $userId = $this->request->getPost('record_id');
        $name = $this->request->getPost('name');
        $last_name = $this->request->getPost('last_name');
        $middle_name = $this->request->getPost('middle_name');
        $sex = $this->request->getPost('sex');
        $age = $this->request->getPost('age');
        $birthdate = $this->request->getPost('birthdate');
        $contact = $this->request->getPost('contact');
        $course = $this->request->getPost('course');
        $year_level = $this->request->getPost('year_level');
      

        $userData = [
            'name'       => $name,
            'last_name'       => $last_name,
            'middle_name'       => $middle_name,
            'sex'       => $sex,
            'age'       => $age,
            'birthdate'       => $birthdate,
            'contact'       => $contact,
            'course'       => $course,
            'year_level'       => $year_level,
            
        ];

        $updated = $model->update($userId, $userData);

        if ($updated) {
            $logModel->addLog('New Record has been apdated: ' . $name, 'UPDATED');
            return $this->response->setJSON([
                'success' => true,
                'message' => 'Record updated successfully.'
            ]);
        } else {
            return $this->response->setJSON([
                'success' => false,
                'message' => 'Error updating Record.'
            ]);
        }
    }

    public function edit($id){
        $model = new RecordModel();
    $user = $model->find($id); // Fetch user by ID

    if ($user) {
        return $this->response->setJSON(['data' => $user]); // Return user data as JSON
    } else {
        return $this->response->setStatusCode(404)->setJSON(['error' => 'User not found']);
    }
}

public function delete($id){
    $model = new RecordModel();
    $logModel = new LogModel();
    $user = $model->find($id);
    if (!$user) {
        return $this->response->setJSON(['success' => false, 'message' => 'Record not found.']);
    }

    $deleted = $model->delete($id);

    if ($deleted) {
        $logModel->addLog('Delete Record', 'DELETED');
        return $this->response->setJSON(['success' => true, 'message' => 'Record deleted successfully.']);
    } else {
        return $this->response->setJSON(['success' => false, 'message' => 'Failed to delete Record.']);
    }
}

public function fetchRecords()
{
    $request = service('request');
    $model = new \App\Models\RecordModel();

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