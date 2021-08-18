<template>
  <div>
    <dashboardAdmin v-if="this.rol_user == 1"></dashboardAdmin>
    <dashboardAlumno v-if="this.rol_user == 2"></dashboardAlumno>
  </div>
</template>

<script>
import LayoutDefault from "../components/layouts/Principal.vue";
import Chart from "chart.js";
import numeral from "numeral";
import { misMixins } from "../mixins.js";

//import dashboards
import dashboardAdmin from "./dashboards/dashboardAdmin.vue";
import dashboardAlumno from "./dashboards/dashboardAlumno.vue";

export default {
  created: function () {
    this.$emit("update:layout", LayoutDefault);
  },
  components: {
    dashboardAdmin,
    dashboardAlumno,
  },
  data() {
    return {
      rol_user: this.$auth.user().id_role,
    };
  },

  mixins: [misMixins],

  methods: {},
};
</script>


<style scoped>
.th-e {
  font-family: font-title;
  text-align: center;
}

.scroll-consumibles {
  overflow-y: scroll;
  height: 300px;
}
</style>