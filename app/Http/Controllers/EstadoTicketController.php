<?php

namespace App\Http\Controllers;

use App\Estado_ticket;
use Illuminate\Http\Request;

class EstadoTicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->wantsJson()) {

            $estados = Estado_ticket::select('id', 'nombre')
                ->orderBy('id', 'asc')->get();

            return ['estados' => $estados];
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
     * @param  \App\Estado_ticket  $estado_ticket
     * @return \Illuminate\Http\Response
     */
    public function show(Estado_ticket $estado_ticket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Estado_ticket  $estado_ticket
     * @return \Illuminate\Http\Response
     */
    public function edit(Estado_ticket $estado_ticket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Estado_ticket  $estado_ticket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Estado_ticket $estado_ticket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Estado_ticket  $estado_ticket
     * @return \Illuminate\Http\Response
     */
    public function destroy(Estado_ticket $estado_ticket)
    {
        //
    }
}
