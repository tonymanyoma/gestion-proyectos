<template>

    <div>

         <header class="main-header ">
    <!-- Logo -->
    <a href="#" class="logo bg-info-gradient-animet">
      <!-- mini logo -->
	  <b class="logo-mini">
		  
	  </b>
      <!-- logo-->
      <span class="logo-lg">
		  
	  </span>
    </a>
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top bg-info-gradient-animet">

      <!-- Sidebar toggle button-->
		  <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
			<span class="sr-only">Toggle navigation</span>
		  </a>

      <div class="navbar-custom-menu ">
        <ul class="nav navbar-nav">



          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" @click.prevent="Logout()">Salir&nbsp;<i class="fa fa-sign-out"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>


    <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar bg-pale-secondary ">


    <vs-sidebar :parent="$refs.parentSidebar" static-position default-index="1" color="primary" class="sidebarx" spacer v-model="active">

      <div class="header-sidebar" slot="header">
        <center><vs-avatar  size="70px" :src="'fotos/'+this.$auth.user().foto"/></center>

        <center><h4 v-text="this.username" class="font-title"></h4></center>

      </div>

    <router-link :to="{name: 'dashboard'}" class="nav-link" >
      <vs-sidebar-item index="1" icon="home"  >
        Home
      </vs-sidebar-item>
    </router-link>

    <router-link :to="{name: 'usuarios'}" class="nav-link"  v-if="this.$auth.user().id_role == 1" >
      <vs-sidebar-item index="2" icon="account_circle" >
        Usuarios
      </vs-sidebar-item>
    </router-link>

    <router-link :to="{name: 'cursos'}" class="nav-link"  v-if="this.$auth.user().id_role == 1" >
      <vs-sidebar-item index="3" icon="import_contacts" >
        Cursos
      </vs-sidebar-item>
    </router-link>

    <router-link :to="{name: 'matricula'}" class="nav-link">
      <vs-sidebar-item index="4" icon="library_books" v-if="this.$auth.user().id_role == 1">
        Matricular cursos
      </vs-sidebar-item>
      <vs-sidebar-item index="4" icon="star_half" v-else>
        Cursos matriculados
      </vs-sidebar-item>
    </router-link>

    <router-link :to="{name: 'configuracion'}" class="nav-link" >
      <vs-sidebar-item index="5" icon="settings" >
        Configuración
      </vs-sidebar-item>
    </router-link>




    </vs-sidebar>

  </aside>

        <router-view></router-view>

        

    </div>

</template>

<script>

    import {misMixins} from '../../mixins.js';

    export default{

      created: function() {

         this.Username();
         
     },

        data(){

            return{
                loading: true,
                active:false,
                username:'',

            }
        },

        mixins:[misMixins],

        methods:{

          Username(){

        var nombre = this.$auth.user().nombre_completo.split(' ');
        this.username = nombre[0];   

      },

             Logout(){

              this.loadingOpen();

            var redirect = this.$auth.redirect()
            var app = this

            this.$auth.logout({
                makeRequest: true,
                params: {}, // data: {} in axios
                success: function () {

                    this.loadingClose();
                    app.success = true
                    //const redirectTo = 'login'
                    //this.$router.push({name: redirectTo})
                    window.location = '/login';
                },
                error: function () {

                    app.has_error = true
                    app.error = res.response.data.error

                },

            });

        },

        }
    }


</script>


<style>

.li_hover_menu:hover {

  background-color: #1E9FF2;
  border: 2px solid #1E9FF2;
  border-radius: 10px;

}

.li_hover_menu span:hover {

  color: white;

}

.vs-sidebar--background {
    position: relative !important;

}

.vs-sidebar--item a {

    font-size: 13px !important;
}

.vs-sidebar-group h4 {

  font-size: 13px !important;
  margin-left: 15px !important;
}

.sidebar-collapse .main-sidebar {

    padding-top: 120px !important;
    -webkit-transform: translate(-230px, 0) !important;
    -ms-transform: translate(-230px, 0) !important;
    -o-transform: translate(-230px, 0) !important;
    transform: translate(-230px, 0) !important;
    position: absolute !important;
}

.font-title{
  font-family: title;
}

.font-body{
  font-family: body;
}



.h3{
  font-family: font-title;
}
</style>
