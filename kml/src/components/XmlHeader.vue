<template>
  <div class="header">
      <div class="top">
         <ul>
            <li v-if="!$store.state.isLogined">
                <router-link to="/login">登录</router-link>
            </li>
            <li v-else>
                <a href="javascript:;" @click="logout">退出</a>
            </li>
            <li>
                <router-link to="/car">
                    <img src="img/index/top-cart.928e66c.png" alt="购物车">
                    <span >{{$store.getters.getAllCount}}</span>
                </router-link>
            </li>
            <li><router-link to="">我的订单</router-link></li>
            <li><router-link to="">会员中心</router-link></li>
        </ul>
     </div>
    <div class="nav">
       <div class="logo fl">
           <router-link to="/" >
              <img src="img/index/logo.png">
           </router-link>
       </div>
       <span class="location" @click="city()" v-text="`配送至 ${City}`">配送至 成都</span>
      <div class="link fr">
          <router-link to="/">首页</router-link>
          <router-link to="/goods/0" class="t-color1">蛋糕名录</router-link>
          <router-link to="/company" class="t-color1">品牌传承</router-link>
          <router-link to="/myallactiv" class="t-color1">企业客户</router-link>
      </div>
    </div>
    <div class="city-box" v-show="isShow">
        <div class="cv">
            <div class="m" >
                <h1>请选择您所在的城市</h1>
                <ul v-for="(item,k) of cityname" :key='k'>
                    <li v-text="item.cname" @click="select(k)"></li>
                </ul>
                <!-- <span></span> -->
                <!-- <span @click="select('重庆')">重庆</span> -->
                <!-- <span @click="select('成都')">成都</span> -->
            </div>
        </div>   
    </div>
  </div>
</template>

<script>
    import {mapState,mapMutations,getters} from 'vuex'
    import {axiosGet,axiosPost} from '../utils/request.js'
    export default {
        data(){
            return {
                count:'0',
                // others:{}
                isShow:false,
                City:'成都',
                cityname:[]
            }
        },
        methods:{
            city(){
                this.isShow=true;
            },
            select(i){
                this.isShow=false;
                this.City=this.cityname[i].cname;
            },
            logout(){
               this.$store.commit('logout_mutations');
               //this.$router.push('/register'); 
            },
        },
        created(){
            axiosGet('/header/v1').then(res=>{
                this.cityname=res.data;
                console.log(res.data)
            })
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header>.top{
    background-color: #f1f1f1;
}
.header>.top>ul{
    height: 2.1875rem;
    width: 1200px;
    margin-left: auto;
    margin-right: auto;
    
}
.header>.top>ul>li{
    list-style: none;
    float: right;
    padding: 0 1.25rem;
    line-height: 2.1875rem;
}
.header>.top>ul>li:nth-child(2){
    background-color: #e9e9e9;
}
.header>.top>ul>li:first-child{
    background-color: #fff;
}
.header>.top>ul>li>a,.header>.nav>a,.header>.nav>a>span{
    text-decoration: none;
    color: #a36663;
}
.header>.top>ul>li>a>img{
    vertical-align: middle;
    margin-top: -0.1875rem;
}
.header>.top>ul>li>a>span{
    display: inline-block;
    width: 1.25rem;
    height: 1.25rem;
    line-height: 1.25rem;
    border-radius: 50%;
    background: #fff;
    font-size: 0.75rem;
    margin-left: 0.3125rem;
}
.header>.nav{
    margin-left: auto;
    margin-right: auto;
    height: 6.25rem;
    width: 73.75rem;
}
.header>.city-box,.header>.city-box>.cv{
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 2;
}
.header>.city-box>.cv{
    background-color: rgba(0,0,0,.8);
    z-index: 2;
}
.header>.city-box>.cv>.m{
    position: absolute;
    background: #fff;
    padding: 10px;
    width: 580px;
    height: 205px;
    left: 50%;
    top: 50%;
    text-align: center;
    margin: -106px 0 0 -304px;
    border: 4px solid #dadada;
    z-index: 2;
}
.header>.city-box>.cv>.m>h1{
    padding: 50px 0;
    color: #522725;
    font-size: 20px;
}

.header>.city-box>.cv>.m li{
    display: block;
    text-decoration: none;
    float: left;
    height: 26px;
    line-height: 26px;
    background-color: #522725;
    color: #fff;
    padding: 0 10px;
    border: 1px solid #a87c79;
    border-radius: 5px;
    margin: 0 112px 10px;
    /* margin-left: 0px; */
}
.fl{
    float: left;
}
.fr{
    float: right;
}
.header .nav .logo {
   width: 6.25rem;
   height: 100%;
}
.header .nav .logo img {
    max-height: 58px;
    vertical-align: middle;
}
.header .nav .location {
    display: inline-block;
    color: #a36663;
    height: 20px;
    line-height: 20px;
    font-weight: 700;
    padding-left: 30px;
    background: url(/img/index/location.fadbf2b.png) 10px no-repeat;
    -webkit-transition: all .2s;
    -o-transition: all .2s;
    transition: all .2s;
    margin: 55px 0 0 20px;
}
.header .nav .location:hover{
    color: #f00;
}
.header .nav .link a {
    display: inline-block;
    margin: 41px 30px;
    font-size: 16px;
    color:  #a36663;
    text-decoration: none;
}

</style>

