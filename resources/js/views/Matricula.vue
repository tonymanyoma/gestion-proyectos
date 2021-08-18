<template>
  <div>
    <div class="content-wrapper">
      <div class="row">
        <div class="col-md-12">
          <div class="media align-items-center bg-white mb-20">
            <div class="media-body">
              <h3 style="text-align: left" class="font-title">Matricula</h3>
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
                  <div class="col-md-6" v-if="this.$auth.user().id_role == 1">
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
                  <!--si es un administrador-->
                  <vs-table
                    v-if="this.$auth.user().id_role == 1"
                    @search="handleSearch"
                    @change-page="handleChangePage"
                    @sort="handleSort"
                    v-model="selected"
                    pagination
                    max-items="8"
                    search
                    :data="Matriculas"
                  >
                    <template slot="header"> </template>
                    <template slot="thead">
                      <vs-th sort-key="foto">
                        <p class="p-th">Fecha matricula</p>
                      </vs-th>
                      <vs-th sort-key="codigo">
                        <p class="p-th">Nombre alumno</p>
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
                        <vs-td :data="data[indextr].fecha" class="table-td">
                          {{ data[indextr].fecha }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].nombre_alumno"
                          class="table-td"
                        >
                          {{ data[indextr].nombre_alumno }}
                        </vs-td>

                        <vs-td>
                          <vs-button
                            radius
                            color="warning"
                            color-text="rgb(50,50,50)"
                            icon="edit"
                            v-on:click.prevent="editMatricula(data[indextr])"
                          ></vs-button>
                          &nbsp;&nbsp;
                          <vs-button
                            radius
                            color="danger"
                            color-text="rgb(50,50,50)"
                            icon="delete"
                            v-on:click.prevent="deleteMatriculas(data[indextr])"
                          ></vs-button>
                        </vs-td>
                      </vs-tr>
                    </template>
                  </vs-table>

                  <!-- si es un alumno -->
                  <vs-table
                    v-if="this.$auth.user().id_role == 2"
                    @search="handleSearch"
                    @change-page="handleChangePage"
                    @sort="handleSort"
                    v-model="selected"
                    pagination
                    max-items="8"
                    search
                    :data="Matriculas"
                  >
                    <template slot="header"> </template>
                    <template slot="thead">
                      <vs-th sort-key="foto">
                        <p class="p-th">Fecha matricula</p>
                      </vs-th>

                      <vs-th sort-key="codigo">
                        <p class="p-th">Nombre curso</p>
                      </vs-th>

                      <vs-th sort-key="codigo">
                        <p class="p-th">Intensidad horaria</p>
                      </vs-th>
                    </template>

                    <template slot-scope="{ data }">
                      <vs-tr
                        :data="tr"
                        :key="indextr"
                        v-for="(tr, indextr) in data"
                      >
                        <vs-td :data="data[indextr].fecha" class="table-td">
                          {{ data[indextr].fecha }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].nombre_curso"
                          class="table-td"
                        >
                          {{ data[indextr].nombre_curso }}
                        </vs-td>

                        <vs-td
                          :data="data[indextr].intensidad"
                          class="table-td"
                        >
                          {{ data[indextr].intensidad }}
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

    <form method="POST" v-on:submit.prevent="createMatricula">
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
              <h5 class="modal-title">Nueva Matricula</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="nombre">Número documento</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          id="nombre"
                          type="number"
                          class="form-control"
                          v-model="newnumero_documento"
                          required
                        />
                      </div>
                    </div>

                    <div class="col-md-2">
                      <button
                        type="button"
                        @click="validateUsuario()"
                        class="
                          btn btn-outline btn-rounded btn-cyan
                          mb-5
                          font-title
                        "
                        style="margin-top: 15px"
                      >
                        <i class="fa fa-search">&nbsp;Buscar</i>
                      </button>
                    </div>
                  </div>

                  <br />

                  <div class="row" v-show="show_inputs">
                    <div class="col-md-6">
                      <h4>Información del alumno</h4>
                    </div>
                  </div>

                  <div class="form-group row" v-show="show_inputs">
                    <div class="col-md-4">
                      <label for="nombreT">Nombre</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          id="nombreT"
                          type="text"
                          class="form-control"
                          v-model="newnombre_alumno"
                          disabled
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="celularT">Teléfono</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-phone"></i
                          ></span>
                        </div>
                        <input
                          id="celularT"
                          type="text"
                          class="form-control"
                          v-model="newtelefono_alumno"
                          disabled
                        />
                      </div>
                    </div>

                    <div class="col-md-4">
                      <label for="direccionT">Dirección</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-map-marker"></i
                          ></span>
                        </div>
                        <input
                          id="direccionT"
                          type="text"
                          class="form-control"
                          v-model="newdireccion_alumno"
                          disabled
                        />
                      </div>
                    </div>
                  </div>

                  <!-- div scroll -->
                  <div class="scroll">
                    <div class="row">
                      <div class="col-md-12" v-show="show_inputs">
                        <h3 style="text-align: center" class="font-title">
                          Listado de cursos
                        </h3>

                        <div class="input-group">
                          <input
                            type="text"
                            class="form-control"
                            placeholder="Texto a Buscar"
                            v-model="textSearch"
                          />
                        </div>
                      </div>
                    </div>
                    <br />

                    <div class="row" v-show="show_inputs">
                      <div class="col-md-12">
                        <draggable
                          :list="cursosFilter"
                          :group="{ name: 'cursos', pull: 'clone', put: false }"
                        >
                          <transition-group
                            type="transition"
                            :name="'flip-list'"
                          >
                            <div
                              class="
                                list-group-item list-group-item-action
                                arrasta
                                text-truncate
                              "
                              v-for="curso in cursosFilter"
                              :key="curso.id"
                            >
                              <div class="row">
                                <div
                                  class="col-md-6"
                                  style="word-wrap: break-word"
                                >
                                  <label>Nombre</label><br />
                                  <span
                                    class="badge"
                                    style="color:black;break-word;"
                                    >{{ curso.nombre }}</span
                                  ><br />
                                </div>

                                <div
                                  class="col-md-4"
                                  style="word-wrap: break-word"
                                >
                                  <label>Intensidad horaria</label><br />
                                  <span
                                    class="badge"
                                    style="color: black; text-align: center"
                                    >{{ curso.intensidad_horaria }}</span
                                  ><br />
                                </div>

                                <div class="col-md-2">
                                  <br />
                                  <vs-button
                                    radius
                                    color="#2b3f7f"
                                    color-text="rgb(50,50,50)"
                                    icon="add"
                                    @click="agregarCursos(curso)"
                                  ></vs-button>
                                </div>
                              </div>
                            </div>
                          </transition-group>
                        </draggable>
                      </div>
                    </div>

                    <div class="row" v-if="arrayNewMatricula != ''">
                      <div class="col-md-12">
                        <br /><br />
                        <vs-table
                          @search="handleSearch"
                          @change-page="handleChangePage"
                          @sort="handleSort"
                          v-model="selected"
                          pagination
                          max-items="5"
                          search
                          :data="arrayNewMatricula"
                        >
                          <template slot="header">
                            <h3 style="display: inline">Cursos agregados</h3>
                            <h3 style="display: inline; margin-left: 10px">
                              {{ this.arrayNewMatricula.length }}
                            </h3>
                          </template>
                          <template slot="thead">
                            <vs-th sort-key="foto">
                              <p class="p-th">Nombre</p>
                            </vs-th>
                            <vs-th sort-key="accion">
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
                              <vs-td
                                :data="data[indextr].nombre"
                                class="table-td"
                              >
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
                                  color="#31b1dd"
                                  color-text="rgb(50,50,50)"
                                  icon="delete"
                                  @click="ClearCursos(indextr, data[indextr])"
                                ></vs-button>
                              </vs-td>
                            </vs-tr>
                          </template>
                        </vs-table>
                      </div>
                      <br />
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

    <form
      method="POST"
      v-on:submit.prevent="updateMatriculas(fillmatricula.id)"
    >
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
              <h5 class="modal-title">Editar Matricula</h5>
              <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col s12">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="edit-nombre">Número documento</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          id="edit-nombre"
                          type="number"
                          class="form-control"
                          v-model="fillmatricula.numero_documento"
                          disabled
                        />
                      </div>
                    </div>
                  </div>

                  <br />

                  <div class="row">
                    <div class="col-md-6">
                      <h4>Información del alumno</h4>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-4">
                      <label for="edit-nombreT">Nombre</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-user"></i
                          ></span>
                        </div>
                        <input
                          id="edit-nombreT"
                          type="text"
                          class="form-control"
                          v-model="fillmatricula.nombre_alumno"
                          disabled
                        />
                      </div>
                      <!-- /.input group -->
                    </div>

                    <div class="col-md-4">
                      <label for="edit-celularT">Teléfono</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-phone"></i
                          ></span>
                        </div>
                        <input
                          id="edit-celularT"
                          type="text"
                          class="form-control"
                          v-model="fillmatricula.telefono_alumno"
                          disabled
                        />
                      </div>
                    </div>

                    <div class="col-md-4">
                      <label for="edit-direccionT">Dirección</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text"
                            ><i class="fa fa-map-marker"></i
                          ></span>
                        </div>
                        <input
                          id="edit-direccionT"
                          type="text"
                          class="form-control"
                          v-model="fillmatricula.direccion_alumno"
                          disabled
                        />
                      </div>
                    </div>
                  </div>

                  <!-- div scroll -->
                  <div class="scroll">
                    <div class="row">
                      <div class="col-md-12">
                        <h3 style="text-align: center" class="font-title">
                          Listado de cursos
                        </h3>

                        <div class="input-group">
                          <input
                            type="text"
                            class="form-control"
                            placeholder="Texto a Buscar"
                            v-model="textSearch"
                          />
                        </div>
                      </div>
                    </div>
                    <br />

                    <div class="row">
                      <div class="col-md-12">
                        <draggable
                          :list="cursosFilter"
                          :group="{ name: 'cursos', pull: 'clone', put: false }"
                        >
                          <transition-group
                            type="transition"
                            :name="'flip-list'"
                          >
                            <div
                              class="
                                list-group-item list-group-item-action
                                arrasta
                                text-truncate
                              "
                              v-for="curso in cursosFilter"
                              :key="curso.id"
                            >
                              <div class="row">
                                <div
                                  class="col-md-6"
                                  style="word-wrap: break-word"
                                >
                                  <label>Nombre</label><br />
                                  <span
                                    class="badge"
                                    style="color:black;break-word;"
                                    >{{ curso.nombre }}</span
                                  ><br />
                                </div>

                                <div
                                  class="col-md-4"
                                  style="word-wrap: break-word"
                                >
                                  <label>Intensidad horaria</label><br />
                                  <span
                                    class="badge"
                                    style="color: black; text-align: center"
                                    >{{ curso.intensidad_horaria }}</span
                                  ><br />
                                </div>

                                <div class="col-md-2">
                                  <br />
                                  <vs-button
                                    radius
                                    color="#2b3f7f"
                                    color-text="rgb(50,50,50)"
                                    icon="add"
                                    @click="editagregarCursos(curso)"
                                  ></vs-button>
                                </div>
                              </div>
                            </div>
                          </transition-group>
                        </draggable>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-12">
                        <br /><br />
                        <vs-table
                          @search="handleSearch"
                          @change-page="handleChangePage"
                          @sort="handleSort"
                          v-model="selected"
                          pagination
                          max-items="5"
                          search
                          :data="arrayCursosMatriculados"
                        >
                          <template slot="header">
                            <h3 style="display: inline">Cursos agregados</h3>
                            <h3 style="display: inline; margin-left: 10px">
                              {{ this.arrayCursosMatriculados.length }}
                            </h3>
                          </template>
                          <template slot="thead">
                            <vs-th sort-key="foto">
                              <p class="p-th">Nombre</p>
                            </vs-th>
                            <vs-th sort-key="accion">
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
                              <vs-td
                                :data="data[indextr].nombre"
                                class="table-td"
                              >
                                {{ data[indextr].nombre }}
                              </vs-td>

                              <vs-td
                                :data="data[indextr].intensidad_horaria"
                                class="table-td"
                              >
                                {{ data[indextr].intensidad_horaria }}
                              </vs-td>

                              <vs-td>
                                <!-- <vs-button
                                                radius
                                                color="#31b1dd"
                                                color-text="rgb(50,50,50)"
                                                icon="delete"
                                                @click="editClearCursos(indextr, data[indextr])"
                                                ></vs-button> -->
                              </vs-td>
                            </vs-tr>
                          </template>
                        </vs-table>
                      </div>
                      <br />
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
import draggable from "vuedraggable";
import { misMixins } from "../mixins.js";

export default {
  created: function () {
    this.$emit("update:layout", LayoutDefault);

    this.getCursos();
    this.getMatriculas();
  },

  data() {
    return {
      selected: [],
      newid_alumno: "",
      newtelefono_alumno: "",
      newnombre_alumno: "",
      newdireccion_alumno: "",
      newnumero_documento: "",
      show_inputs: false,
      Matriculas: [],
      Cursos: [],
      textSearch: "",
      arrayNewMatricula: [],
      arrayCursosMatriculados: [],
      arrayTempCursosMatriculados: [],
      fillmatricula: {},
      tamArrayCursos: "",
    };
  },

  computed: {
    cursosFilter: function () {
      var textSearch = this.textSearch;
      return this.Cursos.filter(function (el) {
        return el.nombre.toLowerCase().indexOf(textSearch.toLowerCase()) !== -1;
      });
    },
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

    validateUsuario() {
      if (this.newnumero_documento == "") {
        me.$swal({
          type: "error",
          title: "Debes ingresar un número de documento",
        });
      } else {
        this.loadingOpen();

        let me = this;
        this.$http({
          url: "auth/searchUsuario",
          method: "POST",
          data: {
            numero_documento: me.newnumero_documento,
          },
        })
          .then(function (response) {
            if (response.data == "") {
              me.loadingClose();
              me.$swal({
                type: "warning",
                title: "El usuario no se encuentra registrado",
              });

              me.newid_alumno = "";
              me.newtelefono_alumno = "";
              me.newnombre_alumno = "";
              me.newdireccion_alumno = "";

              me.show_inputs = false;
            } else {
              me.loadingClose();

              me.newid_alumno = response.data.id;
              me.newtelefono_alumno = response.data.telefono;
              me.newnombre_alumno = response.data.nombre_completo;
              me.newdireccion_alumno = response.data.direccion;

              me.show_inputs = true;
            }
          })
          .catch(function (error) {
            // handle error
            console.log(error);
          });
      }
    },

    getCursos() {
      this.spinnerOpen();

      let me = this;
      this.$http({
        url: "auth/cursos",
        method: "GET",
      })
        .then(function (response) {
          me.spinnerClose();
          me.Cursos = response.data;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    getMatriculas() {
      let me = this;
      this.$http({
        url: "auth/matricula",
        method: "GET",
      })
        .then(function (response) {
          me.Matriculas = response.data;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },

    ClearCursos(curso, data) {
      this.arrayNewMatricula.splice(curso, 1);

      this.$vs.notify({
        text: "Curso retirado con éxito",
        color: "warning",
        icon: "done",
      });
    },

    agregarCursos(data) {
      var id_curso = data.id;

      if (this.arrayNewMatricula.find((item) => item.id_curso === id_curso)) {
        this.$swal({
          type: "error",
          text: "No puedes matricular el mismo curso",
        });
      } else {
        var curso = new Object();

        curso.id_curso = data.id;
        curso.nombre = data.nombre;
        curso.intensidad_horaria = data.intensidad_horaria;

        this.arrayNewMatricula.push(curso);

        this.$vs.notify({
          text: "Curso agregado con éxito",
          color: "success",
          icon: "done",
        });
      }
    },

    editagregarCursos(data) {
      var id_curso = data.id;

      if (this.arrayCursosMatriculados.find((item) => item.id === id_curso)) {
        this.$swal({
          type: "error",
          text: "No puedes matricular el mismo curso",
        });
      } else {
        var curso = new Object();

        curso.id = data.id;
        curso.nombre = data.nombre;
        curso.intensidad_horaria = data.intensidad_horaria;

        this.arrayCursosMatriculados.push(curso);

        this.$vs.notify({
          text: "Curso agregado con éxito",
          color: "success",
          icon: "done",
        });
      }
    },

    editClearCursos(curso, data) {
      this.arrayCursosMatriculados.splice(curso, 1);

      this.$vs.notify({
        text: "Curso retirado con éxito",
        color: "warning",
        icon: "done",
      });
    },

    editMatricula(matricula) {
      this.fillmatricula.id = matricula.id;
      this.fillmatricula.id_usuario = matricula.id_usuario;
      this.fillmatricula.nombre_alumno = matricula.nombre_alumno;
      this.fillmatricula.telefono_alumno = matricula.telefono;
      this.fillmatricula.direccion_alumno = matricula.direccion;
      this.fillmatricula.numero_documento = matricula.numero_documento;

      var tam;
      //obtenemos la información detallada de la matrícula
      let me = this;
      this.$http({
        url: "auth/infomatricula",
        method: "POST",
        data: {
          id_matricula: matricula.id,
        },
      })
        .then(function (response) {
          me.arrayCursosMatriculados = response.data;
          me.tamArrayCursos = me.arrayCursosMatriculados.length;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });

      $("#edit").modal("show");
    },

    updateMatriculas(id) {
      var arraytemp = [];

      if (this.arrayCursosMatriculados.length > this.tamArrayCursos) {
        for (
          var i = this.tamArrayCursos;
          i < this.arrayCursosMatriculados.length;
          i++
        ) {
          arraytemp.push(this.arrayCursosMatriculados[i]);
        }

        this.loadingOpen();

        let me = this;
        this.$http({
          url: "auth/matriculaUpdate",
          method: "POST",
          data: {
            arrayCursosMatriculados: arraytemp,
            id_matricula: this.fillmatricula.id,
            id_usuario: this.fillmatricula.id_usuario,
          },
        })
          .then((response) => {
            this.getMatriculas();
            this.errors = [];

            $("#edit").modal("hide");
            if ($(".modal-backdrop").is(":visible")) {
              $("body").removeClass("modal-open");
              $(".modal-backdrop").remove();
            }
            this.$swal(
              "Actualizado",
              "matricula actualizada con éxito.",
              "success"
            );
          })
          .catch((error) => {
            this.errors = errors.response.data;
          });
      } else {
        console.log("no cambia nada");

        $("#edit").modal("hide");
        if ($(".modal-backdrop").is(":visible")) {
          $("body").removeClass("modal-open");
          $(".modal-backdrop").remove();
        }
      }
    },

    createMatricula() {
      if (this.arrayNewMatricula == "") {
        this.$swal({
          type: "error",
          title: "Debes agregar al menos un curso",
        });
      } else {
        this.loadingOpen();

        this.$http({
          url: "auth/matricula",
          method: "POST",
          data: {
            id_alumno: this.newid_alumno,
            arrayNewMatricula: this.arrayNewMatricula,
          },
        })
          .then((response) => {
            this.getMatriculas();

            this.newnumero_documento = "";
            this.newid_alumno = "";
            this.newtelefono_alumno = "";
            this.newnombre_alumno = "";
            this.newdireccion_alumno = "";
            this.arrayNewMatricula = [];

            this.show_inputs = false;

            this.errors = [];
            $("#create").modal("hide");
            if ($(".modal-backdrop").is(":visible")) {
              $("body").removeClass("modal-open");
              $(".modal-backdrop").remove();
            }

            this.$swal("Creado", "matricula realizada con éxito.", "success");
          })
          .catch((error) => {
            if (error.response.data.code == 1) {
              this.$swal({
                type: "error",
                text: "El alumno ya cuenta con una matricula creada, para agregar mas cursos debes editar la matricula existente y añadirlos",
              });
            }
          });
      }
    },

    deleteMatriculas(matricula) {
      this.$swal({
        title: "Está seguro de Eliminar esta matrícula?",
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
            url: "auth/matricula/" + matricula.id,
            method: "DELETE",
          })
            .then((response) => {
              this.getMatriculas();
              this.$swal(
                "Eliminado!",
                "La matrícula ha sido Eliminada con éxito.",
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

  components: {
    draggable,
  },
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

.scroll {
  overflow-y: scroll;
  height: 300px;
}
</style>
