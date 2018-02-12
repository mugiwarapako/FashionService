<?php
namespace Application\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;

class ModelsModel extends TableGateway
{

    private $dbAdapter;

    public function __construct()
    {
        $this->dbAdapter = \Zend\Db\TableGateway\Feature\GlobalAdapterFeature::getStaticAdapter();
        $this->table = 'modelo';
        $this->featureSet = new Feature\FeatureSet();
        $this->featureSet->addFeature(new Feature\GlobalAdapterFeature());
        $this->initialize();
    }

    public function getAll()
    {
        $sql = new Sql($this->dbAdapter);
        $select = $sql->select();
        $select->columns(array(
                'id',
                'descripcion',
                'imagen',
                'id_evento'
        ))->from(array(
            'v' => $this->table
        ));
        $selectString = $sql->getSqlStringForSqlObject($select);
        // print_r($selectString); exit;
        $execute = $this->dbAdapter->query($selectString, Adapter::QUERY_MODE_EXECUTE);
        $result = $execute->toArray();
        // echo "<pre>"; print_r($result); exit;
        
        return $result;
    }

    public function existe($folioNuevo)
    {
        
        // print_r($folioNuevo);
        // $consulta=$this->dbAdapter->query("select id , folio FROM voluntarioCreador where nombre = '" . $dataUser['nombre']."' and correo = '".$dataUser['correo']. "'" ,Adapter::QUERY_MODE_EXECUTE);
        $consulta = $this->dbAdapter->query("select * correo FROM modelo where folio = '" . $folioNuevo . "'", Adapter::QUERY_MODE_EXECUTE);
        
        $res = $consulta->toArray();
        // echo "res ";
        // print_r($res);
        
        return $res;
    }

    

    public function addVolModelo($dataModelo)
    {
        $flag = false;
        $respuesta = array();
        
        try {
            $sql = new Sql($this->dbAdapter);
            $insertar = $sql->insert($this->table);
            
            $array = array(
                'descripcion'=> $dataModelo['descripcion'],
                'imagen'=> $dataModelo['imagen'],
                'id_evento'=> $dataModelo['id_evento']
            );
            
            $insertar->values($array);
            
            $selectString = $sql->getSqlStringForSqlObject($insertar);
            $results = $this->dbAdapter->query($selectString, Adapter::QUERY_MODE_EXECUTE);
            $flag = true;
        } catch (\PDOException $e) {
            // echo "First Message " . $e->getMessage() . "<br/>";
            $flag = false;
        } catch (\Exception $e) {
            // echo "Second Message: " . $e->getMessage() . "<br/>";
        }
        $respuesta['status'] = $flag;

        return $respuesta;
    }

    public function updateModelo($dataModelo)
    {
        
        $flag = false;
        $respuesta = array();
        
        try {
            $sql = new Sql($this->dbAdapter);
            $update = $sql->update();
            $update->table('voluntarioCreador');
            
            $array = array(
                'descripcion'=> $dataModelo['descripcion'],
                'imagen'=> $dataModelo['imagen'],
                'id_evento'=> $dataModelo['id_evento']
            );
            
            $update->set($array);
            $update->where(array(
                'id' => $dataModelo[0]['id']
            ));
            
            $selectString = $sql->getSqlStringForSqlObject($update);
            $results = $this->dbAdapter->query($selectString, Adapter::QUERY_MODE_EXECUTE);
        } catch (\PDOException $e) {
            // echo "First Message " . $e->getMessage() . "<br/>";
            $flag = false;
        } catch (\Exception $e) {
            // echo "Second Message: " . $e->getMessage() . "<br/>";
        }
        $respuesta['status'] = $flag;
        return $respuesta;
    }
    
    
//     public function maxFolio($folioNuevo)
//     {
        
//         // $consulta=$this->dbAdapter->query("select id , folio FROM voluntarioCreador where nombre = '" . $dataUser['nombre']."' and correo = '".$dataUser['correo']. "'" ,Adapter::QUERY_MODE_EXECUTE);
//         $consulta = $this->dbAdapter->query("select max(folio) as maxFolio FROM voluntarioCreador where folio like '" . $folioNuevo . "%'", Adapter::QUERY_MODE_EXECUTE);
        
//         $res = $consulta->toArray();
//         return $res;
//     }
    
//     public function existeCorreo($dataUser)
//     {
//         $consulta = $this->dbAdapter->query("select id , folio, correo FROM voluntarioCreador where correo = '" . $dataUser['correo'] . "'", Adapter::QUERY_MODE_EXECUTE);
        
//         $res = $consulta->toArray();
//         // echo "existe correo";
//         // print_r($res);
        
//         return $res;
//     }

}

?>






