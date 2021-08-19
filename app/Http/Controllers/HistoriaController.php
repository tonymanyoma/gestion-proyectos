<?php

namespace App\Http\Controllers;

use App\Historia;
use Illuminate\Http\Request;
use DB;

class HistoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
         
    }

    public function getHistorias(Request $request)
    {
         // obtener historias

         if ($request->wantsJson()) {


            try {

                $historias = DB::table('historias as H')
                    ->where('id_proyecto', $request->id_proyecto)
                    ->where('id_estado', 1)
                    ->orderBy('H.id', 'DESC')
                    ->get();

                // $historias = Historia::with('tickets')->get(); 

            } catch (QueryException $queryException) {

                return $queryException->getMessage();
            }

            return $historias;
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
                'comentarios' => 'required'
            ]);


            $historia = new Historia();

            $historia->nombre = $request->nombre;
            $historia->comentarios = $request->comentarios;
            $historia->id_proyecto = $request->id_proyecto;
            $historia->id_estado = 1;

            $historia->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'historia creada satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Historia  $historia
     * @return \Illuminate\Http\Response
     */
    public function show(Historia $historia)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Historia  $historia
     * @return \Illuminate\Http\Response
     */
    public function edit(Historia $historia)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Historia  $historia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($request->wantsJson()) {

            $this->validate($request, [
                'nombre' => 'required',
                'comentarios' => 'required'
            ]);


            $historia = Historia::find($id);

            $historia->nombre = $request->nombre;
            $historia->comentarios = $request->comentarios;

            $historia->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'historia actualizada satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Historia  $historia
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request,  $id)
    {
        if ($request->wantsJson()) {

            $historia = Historia::find($id);
            $historia->id_estado = 2;

            $historia->save();
            
        } else {
            return redirect('/');
        }
    }
}
