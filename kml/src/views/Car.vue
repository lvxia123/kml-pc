<template>
    <div class="car t-color c">
        <div class="order-header w tr">
            <img src="img/car/cart_headimg.e6cbf32.png" alt="">
        </div>
        <div class="order-con c w">
            <h2 class="tl">我的购物篮</h2>
            <table class="order-form">
                <thead>
                    <tr>
                        <th>选择</th>
                        <th colspan="2"><div>商品名称</div></th>
                        <th><div>属性</div></th>
                        <th><div>单价</div></th>
                        <th><div>数量</div></th>
                        <th><div>小计</div></th>
                        <th><div>操作</div></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item,i) of carItems" :key="i">
                        <!-- <td><input type="checkbox" checked="item.is_checked"></td> -->
                        <td class="img">
                            <img :src="item.img" alt="">
                        </td>
                        <td v-text="item.title"></td>
                        <td v-text="item.spec"></td>
                        <td v-text="`¥${item.price.toFixed(2)}`"></td>
                        <td>
                            <div class="number">
                                <span class="jian">
                                    <button @click="minList(item)">-</button>
                                </span>
                                <span class="num" v-text="item.count"></span>
                                <span class="jia">
                                    <button @click="addList(item)">+</button>
                                </span>
                            </div>
                        </td>
                        <td v-text="`¥${item.price.toFixed(2)*item.count}`"></td>
                        <td><button @click="del(item)">×</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="totalcount tr">
                <span>商品总计:</span>
                <b v-text="`¥${total.toFixed(2)}`"></b>
            </div>
            <div class="car-put tr">
                <router-link  to="/goods/0" class="tc">继续购买</router-link>
                <a @click="checkout()" href="javascript:;" class="tc">去结账</a>
            </div>
        </div>
    </div>
</template>
<script>
import { mapMutations,mapGetters, mapState } from 'vuex'
export default {
    data(){
        return {
            carItems:[],
            // noLogin:false,
            // phone:{}
        }
    },
    methods:{
        ...mapState(['phone','uid']),
        ...mapGetters(['getCart']),
        ...mapMutations(['addCart','minCart','clearCart','delCart']),
        getFromCart(i){
            this.carItems = this.getCart()
            // this.carItems = this.$store.state.cart
            console.log(this.carItems)
        },
        addList(i){
            this.addCart(i);
        },
        minList(i){
            this.minCart(i);
        },
        del(i){
            this.delCart(i);
        },
       
        // 结算
        checkout(){
            this.phone = JSON.parse(localStorage.getItem('phone'))
            console.log(this.phone)
            if(!this.phone){
                console.log(this.phone)
                alert('您还没登陆')
                this.$router.push('/login')
            }else{
                for(var i of this.carItems){
                    i.uid =  localStorage.getItem('uid')
                    console.log(i.uid)
                }
                let data = {carItems:this.carItems}
                this.axios.post('/cartItems/v1/add',this.$qs.stringify(data)).then(res=>{
                    console.log(res.data)
                     alert('即将跳入支付页面')
                }).then(()=>{
                    // 结算后 清空 购物车
                    this.clearCart();
                })
            }
        }
    },
    computed:{
        total(){
            let total=0
            for(let p of this.carItems){
                 total+=p.price*p.count;    
            }
            return total;
        }
    },
    created(){
    },
    mounted(){
        this.getFromCart()
        // this.unLogin()
    }
}
</script>
<style scoped>
.car{
    width: 100%;
    border-top: 1px solid #d8d0d0;
    font-size: 14px;
}
.car>.order-header{
    margin-top: 20px;
}
.car>.order-con>h2{
    color: #666;
    font-size: 24px;
    font-weight: 700;
    height: 44px;
}
.car>.order-con>.order-form{
    width: 100%;
    border-top: 1px solid #d8d0d0;
    color: #5b3937;
    font-size: 14px;
}
.car>.order-con>.order-form>thead{
    color: #666;
    font-weight: 700;
}
.car>.order-con>.order-form>thead>tr{
    height: 74px;
    /* vertical-align: middle; */
    /* line-height: 74px; */
}
.car>.order-con>.order-form>thead>tr>th>div{
     width: 100%;
     height: 20px;
     margin-top: 27px;
     border-right:1px dotted  #d8d0d0;
}
.car>.order-con>.order-form>tbody>tr{
    height: 190px;
    border-bottom: 1px solid #d8d0d0;
    vertical-align: middle;
    text-align: center;
}
.car>.order-con>.order-form>tbody>tr>td.img{
    width: 128px;
}
.car>.order-con>.order-form>tbody>tr>td.img>img{
    width: 100px;
    height: 100px;
}
.car>.order-con>.order-form>tbody>tr>td:nth-child(2){
    color: #522725;
    font-size: 18px;
}
.car>.order-con>.order-form>tbody>tr>td:nth-child(6){
    color: #f00;
}
/* .car>.order-con>.order-form>tbody>tr>td>.number{
    width: 110px;
} */
.car>.order-con>.order-form>tbody>tr>td .num {
    display: inline-block;
    width: 56px;
    height: 23px;
    border: 1px solid #979696;
    top: -7px;
    line-height: 25px;
    text-align: center;
}
.car>.order-con>.totalcount {
    color: #666;
    margin-top: 20px;
    margin-right: 100px;
}
.car>.order-con>.car-put{
    margin-top: 40px;
    margin-bottom: 50px;
}
.car>.order-con>.car-put>a{
    display: inline-block;
    width: 312px;
    height: 39px;
    line-height: 39px;
    color: #000;
    border: 1px solid #e0e0e0;
    cursor: pointer;
}
</style>