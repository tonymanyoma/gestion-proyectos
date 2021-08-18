<template>

    <!-- Main content -->
    <section class="content">
      <div class="error-page">
        <div class="row">
          <div class="col-md-12">
            <h2 class="headline text-warning"> 404</h2>
          </div>
        </div>

          
      <div class="row"> 
        
          <div class="error-content">
            <div class="col-md-12"> 
              <h3><i class="fa fa-exclamation-triangle text-warning"></i> Oops! Página no encontrada.</h3>
            </div>

            <div class="col-md-12">
              <p>
                No pudimos encontrar la página que buscaba.
                Mientras tanto  puedes regresar al inicio y buscarla desde ahí.
              </p>
            </div>

            <div class="col-md-12">
              <router-link :to="{name: 'dashboard'}">
                <vs-button color="#08b4e0" type="filled" data-toggle="modal" class="font-title" data-target="#create">Regresar al inicio</vs-button>
              </router-link>
            </div>

            <form class="search-form">
              <div class="input-group">
                

                <div class="input-group-append">
                  
                  
                </div>
              </div>
              <!-- /.input-group -->
            </form>
          </div>
        
      </div>  
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>
    <!-- /.content -->

</template>

<script>

    export default {
    }

</script>
