<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Usuario extends Authenticatable implements JWTSubject
{
    use Notifiable;

    public function id_estado(){
        return $this->belongsTo(Estado::class, 'id');
    }

    public function id_role(){
        return $this->belongsTo(Role::class, 'id');
    }


    /**
     * Tabla asociada con el modelo
     * @var string
     */
    protected $table = "usuarios";

    /**
     * @var array
     */
    protected $fillable = [
        'id_tipo_documento','numero_documento','nombre_completo', 'telefono','direccion','email','password','foto' ,'id_role', 'id_estado'
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

}
