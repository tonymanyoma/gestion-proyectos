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
                <h3>{{ this.TotalProyectos }}</h3>

                <p>TOTAL PROYECTOS</p>
              </div>
              <div class="icon text-white">
                <i class="fa fa-book"></i>
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
      TotalProyectos: 0,
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
          me.TotalProyectos = response.data.TotalProyectos;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
  },
};
</script>