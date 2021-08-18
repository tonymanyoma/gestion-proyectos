<?php

namespace App\Http\Controllers;

use App\Ciudad;
use App\Curso;
use App\Detalle_matricula_curso;
use App\Matricula_curso;
use App\Usuario;
use Illuminate\Http\Request;
use Auth;
use DB;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
    }


    public function infoDashboardAdmin(Request $request)
    {
        if ($request->wantsJson()) {

            $TotalCursos = Curso::where('id_estado', '=', 1)->count();

            $TotalUsuarios = Usuario::where('id_estado', '=', 1)->count();

            $TotalMatriculas = Matricula_curso::where('id_estado', '=', 1)->count();

            return response()->json([
                'status' => 'success',
                'TotalCursos' => $TotalCursos,
                'TotalUsuarios' => $TotalUsuarios,
                'TotalMatriculas' => $TotalMatriculas,

            ], 200);
        } else {
            return redirect('/');
        }
    }

    public function infoDashboardAlumno(Request $request)
    {
        if ($request->wantsJson()) {

            $id_user = Auth::user()->id;


            $TotalCursos = DB::table('matricula_cursos as M')
                        ->join('detalle_matricula_cursos as D', 'D.id_matricula', '=', 'M.id')
                        ->where('M.id_usuario', '=', $id_user)
                        ->where('M.id_estado', '=', 1)
                        ->count();
                        


            return $TotalCursos;
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function show(Ciudad $ciudad)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function edit(Ciudad $ciudad)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ciudad $ciudad)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ciudad $ciudad)
    {
        //
    }
}
