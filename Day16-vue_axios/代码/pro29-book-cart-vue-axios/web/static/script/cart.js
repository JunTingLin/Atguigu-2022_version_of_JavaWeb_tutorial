window.onload=function(){
    var vue = new Vue({
        el:"#cart_div",
        data:{
            cart:{}
        },
        methods:{
            getCart:function(){
                axios({
                    method:"POST",
                    url:"cart.do",
                    params:{
                        operate:'cartInfo'
                    }
                })
                    .then(function (value) {
                        var cart = value.data ;
                        vue.cart = cart ;
                    })
                    .catch(function (reason) {  });
            },
            editCart:function(cartItemId , buyCount){
                axios({
                    method:"POST",
                    url:"cart.do",
                    //補充: 這邊沒有使用data:{}發送請求體json，因為後端 CartController是使用接收參數的
                    params:{
                        operate:'editCart',
                        cartItemId:cartItemId,
                        buyCount:buyCount
                    }
                })
                    .then(function (value) {
                        vue.getCart();  //重新在查一次
                    })
                    .catch(function (reason) {  });
            }
        },
        mounted:function(){
            this.getCart() ;
        }
    });







}