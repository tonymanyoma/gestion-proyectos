export const misMixins = {

    methods:{
        loadingOpen(){

            this.$swal({
                title: 'Cargando!',
                text: 'Espere un momento por favor..',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                showCancelButton: false,
                showConfirmButton: false,
                imageUrl: "images/spinner.gif",
                onOpen: () => {
                    swal.showLoading()
                }
            });

        },

        loadingClose(){

            this.$swal.close();

        },

        spinnerOpen(){

            this.$vs.loading({
                color:'#0fafe6',
                type:'point',
            })
        },

        spinnerClose(){

            this.$vs.loading.close();
        }

    }
}