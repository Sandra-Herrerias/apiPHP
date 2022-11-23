<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;

class HomeController extends ResourceController
{
    public function index()
    {
        $response = [
            'status' => 500,
            "error" => true,
            'messages' => 'Good afternoon',
            'data' => []
        ];
        return $this->respond($response);
    }

    public function number()
    {
        $response = [
            'status' => 0,
            "error" => false,
            'messages' => 'Numbers introduced',
            'data' => [0,2,3]
        ];
        return $this->respond($response);
    }
}

