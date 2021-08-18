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
					<form @submit.prevent="register" v-if="!success" method="post">

                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-info border-info"><i class="fa fa-id-card"></i></span>
                            </div>
                            <select class="custom-select"  v-model="id_tipo" required>
                                <option value="" disabled>Tipo de documento</option>
                                <option v-for="documento in arraydocumentos" :key="documento.id" :value="documento.id" >{{documento.nombre}}</option>
                                </select>
                            </div>
                    </div>

                    <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="fa fa-id-card"></i></span>
								</div>
								<input type="number" class="form-control" placeholder="Número Documento" v-model="numero_documento" required>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="ti-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Nombre Completo" v-model="nombre_completo" required>
							</div>
						</div>

            <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="fa fa-phone"></i></span>
								</div>
								<input type="number" class="form-control" placeholder="Telefono" v-model="telefono" required>
							</div>
						</div>

            <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="fa fa-map-marker"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Dirección" v-model="direccion" required>
							</div>
						</div>

            <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-info border-info"><i class="fa fa-briefcase"></i></span>
                            </div>
                            <select class="custom-select" v-model="id_compania" required>
                                <option value="" disabled>Compañia</option>
                                <option v-for="compania in arraycompanias" :key="compania.id" :value="compania.id" >{{compania.nombre}}</option>
                                </select>
                            </div>
                    </div>

						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="ti-email"></i></span>
								</div>
								<input type="email" class="form-control" placeholder="Email" v-model="email" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="ti-lock"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="Contraseña" v-model="password" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="ti-lock"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="Confirmar Contraseña" v-model="password_confirmation" required>
							</div>
						</div>
						  <div class="row">

							<!-- /.col -->
							<div class="col-12 text-center">
							  <button type="submit" class="btn btn-info btn-block margin-top-10 btn-rounded">CREAR CUENTA</button>
							</div>
							<!-- /.col -->
						  </div>
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

      created: function(){

          this.select_tipo_documento();
          this.selectCompania();
      },

    data() {
      return {
       numero_documento:'',
       nombre_completo:'',
       email:'',
       password:'',
       id_tipo:'',
       id_compania:'',
       telefono:'',
       direccion:'',
        password_confirmation: '',
        has_error: false,
        error: '',
        errors: {},
        success: false,
        arraydocumentos:[],
        arraycompanias:[],
        loading: true
      }
    },

    mixins:[misMixins],

    methods: {

        select_tipo_documento(){

                let me =this;
                let url = 'documentos'
                axios.get(url)
                .then((response) => {
                    me.arraydocumentos = response.data.documentos;
                })
                .catch(function (error) {
                    // handle error
                    console.log(error);
                });
            },

     selectCompania(){

                let me = this;
                let url = 'getCompanias'
                axios.get(url)
                .then((response) => {
                    me.arraycompanias = response.data.companias;

                })
                .catch(function (error) {
                    // handle error
                    console.log(error);
                });
            },       

      register() {

        this.loadingOpen();

        var app = this
        this.$auth.register({
          data: {
           id_tipo_documento: app.id_tipo,
           numero_documento: app.numero_documento,
           nombre_completo: app.nombre_completo,
            email: app.email,
            telefono: app.telefono,
            direccion: app.direccion,
            password: app.password,
            password_confirmation: app.password_confirmation,
            id_compania: app.id_compania
          },
          success: function () {

            this.$swal(
                    'Creado',
                    'Registro exitoso',
                    'success'
                )

            app.success = true
            this.$router.push({name: 'login', params: {successRegistrationRedirect: true}})
          },
          error: function (res) {
            // console.log(res.response.data.errors)
            app.has_error = true
            app.error = res.response.data.error
            app.errors = res.response.data.errors || {}
          }
        })
      }
    }
  }
</script>
