<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    public function historia_ticket(){
        
        return $this->belongsTo('App\Historia', 'id');
    }

     /**
     * Tabla asociada con el modelo
     * @var string
     */
    protected $table = "tickets";

    /**
     * @var array
     */
    protected $fillable = [
          'id_historia' ,'nombre', 'id_estado', 'id_estado_ticket'
    ];
}
