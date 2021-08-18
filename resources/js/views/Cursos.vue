<template>
  <div>
    <div class="content-wrapper">
      <div class="row">
        <div class="col-md-12">
          <div class="media align-items-center bg-white mb-20">
            <div class="media-body">
              <h3 style="text-align: left" class="font-title">Cursos</h3>
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
                    :data="Cursos"
                  >
                    <template slot="header"> </template>
                    <template slot="thead">
                      <vs-th sort-key="Nombre">
                        <p class="p-th">Nombre</p>
                      </vs-th>
                      <vs-th sort-key="intensidad">
                        <p class="p-th">Intensidad horaria</p>
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
                        <vs-td :data="data[indextr].nombre" class="table-td">
                          {{ data[indextr].nombre }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].intensidad_horaria"
                          class="table-td"
                        >
                          {{ data[indextr].intensidad_horaria }}
                        </vs-td>

                        <vs-td>
                          <vs-button
                            radius
                            color="warning"
                            color-text="rgb(50,50,50)"
                            icon="edit"
                            v-on:click.prevent="editCursos(data[indextr])"
                          ></vs-button>
                          &nbsp;&nbsp;
                          <vs-button
                            radius
                            color="danger"
                            color-text="rgb(50,50,50)"
                            icon="delete"
                            v-on:click.prevent="deleteCursos(data[indextr])"
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

    <form method="POST" v-on:submit.prevent="createCursos">
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
              <h5 class="modal-title">Nuevo Curso</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="nombre">Nombre Curso</label>
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
                          v-model="newnombre"
                          required
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="intensidad">Intensidad horaria</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <input
                          id="intensidad"
                          type="number"
                          class="form-control"
                          v-model="newintensidad_horaria"
                          min="1"
                          required
                          pattern="[0-9]+"
                          title="Ingrese sólo Números"
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

    <form method="POST" v-on:submit.prevent="updateCursos(fillcursos.id)">
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
              <h5 class="modal-title">Editar Curso</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="edit-nombre">Nombre Curso</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          id="edit-nombre"
                          type="text"
                          class="form-control"
                          v-model="fillcursos.nombre"
                          required
                          title="Ingrese sólo Letras"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="edit-intensidad">Intensidad horaria</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <input
                          id="edit-intensidad"
                          type="number"
                          class="form-control"
                          v-model="fillcursos.intensidad_horaria"
                          min="1"
                          required
                          pattern="[0-9]+"
                          title="Ingrese sólo Números"
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
    this.$emit("update:layout", LayoutDefault);

    this.getCursos();
  },

  data() {
    return {
      Cursos: [],
      selected: [],
      newnombre: "",
      newintensidad_horaria: "",
      fillcursos: {
        id: "",
        nombre: "",
        intensidad_horaria: "",
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

    getCursos() {
      this.spinnerOpen();

      let me = this;
      this.$http({
        url: "auth/cursos",
        method: "GET",
      })
        .then(function (response) {
          (me.Cursos = response.data), me.spinnerClose();
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    editCursos(curso) {
      this.fillcursos.id = curso.id;
      this.fillcursos.nombre = curso.nombre;
      this.fillcursos.intensidad_horaria = curso.intensidad_horaria;

      $("#edit").modal("show");
    },

    updateCursos(id) {
      this.loadingOpen();

      let me = this;
      this.$http({
        url: "auth/cursos/" + id,
        method: "PUT",
        data: {
          nombre: this.fillcursos.nombre,
          intensidad_horaria: this.fillcursos.intensidad_horaria,
        },
      })
        .then((response) => {
          this.getCursos();
          this.errors = [];

          $("#edit").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }
          this.$swal("Actualizado", "curso actualizado con éxito.", "success");
        })
        .catch((error) => {
          this.errors = errors.response.data;
        });
    },

    createCursos() {
      this.loadingOpen();

      this.$http({
        url: "auth/cursos",
        method: "POST",
        data: {
          nombre: this.newnombre,
          intensidad_horaria: this.newintensidad_horaria,
        },
      })
        .then((response) => {
          this.getCursos();

          this.nombre = "";
          this.intensidad_horaria = "";

          this.errors = [];
          $("#create").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }

          this.$swal("Creado", "curso creado con éxito.", "success");
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    },

    deleteCursos(curso) {
      this.$swal({
        title: "Está seguro de Eliminar este Curso?",
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
            url: "auth/cursos/" + curso.id,
            method: "DELETE",
          })
            .then((response) => {
              this.getCursos();
              this.$swal(
                "Eliminado!",
                "El curso ha sido Eliminado con éxito.",
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
