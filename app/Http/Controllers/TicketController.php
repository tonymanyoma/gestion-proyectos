<?php

namespace App\Http\Controllers;

use App\Ticket;
use Illuminate\Http\Request;
use DB;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function getTickets(Request $request)
    {
        // obtener tickets

        if ($request->wantsJson()) {


            try {

                $tickets = DB::table('tickets as T')
                    ->join('estado_tickets as E', 'T.id_estado_ticket', '=', 'E.id')
                    ->select('T.*', 'E.nombre as estado')
                    ->where('id_historia', $request->id_historia)
                    ->orderBy('T.id', 'DESC')
                    ->get();

                // $historias = Historia::with('tickets')->get(); 

            } catch (QueryException $queryException) {

                return $queryException->getMessage();
            }

            return $tickets;
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
        // crear tickets

        if ($request->wantsJson()) {

            $this->validate($request, [
                'nombre' => 'required',
                'comentarios' => 'required'
            ]);


            $ticket = new Ticket();

            $ticket->nombre = $request->nombre;
            $ticket->comentarios = $request->comentarios;
            $ticket->id_historia = $request->id_historia;
            $ticket->id_estado_ticket = 1;
            $ticket->id_estado = 1;

            $ticket->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'ticket creada satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    public function updateTickets(Request $request)
    {
        // actualizar estado de tickets

        if ($request->wantsJson()) {



            $ticket = Ticket::find($request->id_ticket);

            $ticket->id_estado_ticket = $request->estado;

            $ticket->save();


            return response()->json([
                'status' => 'Operacion concretada!',
                'msg' => 'ticket actualizado satisfactoriamente',
                'code' => 1
            ], 201);
        } else {
            return redirect('/');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function show(Ticket $ticket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function edit(Ticket $ticket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ticket $ticket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ticket $ticket)
    {
        //
    }
}
