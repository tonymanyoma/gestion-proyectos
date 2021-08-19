<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->unsignedInteger('id_historia')->nullable();
            $table->foreign('id_historia')->references('id')->on('historias');
            $table->unsignedInteger('id_estado')->nullable();
            $table->foreign('id_estado')->references('id')->on('estados');
            $table->unsignedInteger('id_estado_ticket')->nullable();
            $table->foreign('id_estado_ticket')->references('id')->on('estado_tickets');
            $table->longText('comentarios');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
