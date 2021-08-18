import router from "./routes";
import VueRouter from "vue-router";

import Vue from "vue";
import VueSweetalert2 from "vue-sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

import moment from "moment";

import VCalendar from "v-calendar";

import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";

import "es6-promise/auto";
import axios from "axios";
import VueAuth from "@websanova/vue-auth";
import VueAxios from "vue-axios";
import auth from "./auth";

import { ServerTable } from "vue-tables-2";

import Vuesax from "vuesax";
import "vuesax/dist/vuesax.css";
import "material-icons/iconfont/material-icons.css";
import VueSignaturePad from "vue-signature-pad";
import VueCurrencyFilter from "vue-currency-filter";

import VueHtml2Canvas from "vue-html2canvas";

Vue.use(VueHtml2Canvas);

Vue.use(VueCurrencyFilter, {
    symbol: "$",
    thousandsSeparator: ".",

    fractionSeparator: ",",
    symbolPosition: "front",
    symbolSpacing: true
});

Vue.use(VueSignaturePad);

Vue.use(Vuesax);
Vue.use(ServerTable);

// Set Vue router
Vue.router = router;
Vue.use(VueRouter);
// Set Vue authentication
Vue.use(VueAxios, axios);
Vue.use(VueAuth, auth);

Vue.component("v-select", vSelect);

//Daterange
Vue.use(VCalendar, { componentPrefix: "vc" });

// Moment
Vue.prototype.moment = moment;

require("./bootstrap");

window.Vue = require("vue");

// Millares
Vue.filter("format-thousands", function(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
});

Vue.component("app", require("./components/AppComponent.vue").default);

Vue.component(
    "principal",
    require("./components/layouts/Principal.vue").default
);
Vue.component("e404", require("./components/E404.vue").default);

Vue.component("dashboard", require("./views/Dashboard.vue").default);
Vue.component("usuarios", require("./views/Usuarios.vue").default);
Vue.component("cursos", require("./views/Cursos.vue").default);
Vue.component("matricula", require("./views/Matricula.vue").default);

Vue.component("configuracion", require("./views/Configuracion.vue").default);
Vue.component("login", require("./views/Login.vue").default);
Vue.component("register", require("./views/Register.vue").default);

//sweet alert
Vue.use(VueSweetalert2);

const app = new Vue({
    el: "#app",
    router
});
