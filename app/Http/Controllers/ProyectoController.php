<?php

namespace App\Http\Controllers;

use App\Proyecto;
use Illuminate\Http\Request;
use Auth;
use DB;

class ProyectoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // obtener proyectos

        if ($request->wantsJson()) {

            $id_compania = Auth::user()->id_compania;

            try {

                $proyectos = DB::table('proyectos as P')
                    ->where('id_estado', 1)
                    ->where('id_compania', $id_compania)
                    ->orderBy('P.id', 'DESC')
                    ->get();
            } catch (QueryException $queryException) {

                return $queryException->getMessage();
            }

            return $proyectos;
        } else {
            return redirect('/');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // crear proyectos

        if ($request->wantsJson()) {

            $this->validate($request, [
                'nombre' => 'required',
                'descripcion' => 'required'
            ]);

            $id_compania = Auth::user()->id_compania;

            $proyecto = new Proyecto();

            $proyecto->nombre = $request->nombre;
            $proyecto->id_compania = $id_compania;
            $proyecto->descripcion = $request->descripcion;
            $proyecto->id_estado = 1;

            $proyecto->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'proyecto creado satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function show(Proyecto $proyecto)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function edit(Proyecto $proyecto)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($request->wantsJson()) {

            $this->validate($request, [
                'nombre' => 'required',
                'descripcion' => 'required'
            ]);


            $proyecto = Proyecto::find($id);

            $proyecto->nombre = $request->nombre;
            $proyecto->descripcion = $request->descripcion;

            $proyecto->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'proyecto actualizado satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        if ($request->wantsJson()) {

            $proyecto = Proyecto::find($id);
            $proyecto->id_estado = 2;

            $proyecto->save();
            
        } else {
            return redirect('/');
        }
    }
}
