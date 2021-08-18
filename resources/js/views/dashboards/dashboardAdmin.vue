<template>
  <div>
    <div class="content-wrapper">
      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-xl-4 col-md-4 col-4">
            <!-- small box -->
            <div class="small-box box-inverse bg-success-gradient">
              <div class="inner">
                <h3>{{ this.TotalCursos }}</h3>

                <p>TOTAL CURSOS</p>
              </div>
              <div class="icon text-white">
                <i class="fa fa-book"></i>
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-md-4 col-4">
            <!-- small box -->
            <div class="small-box box-inverse bg-primary-gradient-animet">
              <div class="inner">
                <h3>{{ this.TotalUsuarios }}</h3>

                <p>TOTAL USUARIOS</p>
              </div>
              <div class="icon text-white">
                <i class="fa fa-user"></i>
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-md-4 col-4">
            <!-- small box -->
            <div class="small-box box-inverse bg-info-gradient-animet">
              <div class="inner">
                <h3>{{ this.TotalMatriculas }}</h3>

                <p>TOTAL MATRICULAS</p>
              </div>
              <div class="icon text-white">
                <i class="fa fa-address-book"></i>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  created: function () {
    this.InfoDashboard();
  },

  data() {
    return {
      TotalCursos: 0,
      TotalUsuarios: 0,
      TotalMatriculas: 0,
    };
  },

  methods: {
    InfoDashboard() {
      //consultar consumibles del tecnico

      let me = this;
      this.$http({
        url: "auth/infoDashboardAdmin",
        method: "get",
      })
        .then(function (response) {
          me.TotalCursos = response.data.TotalCursos;
          me.TotalUsuarios = response.data.TotalUsuarios;
          me.TotalMatriculas = response.data.TotalMatriculas;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
  },
};
</script>