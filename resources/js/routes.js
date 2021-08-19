import Vue from "vue/dist/vue.min.js";
import Router from "vue-router";

window.Vue = require("vue");
Vue.use(Router);

import e404 from "./components/E404";

import dashboard from "./views/Dashboard";

import proyectos from "./views/Proyectos";
import historias from "./views/Historias";

import configuracion from "./views/Configuracion";
import login from "./views/Login";
import register from "./views/Register";

export default new Router({
    routes: [
        {
            path: "/register",
            name: "register",
            component: register,
            meta: {
                auth: false
            }
        },

        {
            path: "/login",
            name: "login",
            component: login,
            meta: {
                auth: false
            }
        },

        {
            path: "/",
            name: "dashboard",
            component: dashboard,
            meta: {
                auth: true
            }
        },

        {
            path: "/proyectos",
            name: "proyectos",
            component: proyectos,
            meta: {
                auth: true
            }
        },

        {
            path: ":id",
            name: "historias",
            component: historias,
            meta: {
                auth: true
            },
            props: true
        },


        {
            path: "/configuracion",
            name: "configuracion",
            component: configuracion,
            meta: {
                auth: true
            }
        },

        {
            path: "*",
            component: e404
        }
    ],
    mode: "history"
});
