<template>
<div class="index">
  <div class="carousel">
    <!--vue-awesome-swiper 文档copy-->
    <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
      <!-- <div class="swiper-wrapper"> -->
         <swiper-slide v-for="(i,k) in imgList" :key="k">
           <router-link :to="i.href">
             <img :src="i.img" alt="">
           </router-link>
         </swiper-slide>
      <!-- </div> -->
      <div class="swiper-pagination" slot="pagination"></div>
    </swiper>
  </div>
  <div class="car">
    <div class="img1">
      <router-link to="/">
        <img :src="car01.img" alt="">
      </router-link>
    </div>
    <div class="img2">
      <router-link to="/">
        <img :src="car02.img" alt="">
      </router-link>
    </div>
    <div class="img3">
      <router-link to="/">
        <img :src="car03.img" alt="">
      </router-link>
    </div>
    <div class="img4">
      <router-link to="/">
        <img :src="car04.img" alt="">
      </router-link>
    </div>
    <div class="img5">
      <router-link to="/">
        <img :src="car05.img" alt="">
      </router-link>
    </div>
  </div>
</div>
</template>

<script>
// import carousel from "../components/Index/Carousel"
import 'swiper/css/swiper.css' // 组件引入
// import 'swiper/swiper-bundle.css' 6版本以上
import { swiper, swiperSlide } from 'vue-awesome-swiper'  // 组件样式
import {axiosGet,axiosPost} from '../utils/request.js'

export default {
  data(){
    return{
      imgList:[],
      car01:{},
      car02:{},
      car03:{},
      car04:{},
      car05:{},
      swiperOptions: {
        pagination: {
          el: '.swiper-pagination'
        },
        autoplay:{
          delay:4000  // 1秒时长切换
        },
        loop: true
      }
    }  
  },
  mounted(){
     axiosGet(
       '/index/v1/carousel').then(res=>{
         console.log(res.data)
         this.imgList = res.data
      })
      axiosGet(
       '/index/v1').then(res=>{
         console.log(res.data);
         [this.car01,this.car02,this.car03,this.car04,this.car05] = res.data
      })
   },
}
</script>

<style scoped>
  .carousel{
    width: 100%;
  }
  /*样式穿透*/
  .swiper >>> .swiper-pagination-bullet{
    background-color:#8391a5;;
    width: 30px;
    height: 2px;
  }
  .car{
    width: 1210px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 40px;
    overflow: hidden;
  }
  .car>div img{
    width: 100%;
    height: 100%;
    vertical-align: middle;
  }
  .car>div{
    float: left;
  }
  .car>div.img1{
    width: 449px;
    height: 420px;
    margin: 0 2px 5px 0;
  }
  .car>div.img2,.car>div.img3{
    width: 247px;
    height: 207px;
    margin: 0 2px 5px 0;
  }
  .car>div.img4{
    width: 496px;
    height: 207px;
    margin: 0 2px 5px 0;
  }
  .car>div.img5{
    width: 246px;
    height: 418px;
    margin: -212px 0 0;
  }
</style>
