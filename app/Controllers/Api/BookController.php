<?php

namespace App\Controllers\Api;

use App\Models\BookModel;
use CodeIgniter\RESTful\ResourceController;

class BookController extends ResourceController
{
  
    public function list()
    {
        $book = new BookModel();
            
        //log_message('error', $e->getMessage());
        
		$response = [
			'status' => 200,
			"error" => false,
			'messages' => 'Book list',
			'data' => $book->findAll()
		];

		return $this->respond($response);
    }

    public function show($book_id = null)
    {
        $book = new BookModel();

		$data = $book->find($book_id);
        //$data = $model->where(['id' => $book_id])->first();

		if (!empty($data)) {

			$response = [
				'status' => 200,
				"error" => false,
				'messages' => 'Single employee data',
				'data' => $data
			];

		} else {

			$response = [
				'status' => 500,
				"error" => true,
				'messages' => 'No employee found',
				'data' => []
			];
		}

		return $this->respond($response);
        
    }


    public function add()
    {
        $rules = [
			"isbn" => "required|is_unique[books.isbn]",
			"title" => "required",
			"description" => "required",
            "author" => "required",
		];

		$messages = [
			"isbn" => [
				"required" => "Isbn is required",
                "is_unique" => "Isbn already exists"
			],
			"title" => [
				"required" => "Title required"
			],
			"description" => [
				"required" => "Description is required"
			],
            "author" => [
				"required" => "Author Number is required"
			],
		];

		if (!$this->validate($rules, $messages)) {

			$response = [
				'status' => 500,
				'error' => true,
				'message' => $this->validator->getErrors(),
				'data' => []
			];
		} else {

			$book = new BookModel();

			$data['isbn'] = $this->request->getVar("isbn");
			$data['title'] = $this->request->getVar("title");
			$data['description'] = $this->request->getVar("description");
            $data['author'] = $this->request->getVar("author");

			$book->save($data);

			$response = [
				'status' => 200,
				'error' => false,
				'message' => 'Book added successfully',
				'data' => []
			];
		}

		return $this->respond($response);
    }


    public function update($book_id = null)
    {
        $rules = [
			"isbn" => "required|is_unique[books.isbn]",
			"title" => "required",
			"description" => "required",
            "author" => "required",
		];

		$messages = [
			"isbn" => [
				"required" => "Isbn is required",
                "is_unique" => "Isbn already exists"
			],
			"title" => [
				"required" => "Title required"
			],
			"description" => [
				"required" => "Description is required"
			],
            "author" => [
				"required" => "Author Number is required"
			],
		];

		if (!$this->validate($rules, $messages)) {

			$response = [
				'status' => 500,
				'error' => true,
				'message' => $this->validator->getErrors(),
				'data' => []
			];
		} else {

			$book = new BookModel();

			if ($book->find($book_id)) {
                $input = $this->request->getRawInput();

                $data['isbn'] = $input["isbn"];
                $data['title'] = $input["title"];
                $data['description'] = $input["description"];
                $data['author'] = $input["author"];

				$book->update($book_id, $data);

				$response = [
					'status' => 200,
					'error' => false,
					'message' => 'Employee updated successfully',
					'data' => []
				];
			}else {

				$response = [
					'status' => 500,
					"error" => true,
					'messages' => 'No employee found',
					'data' => []
				];
			}
		}

		return $this->respond($response);
    }


    public function delete($book_id = null)
    {
        $book = new BookModel();

		$data = $book->find($book_id);

		if (!empty($data)) {

			$book->delete($book_id);

			$response = [
				'status' => 200,
				"error" => false,
				'messages' => 'Book deleted successfully',
				'data' => []
			];

		} else {

			$response = [
				'status' => 500,
				"error" => true,
				'messages' => 'No book found',
				'data' => []
			];
		}

		return $this->respond($response);
    }
}
