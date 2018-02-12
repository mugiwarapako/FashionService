<?php
/**
 * @autor JuanMS
 * Controlador para las peticiones de voluntario Creador
 */

namespace Application\Controller;

use Application\Service\ModelsService;
use Zend\Mvc\Controller\AbstractActionController;

class ModelsController extends AbstractActionController
{

    private $modelsService;

    public function getModel(){
    	return $this->voluntCreadorService = new ModelsService();
    }

    public function listAction(){
        
        $models = $this->getModel()->getAll();
        $response = $this->getResponse()->setContent(\Zend\Json\Json::encode(array(
            "response" => $models,
        )));
        
        return $response;
        //exit;
    }
    public function addModelsAction(){
        
    	$request = $this->getRequest();
    	if ($request->isPost()) {
    		$postData       = $this->getRequest()->getContent();
    		$decodePostData = json_decode($postData, true);
          
    		$result = $this->getModel()->addModel($decodePostData);
//     		print_r($result);
//     		exit;
    		
            $response = $this->getResponse()->setContent(\Zend\Json\Json::encode(array(
                "response" => $result,
            )));
            
            return $response;
     
    	}

    	exit;
    }
    
    public function existModelAction(){
        
        $request = $this->getRequest();
        if ($request->isPost()) {
            $postData       = $this->getRequest()->getContent();
            $decodePostData = json_decode($postData, true);
            
            $result = $this->getModel()->existModel($decodePostData);
            
            $response = $this->getResponse()->setContent(\Zend\Json\Json::encode(array(
                "response" => $result,
            )));
            
            return $response;
            
        }
        
        exit;
    }

}