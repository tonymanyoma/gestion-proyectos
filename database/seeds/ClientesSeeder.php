<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class ClientesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $handle = Faker::create();

         $arrays = range(0,200);

         foreach ($arrays as $valor) {
           DB::table('usuarios')->insert([
               'id_tipo_documento' => 1,
               //'numero_documento' =>$handle->unique()->numberBetween($min = 1, $max = 200),
               'numero_documento' =>$handle->unique()->randomNumber($nbDigits = 8),
               'nombre_completo' => $handle->name,
               'telefono' => $handle->phoneNumber,
               'direccion' => $handle->address,
               'email' => $handle->unique()->safeEmail,
               'id_role' => 3,
               'id_estado' => 1,
           ]);
         }
    }
}
