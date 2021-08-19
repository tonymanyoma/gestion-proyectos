<template>
  <div>
    <div class="content-wrapper">
      <div class="row">
        <div class="col-md-12">
          <div class="media align-items-center bg-white mb-20">
            <div class="media-body">
              <h3 style="text-align: left" class="font-title">Historias</h3>
            </div>
          </div>
        </div>
      </div>

      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <form method="POST" v-on:submit.prevent="updateUsuario">
              <div class="card card-info">
                <div class="card-header">
                  <h3 class="card-title">{{ this.nombre }}</h3>
                </div>
                <div class="card-body">
                  <div
                    class="box card-inverse bg-img"
                    style="
                      background-image: url(../images/proyecto.jpg);
                      padding-top: 150px;
                    "
                  >
                    <div
                      class="flexbox align-items-center px-20"
                      data-overlay="4"
                    >
                      <div class="flexbox align-items-center mr-auto">
                        <a href="#"> </a>
                        <div class="pl-10 d-none d-md-block"></div>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-12">
                      <p class="comentarios-historias">
                        {{ this.descripcion }}
                      </p>
                    </div>
                  </div>
                </div>

                <!-- /.card-body -->
              </div>
            </form>
          </div>
        </div>
      </section>

      <vs-row vs-justify="center">
        <vs-col
          type="flex"
          vs-justify="center"
          vs-align="center"
          vs-w="3"
          v-for="historia in Historias"
          v-bind:key="historia.id"
          class="cards-historias"
        >
          <vs-card class="cardx">
            <div slot="header">
              <h3>Nombre de la historia: {{ historia.nombre }}</h3>
            </div>
            <div slot="media">
              <img />
            </div>
            <div>
              <span class="comentarios-historias"
                >Comentarios: {{ historia.comentarios }}</span
              >
            </div>

            <br />

            <div slot="footer">
              <vs-row vs-justify="flex-end">
                <vs-button
                  color="primary"
                  icon="sticky_note_2"
                  v-on:click.prevent="getTickets(historia.id)"
                ></vs-button>
                <vs-button
                  color="warning"
                  icon="edit"
                  v-on:click.prevent="editHistorias(historia)"
                ></vs-button>
                <vs-button
                  color="danger"
                  icon="delete"
                  v-on:click.prevent="deleteHistorias(historia)"
                ></vs-button>
              </vs-row>
            </div>
          </vs-card>
        </vs-col>
      </vs-row>

      <div class="adminActions" data-target="#create" data-toggle="modal">
        <input type="checkbox" name="adminToggle" class="adminToggle" />
        <a class="adminButton" href="#!"><i class="fa fa-plus"></i></a>
      </div>
    </div>

    <!-- Modal -->
    <div
      class="modal fade bs-example-modal-lg"
      tabindex="-1"
      role="dialog"
      aria-labelledby="myLargeModalLabel"
      aria-hidden="true"
      style="display: none"
      id="createtickets"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header bg-info">
            <h5 class="modal-title">Tickets</h5>
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">
                <h2>Crear tickets</h2>
              </div>
            </div>

            <div class="row">
              <div class="col s12">
                <div class="form-group row">
                  <div class="col-md-4">
                    <label for="nombre">Nombre Ticket</label>
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
                        v-model="newnombreticket"
                        required
                      />
                    </div>
                    <!-- /.input group -->
                  </div>

                  <div class="col-md-6">
                    <label for="comentarios">Comentarios</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"
                          ><i class="fa fa-id-card"></i
                        ></span>
                      </div>
                      <textarea
                        id="comentarios"
                        type="text"
                        class="form-control"
                        v-model="newcomentariosticket"
                        required
                      />
                    </div>
                    <!-- /.input group -->
                  </div>
                  <div class="col-md-2" style="margin-top: 15px">
                    <button
                      type="submit"
                      class="
                        btn btn-bold btn-pure btn-success
                        float-right
                        btn-rounded
                      "
                      @click="createTickets()"
                    >
                      Crear
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col s12">
                <h2>Tickets de la historia</h2>
              </div>
            </div>

            <div class="row">
              <div class="col s12">
                <vs-table
                  @search="handleSearch"
                  @change-page="handleChangePage"
                  @sort="handleSort"
                  v-model="selectedTicket"
                  pagination
                  max-items="5"
                  search
                  :data="Tickets"
                >
                  <template slot="header"> </template>
                  <template slot="thead">
                    <vs-th sort-key="Nombre">
                      <p class="p-th">Nombre</p>
                    </vs-th>
                    <vs-th sort-key="intensidad">
                      <p class="p-th">Comentarios</p>
                    </vs-th>

                    <vs-th sort-key="accion">
                      <p class="p-th">Estado</p>
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

                      <vs-td :data="data[indextr].comentarios" class="table-td">
                        {{ data[indextr].comentarios }}
                      </vs-td>

                      <vs-td :data="data[indextr].estado" class="table-td">
                        {{ data[indextr].estado }}
                        <template slot="edit">
                          <div class="form-group">
                            <div class="input-group mb-4">
                              <div class="input-group-prepend">
                                <span
                                  class="input-group-text bg-info border-info"
                                  ><i class="fa fa-briefcase"></i
                                ></span>
                              </div>
                              <select
                                class="custom-select"
                                v-model="estado"
                                required
                                @change="updateTicket"
                              >
                                <option value="" disabled>Estado</option>
                                <option
                                  v-for="estado in Estados"
                                  :key="estado.id"
                                  :value="estado.nombre"
                                >
                                  {{ estado.nombre }}
                                </option>
                              </select>
                            </div>
                          </div>
                        </template>
                      </vs-td>

                      <vs-td> </vs-td>
                    </vs-tr>
                  </template>
                </vs-table>
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
          </div>
        </div>
      </div>
    </div>
    <!-- /.modal -->

    <form method="POST" v-on:submit.prevent="createHistorias">
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
              <h5 class="modal-title">Crear historia</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="nombre">Nombre Historia</label>
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
                      <label for="comentarios">Comentarios</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-id-card"></i
                          ></span>
                        </div>
                        <textarea
                          id="comentarios"
                          type="text"
                          class="form-control"
                          v-model="newcomentarios"
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

    <form method="POST" v-on:submit.prevent="updateHistoria(fillhistorias.id)">
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
              <h5 class="modal-title">Editar Historia</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="edit-nombre">Nombre Historia</label>
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
                          v-model="fillhistorias.nombre"
                          required
                          title="Ingrese sólo Letras"
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-6">
                      <label for="edit-descripcion">Comentarios</label>
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
                          v-model="fillhistorias.comentarios"
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
    this.getHistorias();
    this.getEstados();
  },

  props: ["id", "nombre", "descripcion"],

  data() {
    return {
      Historias: [],
      Tickets: [],
      selected: [],
      selectedTicket: [],
      newnombre: "",
      newcomentarios: "",
      newnombreticket: "",
      newcomentariosticket: "",
      id_historia: "",
      estado: "",
      id_ticket: "",
      fillhistorias: {
        id: "",
        nombre: "",
        comentario: "",
      },
      estados: [],
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

    getHistorias() {
      this.spinnerOpen();

      let me = this;
      this.$http({
        url: "auth/getHistorias",
        method: "POST",
        data: {
          id_proyecto: this.id,
        },
      })
        .then(function (response) {
          (me.Historias = response.data), me.spinnerClose();
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    getTickets(id_historia) {
      this.id_historia = id_historia;
      let me = this;
      this.$http({
        url: "auth/getTickets",
        method: "POST",
        data: {
          id_historia: id_historia,
        },
      })
        .then(function (response) {
          (me.Tickets = response.data), me.spinnerClose();
          $("#createtickets").modal("show");
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    getEstados() {
      let me = this;
      this.$http({
        url: "auth/estados",
        method: "GET",
      })
        .then(function (response) {
          (me.Estados = response.data.estados), me.spinnerClose();
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    createTickets() {
      this.loadingOpen();

      let me = this;

      this.$http({
        url: "auth/tickets",
        method: "POST",
        data: {
          nombre: this.newnombreticket,
          comentarios: this.newcomentariosticket,
          id_historia: this.id_historia,
        },
      })
        .then((response) => {
          me.getTickets(me.id_historia);
          me.$swal("Creado", "ticket creado con éxito.", "success");
          me.newnombreticket = "";
          me.newcomentariosticket = "";
        })
        .catch((error) => {});
    },

    updateTicket() {
      this.loadingOpen();

      var estado;

      if (this.estado == "Activo") {
        estado = 1;
      } else if (this.estado == "En proceso") {
        estado = 2;
      } else if (this.estado == "Finalizado") {
        estado = 3;
      }

      let me = this;
      this.$http({
        url: "auth/updateTickets",
        method: "POST",
        data: {
          estado: estado,
          id_ticket: this.selectedTicket.id,
        },
      })
        .then((response) => {
          this.getTickets(this.id_historia);
          this.estado = "";
          this.errors = [];

          this.$swal(
            "Actualizado",
            "estado del ticket actualizado con éxito.",
            "success"
          );
        })
        .catch((error) => {
          this.errors = errors.response.data;
        });
    },

    editHistorias(historia) {
      this.fillhistorias.id = historia.id;
      this.fillhistorias.nombre = historia.nombre;
      this.fillhistorias.comentarios = historia.comentarios;

      $("#edit").modal("show");
    },

    updateHistoria(id) {
      this.loadingOpen();

      let me = this;
      this.$http({
        url: "auth/historias/" + id,
        method: "PUT",
        data: {
          nombre: this.fillhistorias.nombre,
          comentarios: this.fillhistorias.comentarios,
        },
      })
        .then((response) => {
          this.getHistorias();
          this.errors = [];

          $("#edit").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }
          this.$swal(
            "Actualizado",
            "historia actualizada con éxito.",
            "success"
          );
        })
        .catch((error) => {
          this.errors = errors.response.data;
        });
    },

    createHistorias() {
      this.loadingOpen();

      this.$http({
        url: "auth/historias",
        method: "POST",
        data: {
          nombre: this.newnombre,
          comentarios: this.newcomentarios,
          id_proyecto: this.id,
        },
      })
        .then((response) => {
          this.getHistorias();

          this.newnombre = "";
          this.newcomentarios = "";

          this.errors = [];
          $("#create").modal("hide");
          if ($(".modal-backdrop").is(":visible")) {
            $("body").removeClass("modal-open");
            $(".modal-backdrop").remove();
          }

          this.$swal("Creado", "historia creada con éxito.", "success");
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    },

    deleteHistorias(historia) {
      this.$swal({
        title: "Está seguro de Eliminar este historia?",
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
            url: "auth/historias/" + historia.id,
            method: "DELETE",
          })
            .then((response) => {
              this.getHistorias();
              this.$swal(
                "Eliminado!",
                "La historia ha sido Eliminada con éxito.",
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

/* Floating button */
.adminActions {
  position: fixed;
  bottom: 35px;
  right: 35px;
}

.adminButton {
  height: 60px;
  width: 60px;
  background-color: #31b1dd;
  border-radius: 50%;
  display: block;
  color: #fff;
  text-align: center;
  position: relative;
  z-index: 1;
}

.adminButton i {
  font-size: 22px;
}

.adminButtons {
  position: absolute;
  width: 100%;
  bottom: 120%;
  text-align: center;
}

.adminButtons a {
  display: block;
  width: 45px;
  height: 45px;
  border-radius: 50%;
  text-decoration: none;
  margin: 10px auto 0;
  line-height: 1.15;
  color: #fff;
  opacity: 0;
  visibility: hidden;
  position: relative;
  box-shadow: 0 0 5px 1px rgba(51, 51, 51, 0.3);
}

.adminButtons a:hover {
  transform: scale(1.05);
}

.adminButtons a:nth-child(1) {
  background-color: #2b3f7f;
  transition: opacity 0.2s ease-in-out 0.3s, transform 0.15s ease-in-out;
}
.adminButtons a:nth-child(2) {
  background-color: #fbb03b;
  transition: opacity 0.2s ease-in-out 0.25s, transform 0.15s ease-in-out;
}

.adminActions a i {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.adminToggle {
  -webkit-appearance: none;
  position: absolute;
  border-radius: 50%;
  top: 0;
  left: 0;
  margin: 0;
  width: 100%;
  height: 100%;
  cursor: pointer;
  background-color: transparent;
  border: none;
  outline: none;
  z-index: 2;
  transition: box-shadow 0.2s ease-in-out;
  box-shadow: 0 3px 5px 1px rgba(51, 51, 51, 0.3);
}

.adminToggle:hover {
  box-shadow: 0 3px 6px 2px rgba(51, 51, 51, 0.3);
}

.adminToggle:checked ~ .adminButtons a {
  opacity: 1;
  visibility: visible;
}

.cards-historias {
  margin-right: 15px;
}

.comentarios-historias {
  font-size: 15px;
}
</style>
