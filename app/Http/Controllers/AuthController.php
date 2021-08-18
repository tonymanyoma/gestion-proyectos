<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Auth;
use Validator;
use App\Usuario;
class AuthController extends Controller
{
    /**
     * Register a new user
     */
    public function register(Request $request)
    {
        $v = Validator::make($request->all(), [
            'nombre_completo' => 'required|min:3',
            'email' => 'required|email|',
            'password'  => 'required|min:3|confirmed',
        ]);
        if ($v->fails())
        {
            return response()->json([
                'status' => 'error',
                'errors' => $v->errors()
            ], 422);
        }

        $user = new Usuario();

        $user->id_tipo_documento = $request->id_tipo_documento;
        $user->numero_documento = $request->numero_documento;
        $user->nombre_completo = $request->nombre_completo;
        $user->telefono = $request->telefono;
        $user->direccion = $request->direccion;
        $user->id_estado = 1;
        $user->id_role = 1;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->foto = 'admin.svg';

        $user->save();
        return response()->json(['status' => 'success'], 200);
    }
    /**
     * Login user and return a token
     */
    public function login(Request $request)
    {

        $usuario = Usuario::where('email', '=', $request->email)->first();

        if( empty($usuario) ){

            return response()->json(['error' => 'login error por favor revise sus credenciales',
                                 'code' => 3 ], 401);
        }

        $credentials = $request->only('email', 'password');
        if ($token = $this->guard()->attempt($credentials)) {
            return response()->json(['status' => 'success',
                                     'token' => $token,
                                    ], 200)

                            ->header('Authorization', $token);
        }else{

            return response()->json(['error' => 'login error por favor revise sus credenciales',
                                 'code' => 3 ], 401);
        }

        
    }
    /**
     * Logout User
     */
    public function logout()
    {
        $this->guard()->logout();
        return response()->json([
            'status' => 'success',
            'msg' => 'Logged out Successfully.'
        ], 200);
    }
    /**
     * Get authenticated user
     */
    public function user(Request $request)
    {
        $user = Usuario::find(Auth::user()->id);
        return response()->json([
            'status' => 'success',
            'data' => $user
        ]);
    }
    /**
     * Refresh JWT token
     */
    public function refresh()
    {
        if ($token = $this->guard()->refresh()) {
            return response()
                ->json(['status' => 'successs'], 200)
                ->header('Authorization', $token);
        }
        return response()->json(['error' => 'refresh_token_error'], 401);
    }
    /**
     * Return auth guard
     */
    private function guard()
    {
        return Auth::guard();
    }
}
