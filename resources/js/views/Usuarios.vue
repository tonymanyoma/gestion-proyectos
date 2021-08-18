<template>
  <div>
    <div class="content-wrapper">
      <div class="row">
        <div class="col-md-12">
          <div class="media align-items-center bg-white mb-20">
            <div class="media-body">
              <h3 style="text-align: left" class="font-title">Usuarios</h3>
            </div>
          </div>
        </div>
      </div>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-12 col-lg-12">
            <vs-card>
              <div slot="header">
                <div class="row">
                  <div class="col-md-6">
                    <vs-button
                      color="#08b4e0"
                      type="filled"
                      data-toggle="modal"
                      class="font-title"
                      data-target="#create"
                      >Nuevo</vs-button
                    >
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12">
                  <vs-table
                    @search="handleSearch"
                    @change-page="handleChangePage"
                    @sort="handleSort"
                    v-model="selected"
                    pagination
                    max-items="8"
                    search
                    :data="Usuarios"
                  >
                    <template slot="header"> </template>
                    <template slot="thead">
                      <vs-th sort-key="foto">
                        <p class="p-th">Foto</p>
                      </vs-th>
                      <vs-th sort-key="foto">
                        <p class="p-th">Tipo documento</p>
                      </vs-th>
                      <vs-th sort-key="codigo">
                        <p class="p-th">Número documento</p>
                      </vs-th>
                      <vs-th sort-key="nombre">
                        <p class="p-th">Nombre completo</p>
                      </vs-th>
                      <vs-th sort-key="valor">
                        <p class="p-th">Teléfono</p>
                      </vs-th>
                      <vs-th sort-key="categoria">
                        <p class="p-th">Dirección</p>
                      </vs-th>

                      <vs-th sort-key="stock">
                        <p class="p-th">Email</p>
                      </vs-th>
                      <vs-th sort-key="iva">
                        <p class="p-th">Rol</p>
                      </vs-th>
                      <vs-th sort-key="accion">
                        <p class="p-th">Acción</p>
                      </vs-th>
                    </template>

                    <template slot-scope="{ data }">
                      <vs-tr
                        :data="tr"
                        :key="indextr"
                        v-for="(tr, indextr) in data"
                      >
                        <vs-td :data="data[indextr].foto">
                          <vs-avatar
                            size="50px"
                            :src="'fotos/' + data[indextr].foto"
                          />
                        </vs-td>

                        <vs-td
                          :data="data[indextr].tipo_documento"
                          class="table-td"
                        >
                          {{ data[indextr].tipo_documento }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].numero_documento"
                          class="table-td"
                        >
                          {{ data[indextr].numero_documento }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].nombre_completo"
                          class="table-td"
                        >
                          {{ data[indextr].nombre_completo }}
                        </vs-td>

                        <vs-td :data="data[indextr].telefono" class="table-td">
                          {{ data[indextr].telefono }}
                        </vs-td>

                        <vs-td :data="data[indextr].direccion" class="table-td">
                          {{ data[indextr].direccion }}
                        </vs-td>

                        <vs-td :data="data[indextr].email" class="table-td">
                          {{ data[indextr].email }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].nombre_role"
                          class="table-td"
                        >
                          {{ data[indextr].nombre_role }}
                        </vs-td>

                        <vs-td>
                          <vs-button
                            radius
                            color="warning"
                            color-text="rgb(50,50,50)"
                            icon="edit"
                            v-on:click.prevent="editUsuarios(data[indextr])"
                          ></vs-button>
                          &nbsp;&nbsp;
                          <vs-button
                            radius
                            color="danger"
                            color-text="rgb(50,50,50)"
                            icon="delete"
                            v-on:click.prevent="deleteUsuarios(data[indextr])"
                          ></vs-button>
                        </vs-td>
                      </vs-tr>
                    </template>
                  </vs-table>
                </div>
              </div>
            </vs-card>
          </div>
        </div>
      </section>
    </div>

    <form method="POST" v-on:submit.prevent="createUsuarios">
      <!-- Modal -->
      <div
        class="modal fade bs-example-modal-lg"
        tabindex="-1"
        role="dialog"
        aria-labelledby="myLargeModalLabel"
        aria-hidden="true"
        style="display: none"
        id="create"
      >
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header bg-info">
              <h5 class="modal-title">Nuevo Usuario</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="tipo_documento">Tipo Documento</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <select
                          class="custom-select"
                          v-model="newid_tipo"
                          required
                        >
                          <option value="0" disabled>Seleccione</option>
                          <option
                            v-for="documento in arraydocumentos"
                            :key="documento.id"
                            :value="documento.id"
                          >
                            {{ documento.nombre }}
                          </option>
                        </select>
                      </div>
                      <!-- /.input group -->
                    </div>
                    <div class="col-md-4">
                      <label for="documento">Número Documento</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <input
                          id="documento"
                          type="number"
                          class="form-control"
                          v-model="newnumero_documento"
                          min="1"
                          required
                          pattern="[0-9]+"
                          title="Ingrese sólo Números"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                    <div class="col-md-4">
                      <label for="nombre">Nombre Completo</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          id="nombre"
                          type="text"
                          class="form-control"
                          v-model="newnombre_completo"
                          required
                          pattern="[A-Z a-z\sáéíóú]+"
                          title="Ingrese sólo Letras"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="telefono">Teléfono</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-phone"></i
                          ></span>
                        </div>
                        <input
                          id="telefono"
                          type="text"
                          class="form-control"
                          v-model="newtelefono"
                          min="1"
                          required
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="direccion">Dirección</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-map-marker"></i
                          ></span>
                        </div>
                        <input
                          id="direccion"
                          type="text"
                          class="form-control"
                          v-model="newdireccion"
                          required
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="email">Email</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-at"></i
                          ></span>
                        </div>
                        <input
                          id="email"
                          type="text"
                          class="form-control"
                          v-model="newemail"
                          pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="tipo_documento">Role</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <select
                          class="custom-select"
                          v-model="newrole"
                          required
                        >
                          <option value="0" disabled>Seleccione</option>
                          <option
                            v-for="role in arrayroles"
                            :key="role.id"
                            :value="role.id"
                          >
                            {{ role.nombre }}
                          </option>
                        </select>
                      </div>
                      <!-- /.input group -->
                    </div>
                    <div class="col-md-4">
                      <label for="password">Password</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-key"></i
                          ></span>
                        </div>
                        <input
                          id="password1"
                          type="password"
                          class="form-control"
                          v-model="newpassword"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="modal-footer modal-footer-uniform">
              <button
                type="button"
                class="btn btn-bold btn-pure btn-secondary btn-rounded"
                data-dismiss="modal"
              >
                Cerrar
              </button>
              <button
                type="submit"
                class="
                  btn btn-bold btn-pure btn-success
                  float-right
                  btn-rounded
                "
              >
                Crear
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- /.modal -->
    </form>

    <form method="POST" v-on:submit.prevent="updateUsuarios(fillusuarios.id)">
      <!-- Modal -->
      <div
        class="modal fade bs-example-modal-lg"
        tabindex="-1"
        role="dialog"
        aria-labelledby="myLargeModalLabel"
        aria-hidden="true"
        style="display: none"
        id="edit"
      >
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header bg-info">
              <h5 class="modal-title">Editar Usuario</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="box card-inverse bg-img">
                    <div class="row">
                      <div class="col-md-12">
                        <center>
                          <vs-avatar
                            size="100px"
                            :src="'fotos/' + fillusuarios.fotoMiniatura"
                          />
                        </center>
                      </div>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="tipo_documento">Tipo Documento</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <select
                          class="custom-select"
                          v-model="fillusuarios.id_tipo_documento"
                          required
                        >
                          <option value="0" disabled>Seleccione</option>
                          <option
                            v-for="documento in arraydocumentos"
                            :key="documento.id"
                            :value="documento.id"
                          >
                            {{ documento.nombre }}
                          </option>
                        </select>
                      </div>
                      <!-- /.input group -->
                    </div>
                    <div class="col-md-4">
                      <label for="documento">Número Documento</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <input
                          type="number"
                          class="form-control"
                          v-model="fillusuarios.numero_documento"
                          min="1"
                          required
                          pattern="[0-9]+"
                          title="Ingrese sólo Números"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                    <div class="col-md-4">
                      <label for="nombre">Nombre Completo</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          type="text"
                          class="form-control"
                          v-model="fillusuarios.nombre_completo"
                          required
                          pattern="[A-Z a-z\sáéíóú]+"
                          title="Ingrese sólo Letras"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="telefono">Teléfono</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-phone"></i
                          ></span>
                        </div>
                        <input
                          type="text"
                          class="form-control"
                          v-model="fillusuarios.telefono"
                          min="1"
                          required
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="direccion">Dirección</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-map-marker"></i
                          ></span>
                        </div>
                        <input
                          type="text"
                          class="form-control"
                          v-model="fillusuarios.direccion"
                          required
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="email">Email</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-at"></i
                          ></span>
                        </div>
                        <input
                          type="text"
                          class="form-control"
                          v-model="fillusuarios.email"
                          pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="tipo_documento">Role</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <select
                          class="custom-select"
                          v-model="fillusuarios.id_role"
                          required
                        >
                          <option value="0" disabled>Seleccione</option>
                          <option
                            v-for="role in arrayroles"
                            :key="role.id"
                            :value="role.id"
                          >
                            {{ role.nombre }}
                          </option>
                        </select>
                      </div>
                      <!-- /.input group -->
                    </div>
                    <div class="col-md-4">
                      <label for="password">Password</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-key"></i
                          ></span>
                        </div>
                        <input
                          id="password"
                          type="password"
                          class="form-control"
                          v-model="fillusuarios.password"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="modal-footer modal-footer-uniform">
              <button
                type="button"
                class="btn btn-bold btn-pure btn-secondary btn-rounded"
                data-dismiss="modal"
              >
                Cerrar
              </button>
              <button
                type="submit"
                class="
                  btn btn-bold btn-pure btn-success
                  float-right
                  btn-rounded
                "
              >
                Actualizar
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- /.modal -->
    </form>
  </div>
</template>

<script>
import LayoutDefault from "../components/layouts/Principal.vue";
import { misMixins } from "../mixins.js";

export default {
  created: function () {
    this.getUsuarios();
    this.select_tipo_documento();
    this.select_role();

    this.$emit("update:layout", LayoutDefault);
  },

  data() {
    return {
      fotoMiniatura: "",
      imagen: "",
      Usuarios: [],
      arraydocumentos: [],
      arrayroles: [],
      selected: [],
      newid_tipo: "",
      newrole: "",
      newnumero_documento: "",
      newnombre_completo: "",
      newtelefono: "",
      newdireccion: "",
      newemail: "",
      newusername: "",
      newpassword: "",
      errors: [],
      fillusuarios: {
        id: "",
        numero_documento: "",
        nombres_completo: "",
        telefono: "",
        direccion: "",
        email: "",
        id_tipo_documento: "",
        id_role: "",
        password: "",
      },
    };
  },

  mixins: [misMixins],

  methods: {
    handleSearch(searching) {
      let _print = `The user searched for: ${searching}\n`;
      this.$refs.pre.appendChild(document.createTextNode(_print));
    },
    handleChangePage(page) {
      let _print = `The user changed the page to: ${page}\n`;
      this.$refs.pre.appendChild(document.createTextNode(_print));
    },
    handleSort(key, active) {
      let _print = `the user ordered: ${key} ${active}\n`;
      this.$refs.pre.appendChild(document.createTextNode(_print));
    },

    select_tipo_documento() {
      let me = this;
      this.$http({
        url: "auth/documentos",
        method: "GET",
      })
        .then((response) => {
          me.arraydocumentos = response.data.documentos;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    select_role() {
      let me = this;
      this.$http({
        url: "auth/roles",
        method: "GET",
      })
        .then(function (response) {
          me.arrayroles = response.data.roles;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    getUsuarios() {
      this.spinnerOpen();

      let me = this;
      this.$http({
        url: "auth/usuarios",
        method: "GET",
      })
        .then(function (response) {
          (me.Usuarios = response.data), me.spinnerClose();
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    editUsuarios(usuario) {
      this.fillusuarios.id = usuario.id;
      this.fillusuarios.numero_documento = usuario.numero_documento;
      this.fillusuarios.id_tipo_documento = usuario.id_tipo_documento;
      this.fillusuarios.nombre_completo = usuario.nombre_completo;
      this.fillusuarios.telefono = usuario.telefono;
      this.fillusuarios.direccion = usuario.direccion;
      this.fillusuarios.email = usuario.email;
      this.fillusuarios.id_role = usuario.id_role;
      this.fillusuarios.id_estado = usuario.id_estado;
      this.fillusuarios.fotoMiniatura = usuario.foto;
      this.fillusuarios.password = usuario.password;
      // this.fillusuarios.estado = usuario.estado;

      $("#edit").modal("show");
    },

    updateUsuarios(id) {
      this.loadingOpen();

      let me = this;
      this.$http({
        url: "auth/usuarios/" + id,
        method: "PUT",
        data: {
          id_tipo_documento: this.fillusuarios.id_tipo_documento,
          numero_documento: this.fillusuarios.numero_documento,
          nombre_completo: this.fillusuarios.nombre_completo,
          telefono: this.fillusuarios.telefono,
          direccion: this.fillusuarios.direccion,
          email: this.fillusuarios.email,
          id_role: this.fillusuarios.id_role,
          id_estado: this.fillusuarios.id_estado,
          password: this.fillusuarios.password,
          //foto: this.fillusuarios.fotoMiniatura,
        },
      })
        .then((response) => {
          this.getUsuarios();
          this.errors = [];

          $("#edit").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }
          this.$swal(
            "Actualizado",
            "usuario actualizado con éxito.",
            "success"
          );
        })
        .catch((error) => {
          this.errors = errors.response.data;
        });
    },

    createUsuarios() {
      this.loadingOpen();

      this.$http({
        url: "auth/usuarios",
        method: "POST",
        data: {
          id_tipo_documento: this.newid_tipo,
          numero_documento: this.newnumero_documento,
          nombre_completo: this.newnombre_completo,
          telefono: this.newtelefono,
          direccion: this.newdireccion,
          email: this.newemail,
          id_role: this.newrole,
          password: this.newpassword,
          id_estado: 1,
          foto: this.fotoMiniatura,
        },
      })
        .then((response) => {
          this.getUsuarios();

          this.newid_tipo = "";
          this.newnumero_documento = "";
          this.newapellidos = "";
          this.newnombre_completo = "";
          this.newtelefono = "";
          this.newbarrio = "";
          this.newdireccion = "";
          this.newemail = "";
          this.newrole = "";
          this.newpassword = "";
          this.fotoMiniatura = "";

          this.errors = [];
          $("#create").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }

          this.$swal("Creado", "usuario creado con éxito.", "success");
        })
        .catch((error) => {
          console.log(error.response.data.code);
          //this.errors = 'error.response.data'
          if (error.response.data.code == 1) {
            this.$swal({
              type: "error",
              title: "El documento ya se encuentra registrado",
              text: "Por favor verifica los datos",
            });
          }
          if (error.response.data.code == 2)
            this.$swal({
              type: "error",
              title: "El email ya se encuentra registrado",
              text: "Por favor verifica los datos",
            });
        });
    },

    deleteUsuarios(usuario) {
      this.$swal({
        title: "Está seguro de Eliminar este Usuario?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#00BFF3",
        cancelButtonColor: "#d33",
        confirmButtonText: "Aceptar!",
        cancelButtonText: "Cancelar",
        confirmButtonClass: "btn btn-info",
        cancelButtonClass: "btn btn-danger",
        buttonsStyling: false,
        reverseButtons: true,
      }).then((result) => {
        if (result.value) {
          this.loadingOpen();

          this.$http({
            url: "auth/usuarios/" + usuario.id,
            method: "DELETE",
          })
            .then((response) => {
              this.getUsuarios();
              this.$swal(
                "Eliminado!",
                "El Usuario ha sido Eliminado con éxito.",
                "success"
              );
            })
            .catch(function (error) {
              console.log(error);
            });
        } else if (
          // Read more about handling dismissals
          result.dismiss === swal.DismissReason.cancel
        ) {
        }
      });
    },
  },

  components: {},
};
</script>


<style scoped>
th,
td {
  text-align: center;
}

.btn-warning {
  background-color: #ffc107;
  border-color: #ffc107;
}

.p-th {
  margin: auto;
  font-family: title;
  font-size: 15px;
}

.table-td {
  font-family: body;
  font-size: 13px;
}
</style>
