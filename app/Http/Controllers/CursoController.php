<?php

namespace App\Http\Controllers;

use App\Curso;
use Illuminate\Http\Request;
use DB;

class CursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->wantsJson()) {


            try {

                $cursos = DB::table('cursos as C')
                    ->where('C.id_estado', '=', 1)
                    ->orderBy('C.id', 'DESC')
                    ->get();
            } catch (QueryException $queryException) {

                return $queryException->getMessage();
            }

            return $cursos;
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
        if ($request->wantsJson()) {

            $this->validate($request, [
                'nombre' => 'required',
                'intensidad_horaria' => 'required'
            ]);


            $curso = new Curso();

            $curso->nombre = $request->nombre;
            $curso->intensidad_horaria = $request->intensidad_horaria;
            $curso->id_estado = 1;

            $curso->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'curso creado satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function show(Curso $curso)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function edit(Curso $curso)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($request->wantsJson()) {

            $this->validate($request, [
                'nombre' => 'required',
                'intensidad_horaria' => 'required'
            ]);


            $curso = Curso::find($id);

            $curso->nombre = $request->nombre;
            $curso->intensidad_horaria = $request->intensidad_horaria;

            $curso->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'curso actualizado satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        if ($request->wantsJson()) {

            $curso = Curso::find($id);
            $curso->id_estado = 2;

            $curso->save();
        } else {
            return redirect('/');
        }
    }
}
