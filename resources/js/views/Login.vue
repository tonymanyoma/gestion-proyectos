<template>

    <div>

        <br><br><br><br><br>
        <div class="container h-p100">
		<div class="row align-items-center justify-content-md-center h-p100">

			<div class="col-lg-5 col-md-8 col-12">
				<div class="content-top-agile bg-secondary">
					<img class="card-title text-center" src='images/notas.png' width="150px" />
				</div>
				<div class="p-40 mt-10 bg-white content-bottom">
					<form class="form-signin" autocomplete="off" @submit.prevent="login" method="post">

						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info "><i class="ti-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Email" v-model="email">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info "><i class="ti-lock"></i></span>
								</div>
								<input type="password" id="password-field" class="form-control" placeholder="Contraseña" v-model="password">

                                <div class="input-group-addon">
                                    <a  type="password" @click="switchVisibility"><i id="pass-status" class="fa fa-eye" aria-hidden="true"></i></a>
                                </div>
							</div>
						</div>
						  <div class="row">


							<!-- /.col -->
							<div class="col-12 text-center">
							  <button type="submit" class="btn btn-info btn-block margin-top-10 btn-rounded">INICIAR SESIÓN</button>
							</div >

              
              <div class="col-12 text-center">
                <br>
            	  <router-link :to="{name: 'register'}"><a class="cambio-color" href="#">¿No tienes una cuenta? Regístrate</a></router-link>
              </div>

						  </div>

              <br><br>
              
					</form>

				</div>
			</div>


		</div>
	</div>

         

    </div>

</template>
<script>

  import {misMixins} from '../mixins.js';

  export default {
    data() {
      return {

        email: null,
        password: null,
        success: false,
        has_error: false,
        error: '',
        loading: true,
        passwordFieldType: 'password'
      }
    },
    mounted() {
      //
    },

    mixins:[misMixins],

    methods: {

    switchVisibility() {

        var passwordInput = document.getElementById('password-field');
        var passStatus = document.getElementById('pass-status');

        if (passwordInput.type == 'password'){
            passwordInput.type='text';
            passStatus.className='fa fa-eye-slash';

        }
        else{
            passwordInput.type='password';
            passStatus.className='fa fa-eye';
        }
    },

      login() {

        
          if( this.email == '' || this.password == '' ){

              this.$swal({
                    type: 'error',
                    text: 'Debes ingresar un correo y una contraseña',
                    })
          }else{

         this.loadingOpen();
         const authUser = {}

        var redirect = this.$auth.redirect()
        var app = this

        this.$auth.login({
          data: {
            email: app.email,
            password: app.password
          },
          success: function(res) {


            authUser.data = this.$auth.user();

            localStorage.setItem('token', res.data.token);

            app.success = true

            window.localStorage.setItem('lbUser',JSON.stringify(authUser));

            this.loadingClose();

            

                const redirectTo = 'dashboard'
                this.$router.push({name: redirectTo})




          },

          error: function(res) {
            app.has_error = true
            app.error = res.response.data.error

            $("#load").modal("hide");

            if(res.response.data.code == 2){
                    this.$swal({
                    type: 'error',
                    title: 'Usuario no válido',
                    text: 'Por favor verifica los datos',
                    })


            }else if(res.response.data.code == 3){
                    this.$swal({
                    type: 'error',
                    title: 'Email o contraseña no válidos',
                    text: 'Por favor verifica los datos',
                    })
            }
          },
          rememberMe: true,
          fetchUser: true
        })

          }


      }
    }
  }
</script>

<style>

body{
    background-color:#F4F6F9;
}

</style>
