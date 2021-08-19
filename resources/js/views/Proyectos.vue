<template>
  <div>
    <div class="content-wrapper">
      <div class="row">
        <div class="col-md-12">
          <div class="media align-items-center bg-white mb-20">
            <div class="media-body">
              <h3 style="text-align: left" class="font-title">Proyectos</h3>
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
                    :data="Proyectos"
                  >
                    <template slot="header"> </template>
                    <template slot="thead">
                      <vs-th sort-key="Nombre">
                        <p class="p-th">Nombre</p>
                      </vs-th>
                      <vs-th sort-key="intensidad">
                        <p class="p-th">Descripción</p>
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
                          :data="data[indextr].descripcion"
                          class="table-td"
                        >
                          {{ data[indextr].descripcion }}
                        </vs-td>

                        <vs-td>
                          <router-link
                            :to="{
                              name: 'historias',
                              params: {
                                id: data[indextr].id,
                                nombre: data[indextr].nombre,
                                descripcion: data[indextr].descripcion,
                              },
                            }"
                          >
                            <vs-button
                              radius
                              color="primary"
                              color-text="rgb(50,50,50)"
                              icon="description"
                            ></vs-button>
                          </router-link>
                          &nbsp;&nbsp;
                          <vs-button
                            radius
                            color="warning"
                            color-text="rgb(50,50,50)"
                            icon="edit"
                            v-on:click.prevent="editProyectos(data[indextr])"
                          ></vs-button>
                          &nbsp;&nbsp;
                          <vs-button
                            radius
                            color="danger"
                            color-text="rgb(50,50,50)"
                            icon="delete"
                            v-on:click.prevent="deleteProyectos(data[indextr])"
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

    <form method="POST" v-on:submit.prevent="createProyectos">
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
              <h5 class="modal-title">Nuevo Proyecto</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="nombre">Nombre Proyecto</label>
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

                    <div class="col-md-6">
                      <label for="descripcion">Descripción</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <textarea
                          id="descripcion"
                          type="text"
                          class="form-control"
                          v-model="newdescripcion"
                          required
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

    <form method="POST" v-on:submit.prevent="updateProyectos(fillproyectos.id)">
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
              <h5 class="modal-title">Editar Proyecto</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="edit-nombre">Nombre Proyecto</label>
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
                          v-model="fillproyectos.nombre"
                          required
                          title="Ingrese sólo Letras"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-6">
                      <label for="edit-descripcion">Descripción</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <textarea
                          id="edit-descripcion"
                          type="text"
                          class="form-control"
                          v-model="fillproyectos.descripcion"
                          required
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

    this.getProyectos();
  },

  data() {
    return {
      Proyectos: [],
      selected: [],
      newnombre: "",
      newdescripcion: "",
      fillproyectos: {
        id: "",
        nombre: "",
        descripcion: "",
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

    getProyectos() {
      this.spinnerOpen();

      let me = this;
      this.$http({
        url: "auth/proyectos",
        method: "GET",
      })
        .then(function (response) {
          (me.Proyectos = response.data), me.spinnerClose();
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    editProyectos(proyecto) {
      this.fillproyectos.id = proyecto.id;
      this.fillproyectos.nombre = proyecto.nombre;
      this.fillproyectos.descripcion = proyecto.descripcion;

      $("#edit").modal("show");
    },

    updateProyectos(id) {
      this.loadingOpen();

      let me = this;
      this.$http({
        url: "auth/proyectos/" + id,
        method: "PUT",
        data: {
          nombre: this.fillproyectos.nombre,
          descripcion: this.fillproyectos.descripcion,
        },
      })
        .then((response) => {
          this.getProyectos();
          this.errors = [];

          $("#edit").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }
          this.$swal(
            "Actualizado",
            "proyecto actualizado con éxito.",
            "success"
          );
        })
        .catch((error) => {
          this.errors = errors.response.data;
        });
    },

    createProyectos() {
      this.loadingOpen();

      this.$http({
        url: "auth/proyectos",
        method: "POST",
        data: {
          nombre: this.newnombre,
          descripcion: this.newdescripcion,
        },
      })
        .then((response) => {
          this.getProyectos();

          this.nombre = "";
          this.newdescripcion = "";

          this.errors = [];
          $("#create").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }

          this.$swal("Creado", "proyecto creado con éxito.", "success");
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    },

    deleteProyectos(proyecto) {
      this.$swal({
        title: "Está seguro de Eliminar este proyecto?",
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
            url: "auth/proyectos/" + proyecto.id,
            method: "DELETE",
          })
            .then((response) => {
              this.getProyectos();
              this.$swal(
                "Eliminado!",
                "El proyecto ha sido Eliminado con éxito.",
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
