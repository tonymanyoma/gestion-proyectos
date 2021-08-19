<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historia extends Model
{
    public function tickets(){
        return $this->hasMany(Ticket::class, 'id_historia');
    }

     /**
     * Tabla asociada con el modelo
     * @var string
     */
    protected $table = "historias";

    /**
     * @var array
     */
    protected $fillable = [
          'nombre', 'id_proyecto', 'id_estado', 'comentarios'
    ];

}
