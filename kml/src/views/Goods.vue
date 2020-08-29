<template>
  <div class="goods">
    <div class="content">
      <div class="cataimg1" :style="{ 'background-image': 'url(' + bg.img+ ')' }">
        <!-- 商品分类表 -->
        <div class="catalogue-list">
          <ul>
            <!-- <li>
              <router-link to="/goods/0"  v-bind:class="{active:currentIndex == k}">全部名录</router-link>
            </li> -->
              <li v-for="(i,k) of nav" :key="k" v-bind:class="{active:currentIndex == k}">
                <span  v-text="i.fname" @click="goto(parseInt(i.fid))" ></span>
                <!-- <a href="javascript:;" v-text="i.fname" @click="goto(k+1)" v-bind:class="{active:currentIndex == k}"></a> -->
                <!-- <button v-text="i.fname" @click="goto(k+1)" v-bind:class="{active:currentIndex == k}">  </button> -->
              </li>
          </ul>
        </div>
      <!-- 商品详情 -->
      </div>
        <div class="content-list">
         <div class="all-thing-lists">
           <ul v-for="(i,k) of goodsall" :key="k">
             <li class="index-list" >
               <div class="index-list-left fl">
                 <router-link :to="`/details/${i.pid}`">
                   <div class="index-list-leftimg">
                     <img :src="i.pic" alt="">
                   </div>
                 </router-link>
               </div>
               <div class="index-list-right fr">
                 <router-link :to="`/details/${i.pid}`">
                   <p class="index-list-right-name"  v-text="i.title"></p>
                 </router-link>
                 <div class="index-list-right-details" v-text="i.details"></div>
                 <p class="index-list-right-spec">
                   规格:
                   <span v-text="i.spec" class="list-text"></span>
                 </p>
                 <p class="index-list-right-price">
                   价格：
                   <span class="list-text" v-text="`¥${i.price.toFixed(2)}`"></span>
                 </p>
                 <div class="index-list-right-buy">
                   <router-link to="" class="index-list-right-sbuy fl tc">快速购买</router-link>
                   <router-link :to="`/details/${i.pid}`" class="index-right-right-shopping fl tc">加入购物车</router-link>
                 </div>
               </div>
             </li>
           </ul>
         </div>
       </div> 
       <!-- 分页项 -->
       <ul>
         <li :class="{disabled:page==1}">
           <a href="javascript:;" :class="{disabled:page==1}" @click="change(-1,$event)">上一页</a>
          </li>
         <li v-for="i of pagecount" :key='i' :class="{active:i==page}">
           <a href="javascript:;"  v-text=i  @click="changepage(i)"></a>
         </li>
         <li :class="{disabled:page==pagecount}">
           <a href="javascript:;" :class="{disabled:page==pagecount}" @click="change(+1,$event)">下一页</a>
        </li>
       </ul>
       <!-- 返回顶部 -->
       <Top></Top>
    </div> 
  </div>
  
</template>
<script>
   import Top from '../components/Top.vue'
   import {axiosGet,axiosPost} from '../utils/request.js'
   export default {
    components:{Top},
    data(){
      return {
        // url传参
         lid:'',
        //  获取背景色对象
         bg:{},
        // nav表单选中的下标
         currentIndex: '0',
        //  初始页码   
         page:1,
        //  服务器返回来的总的页码数
        pagecount:0,
        //  nav表单数组
         nav:[],
        //  商品
         goodsall:[],  
      }
    },
    methods:{
      //  点击商品分类列表将列表id传给url
        goto(lid){
        // console.log(lid);
        this.$router.push(`/goods/${lid}`);
        this.currentIndex=lid;
        // console.log(this.currentIndex);
       },
       change(n,e){
         if(e.target.className.indexOf("disabled")==-1)
         {
           console.log(e)
           this.changepage(this.page+parseInt(n));
         }
       }
       ,
       changepage(i){
         this.page=i
         this.load();
       },
       load(){
      //地址栏不变化但有参数  
      //  判断得到的参数 执行全局查找
       if(this.lid==0){
         console.log(this.lid)
          this.axios.get(
          '/goods/v1/list?page='+this.page).then(res=>{
           this.goodsall=res.data.results;
           this.pagecount = res.data.pagecount;
          console.log(this.pagecount);
        })
        // 或者分类查找
       }else{
            // 分类查找，通过分类号
            this.axios.get('/goods/v1/search?pid='+this.lid+'&page='+this.page).then(res=>{
            this.pagecount = res.data.pagecount;
            if(res.data.results!=0){
              this.goodsall=res.data.results;
            }else{
              this.goodsall=0;
            }
            console.log(res.data.results)
          }) 
        }   
      }
    },
    mounted(){
      // 恢复起始页
      this.page = 1;
      this.load();
      // 获取nav的背景
      axiosGet('/goods/v1/bg').then(res=>{
      this.bg=res.data[0]
      console.log(this.bg)
      }); 
      // 获取nav表单列数据
      axiosGet('/goods/v1/nav').then(res=>{
        res.data.unshift({fname:'全部名录',fid:0});
        this.nav=res.data;
        console.log(this.nav)
      });
      
    },
    
    watch: {
    //  分类查询监听地址栏变化
     $route(){
       this.lid=this.$route.params.lid;
      //  console.log(this.lid)
      //  地址栏变化，更新页面时，页码恢复默认第一页
       this.page = 1; 
       this.load()
      }
    }
}

</script>
<style scoped>
/* 分页按钮样式 */
.goods>.content>ul{list-style:none;}
.goods>.content>ul>li{
  float:left;
  padding: 5px 10px;
  border:1px solid #aaa;
  background-color: #a36663;
}
.goods>.content>ul>li~li{
  border-left:0;
}
.goods>.content>ul>li>a{
  color: #fff;
}
.goods>.content>ul>li.disabled{
  background-color: lightgray;
}
.goods>.content>ul>li.active{
  background-color: #522725;
}


.goods>.content>.cataimg1>.catalogue-list ul li.active{
  background-color: #fff;
  color: #a36663 !important;
  
}
.goods.content>.cataimg1>.catalogue-list ul li a.active{
   background-color: #fff;
   color: #a36663 !important;
}

.content {
    width: 100%;
    color: #a36663;
}
.goods>.content>.cataimg1 {
    width: 100%;
    height: 180px;
    position: relative;
    /* background: url(); */
}
.content>.cataimg1>.catalogue-list{
    width: 1260px;
    position: absolute;
    top: 130px;
    left: 280px;
    bottom: 0;
}
.goods>.content>.cataimg1>.catalogue-list ul{
    list-style: none;
    height: 40px;
    margin: 0 auto;
    line-height: 40px;
    color: #fff;
}
.goods>.content>.cataimg1>.catalogue-list ul li{
    padding: 0 40px;
    background: #522725;
    height: 40px;
    float: left;
    margin-left: 5px;
}
.goods>.content>.cataimg1>.catalogue-list>ul>li a{
    color: #fff;
    width: 100%;
    font-size: 14px;
    display: inline-block;
}
/* .content>.cataimg1>.catalogue-list>ul>li button{
    background-color: #522725;
    border: 0px;
    outline: 0px;
    color: #fff;
    width: 100%;
} */
.content-list {
   position: relative;
   width: 100%;
   top:0px;
}
.content-list>.all-thing-lists{
    width: 1200px;
    margin: 10px auto;
}
.content-list>.all-thing-lists>ul{
    list-style: none;
    width: 100%;
    padding-bottom: 5px;
}
.content-list>.all-thing-lists>ul>.index-list{
    width: 100%;
    margin-bottom: 10px;
    border-bottom: 1px solid #dcdcdc;
    overflow: hidden;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-left{
    width: 560px;
    margin-right: 20px;
    text-align: center;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-left>a>.index-list-leftimg{
    width: 300px!important;
    height: 300px!important;
    background: gray;
    display: inline-block;
}
.content .content-list .all-thing-lists ul li .index-list-left a .index-list-leftimg img {
    width: 100%;
    height: 100%;
}
.content-list>.all-thing-lists>ul .index-list>.index-list-right{
    width: 590px;
    color: #522725;
    font-size: 14px;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-right .index-list-right-name{
    width: 100%;
    height: 50px;
    line-height: 50px;
    font-size: 24px;
    font-weight: 400;
    color: #522725;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-right>.index-list-right-details{
    padding: 10px 0;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    line-height: 20px;
    margin-bottom: 10px;
    text-align: left;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-right>.index-list-right-spec,.content-list>.all-thing-lists>ul>.index-list>.index-list-right>.index-list-right-spec {
    line-height: 30px;
    text-align: left;
}
.content-list>.all-thing-lists>ul>li>.index-list-right>.index-list-right-price .list-text,.content-list>.all-thing-lists>ul>li>.index-list-right .index-list-right-spec .list-text{
    font-size: 18px;
    color: #a36663;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-right>.index-list-right-buy{
  margin-top: 45px;
}
.content-list>.all-thing-lists>ul>.index-list>.index-list-right>.index-list-right-buy>.index-list-right-sbuy,.content-list>.all-thing-lists>ul>.index-list>.index-list-right>.index-list-right-buy>.index-right-right-shopping{
    display: inline-block;
    width: 190px;
    margin-right: 5px;
    color: #522725;
    font-size: 14px;
    border: 1px solid #522725;
    height: 40px;
    line-height: 40px;
    cursor: pointer;
    text-align: center;
}
</style>
