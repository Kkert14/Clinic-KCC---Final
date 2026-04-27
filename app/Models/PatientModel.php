<?php

namespace App\Models;

use CodeIgniter\Model;

class PatientModel extends Model
{
    protected $table = 'patients';
    protected $primaryKey = 'patient_id';

    protected $allowedFields = ['last_name', 'name', 'middle_name', 'sex', 'age', 'birthdate', 'contact', 'department'];

    public function getRecords($start, $length, $searchValue = '', $orderColumn = 'last_name', $orderDir = 'asc')
{
    $builder = $this->builder();
    $builder->select('*');

    // SEARCH
    if (!empty($searchValue)) {
        $builder->groupStart()
            ->orLike('last_name', $searchValue)
            ->orLike('name', $searchValue)
            ->orLike('middle_name', $searchValue)
            ->groupEnd();
    }

    //COUNT FILTERED BEFORE LIMIT
    $filteredBuilder = clone $builder;
    $filtered = $filteredBuilder->countAllResults(false);

    //ORDER FIRST
    $builder->orderBy($orderColumn, $orderDir);

    // 
    $builder->limit($length, $start);

    $data = $builder->get()->getResultArray();

    return [
        'data' => $data,
        'filtered' => $filtered
    ];
}
    
}
