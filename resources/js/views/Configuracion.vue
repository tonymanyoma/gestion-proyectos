<template>


    <div>

        <div class="content-wrapper">

            <div class="row">

                <div class=" col-md-12 ">
                    <div class="media align-items-center bg-white mb-20">

                    <div class="media-body">
                        <h3><strong>Configuración</strong></h3>
                    </div>
                    </div>
                </div>

            </div>

        <section class="content">

            <div class="row">
                <div class="col-md-6">
            <form  method="POST" v-on:submit.prevent="updateUsuario" >
                <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Información Personal</h3>
              </div>
              <div class="card-body">

                 <div class="box card-inverse bg-img" style="background-image: url(images/fondo-clientes.png); padding-top: 150px">

              <div class="flexbox align-items-center px-20" data-overlay="4">
                <div class="flexbox align-items-center mr-auto">
                  <a href="#" >
                    <img class="avatar avatar-xl avatar-bordered" :src="fotoMiniatura" alt="foto">
                  </a>
                  <div class="pl-10 d-none d-md-block">

                  </div>
                </div>

                <ul class="flexbox flex-justified text-center py-20">

                  <li class="pl-10">
                    <label for="file-upload" class="subir">
                    <i class="fa fa-camera" style="width:50px;"></i>
                    </label>
                    <input id="file-upload" type="file" name="foto" @change="obtenerFoto" class="form-control-file" style='display: none;'>

                  </li>
                </ul>

              </div>
            </div>

                 <div class="form-group row">

        			<div class="col-md-4">

                        <label for="tipo_documento">Tipo Documento</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-id-card"></i></span>
						  </div>
						   <select class="custom-select" v-model="newid_tipo" required>
                            <option value="0" disabled>Seleccione</option>
                            <option v-for="documento in arraydocumentos" :key="documento.id" :value="documento.id" >{{documento.nombre}}</option>
                            </select>
						</div>
						<!-- /.input group -->

					</div>
					<div class="col-md-4">
                      <label for="documento">Número Documento</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-id-card"></i></span>
						  </div>
						   <input id="documento" type="number" class="form-control" v-model="newnumero_documento" min="1" required pattern="[0-9]+" title="Ingrese sólo Números" >
						</div>
						<!-- /.input group -->
				  	</div>
                     <div class="col-md-4">
					  <label for="nombre">Nombre Completo</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-user"></i></span>
						  </div>
						   <input id="nombre" type="text" class="form-control" v-model="newnombre_completo" required pattern="[A-Z a-z\sáéíóú]+" title="Ingrese sólo Letras">

						</div>
						<!-- /.input group -->
				  	</div>

				</div>

          <div class="form-group row">

            <div class="col-md-4">
					 <label for="telefono">Teléfono</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-phone"></i></span>
						  </div>
						   <input id="telefono" type="number" class="form-control" v-model="newtelefono" min="1" required pattern="[0-9]+" title="Ingrese sólo Números">
						</div>
						<!-- /.input group -->
				  	</div>

            <div class="col-md-4">
					  <label for="direccion">Dirección</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-map-marker"></i></span>
						  </div>
						   <input id="direccion" type="text" class="form-control" v-model="newdireccion" required >
						</div>
						<!-- /.input group -->
				  	</div>

            <div class="col-md-4">
					   <label for="email">Email</label>
						  <div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-at"></i></span>
						  </div>
						   <input id="email" type="text" class="form-control" v-model="newemail" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" disabled>
						</div>
						<!-- /.input group -->
				  	</div>
            </div>


              </div>
              <div class="card-footer clearfix">

                    <button type="submit" class="btn btn-bold btn-pure btn-success float-right btn-rounded" style="margin-top:10px; margin-right:10px; margin-bottom:10px;">Guardar</button>
                </div>


              <!-- /.card-body -->
            </div>
            </form>
            </div>



            </div>

        </section>

        </div>

        <form  method="POST" v-on:submit.prevent="updateConfiguracion(fillconfiguracion.id)">
        <!-- Modal -->
				<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;" id="edit">
				  <div class="modal-dialog modal-lg">
					<div class="modal-content">

					  <div class="modal-header bg-info">
						<h5 class="modal-title">Editar Comisiones</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
				<div class="row">

            <div class="col s12">

                <div class="form-group row">
					<div class="col-md-4">
                      <label for="comision_lente">Comisión Lente</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-percent"></i></span>
						  </div>
						   <input id="comision_lente" type="number" class="form-control" v-model="fillconfiguracion.comision_lente" min="1" required pattern="[0-9]+" title="Ingrese sólo Números">
						</div>
						<!-- /.input group -->
				  	</div>
                     <div class="col-md-4">
					  <label for="comision_montura">Comisión Montura</label>
						<div class="input-group">
						  <div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-money"></i></span>
						  </div>
						   <input id="comision_montura" type="text" class="form-control" v-model="fillconfiguracion.comision_montura" required pattern="[0-9]+" title="Ingrese sólo Números">

						</div>
						<!-- /.input group -->
				  	</div>

				</div>

                    </div>
                  </div>

					  </div>

					  <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-pure btn-secondary btn-rounded" data-dismiss="modal">Cerrar</button>
						<button type="submit" class="btn btn-bold btn-pure btn-success float-right btn-rounded">Guardar</button>
					  </div>
					</div>
				  </div>
				</div>
			  <!-- /.modal -->
    </form>

    </div>



</template>

<script>

        import LayoutDefault from '../components/layouts/Principal.vue';

        export default{

            created: function (){

            this.select_tipo_documento();
            this.listar_configuracion();
            this.validar_configuracion();

            this.$emit('update:layout', LayoutDefault);

            },

            data(){

                return{

                    newid_tipo:this.$auth.user().id_tipo_documento,
                    newnumero_documento:this.$auth.user().numero_documento,
                    newnombre_completo:this.$auth.user().nombre_completo,
                    newtelefono:this.$auth.user().telefono,
                    newdireccion:this.$auth.user().direccion,
                    newemail:this.$auth.user().email,
                    newrole:this.$auth.user().id_role,
                    //newpassword:this.$auth.user().password,
                    fotoMiniatura : 'fotos/'+this.$auth.user().foto,
                    arraydocumentos:[],
                    newcomision_lente:'',
                    newcomision_montura:'',
                    Configuracions:[],
                    loading: true,
                    fillconfiguracion:{'comision_lente': '',  'comision_montura': ''},
                    Validar_Configuracion: 0,

            }

            },

            computed: {

           foto(){
               return this.fotoMiniatura;
           },


            },

            methods:{

                obtenerFoto(e){
                let file = e.target.files[0];
                this.foto = file;

                this.cargarImagen(file);
            },



            cargarImagen(file){
                let reader = new FileReader();

                reader.onload = (e) => {
                    this.fotoMiniatura = e.target.result;
                }
                reader.readAsDataURL(file);
                this.foto = file.name;
                console.log(file.name);

            },

          select_tipo_documento(){
                this.$http({
                url: 'auth/documentos',
                method: 'GET'
                })
                .then((response) => {
                    this.arraydocumentos = response.data.documentos;

                })
                .catch(function (error) {
                    // handle error
                    console.log(error);
                });
            },

            validar_configuracion(){
                this.$http({
                url: 'auth/validar-configuracion',
                method: 'GET'
                })
                .then((response) => {
                    this.Validar_Configuracion = response.data;
                })
                .catch(function (error) {
                    // handle error
                    console.log(error);
                });
            },

            listar_configuracion(){
                this.$http({
                url: 'auth/listar-configuracion',
                method: 'GET'
                })
                .then((response) => {
                    this.Configuracions = response.data;
                    this.loading = false;

                })
                .catch(function (error) {
                    // handle error
                    console.log(error);
                });
            },


    

        editConfiguracion(configuracion){

                this.fillconfiguracion.id = configuracion.id;
                this.fillconfiguracion.comision_lente = configuracion.comision_lente;
                this.fillconfiguracion.comision_montura = configuracion.comision_montura;

                $('#edit').modal('show');
            },

        updateConfiguracion(id){

                 this.$swal({
                title: 'Cargando!',
                text: 'Espere un momento por favor..',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                showCancelButton: false,
                showConfirmButton: false,
                imageUrl: "img/spinner.gif",
                onOpen: () => {
                    swal.showLoading()
                }
            });

                this.$http({
                url: 'auth/comisiones/' + id,
                method: 'PUT',
                data : this.fillconfiguracion
                })
                .then(response => {
                    this.listar_configuracion();
                    this.fillconfiguracion = {'id': '', 'comision_lente': '', 'comision_montura': ''};
                    this.errors = [];

                    $('#edit').modal('hide');
                    if ($('.modal-backdrop').is(':visible')) {
                    $('body').removeClass('modal-open');
                    $('.modal-backdrop').remove();
                };
                     this.$swal(
                    'Actualizado',
                    'Configuración actualizada con éxito.',
                    'success'
                )
                }).catch(error =>{
                    this.errors = error.response.data
                });
            },

          updateUsuario(){


                this.$swal({
                title: 'Cargando!',
                text: 'Espere un momento por favor..',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                showCancelButton: false,
                showConfirmButton: false,
                imageUrl: "img/spinner.gif",
                onOpen: () => {
                    swal.showLoading()
                }
                });

                var foto_real;
                var foto_nombre = this.fotoMiniatura.split('/');

                if(foto_nombre[1] == this.$auth.user().foto){
                    this.foto_real=''

                }else{
                    this.foto_real = this.fotoMiniatura
                }

                this.$http({
                url: 'auth/usuarios/' + this.$auth.user().id,
                method: 'PUT',
                data: {
                    id_tipo_documento : this.newid_tipo,
                    numero_documento : this.newnumero_documento,
                    nombre_completo : this.newnombre_completo,
                    telefono : this.newtelefono,
                    direccion : this.newdireccion,
                    email : this.newemail,
                    foto: this.foto_real,
                    id_role: this.newrole

                    //password : this.fillclientes.password
                }
                }).then(response => {

                    this.errors = [];

                     this.$swal(
                    'Actualizado',
                    'Información actualizada con éxito.',
                    'success'
                )
                }).catch(error =>{
                    this.errors = errors.response.data
                });
            },

            }
        }



</script>
